# 🍎 Apple App Store — 1.0 YAYINDA · 1.0.3 incelemede

> **Durum (2026-07-28):** Uygulama **App Store'da satışta** (sürüm 1.0 = build 3).
> **1.0.3 + build 7** incelemede. Bu dosya kurulum/altyapı bilgisi tutar;
> **güncel durum ve karar geçmişi TEK KAYNAK olarak `wiki/01-durum.md`'de.**
> Genel playbook: memory `reference_apple_store_yayin_playbook.md`.
>
> ⚙️ **Tarayıcısız iş akışı hazır:** `tools/asc-api.js` (JWT ES256 · `state` ve `raw` komutları).
> Sürüm/build durumu, build bağlama, gönderme hep bununla yapılıyor.
> 🪤 Git Bash `/apps/...` yolunu bozar → komutun başına **`MSYS_NO_PATHCONV=1`**.
>
> 🚨 **İki ret yaşandı, ikisi de `wiki/08-tuzaklar.md`'de:**
> **3.1.2** (abonelik varsa açıklamada Kullanım Koşulları/EULA linki ŞART) ve
> **2.1(a)** (bir özellik iOS'ta çalışmıyorsa arayüzde GÖSTERME — Apple **iPad'de** test ediyor).

## 🚨🚨 CODEMAGIC BUILD OTOMATİK TETİKLENMİYOR — ELLE BAŞLAT (2026-07-21 yaşandı)
`codemagic.yaml`'da **`triggering` bloğu YOK.** Yani `git push` GitHub'a gitse bile Codemagic
build'i **başlatmaz** — panelden **elle** "Start new build" gerekir (ios-testflight workflow).
2026-07-21'de push yapıldı, 35 dk beklendi, build ASC'ye HİÇ gelmedi; sebep buydu.
- **Build başlatmak için:** Codemagic'e giriş (codemagic.io) → **GitHub ile** (🔑 GitHub şifresi
  KULLANICIDA, Sipling tarayıcısında GitHub oturumu açık DEĞİL) → Sipling app → "Start new build"
  → workflow **ios-testflight** → branch main. Build ~20-30 dk, sonra ASC "Build Uploads"a düşer.
- İstersen `codemagic.yaml`'a `triggering: { events: [push], branch_patterns: [{pattern: main}] }`
  eklenip push'ta otomatik olması sağlanabilir (kullanıcı onayıyla). O zaman bu tuzak biter.

## 🔑 Apple giriş bilgisi (TÜM projelerle ORTAK — Misyon/Randevio/Sipling aynı)

