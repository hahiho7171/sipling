import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// iOS'ta native WeatherKit köprüsü. Android'de (dart:io var ama iOS değil)
/// doğrudan null döner — kanal yalnız iOS Runner'da kayıtlıdır.
class WeatherService {
  WeatherService._();

  static const _channel = MethodChannel('sipling/weather');

  /// [city] için bugünün en yüksek sıcaklığı (°C). Yalnız iOS 16+ (WeatherKit).
  /// Şehir bulunamaz / iOS<16 / hata → null. Konum izni istemez (şehir → geocode).
  static Future<double?> todayMaxC(String city) async {
    if (!Platform.isIOS || city.trim().isEmpty) return null;
    try {
      final v = await _channel.invokeMethod('todayMaxC', {'city': city});
      return (v as num?)?.toDouble();
    } catch (e) {
      debugPrint('Sipling hava durumu alınamadı: $e');
      return null;
    }
  }
}
