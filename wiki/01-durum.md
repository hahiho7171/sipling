# 📍 Durum — nerede kaldık

> Her oturum sonunda **buraya** yaz. Başka yere durum yazma.

## ▶️ SIRADAKİ OTURUMDA İLK İŞ (2026-07-11 sonu itibarıyla)

**Android + iOS + Wear kod tarafı TAM.** Kalan her şey hesap/donanım ister:

1. **AAB'yi Play'e yükle** — Desktop'ta **`Sipling-Play-yukle.aab`** (44,2 MB, taze). Kullanıcı elle
   sürükleyip bırakacak (headless Chrome AAB'yi işlerken çöktü). → `wiki/04-yayin-play.md`.
2. **Kapalı test: 12 testçi / 14 gün** (Play zorunlu). Testçiler → `https://sipling-app.web.app/indir`.
3. **iOS'u yayınla** → `wiki/05-yayin-apple.md`: git remote + Codemagic bağla, ASC kaydı + API anahtarı,
   App Group'u Apple'da tanımla, widget Xcode hedefini ekle. Kod hazır, hepsi hesap/Mac işi.
4. **AdMob + Play Billing** — bilerek en sonda; fiyat + kullanıcı kararı gerek. **Sorulmadan yapma.**
5. **Wear OS** → build-hazır iskele (`Sipling-saat-test.apk`), 1.1'de senkron/ambient. → `wiki/10-wear-os.md`.

İndirme linki: **https://sipling-app.web.app/indir** — Firebase ücretsiz plan `.apk` yasakladığı
için dosya `sipling-test.bin`, `Content-Disposition` ile `Sipling.apk` olarak iniyor.

**💳🆕 2026-07-11 (6. blok) — ABONELİK + PAYWALL + REKLAM YERLEŞİMİ + APPLE HAZIRLIK → `wiki/11`:**
- **Abonelik akışı** `purchase_service.dart` (`in_app_purchase`): satın al/geri yükle/akış dinle →
  doğrulanınca `setPro` (reklamlar susar). Ürün id `sipling_pro_monthly`. İstemci doğrulama; sunucu 1.1.
- **Apple-uyumlu paywall** `pro_screen.dart`: mağaza fiyatı + Abone ol + **Geri Yükle** +
  **Koşullar/Gizlilik linkleri** + **otomatik-yenileme açıklaması** (Apple'ın 4 zorunlu öğesi → red riski↓).
  `url_launcher` eklendi, `site/kosullar.html` yazıldı.
- **Reklam yerleşimi:** banner İstatistik'te · interstitial gün-sonu özeti sonrası (sıklık sınırlı) ·
  rewarded tema açmada (`species_screen`). Kutlama/su-ekleme reklamsız.
- **Gizlilik politikası** reklama göre yeniden yazıldı (AdMob/INTERNET/ATT/rıza/13+).
- **Paywall 20 dilde** (120 çeviri). `codemagic.yaml` Misyon'un KANITLANMIŞ script-imzalama'sına göre
  yeniden yazıldı (managed `ios_signing` patlıyordu). Web+APK derlendi (58,7 MB), 50 test, analyze temiz.
- ⏸️ Reklamlı build YAYINLANMADI (kullanıcı: önce her şeyi bitir+doğrula, sonra yükle). Git'e dokunulmadı.
- **Kalan (kullanıcı hesabı):** AdMob gerçek kimlik · Play/Apple abonelik ürünü + ~$1 kademe · ASC kaydı +
  API anahtarı · Codemagic build → TestFlight · sandbox satın-alma testi · Data Safety/App Privacy beyanı.

**💵 2026-07-11 (5. blok) — reklam altyapısı (temel) → `wiki/11-para-yayin.md`:**
Kullanıcı reklam+Pro modelini seçti; "internet yok" kimliği BİLEREK bırakıldı. **Bitti:** reklam
altyapısı (`ads_service*.dart`, banner/interstitial/rewarded + UMP rıza + Pro'da kapanma), manifest
INTERNET + AdMob App ID (TEST), iOS reklam ayarları, banner İstatistik'te. APK derlendi (58,1 MB,
INTERNET izni geldi), web stub'ı kullanıyor. **Reklamlı build YAYINLANMADI** (çalışan Pro yokken
tutarsız olur — linkteki sürüm hâlâ reklamsız/eski). **Sırada:** abonelik akışı + sunucu doğrulama
(Firebase) + gizlilik politikası + gerçek kimlikler + mağaza kurulumu. Ayrıntı+checklist → `wiki/11`.

**🐛🆕 2026-07-11 (3. blok) — telefon geri bildirimi, 3 düzeltme (link + Desktop güncel):**
1. **🚨 KRİTİK: hatırlatmalar hiç gelmiyordu** — manifest'te `ScheduledNotificationReceiver`
   (zamanlanmış bildirimi POST eden alıcı) + `ScheduledNotificationBootReceiver` UNUTULMUŞTU.
   Eklendi, APK'da doğrulandı (üç alıcı da var). Artık hatırlatmalar çıkıyor. → `wiki/08` "EN BÜYÜK TUZAK".
   ⚠️ İkinci katman: Samsung "derin uyku" gecikmesi — uygulamadaki pil rehberi bunu anlatıyor.
2. **Widget çift-basma** — güncelleme ~1 sn gecikince kullanıcı tekrar basıp iki kez ekliyordu.
   `onWidgetTap`'e çift-basma koruması (aynı ekleme <1,5 sn yoksay) + `push`'u `reschedule`'dan öne
   aldım (sayı daha hızlı yansısın). `home_widget_service.dart`.
3. **"+" butonu** — üç su bardağıyla aynı görünüyordu; kahve-fincanı ikonu + **"Diğer"** etiketi
   eklendi (20 dil), "farklı içecek" olduğu artık belli. `home_screen.dart` + `homeMoreDrinks`.

**🔬🆕 2026-07-11 (4. blok) — içecek su içeriği bilimsel + görünür (link + Desktop güncel):**
- İçecek katsayıları **su içeriğine** güncellendi (kullanıcı kararı; BHI/hidrasyon yerine "içindeki
  su" seçti). Kaynak USDA gıda-bileşimi: **çay 0.99 · kahve 0.99 · kola 0.90 · süt 0.88 · meyve suyu
  0.88** (eski "sağlık nudge" değerleri 0.8/0.6 bilimsel değildi). Su 1.0, **alkol -0.5 istisna**
  (diüretik, uyarı gösterir). `models.dart` (kaynak yorumda).
- İçecek sayfasında artık **"≈ 248 ml su (%99)"** gibi su-eşdeğeri gösteriliyor (kaydırıcıyla canlı).
  `add_drink_sheet.dart _FactorHint` + yeni `addFactorWaterEq(ml, percent)` anahtarı 20 dilde.
  ⚠️ Faktör değişince geçmiş kayıtlar da yeniden hesaplanıyor (effectiveMl anlık, migration yok).
  `models_test.dart` kahve testi 198'e güncellendi, **50 test geçiyor.**
- Not (bilim): BHI'ye göre çay/kahve/kola zaten ~su kadar, süt/meyve suyu daha fazla susuzluk giderir;
  "içindeki su" bunu tam yansıtmaz ama kullanıcı somut/ayırt edici olsun diye onu seçti.

**🆕 2026-07-11 — "yayına girecek gibi bütün eksikler tamamlandı" oturumu:**
- **20 dil TAM** — 13 yeni anahtar (widget + Wrapped) 18 dile çevrilip doğrudan `app_<dil>.arb`
  dosyalarına yazıldı (mevcut terimlerle tutarlı: streak/water/tree her dilin kendi sözcüğü —
  örn. mevcut `sumStatStreak`/`drinkWater` değerleri kaynak alındı). `gen-l10n` uyarısız, 20 dil = 268 anahtar.
- **İçecek şeridi düzeltildi** — `add_drink_sheet.dart` yatay ListView → `Wrap` (2 satır, 7 içecek görünür).
- **`wrappedStats` testi eklendi** — `test/wrapped_stats_test.dart` (5 test). **Toplam 50 test geçiyor.**
- `flutter analyze` temiz, web+APK+AAB derlendi. **INTERNET izni yok** (aapt ile doğrulandı),
  `ActionBroadcastReceiver` APK'da. Güncel APK link'te (57.577.208 byte, doğrulandı).
- Desktop: `Sipling-telefon-test.apk` (APK, test) + `Sipling-Play-yukle.aab` (Play, taze) — ikisi de güncel.

**🆕 2026-07-11 (2. blok) — iOS + Wear OS "hazır olsun" oturumu:**
- **iOS kod tarafı bitti** (Windows'ta yapılabilecek her şey): bildirimden "+N ml" iOS Darwin
  kategorisi (`notifications.dart`), App Group entitlements (`Runner.entitlements`), 20 dil
  (`Info.plist`), iOS ikonları üretildi, **ana ekran widget'ı kaynağı** (`ios/SiplingWidget/`
  SwiftUI), `codemagic.yaml` (derle+imzala+TestFlight), widget entegrasyon scripti
  (`ios/tools/add_widget_target.rb`). ⚠️ Mac yok → burada DERLENEMEDİ; Codemagic'te derlenecek.
  Checked-in `project.pbxproj`'a dokunulmadı (bozarsa iOS build çöker) — widget hedefi Xcode/CI'da eklenir.
- **Wear OS build-hazır iskele** — `lib/main_wear.dart` + `lib/wear/wear_screen.dart`, **APK derlendi**
  (42,7 MB, Desktop `Sipling-saat-test.apk`). Telefon derlemesini etkilemez. → `wiki/10-wear-os.md`.
- Kullanıcı seçimi: iOS'ta widget dahil her şey · Apple hesabı var · Wear iskele (1.1'e ertele DEĞİL).
- `flutter analyze` temiz, **50 test** geçiyor, telefon APK+AAB tazelendi (INTERNET izni yok, link güncel).

**Not (2026-07-10):** 3 büyük özellik — bildirimden ekleme, Orman Özetin (Wrapped), Ayarlar'da
"widget ekle" butonu — o gün eklendi; 07-11'de çeviri + içecek hatası + test, sonra iOS + Wear kapatıldı.

## Şu an (2026-07-10)

**Aşama:** Uygulama tamam ve Play'e yüklemeye hazır. Play Console kurulumu bitti:
- Uygulama oluşturuldu: app ID `4974431994893643882`, `com.sipling.app`, ücretsiz
- **Mağaza kaydı 20 dilde girildi** (metin + 5 ekran görüntüsü + öne çıkan grafik + ikon)
- **11 zorunlu beyanın hepsi** girildi (gizlilik, veri güvenliği=veri toplanmıyor, hedef 13+,
  sağlık=beslenme, kategori=Sağlık ve Fitness, reklam=hayır...) → `wiki/04-yayin-play.md`
- Alpha test kanalı hazır, Play imzalama otomatik kuruldu ("Google Play tarafından imzalanan ✓")
- ⏳ Sadece **AAB paketi henüz kutuya konmadı** (taslak sürüm var, paket boş)

İmza: release AAB/APK **kendi upload key'imizle imzalı** (`CN=Asim Gokcek, O=Sipling`),
`apksigner` ile doğrulandı. App Store'a hiç dokunulmadı.

⚠️ Bütün özellikler emülatör + tarayıcıda test edildi, **gerçek telefonda ilk kez şimdi**
(kullanıcı APK'yı deniyor). Özellikle bildirimlerin geldiği ve widget'ın görünümü gözlenecek.

Bu proje artık **kendi klasöründen** yönetiliyor: `claude-baslat.bat` → yalnız Sipling'in
hafızası + `CLAUDE.md` + bu wiki yüklenir. Diğer projeler görünmez.

### Biten
- [x] Flutter projesi, marka paleti, kodla çizilen ağaç (görsel dosyası yok)
- [x] 5 adımlı kurulum akışı + EFSA tabanlı hedef hesabı + BMI
- [x] Bugün ekranı: halka, bahçe sahnesi, 3 hızlı bardak, 7 içecek, tempo ipucu, kutlama
- [x] Orman ekranı: geçmiş ağaçlar, tepeler, gölgeler, boş-durum
- [x] İstatistik: 7/30 gün, 4 kart, grafik, içecek dağılımı, BMI, başarımlar
- [x] Ayarlar: hedef, profil, hatırlatmalar, bardaklar, koyu tema, sıfırla
- [x] 8 ağaç türü + 10 başarım + seri (streak)
- [x] Bildirim servisi (inexact alarm, 7 gün ileri planlama, hedefi tutunca sus)
- [x] Pil rehberi ekranı (Xiaomi/Samsung/Huawei/Oppo)
- [x] Veri kalıcılığı (SharedPreferences) — web'de sayfa yenilenince korunduğu doğrulandı
- [x] Release APK derlendi; manifest'te **exact alarm ve INTERNET izni yok** (doğrulandı)
- [x] Sipling'e özel tarayıcı (port 9360) → `wiki/06-tarayici.md`
- [x] **Uygulama ikonu** — damla-yaprak. Kaynak SVG, `flutter_launcher_icons` ile Android
      (adaptive), iOS ve web'e bağlandı. 512×512 Play ikonu da hazır. → `wiki/03-tasarim.md`
- [x] **Ana ekran widget'ı** (Android) — ağaç + ml/hedef + seri + 3 hızlı bardak.
      Uygulama kapalıyken de su ekler ve ağaç büyür. Emülatörde debug+release doğrulandı.
- [x] **Health Connect** (Android) — Ayarlar'dan açılır, varsayılan kapalı, yalnız yazar.
      `minSdk 26` oldu. Emülatörde `0.3 L` kaydı gözle doğrulandı.
- [x] **Mevsimlik orman temaları** — Klasik ücretsiz, 5 tema Pro. Ormanın rengi değişir,
      ağaçların türü değişmez. → `wiki/03-tasarim.md`
- [x] **Sipling'in kendi emülatörü**: AVD adı `sipling` (android-34, google_apis).
      `-gpu guest` ile başlat. `Pixel7`/`Pixel_7` AVD'leri bozuk, `randevio`'ya dokunma.

- [x] **20 dil** (255 anahtar × 20, Arapça/RTL dahil) → `wiki/02-kod-haritasi.md` "Diller"
- [x] **Gün sonu özeti ekranı** — ertesi gün ilk açılışta bir kez (`day_summary_screen.dart`)
- [x] **45 birim testi** (`flutter test`)
- [x] **Gizlilik politikası YAYINDA** — https://sipling-app.web.app/privacy (+ /gizlilik)
- [x] **Upload key** — `app/android/upload-keystore.jks` + `key.properties`. 🚨 YEDEKLE, `.gitignore`'da.
- [x] **Play Console kurulumu** — uygulama + 20 dil mağaza kaydı + 11 beyan + Alpha kanalı
- [x] **iOS hazırlığı** — bundle id `com.sipling.app`, `Info.plist` (diller + HealthKit açıklamaları)
- [x] **APK test linki** — https://sipling-app.web.app/indir (kullanıcı telefonda deniyor)

### Bitmeyen (sıradaki)
Bkz. `wiki/09-yapilacaklar.md`. Kalanların çoğu **hesap/donanım** istiyor: politika yayını,
Play Console beyanları, AdMob, Play Billing fiyatı, iOS (Mac), Wear OS (saat).

### Bilerek eksik bırakılanlar
- **Pro satın alma sahte** — `screens/pro_screen.dart` yalnız yerel bir anahtar çeviriyor.
  Play Billing bağlanmadı, fiyat yazılmadı (TR minimum fiyat Console'da görülecek).
- **Ödüllü reklam sahte** — `screens/species_screen.dart` `_RewardDialog` doğrudan türü açıyor.
  AdMob hesabı gerekiyor.

## Nasıl çalıştırılır

```bash
cd /c/Users/asim_/Desktop/CloudWork/Sipling/app
flutter run                                     # telefon bağlıysa
flutter build web --release && cd build/web && python -m http.server 8792   # tarayıcı önizleme
flutter build apk --release                     # APK
```
```bash
flutter test                                    # 45 birim testi
flutter gen-l10n                                # .arb değişince
python tools/arb-birlestir.py --kuru            # ekran çevirilerini ana .arb'ye kat
```
Release APK: `app/build/app/outputs/flutter-apk/app-release.apk` — **upload key ile imzalı**.

## Kararlar (kullanıcı onaylı — değiştirme, sorma)

| Konu | Karar |
|---|---|
| İsim | **Sipling** = "sip" (yudum) + "sapling" (fidan) |
| Paket adı | `com.sipling.app` — Play'de bir kez seçilir, asla değişmez |
| Play başlığı | Dile göre. Varsayılan EN `Sipling: Water Reminder` · TR `Sipling: Su Hatırlatıcı` · 20 dil |
| Play varsayılan dili | **İngilizce (en-US)** — çevirisi olmayan ülkede buna düşer |
| İkon altındaki ad | Her ülkede sadece **Sipling** |
| Oyunlaştırma | Fidan → ağaç → orman |
| **Ceza yok** | Ağaç asla kurumaz. Hedefi kaçıran gün yarım fidan kalır. |
| Para modeli | Ücretsiz + reklam, reklamsız Pro üyelik |
| Reklam yeri | SADECE gün sonu özeti + isteğe bağlı ödüllü reklam. Ekran geçişinde ve kutlamada **asla**. |
| Sunucu | Yok. Bildirimler cihazda. Aylık maliyet sıfır. INTERNET izni yok. |
| Teknoloji | Flutter · provider · shared_preferences · flutter_local_notifications · flutter_timezone · home_widget · health · intl |
| Dil | **20 dil**, sistem dilini izler. **Uygulama içinde dil seçici yok.** Tek kaynak `tools/diller.json` |
| Hedef yaş (Play) | 13+ (13-15, 16-17, 18+) — çocuk hedefi yok, Families gerekmiyor |
| minSdk | **26** (Health Connect şartı) — Android 7.x cihazlar düştü |
| Firebase projesi | `sipling-app` (Sipling'e özel). 🚨 Randevio'nun `randevio-dbf59`'una dokunma. |
| Play geliştirici hesabı | `randevusayfasi@gmail.com` · ID `7286802637861068803` |
