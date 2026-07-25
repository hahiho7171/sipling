/// Hava durumu köprüsü — YALNIZ iOS'ta gerçek (Apple WeatherKit, native
/// MethodChannel). Android/web'de `null` döner: o platformlarda ücretsiz +
/// sunucusuz + reklamlı-uygulamaya-uygun bir hava kaynağı yok (2026-07-25
/// araştırması). WeatherKit, mevcut Apple Developer üyeliğine dahildir
/// (500k çağrı/ay ücretsiz) ve konum izni istemez — şehir elle girilir.
library;

export 'weather_service_stub.dart'
    if (dart.library.io) 'weather_service_io.dart';
