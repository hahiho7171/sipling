/// Web (ve Health Connect'i olmayan her yer) için boş uygulama.
/// Arayüz `health_bridge_io.dart` ile birebir aynı olmalı.
enum HealthAvailability { available, notInstalled, needsUpdate, unsupported }

class HealthBridge {
  static Future<HealthAvailability> availability() async =>
      HealthAvailability.unsupported;

  static Future<bool> hasPermission() async => false;

  static Future<bool> requestPermission() async => false;

  static Future<void> openInstallPage() async {}

  /// Su kaydını sağlık defterine yazar. Web'de hiçbir şey yapmaz.
  static Future<void> writeWater(int ml, DateTime at) async {}

  /// Belirli bir anda yazılmış kaydı siler (geri al).
  static Future<void> deleteWaterAt(DateTime at) async {}
}
