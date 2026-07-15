/// Bir PNG'yi (byte dizisi) sistem paylaşım sayfasıyla paylaşır.
///
/// 🚨 Gerçek uygulama `dart:io` + `path_provider` kullanıyor; web'de import edilirse
/// `flutter build web` çöker. Web önizlemesini kaybetmemek için koşullu import.
/// (Health Connect köprüsüyle aynı desen.)
library;

export 'share_image_stub.dart' if (dart.library.io) 'share_image_io.dart';
