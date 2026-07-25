import Flutter
import UIKit
import CoreLocation
import WeatherKit

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)

    // Sipling hava durumu köprüsü (yalnız iOS). Dart tarafı `sipling/weather`
    // kanalından `todayMaxC(city)` çağırır; şehri geocode edip WeatherKit ile
    // bugünün en yüksek sıcaklığını (°C) döndürürüz. WeatherKit iOS 16+.
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "SiplingWeather") {
      let channel = FlutterMethodChannel(
        name: "sipling/weather",
        binaryMessenger: registrar.messenger())
      channel.setMethodCallHandler { call, result in
        guard call.method == "todayMaxC",
              let args = call.arguments as? [String: Any],
              let city = (args["city"] as? String)?.trimmingCharacters(in: .whitespaces),
              !city.isEmpty
        else {
          result(nil)
          return
        }
        if #available(iOS 16.0, *) {
          SiplingWeather.todayMaxC(city: city) { temp in
            DispatchQueue.main.async { result(temp) }
          }
        } else {
          result(nil) // WeatherKit iOS 16 gerektirir; eski sürümde özellik yok.
        }
      }
    }
  }
}

/// Şehir adı → koordinat (CLGeocoder, konum izni GEREKTİRMEZ) → WeatherKit
/// günlük tahmin → bugünün en yüksek sıcaklığı (°C). Hata/bulunamama → nil.
@available(iOS 16.0, *)
enum SiplingWeather {
  static func todayMaxC(city: String, completion: @escaping (Double?) -> Void) {
    CLGeocoder().geocodeAddressString(city) { placemarks, _ in
      guard let location = placemarks?.first?.location else {
        completion(nil)
        return
      }
      Task {
        do {
          let weather = try await WeatherService.shared.weather(for: location)
          if let today = weather.dailyForecast.forecast.first {
            let celsius = today.highTemperature.converted(to: .celsius).value
            completion(celsius)
          } else {
            completion(nil)
          }
        } catch {
          completion(nil)
        }
      }
    }
  }
}
