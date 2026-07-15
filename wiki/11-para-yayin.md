# 💵 Para kazanma + yayın planı (2026-07-11 başladı)

> **Karar (kullanıcı, 2026-07-11):** Ücretsizde **reklam** + **$1/ay Pro (reklamsız)**.
> Reklam yoğunluğu **Standart** (banner + interstitial + rewarded, sıklık sınırlı).
> Abonelik **sunucu-doğrulamalı** (playbook: memory `reference_store_satin_alma...`).
> 🚨 Bu, "internet izni yok / tam gizli" kimliğini BİLEREK bitiriyor — reklam internet ister.

## Durum tablosu

| Parça | Durum |
|---|---|
| `google_mobile_ads` + `in_app_purchase` paketleri | ✅ eklendi (9.0.0 / 3.3.0) |
| Reklam servisi (banner/interstitial/rewarded + UMP rıza + Pro-gating) | ✅ `services/ads_service*.dart` (io+stub+köprü, web-güvenli) |
| Manifest: INTERNET + AdMob App ID (TEST) | ✅ eklendi, APK'da doğrulandı |
| iOS: GADApplicationIdentifier (TEST) + ATT metni + SKAdNetwork | ✅ `Info.plist` |
| Reklam yerleşimi (banner/interstitial/rewarded) | ✅ banner İstatistik'te · interstitial gün-sonu özeti sonrası (sıklık sınırlı, `main.dart`) · rewarded tema açmada (`species_screen`) |
| **Abonelik satın-alma akışı** (`in_app_purchase`) | ✅ `services/purchase_service.dart` (satın al + geri yükle + akış dinleme + entitlement→setPro). Ürün id `sipling_pro_monthly` |
| **Apple-uyumlu paywall** | ✅ `pro_screen.dart`: mağaza fiyatı + Abone ol + **Geri Yükle** + **Koşullar/Gizlilik linkleri** + **otomatik-yenileme açıklaması** (Apple 4 zorunlu öğe). `url_launcher` eklendi. Koşullar: `site/kosullar.html` |
| Gizlilik politikası + Koşullar (reklam yansıması) | ✅ `site/gizlilik.html` reklam/AdMob/INTERNET/ATT/rıza güncellendi + `site/kosullar.html` yazıldı. ⏳ Play Data Safety + Apple Privacy panel beyanları (kullanıcı, yüklerken) |
| **Sunucu doğrulama** (Firebase Function) | ⏳ 1.1'e ertelendi — istemci doğrulama şu an yeterli (Apple sunucu doğrulama ARAMAZ). Entitlement tek yerde (`_grant`), sonra bağlanır |
| Gerçek AdMob kimlikleri, abonelik ürünü, fiyat kademesi | ⏳ kullanıcı hesabı |
| Codemagic (proven signing) + git + yükleme + inceleme + testçiler | ⏳ kullanıcı hesabı — `codemagic.yaml` KANITLANMIŞ script-imzalama'ya göre yeniden yazıldı (Misyon yöntemi) |

## 🔴 Yayından önce ŞART (kod tarafı, ben yapacağım)
1. **Abonelik akışı:** `in_app_purchase` ile satın alma + `restorePurchases` + owned-purchase tarama
   (playbook tuzağı: "approved" olayına tek başına güvenme, deterministik tara). `pro_screen`'i bağla.
2. **Sunucu doğrulama:** Firebase Function → Play Developer API (`subscriptionsv2.get`) + Apple App Store
   Server API → entitlement'ı SUNUCU yazsın (self-grant açığı yok). Firestore'da süreli entitlement.
   ⚠️ Sipling şu an tamamen offline (Firebase client SDK YOK) → Auth(anon)+Firestore+Functions eklenecek.
3. **interstitial/rewarded tetikleri:** gün-sonu özeti sonrası interstitial (sıklık sınırı var);
   tema açmada rewarded ("reklam izle, tema aç"). Ana su-ekleme akışı reklamsız kalsın.
4. **Gizlilik politikası + veri güvenliği:** AdMob veri toplama, INTERNET izni, ATT, EU rızası yansıt.
   `site/gizlilik.html` + `privacy.html` yeniden yazılacak; Play Data Safety + Apple Privacy güncellenecek.

## ✅ AdMob KURULDU (2026-07-11) — hesap randevusayfasi@gmail.com · yayıncı `ca-app-pub-3326866070505611`
Reklam kimlikleri **koda girildi** (manifest App ID, iOS Info.plist App ID, `ads_service_io.dart` 6 birim):

