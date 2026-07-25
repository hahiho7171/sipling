/// Web (ve iOS olmayan hedeflerin dart:io'suz derlemesi) için no-op.
class WeatherService {
  WeatherService._();

  /// Bu platformda hava kaynağı yok → her zaman null.
  static Future<double?> todayMaxC(String city) async => null;
}
