/// Health Connect köprüsü — platforma göre gerçek ya da boş uygulama seçilir.
///
/// 🚨 `health` paketi `dart:io` kullanıyor; web'de import edilirse
/// `flutter build web` çöker. Web önizlemesini (port 8792) kaybetmemek için
/// koşullu import şart.
library;

export 'health_bridge_stub.dart' if (dart.library.io) 'health_bridge_io.dart';