| | Android | iOS |
|---|---|---|
| App ID | `~5922360769` | `~5730789076` |
| Banner | `/9255101114` | `/8997483187` |
| Interstitial | `/6628937776` | `/1414506632` |
| Rewarded | `/1637867914` | `/4002774438` |
(hepsi `ca-app-pub-3326866070505611` önekiyle)

⏳ **AdMob'da kalan (kullanıcı — finansal):** ödeme profili (banka/vergi) tamamlanmadan gerçek reklam
SUNULMAZ (no-fill → test sırasında reklam görünmez, kazara tıklama riski yok). Uygulamalar "inceleme
gerekli" durumunda; Play/App Store'da yayınlanınca AdMob'a mağaza bağlanıp onaylanır.
🚨 Onaylanınca **kendi reklamına ASLA tıklama** → hesap kapanır (test cihazını işaretle).

## ✅ APPLE App Store Connect KURULUMU BAŞLADI (2026-07-11) — Team SGMQ8NVKU3 · Tuğba Gökcek
- **Bundle ID `com.sipling.app` kaydedildi** (developer.apple.com, App type, In-App Purchase default).
  ⚠️ App Groups (widget için) SONRA eklenecek — ilk build widget'sız.
- **Sipling uygulaması App Store Connect'te oluşturuldu:** sayısal **App ID `6789913186`**, iOS,
  primary dil English (U.S.), SKU `sipling2026`. → **`codemagic.yaml` APP_STORE_APPLE_ID güncellendi.**
- ⏳ **Sırada (ASC):** API anahtarı (.p8 → Codemagic'e; Codemagic kurulunca üret) + abonelik ürünü
  `sipling_pro_monthly` (⚠️ **Ücretli Uygulamalar Sözleşmesi + banka/vergi** ile birlikte — kullanıcı finansal).

## ⛔ ABONELİK ÜRÜNLERİ — ikisi de ÖN KOŞULA takılı (2026-07-11)
- **Play (`sipling_pro_monthly`):** Abonelik sayfası "Yeni bir APK yükleyin" diyor → Play, billing
  kütüphaneli **bir AAB yüklenmeden** abonelik OLUŞTURTMUYOR. Sipling'de henüz release yok. ⇒ ÖNCE
  AAB'yi (in_app_purchase dahil, gerçek AdMob kimlikli) Play'e yükle → SONRA aboneliği ben oluştururum.
  ⚠️ Desktop'taki AAB ESKİ (gerçek AdMob kimlikleri girmeden önce) → yüklemeden önce `flutter build appbundle` ile tazele.
- **Apple:** abonelik ürünü, **"Ücretli Uygulamalar Sözleşmesi" + banka/vergi (IBAN, W-8BEN)**
  imzalanmadan oluşturulamıyor (ASC → Business/Agreements). Bu tamamen finansal/hukuki → KULLANICI.

## 🟡 Senin yapman gerekenler (hesap — paralel başlayabilirsin)
- **Play abonelik ürünü:** Play Console → Para kazanma → Abonelikler → id `pro_monthly`, temel plan
  `aylik`, fiyat **~$1** (gerçek kademe Console'da görülür — kod/wiki'ye rakam yazılmadı).
- **Apple abonelik:** App Store Connect → Abonelikler → aynı id, ~$1 kademe. IAP sürüme bağlanmalı.
- **Firebase Blaze planı** (Functions için şart — küçük ücret) + Play servis hesabı 2 izin
  (playbook: "Uygulama bilgisi" + "Finansal") + Apple App Store Server API anahtarı.
- **W-8BEN vergi formu** (Play + Apple) — yoksa ödemenin %30'u kesilir.
- **Play:** AAB yükle + 12 testçi + 14 gün kapalı test. **Apple:** Codemagic build + inceleme (1-3 gün).

## Tuzaklar (playbook'tan — ekle, silme)
- **Entitlement'ı YALNIZ sunucu yazar** (self-grant açığı). Token UNIQUE. Süreli (`expires_at`).
- **"Onay" olayına güvenme** → her açılışta `restorePurchases` + owned tarama + retry. Doğrulanınca `completePurchase`.
- **Play izni yayılımı ~saatler** (SA-bazlı). "İzni verdim ≠ çalışıyor" → uçtan uca doğrula.
- **IAP yalnız Play/Store'dan kurulu sürümde çalışır** — sideload'da DEĞİL.
- **Reklam kimliği:** kendi reklamına tıklama = AdMob ban. Test cihazını `RequestConfiguration` testDeviceIds ile işaretle.