- **Apple ID (giriş e-postası):** `gokcektugba198@gmail.com` · sahip **Tuğba Gökcek** · Team `SGMQ8NVKU3`.
- Sipling App Store App ID (sayısal): **`6789913186`** · sürüm sayfası `/apps/6789913186/distribution`.
- Parola + 2FA **kullanıcıda** (kural 7) — oturum düşünce Apple 2FA ister, ben sadece e-postayı yazarım.
- Kaynak: Misyon-Koruma-App `IOS-PLAN.md` (kullanıcı 2026-07-17'de "Apple hepsinde ortak" dedi, oradan alındı).

## Durum

| Alan | Değer |
|---|---|
| iOS klasörü | `app/ios/` var, tam yapılandırıldı |
| Bundle ID | ✅ `com.sipling.app` (`project.pbxproj`, Android'le eşit) · widget: `com.sipling.app.SiplingWidget` |
| Info.plist | ✅ Display name, HealthKit açıklamaları, **20 dil** (`CFBundleLocalizations`) |
| iOS ikonları | ✅ `dart run flutter_launcher_icons` ile üretildi (`Assets.xcassets/AppIcon.appiconset`) |
| Bildirimden "+N ml" | ✅ iOS Darwin kategorisi + `categoryIdentifier` (`notifications.dart`) |
| App Group | ✅ `group.com.sipling.app` — `Runner.entitlements` + widget entitlements |
| Ana ekran widget'ı | ✅ **Kaynak hazır** (`ios/SiplingWidget/`), hedef Xcode/CI'da eklenecek (aşağıda) |
| Codemagic CI | ✅ `codemagic.yaml` (repo kökü) — derle + imzala + TestFlight |
| App Store Connect kaydı | ✅ VAR — App ID `6789913186`, 1.0 satışta |
| Apple Developer hesabı | ✅ Team `SGMQ8NVKU3` · imzalama Codemagic'te (her build taze sertifika) |
| Mac | yok → **Codemagic** (bulut Mac), API ile tetikleniyor (~5 dk) |
| Mağaza dilleri | ✅ **20 dil** (2026-07-27 ASO) — ad/alt başlık/anahtar kelime/açıklama/görsel |
| Abonelik | ✅ `sipling_pro_monthly` **APPROVED** · 0,99 USD/ay (ASC'den doğrulandı) |

## Kurulum (kullanıcı + Codemagic, sırayla)

1. **Depoyu bir Git remote'una gönder** (GitHub/GitLab) — Codemagic git ister. (Bu klasör şu an git değil.)
2. **Codemagic'e bağla**, `codemagic.yaml`'daki `ios-release` workflow'unu seç.
3. **App Store Connect'te uygulama oluştur:** isim `Sipling`, bundle `com.sipling.app`.
   Uygulamanın **sayısal Apple ID**'sini `codemagic.yaml` → `APP_APPLE_ID`'ye yaz.
4. **ASC API anahtarı** üret (App Store Connect → Users and Access → Integrations → API Keys),
   Codemagic → Teams → Integrations → App Store Connect'e yükle, adını `codemagic` koy
   (`codemagic.yaml`'da `integrations.app_store_connect: codemagic` bunu kullanıyor).
5. **App Group'u Apple'da tanımla:** Identifiers → App Groups → `group.com.sipling.app`;
   hem `com.sipling.app` hem `com.sipling.app.SiplingWidget` App ID'lerine ekle.
6. **Build al** → Codemagic otomatik imzalar, `.ipa` üretir, TestFlight'a yükler.
7. Zorunlu varlıklar (ASC panelinde): iPad 13" ekran görüntüleri · App Privacy formu ·
   Gizlilik politikası URL'si (`https://sipling-app.web.app/gizlilik` hazır).
8. İnceleme notu: **test hesabı gerekmez** (uygulama hesapsız çalışıyor) — bunu yaz.

## Ana ekran widget'ı — Xcode hedefi eklemek (tek eksik el işi)

Kaynaklar hazır: `app/ios/SiplingWidget/SiplingWidget.swift`, `Info.plist`, `SiplingWidget.entitlements`.
WidgetKit hedefi **Xcode'da** ya da **CI scriptiyle** eklenir (Windows'ta yapılamaz):

**Yol A — Xcode (Mac'te, ~2 dk, en güvenli):**
1. `Runner.xcworkspace`'i aç → File → New → Target → **Widget Extension**.
2. Ad: `SiplingWidget`, "Include Live Activity" ve "Configuration Intent" **kapalı**.
3. Xcode'un ürettiği 3 dosyayı sil, `ios/SiplingWidget/` içindeki hazır dosyaları hedefe ekle.
4. **Signing & Capabilities** → hem `Runner` hem `SiplingWidget` hedefine
   **App Groups → `group.com.sipling.app`** ekle.

**Yol B — script (Mac/Codemagic'te otomatik):** `app/ios/tools/add_widget_target.rb`
(`gem install xcodeproj && ruby tools/add_widget_target.rb`). `codemagic.yaml`'da hazır ama
**kapalı** — çekirdek build'i riske atmasın diye. Widget doğrulanınca o adımı aç.

> ⚠️ Checked-in `project.pbxproj`'a **elle dokunulmadı** (Windows'ta test edilemez, bozarsa tüm
> iOS build çöker). Widget hedefi eklenene kadar CI **çekirdek uygulamayı sorunsuz** derler;
> widget eklemek tamamen ek (additive) bir adım.

## Sipling'e özel iOS notları

- **Bildirimler + "+N ml" düğmesi:** `notifications.dart` iOS'ta `DarwinNotificationCategory`
  (`sipling_water`) kaydeder; düğme başlığı `init()` anında kayıtlı ilk bardaktan gelir
  ("+250 ml"). Bardak değişince başlık uygulama yeniden açılınca güncellenir. Boş `options` =
  uygulamayı açmadan arka planda ekler (`siplingNotificationAction`). iOS'ta exact-alarm sorunu yok.
  ⚠️ iOS'ta arka-plan bildirim aksiyonunun çalışma penceresi kısadır; gerçek cihazda doğrula.
- **Sağlık verisi:** `health` iOS'ta HealthKit'i **bağlar** ama Sipling iOS'ta HİÇ çağırmaz
  (`HealthBridge` → `Platform.isAndroid`). Apple açıklama istediği için `Info.plist`'te iki
  `NSHealth*UsageDescription` var. iOS'ta gerçekten yazmak istersen Xcode'da HealthKit capability aç.
- **Diller:** `CFBundleLocalizations` = 20 dil (Android/web ile aynı). Uygulama sistem dilini izler.
- **Reklam:** AdMob iOS'ta **App Tracking Transparency** (ATT) + `NSUserTrackingUsageDescription`
  ister. Kişiselleştirilmemiş reklam seçilirse ATT'siz olur — Sipling için tercih bu olmalı.
- **Pro aboneliği:** ilk abonelik sürüme IAP bölümünden **bağlanmalı**, yoksa reddedilir.
- Fiyat/komisyon: ASC'deki gerçek tabloya bakılacak, buraya **rakam yazılmadı**.
