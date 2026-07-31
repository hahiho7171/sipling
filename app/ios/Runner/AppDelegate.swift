import Flutter
import UIKit

// 🚨 WeatherKit KALDIRILDI (2026-07-31, Apple Guideline 5.2.5 reddi).
// Apple, WeatherKit kullanan uygulamalardan " Weather" markasını + yasal kaynak
// linkini arayüzde göstermeyi ve özelliğin çalıştığını gösteren fiziksel cihaz
// ekran videosunu şart koşuyor. "Sıcak gün uyarısı" küçük bir ek özellikti;
// kullanıcı kararıyla iOS'tan tamamen çıkarıldı → `import WeatherKit`,
// `sipling/weather` kanalı, CLGeocoder çağrısı ve entitlement silindi.
// Android'de bu özellik zaten hiç yoktu.
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
  }
}
