/// Reklam servisi köprüsü — mobilde gerçek `google_mobile_ads`, web'de no-op stub.
///
/// 🚨 `google_mobile_ads` + `dart:io` web derlemesini çökertir; Health Connect ve
/// paylaşım köprüleriyle aynı desen. Kullanan taraf yalnız bunu import eder.
library;

export 'ads_service_stub.dart' if (dart.library.io) 'ads_service_io.dart';
