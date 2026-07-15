# 🍎 Apple App Store — kod build-hazır, Codemagic + hesap bekliyor

> **Durum (2026-07-11):** iOS **kod/yapılandırma tarafı bitti** — Windows'ta yapılabilecek
> her şey yapıldı. Kalanlar Mac/Codemagic + Apple hesabı ister (bu makinede iOS derlenemez).
> Genel playbook: memory `reference_apple_store_yayin_playbook.md` — **önce onu oku.**

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
| App Store Connect kaydı | ❌ YOK (kullanıcı açacak) |
| Apple Developer hesabı | Kullanıcıda (var/açılacak) — imzalama Codemagic'te yönetilecek |
| Mac | yok → **Codemagic** (bulut Mac) ile derlenir |

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
