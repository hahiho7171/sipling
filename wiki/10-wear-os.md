# ⌚ Wear OS (Android akıllı saat) — build-hazır iskele

> **Durum (2026-07-11):** Kod yazıldı ve **APK'ya derlendi** (42,7 MB). Bu makinede saat/Wear
> emülatörü yok → görünüm saatte doğrulanmadı. Telefon derlemesini **hiç etkilemez** (ayrı entrypoint).

## Ne var

| Parça | Dosya |
|---|---|
| Saat giriş noktası | `app/lib/main_wear.dart` — sade: `AppState` + `WearScreen` (bildirim/widget yok) |
| Saat ekranı | `app/lib/wear/wear_screen.dart` — ilerleme halkası + 3 hızlı bardakla bilekten su ekleme |

Aynı `store.dart`'ı kullanır → saatte **kendi** verisiyle çalışır (telefondan bağımsız).
Yuvarlak ekrana göre içerik ortalı, OLED/ambient için siyah zemin.

## Nasıl derlenir / test edilir

```bash
cd app
flutter build apk --target lib/main_wear.dart --release   # Wear APK üretir
# çıktı: build/app/outputs/flutter-apk/app-release.apk  (telefon APK'sının üstüne yazar!)
```
Masaüstünde hazır: **`Sipling-saat-test.apk`**. Bir Wear OS cihaza/emülatöre kur:
```bash
adb -s <wear-cihaz> install -r Sipling-saat-test.apk
```
⚠️ Wear emülatör imajı bu makinede kurulu değil (bkz. `wiki/08-tuzaklar.md`).

## Sonraki adımlar (1.1'de, iskele bunun için hazır)

- **Telefon ↔ saat senkronu** — şu an saat kendi verisini tutuyor. Ortak veri için Wearable
  Data Layer (`flutter_wear_os_connectivity` vb.) gerekir.
- **Ambient (her zaman açık) mod** — `wear_plus` ile dimmed görünüm. (Şimdilik ekran etkileşimli.)
- **Ayrı yayın paketi** — Play'de gerçek "Wear uygulaması" için Android product flavor / watch
  manif<uses-feature type.watch> gerekir. **Bilerek eklenmedi**: telefonun yayına-hazır tek-flavor
  derlemesini bozmamak için. Yayına hazırlarken flavor eklenip build komutları güncellenecek.

## ⚠️ Neden flavor eklenmedi (önemli)

Telefon uygulaması yayına hazır ve `flutter build apk/appbundle` (flavorsuz) ile derleniyor.
Gradle product flavor eklenince bu komutlar `--flavor phone` istemeye başlar → yayın akışı ve
tüm wiki komutları kırılır. Bu yüzden Wear şimdilik **ayrı entrypoint + aynı applicationId** ile
duruyor (saatte test için yeterli). Ayrı Play Wear listesi paketlemesi ayrı bir adım.
