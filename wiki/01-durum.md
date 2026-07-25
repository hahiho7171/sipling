# 📍 Durum — nerede kaldık

> Her oturum sonunda **buraya** yaz. Başka yere durum yazma.

## 📣 2026-07-25 — REKLAM DÜZENİ ELDEN GEÇİRİLDİ (kod tarafı bitti; reklamın DOLMASI hesap işi)

**Kullanıcı şikâyeti:** "Reklam izle" butonuna basınca reklam açılmıyor (canlı Apple sürümünde
kullanıcılardan geldi). Ayrıca gelir için "uygulamaya girince reklam" istendi.

**🔎 Teşhis:** Kod doğru bağlıydı — sorun reklamın **"dolmaması" (no-fill)**. Kodda gerçek AdMob
kimlikleri var; AdMob hesabı Google onayını tam almadı / mağaza uygulamalarına bağlanmadıysa reklam
gelmez → tıkla, hiçbir şey olmaz. Üstüne reklam gelmeyince kullanıcıya **hiç geri bildirim yoktu**
(sessiz), o yüzden "bozuk" görünüyordu. ⚠️ **"Reklam izle" butonu Premium AÇMIYOR** — sadece Orman →
Ağaç türleri ekranında kilitli bir **ağaç türünü** (kozmetik) açıyor. "Reklam→Premium" diye bir şey yoktu.

**✅ Kullanıcı kararları (bu oturum — değiştirme, sorma):**
- **Reklam ödülü = KOZMETİK** (ağaç/tema açar). Reklamsızlık $1 Premium'da kalır (aboneliğin değeri korunsun).
- **Premium = aylık ~$1 abonelik** (şu an $0,99/ay kurulu; Play/ASC'de fiyatı $1 kademesine çekilecek).
- **Açılış reklamı** (App Open): uygulama öne gelince, **ilk açılış hariç, 4 saatte bir**.
- **Su eklerken reklam YOK** (bunaltır); banner (İstatistik) + gün-sonu interstitial kalır.

**✅ Kod tarafı YAPILDI (`flutter analyze` temiz · 63 test geçer):**
- `services/ads_service_io.dart` yeniden düzenlendi:
  - **App Open (açılış) reklamı** eklendi: `maybeShowAppOpen()` — 4 saat sınırı SharedPreferences'ta
    kalıcı (`ad_last_app_open`), soğuk açılışın ilk resume'ünde gösterilmez, `_showingFullScreenAd`
    ile üst-üste binme koruması (ödüllü/interstitial kapanırken tekrar tetiklenmez).
  - **🧪 Test-reklam anahtarı** `_forceTestAds` (şu an `false`): elle `true` yapılınca Google'ın
    HER ZAMAN dolan test reklamları gösterilir → hesap onayından bağımsız "buton çalışıyor mu" kanıtı.
  - Ödüllü reklam **yüklenemezse geri bildirim**: `showRewarded(onReward, {onUnavailable})`.
- `main.dart` → `didChangeAppLifecycleState(resumed)` içinde `AdsService.maybeShowAppOpen()`.
- `species_screen.dart` → reklam gelmezse SnackBar (`l.speciesScreenAdUnavailable`, **20 dile** eklendi).
- `services/ads_service_stub.dart` → web için API paritesi (`maybeShowAppOpen`, `onUnavailable`).
- **`site/app-ads.txt` oluşturuldu:** `google.com, pub-3326866070505611, DIRECT, f08c47fec0942fa0`
  (AdMob'un uygulamayı tanıması için — siteye deploy edilecek).

**✅ AdMob HESAP KURULUMU YAPILDI (2026-07-25, 9360 tarayıcı · `randevusayfasi@gmail.com` girişli):**
- 🔴 **KÖK NEDEN bulundu (canlı):** AdMob'da 4 uygulama da "Onay durumu = İnceleme gerekli ·
  **Sınırlı reklam sunumu — Limiti kaldırmak için mağaza ekleyin**" · Mağazalar sütunu boş.
  Uygulamalar yayınlanmış mağaza kaydına **bağlı değildi** → AdMob reklamı kısıtlıyordu (no-fill) →
  "tıkla, açılmıyor". Kod hep doğruydu.
- ✅ **iOS mağaza BAĞLANDI:** Sipling (iOS, AdMob app `5730789076`) → App Store kaydı
  `apps.apple.com/us/app/sipling/id6789913186` ile bağlandı ("Mağaza bilgileri başarıyla güncellendi").
  🪤 AdMob arama kutusu ID/isimle BULMUYOR; **tam App Store URL** ile bulundu. Bu, canlı iOS'ta
  "sınırlı reklam sunumu" limitini kaldırır (fill birkaç saatte artar).
- ✅ **app-ads.txt DEPLOY edildi:** `firebase deploy --only hosting` → `sipling-app.web.app/app-ads.txt`
  canlı (HTTP 200). AdMob doğrulaması taramayla en geç ~24 saatte tamamlanır (dosya AdMob'un
  istediğiyle birebir: `google.com, pub-3326866070505611, DIRECT, f08c47fec0942fa0`).
- ✅ **App Open (açılış) birimleri OLUŞTURULDU + koda yazıldı:**
  - iOS: `ca-app-pub-3326866070505611/8573400217` ("Sipling App Open iOS")
  - Android: `ca-app-pub-3326866070505611/4096053447` ("Sipling App Open Android")
  - `ads_service_io.dart` `_appOpenIos`/`_appOpenAndroid` dolduruldu. `flutter analyze` temiz.
- ⏳ **Android mağaza bağlanamadı** (beklenen): Android hâlâ **kapalı testte**, Play'de herkese açık
  değil → AdMob `com.sipling.app`'i Play'de bulamıyor. **Android üretime çıkınca** aynı akışla bağlanır.
  (Android kullanıcıya canlı değil, gelir zaten ~0.)

**⏳ KALAN:**
1. **iOS reklamları için bekle:** mağaza bağlandı → AdMob "İnceleme gerekli"yi kaldırıp fill'i açar
   (birkaç saat–24s). Sonra canlı iOS'ta banner/ödüllü/açılış reklamı gelmeye başlar.
2. **App Open'ı yayına al:** yeni App Open kimlikleri KODDA ama **mağazadaki iOS sürümünde YOK** →
   yeni bir iOS build (Codemagic) + ASC submit gerekiyor (bu değişiklikler + reklam düzeni canlıya çıksın).
   Banner/interstitial/ödüllü kimlikleri zaten canlı sürümde vardı → onlar mağaza-bağlama ile düzelir.
3. **$1 fiyat:** Apple'da tam **$1.00 kademesi YOK** ($0,99 veya $1,99). Şu an **$0,99/ay** kurulu =
   pratikte istenen "~$1". Değiştirmeye gerek yok (kullanıcı $1,99 istemedikçe). Play'de de $0,99 ≈ $1.
4. Android store bağlama → Play üretiminden sonra.

**🆕 3 ÖZELLİK DENETİMİ + İŞ (2026-07-25, kullanıcı ikisini onayladı: (c)+(a)):**
- **(b) Bildirimlere su/sağlık bilgisi — ✅ ZATEN VAR.** `notifications.dart _messages()` "bir
  motivasyon, bir bilgi" dönüşümlü; kaynaklı (`hydration_facts.dart`, EFSA/USGS/Armstrong). Yapılacak yok.
- **(c) Profil sonunda su ihtiyacı +/- ayar — ✅ YAPILDI.** `onboarding_screen.dart` `_GoalPage`
  StatelessWidget → **StatefulWidget** oldu: hedef büyük gösterilir + **azalt/artır yuvarlak butonları**
  (`_StepButton`, ±100 ml, 1000–5000 clamp). Elle ayarlanınca `customGoalMl` yazılır; önerilene
  geri gelince temizlenir (otomatik kalsın, kilo değişince güncellensin). Onay = "Bitir". `analyze`
  temiz, 63 test geçer. (Zaten vardı: otomatik hesap + büyük gösterim + Ayarlar/Su-ihtiyacım'da değiştirme.)
- **(a) Otomatik hava durumu — ⛔ ÜCRETSİZ+SUNUCUSUZ YOLU YOK (araştırıldı, kaynaklı).**
  - Open-Meteo: anahtarsız (sunucusuz mimariye ideal) AMA **ücretsiz API ticari kullanımı YASAK**
    (Sipling reklamlı=ticari) → ticari plan **$29/ay** (1M çağrı). CC-BY atıf zorunlu.
  - OpenWeatherMap/Visual Crossing: ücretsiz-ticari VAR ama **API anahtarı** ister → sunucusuz app'te
    anahtar istemciye gömülür (kazınıp kötüye kullanılabilir; Sipling'in sunucusu YOK).
  - Sonuç: her yol ya **aylık ücret** ya **gömülü-anahtar riski** getiriyor → "sıfır maliyet, sunucu yok"
    ilkesine ters. Elle "sıcak gün" butonu zaten ihtiyacı karşılıyor.
  - İlk karar iptaldi; **sonra kullanıcı iOS-only WeatherKit'i ONAYLADI** (Android'de gizli kalır).

## 🌡️📦 2026-07-25 (akşam) — SÜRÜM 1.0.3+5: iOS HAVA DURUMU (WeatherKit) + hepsi tek build (KOD HAZIR)

**Karar:** ads + App Open + profil-sonu −/+ + **iOS sıcak-gün (WeatherKit)** TEK sürüme (1.0.3+5),
**önce Codemagic'te derle + TestFlight'ta doğrula, SONRA production'a** (canlıyı riske atmadan).

**✅ Phase 1 — KOD YAZILDI (`flutter analyze` temiz, 63 test geçer):**
- **iOS WeatherKit native** — `ios/Runner/AppDelegate.swift`: `didInitializeImplicitFlutterEngine`
  içinde `pluginRegistry.registrar` messenger'ıyla `sipling/weather` MethodChannel (embedding-doğru).
  `todayMaxC(city)` → CLGeocoder (şehir→koordinat, **konum izni YOK**) → WeatherKit `WeatherService.shared`
  → `dailyForecast.first.highTemperature` °C. `@available(iOS 16.0, *)` (min 14, altı null döner).
  ⚠️ **BURADA DERLENEMEDİ (Windows/Mac yok)** — doğrulama TestFlight'ta.
- `Runner.entitlements` → `com.apple.developer.weatherkit` eklendi.
- Dart köprü `services/weather/weather_service.dart` (+io MethodChannel, +stub) — iOS dışı null.
- `models.dart` ReminderSettings → `hotDayEnabled` + `city` (elle şehir).
- `main.dart` → `_refreshHotDayWeather` (iOS, **günde bir kez**, resume+bootstrap) → önbellek
  (`weather_maxc`/`weather_date`) → reschedule.
- `notifications.dart` → `_hotDayTempToday()` (bugün, ≥30°C) → `_messages()` sıcak mesajı havuzun BAŞINA.
- `settings_screen.dart` → Hatırlatmalar'da **yalnız iPhone** (`defaultTargetPlatform==iOS`) "Sıcak gün
  uyarısı" switch + şehir diyaloğu (`_editCity`).
- l10n: 7 yeni anahtar × 20 dil (`notifHotDayBody` `{temp}` yer tutuculu; İtalyanca ICU tırnak tuzağı için
  "po'"→"pochino"). Sürüm **1.0.3+5**.

**⏳ KALAN FAZLAR (bu build'i canlıya almak için):**
1. **Phase 2 — Apple WeatherKit capability:** developer.apple.com → Identifiers → `com.sipling.app` →
   WeatherKit'i AÇ. **Apple girişi/2FA gerek (kullanıcı).** ⚠️ Bu açılmadan Codemagic imzalama profili
   entitlement'ı içermez → build imzada PATLAR.
2. **Phase 3 — Codemagic iOS build** (API token'la tetiklenir, tarayıcı gerekmez) → build loglarında
   Swift/imza hatası varsa düzelt → TestFlight'a düşsün.
3. **Phase 4 — TestFlight'ta DOĞRULA** (kullanıcı iPhone'da): sıcak-gün (şehir gir, sıcaksa bildirim) +
   açılış reklamı + profil-sonu −/+ + reklamlar.
4. **Phase 5 — Production submit:** ASC (App Store) + Play (AAB `flutter build appbundle` → 9360 yükle).
   ⚠️ Apple gönderiminde Pro aboneliği (`sipling_pro_monthly`) bağlı kalsın; WeatherKit capability +
   App Privacy/atıf ("Weather", Apple) doğru beyan edilsin.

## 🛠️ 2026-07-23 — SÜRÜM 1.0.2: KRİTİK SENKRON HATASI + 3 ÖZELLİK (kod hazır, mağazaya gönderilmedi)

**Kullanıcı isteği:** komple denetim — çalışmayan/eksik ne var, rakiplere göre ne eklenebilir,
düzgün yapılandır, sonra iki mağazaya güncelleme. **Tüm kod baştan sona okundu.**

**🔴 GERÇEK HATA — düzeltildi: bildirim/widget'tan eklenen su kayboluyordu.** `AppState` bir kez
açılışta okunup bellekte kalıyordu; uygulama arka plandayken bildirimdeki "+N ml" düğmesi ya da
ana ekran widget'ı AYRI bir isolate'te suyu diske yazıyor, ana uygulama diski **yeniden okumadığı**
için (a) eklenen su görünmüyor, (b) sonraki elle eklemede eski bellek diske geri yazılıp arka
plandaki eklemeyi **siliyordu**. Çözüm: `AppState.reload()` (`_prefs.reload()` + tüm alanları
yeniden oku) + `RootShell`'de `didChangeAppLifecycleState` → uygulama öne gelince `reload()`.
`store.dart` `init()` → ortak `_readFromPrefs()`'e ayrıldı. **`flutter analyze` temiz, 63 test geçer.**

**Denetim sonucu:** ölü/çalışmayan buton YOK (tarama temiz). Para (reklam+Pro) GERÇEK ve bağlı
(`in_app_purchase` + gerçek AdMob birimleri) — `wiki/09` "sahte" notu ve `pro_screen` yorumu
BAYATTI, yorum düzeltildi. Native taban sağlam. Çıkış/giriş tuşu yok = bilinçli (hesap sistemi yok).

**🆕 3 özellik eklendi (hepsi felsefeye uygun: sunucu yok, internetsiz):**
1. **Sıcak gün / spor artırıcı** — ana ekranda buton → `widgets/boost_sheet.dart` (+250/+500/+750,
   bugüne özel). `DayRecord.boostMl` + `effectiveGoalMl` (ilerleme/tamamlanma/header/widget/stats
   hep efektif hedefi kullanır). Ertesi gün kendiliğinden 0. `store.addBoost/resetBoost`.
2. **Bugünün kayıtları + tek tek silme** — header'da 🕘 ikonu → `widgets/day_log_sheet.dart`
   (eskiden yalnız "son eklemeyi geri al" vardı). `store.removeSip(sip)`.
3. **Hatırlatma stili (Normal/Nazik/Sessiz)** — Ayarlar'da "Sessiz bildirim" anahtarı yerine
   3'lü seçici. `ReminderStyle` enum; eski `silent` bool'undan **otomatik göç**. 🚨 Android'de her
   stil AYRI kanal (`notifications.dart _channelFor`) — kanal sesi oluşturulduktan sonra
   değişmediği için şart; eski `sipling_reminders` kanalı `init`'te siliniyor.
   ⚠️ **Gerçek cihaz testi gerekir** (kullanıcı bilerek istedi; iOS'ta yalnız ses kontrol edilir).
   → CSV dışa aktarma kullanıcı tarafından ELENDI, yapılmadı.

**20 dil:** 16 yeni anahtar 20 dile de eklendi (`tools/yeni-anahtar-ekle.py` + gen-l10n).
Yeni test: `test/boost_and_style_test.dart` (10 test — efektif hedef + stil göçü).

**Sürüm 1.0.1+3 → 1.0.2+4.** ✅ **İKİ MAĞAZAYA DA GÖNDERİLDİ (2026-07-23, ikisi de incelemede):**
- 🤖 **Play:** AAB (versionCode **4**, 1.0.2, 50.2MB, upload-key imzalı) Alpha kapalı testine yüklendi
  (9360 tarayıcı + `tools/aab-yukle.js`), sürüm notu tr+en yazıldı → **"4 (1.0.2) sürümü incelemede"**
  (track sayfasından teyitli). Play kapalı test 16-gün/2-3 güncelleme şartına da sayılır. Bu sefer
  versionCode YAKILMADI (tek denemede 4). 🪤 Yeni akış: Kaydet→İleri→review Kaydet→**Yayınlama özeti**→
  "1 değişikliği incelemeye gönder"→onay diyaloğu. (Play appId `4974431994893643882`, track `4699878750164991262`.)
- 🍎 **iOS:** Codemagic build #11 (app `6a572a79c0d939a624244645`, API token'la TETİKLENDİ — tarayıcı
  gerekmedi) → IPA build "4" ASC'de VALID → **ASC API ile tamamen otonom submit** (2FA yok, `.p8`
  `AuthKey-JYW9GVD5XJ`): sürüm 1.0.2 (`d8389187...`) oluştur→build 4 bağla→whatsNew(en-US)→reviewSubmission
  →submitted:true → **appStoreState WAITING_FOR_REVIEW, releaseType AFTER_APPROVAL** (Apple onaylayınca
  otomatik yayın). ASC App `6789913186`. Codemagic Sipling app id `6a572a79c0d939a624244645`, workflow `ios-testflight`.
⚠️ **Cihazda hâlâ test EDİLMEDİ** (kullanıcı store'a doğrudan gitmeyi seçti): senkron düzelmesi,
sıcak-gün, kayıt-sil, 3 hatırlatma stili (Android kanal), bildirim "+N ml" düğmesi. Play kapalı test +
Apple incelemesi + TestFlight birer geçit — canlıya çıkmadan cihazda denenebilir. 🚨 **git commit ≠ mağazada canlı.**
Değişen dosyalar: `data/models.dart`, `data/store.dart`, `main.dart`, `services/notifications.dart`,
`services/home_widget_service.dart`, `screens/home_screen.dart`, `screens/settings_screen.dart`,
`screens/stats_screen.dart`, `screens/pro_screen.dart`, `widgets/boost_sheet.dart`(yeni),
`widgets/day_log_sheet.dart`(yeni), 20 `.arb`, `test/boost_and_style_test.dart`(yeni).

## 🩺💧 2026-07-20 — SÜRÜM 1.0.1: HEALTH CONNECT DÜZELDİ + SU BİLGİLERİ + İHTİYAÇ HESAPLAYICI

**Kullanıcı isteği:** (a) profilde çıkış/giriş sistemi, (b) Health Connect neden çalışmıyor,
(c) bildirimlerde su bilgileri + ana ekranda "günlük su ihtiyacını hesapla" butonu.

**(a) GİRİŞ SİSTEMİ — YAPILMADI, kullanıcı vazgeçti.** Sebep: uygulamada giriş sistemi
*hiç yoktu* (kullanıcı olduğunu sanıyordu; "Profil bilgilerim" aslında boy/kilo ekranı).
Eklemek Firebase Auth + sunucu + iki mağazada gizlilik beyanının yeniden doldurulmasını
gerektiriyordu ve "sunucu yok, maliyet sıfır" kararını bozuyordu. Kullanıcıya seçenekler
sunuldu → **"Vazgeçtim, giriş eklemeyelim"** dedi. Veri telefonda kalmaya devam ediyor.

**(b) 🎉 HEALTH CONNECT ÇÖZÜLDÜ — tek satır.** `MainActivity` `FlutterActivity`'den
türüyordu; `health` paketi izin isterken `registerForActivityResult` kullandığı için
`FlutterFragmentActivity` şart. İzin ekranı hiç açılmıyor, çağrı sessizce `false` dönüyordu
→ kullanıcı "İzin verilmedi, sağlık defterine yazılmayacak" görüyordu. Kaynak: `health`
13.3.1 README "Android 14" bölümü. Düzeltildi → `wiki/08-tuzaklar.md` "Health Connect §0".

**(c) Su bilgileri + hesaplayıcı — eklendi:**
- `lib/data/hydration_facts.dart` — TEK KAYNAK. 5 kısa (bildirim) + 5 uzun (ekran) bilgi.
  🚨 Hepsi kaynaklı (EFSA 2010, USGS, Armstrong 2012); dosya başında kaynak listesi var.
- Bildirimler artık **bir motivasyon / bir bilgi** dönüşümlü (`notifications.dart _messages()`).
  Arka arkaya bilgi gelirse hatırlatma ders anlatmaya başlıyor, bilerek örüldü.
- `lib/screens/water_needs_screen.dart` — canlı hesap + "Bunu hedefim yap" + "Su ve vücudun".
  Hesap SIFIRDAN yazılmadı, kurulum akışıyla aynı `calculateGoalMl` çağrılıyor.
  🚨 `clearCustomGoal: true` şart — yoksa elle hedef döner, kaydırıcılar hiçbir şeyi değiştirmez.
- Ana ekranda "Su ihtiyacım" butonu (geri al butonunun yanına, `Row` içinde).
- **29 yeni çeviri anahtarı × 20 dil.** Mevcut anahtarlar (cinsiyet/boy/kilo/aktivite/EFSA
  açıklaması) yeniden kullanıldı, gereksiz çeviri yükü alınmadı.
  Yeni araç: `tools/yeni-anahtar-ekle.py` (kuru deneme + JSON doğrulama, CLAUDE.md kural 9).

**Sürüm 1.0.0+1 → 1.0.1+2.** Testers Community'nin şart koştuğu "16 gün içinde 2-3 küçük
güncelleme"nin **BİRİNCİSİ** bu olacak.

✅ **PLAY KAPALI TESTE GÖNDERİLDİ (2026-07-21).** AAB (versionCode **3**, 1.0.1, 50,1 MB, upload
key imzalı) kapalı test "Alpha" kanalına yüklendi, 20 dilde sürüm notu yazıldı, **incelemeye
gönderildi** → "İncelenmekte olan değişiklikler". Bu, Testers Community'nin şart koştuğu "16 gün
içinde 2-3 güncelleme"nin **BİRİNCİSİ**. (Play Console oturumu açıkmış; önceki "düştü" tespitim
sayfa yüklenmeden bakmaktan kaynaklı yanlıştı.)

🪤 Üç yeni yükleme tuzağı yaşandı → hepsi `wiki/08-tuzaklar.md` "Play Console'a AAB yükleme":
(1) 50,1 MB AAB Playwright `setInputFiles` sınırını aşıyor → `tools/aab-yukle.js` (fileChooser +
`DOM.setFileInputFiles`). (2) Her "işliyor" aslında başarılı yükleme; taslak kutusu boş görünüyor
ama paket kitaplığa gidiyor → versionCode 2 ve 3 boşuna yandı, kod 3 **"Kitaplıktan ekle"** ile
bağlandı (`tools/_kitaplik-tam.js`). (3) Ekran görüntüsüne değil DOM'daki hata metnine bak.

⏳ Play "Health apps declaration" formu HÂLÂ işaretsiz (`wiki/09`) — üretime çıkmadan zorunlu,
ama kapalı testi engellemiyor.

### ✅ APPLE 1.0.1 GÖNDERİLDİ (2026-07-21) — "1.0 Waiting for Review", build 1.0.1(3)
Kullanıcı onayı: *"öncekini iptal edip bu yeni kodlanmış halini de gönderebilirsin."* **YAPILDI:**
- git push (`11a68b5`) → ama **Codemagic otomatik trigger YOK** (`triggering` bloğu yok, `wiki/05`
  §başı). Push build başlatmadı → **Codemagic panelinden ELLE başlatıldı** (kullanıcı GitHub ile
  giriş yaptı, ben Builds→Sipling ▶→branch main→workflow ios-testflight). Build **başarılı**
  (commit 11a68b5, 4m40s, `sipling.ipa` 25,8 MB, Publishing→ASC).
- Apple'a giriş (kullanıcı şifre+2FA girdi) → ASC'de **mevcut 1.0 "Waiting for Review" İPTAL
  edildi** ("remove this version from review" → Remove) → sürüm "Developer Rejected" (düzenlenebilir)
  → Build bölümünde eski build 2 kaldırılıp **build 3 (1.0.1) bağlandı** (kırmızı "-" + "Add Build"
  → radio → Done → Save). ⚠️ Apple app version "1.0"a build "1.0.1"i **sorunsuz kabul etti**
  (version mismatch endişesi çıkmadı). → "Add for Review" → Draft Submission → **"Submit for
  Review" → "1 Item Submitted"**. App = **1.0 Waiting for Review**.
- 🍎 **Pro aboneliği:** `sipling_pro_monthly` **zaten "Waiting for Review"** (grup "In Review"),
  "Add for Review" gri (disabled). Yani Pro Apple'a ÖNCEDEN gönderilmişti, hâlâ kuyrukta. App
  submission'ına EKLENEMEDİ (disabled) → **"1 Item Submitted" = SADECE app**. ⚠️ App ve Pro AYRI
  submission'larda ama İKİSİ DE "Waiting for Review" (ikisi de Apple'da). Bu, 2026-07-15 tuzağından
  FARKLI: o zaman Pro "Ready to Submit" (Apple'a hiç gitmemiş) idi; şimdi Pro Apple'ın elinde.
  Apple app'i incelerken Waiting-for-Review subscription'ı sandbox'ta test edebilir. **Onay ~48 saat.**
- ⚠️ Apple onaylayınca yayına-alma MANUEL olabilir → "Release this version". İnceleme sonucu maili beklenecek.
- ⚠️ iOS ekran görüntüleri değişmedi (yeni "Su ihtiyacım" ekranı ekstra, mevcut 5 iPhone+4 iPad geçerli).
- ℹ️ Health Connect düzeltmesi Android'e özgü (Kotlin), iOS'u etkilemez; iOS'ta yeni olan
  su bilgileri bildirimleri + "Su ihtiyacım" ekranı + 20 dil (hepsi Dart, platform bağımsız).
- 🧰 Yeni kalıcı araç: `tools/aab-yukle.js` (Play 50 MB AAB), `tools/yeni-anahtar-ekle.py` (l10n).

⚠️ **Apple'a bu turda DOKUNULMADI.** iOS 1.0 hâlâ inceleme kuyruğunda (15 Tem'den beri);
yeni sürüm göndermek mevcut gönderimi iptal etmeyi ve kuyruk sırasını kaybetmeyi gerektirir.
Karar: 1.0 sonuçlansın, bu değişiklikler 1.0.1 olarak arkasından gitsin.

## 🧪 2026-07-18/19 — 12 TESTÇİ SERVİSİ SATIN ALINDI, KAPALI TESTE EKLENDİ (Misyon oturumundan yapıldı)

**Ne yapıldı:** Play'in "üretime geçmek için 12 testçi × 14 gün kesintisiz" şartı için **Testers Community** servisinden 3'lü paket alındı (₺1.422, Small Portfolio, %5 indirim). Sipling bu paketin bir kredisiyle gönderildi.

- **Servis:** testerscommunity.com · panele **Google ile giriş** (`randevusayfasi@gmail.com`) · plan **Starter = 15 testçi/uygulama** · 16 gün (14 gün şart + 2 gün tampon) · "üretim erişimi garantisi, yoksa tam iade".
- **Play tarafında yapılan:** servisin grubu **`testers-community@googlegroups.com`** kapalı test kanalının *Google Gruplar* alanına **eklendi** (mevcut `sipling-water-testers@googlegroups.com` SİLİNMEDİ, yanına eklendi) → değişiklik **incelemeye gönderildi** → ✅ **2026-07-19 ONAYLANDI ve teyit edildi** ("İncelenmekte" kalktı; `Test kullanıcıları` ekranında hem `sipling-water-testers@` hem `testers-community@googlegroups.com` canlı). Servis paneli **Day 0/16 · 0 testçi** — atama başlamadı.
- Kanal durumu: Kapalı test - Alpha · Sürüm 1 (1.0.0) · 177 ülke · Etkin.
- Paket adı: `com.sipling.app` · test katılım linki `play.google.com/apps/testing/com.sipling.app`.
- Servise verilen not: giriş gerekmiyor, bildirimlere izin verilsin, 14 gün kurulu kalsın.

**⚠️ SIRADAKİ ŞART:** 16 günlük test süresince **2-3 küçük güncelleme** yayınlanmalı — servis bunu açıkça şart koşuyor, atlanırsa Google üretim başvurusunu reddedebiliyor.
**14 gün dolunca:** servisin panelinden "Production Access Report" indirilip Play'de üretime başvurulacak.

🪤 **Play Console dersi:** testçi grubu eklerken ham JS ile alan doldurmak çalışmıyor (Angular formu "değişmedi" sayıyor, Kaydet pasif kalıyor). Playwright `connectOverCDP` + gerçek klavye girişi + Tab gerekiyor.


## 🔎 2026-07-17 — APPLE CANLI KONTROL (Sipling tarayıcısı 9360)

Kullanıcı "Apple onaylanmadı mı hâlâ" dedi → ASC'ye girildi (oturum düşmüştü, 2FA kullanıcıdan).
**DEĞİŞİKLİK YOK — dünkü durumla birebir aynı, hâlâ kuyrukta:**
- iOS App **Version 1.0 = 🟡 Waiting for Review** (build #2 / 1.0.0 bağlı, otomatik yayın seçili).
- Abonelik grubu **Sipling Pro = 🟡 In Review**; ürün **Sipling Pro Monthly** (`sipling_pro_monthly`,
  1 ay) = 🟡 **Waiting for Review**. Grup ID `22239340`.
- Yani ~2 gündür (15 Tem 18:55 gönderim) kuyrukta, Apple daha aktif incelemeye almadı. Ne onay ne ret.
- 🔑 **Apple giriş e-postası artık kayıtlı:** `gokcektugba198@gmail.com` (Tuğba Gökcek) →
  `wiki/05-yayin-apple.md` başındaki "🔑 Apple giriş bilgisi". Bir daha başka projeye bakma.

## 🔎 2026-07-16 — CANLI KONTROL (iki mağaza, Sipling tarayıcısı 9360)

Kullanıcı isteğiyle her iki konsola girip durum tazelendi:

- **🟢 PLAY — kapalı test İNCELEMEYİ GEÇTİ, artık YAYINDA.** "Kapalı test - Alpha" track:
  *Etkin* · Sürüm 1 (1.0.0) **"Belirli test kullanıcıları tarafından kullanılabilir"** (yeşil onay)
  · 177 ülke · 15 Tem 21:54'te sunuldu. Dün "incelemede"ydi, **Google onayladı.** Testçiler artık
  Play Store'dan indirebilir. **Üretim hâlâ "Etkin değil"** — dashboard'daki üretim-erişim şartı:
  ✅ kapalı test yayınlandı · ⬜ **12 test kullanıcısı kayıtlı olsun (ŞU AN 0)** · ⬜ 12 kişiyle 14 gün.
  "Üretime başvur" butonu bu ikisi bitene kadar gri. **Darboğaz artık teknik değil → 12 gerçek kişi.**
- **🟡 APPLE — hâlâ "Waiting for Review"** (kuyrukta, henüz aktif incelemeye alınmamış). iOS App 1.0
  = *Waiting for Review*. **Pro aboneliği İNCELEMEYE DAHİL** (dünkü app-only riski çözülmüş):
  grup "Sipling Pro" = *In Review*, ürün `sipling_pro_monthly` (1 ay) = *Waiting for Review*.
  ⚠️ ASC oturumu belli aralıkla düşüyor (2FA), kontrol için kullanıcı girişi gerekti.
- **Özet:** Hiçbiri henüz halka açık değil. Play = incelemeyi geçti ama 12 testçi/14 gün şartında
  bekliyor · Apple = inceleme kuyruğunda (~1 gün oldu, tipik 24-48s).
- **📨 TESTÇİ LİNKLERİ + adım adım + kopyala-gönder mesaj → `wiki/04-yayin-play.md` "🧪 TESTÇİ
  KATILIM" bölümü.** Kullanıcı "testçi linklerini ver" derse oradan çek (grup: Sipling Testers,
  `sipling-water-testers@googlegroups.com`; opt-in: `play.google.com/apps/testing/com.sipling.app`).

## ✅ 2026-07-15 (PLAY ÜRETİM) — KAPALI TEST GOOGLE'A GÖNDERİLDİ + LİNKLER ALINDI

Play üretimi için **kişisel hesap zorunlu kapalı test**: **12 testçi × 14 gün** (şu an 0 kayıtlı).
Dahili test BUNU SAYMIYOR — ayrı "Kapalı test" gerekti. **Kuruldu ve incelemeye gönderildi.**

**TAMAMLANDI (33 değişiklik "İncelenmekte"):**
- "Kapalı test - Alpha" kanalı (track ID 4699878750164991262), **177 ülke**.
- Testçiler = **Google Grubu** `sipling-water-testers@googlegroups.com` (kullanıcı CAPTCHA'yı kendi
  çözüp grubu oluşturdu; "Herkes katılabilir"). Play'e bu grup eklendi.
- Sürüm: mevcut App bundle **versionCode 1 (1.0.0)** "Kitaplıktan ekle" ile eklendi, 12,1 MB.
- **Reklam kimliği (AD_ID) beyanı** tamamlandı ("Evet" + "Reklam veya pazarlama").
- "33 değişikliği incelemeye gönder" → onaylandı → **Yayın özeti = "İncelenmekte olan değişiklikler"**.

**🔗 KATILIM LİNKLERİ (kullanıcıya verildi):**
- **Web opt-in (paylaşılacak olan):** `https://play.google.com/apps/testing/com.sipling.app`
- Android (Play Store deep-link): `https://play.google.com/store/apps/details?id=com.sipling.app`
- Not: linke tıklayan kişi **önce gruba üye olmalı** (grup "Herkes katılabilir" → herkes kendi
  girebilir), sonra opt-in sayfasında "Testçi ol" → uygulamayı indirir. 12 gerçek kişi bunu yapıp
  14 gün kalınca üretim erişimi için başvurulur.

**SONRAKİ:** Google closed-test incelemesi (~birkaç gün) bitince testçiler kurabilir; 12 kişi × 14
gün sayaç dolunca Play Console'da **üretim erişim başvurusu** yapılır.

## 🎉 2026-07-15 (SON) — APPLE'A GÖNDERİLDİ (uygulama + Pro aboneliği BİRLİKTE)

**iOS 1.0 + Sipling Pro Monthly ($0,99/ay) İNCELEMEDE — "Waiting for Review" (Submission bugün 18:55).**
Abonelik durumu da "Waiting for Review" = birlikte inceleniyor. Eski app-only gönderim (17:48) iptal
edildi ("Removed").

**ÇÖZÜLEN KRİTİK TUZAK (wiki/08'e de eklendi):** Sürüm sayfasındaki "In-App Purchases and
Subscriptions" bölümü, sürüm **gönderilmiş/"Ready for Review" durumundayken KİLİTLİ** (salt-gösterim
gri kutu, tıklanamaz). Aboneliği eklemek için sürümün **"Prepare for Submission" / "Developer
Rejected" (düzenlenebilir)** durumunda olması gerekiyor — o zaman kutuda gerçek **mavi "Select In-App
Purchases or Subscriptions" butonu** çıkıyor → tıkla → aboneliği işaretle → Done → Add for Review →
Submit. İlk seferde sürüm zaten gönderilmiş olduğu için kutu kilitliydi; **gönderimi iptal edip**
(App Review → submission → Cancel Submission → Confirm) sürüm düzenlenebilir olunca buton çıktı.

⚠️ **Release seçeneği:** iptal+yeniden-ekle'de sıfırlanmış olabilir (muhtemelen MANUAL). Yani Apple
onaylayınca uygulama otomatik yayına GİRMEYEBİLİR — kullanıcı sürüm sayfasından "Release this
version"a basar. (Kullanıcı zaten "yayına geçerim orada" demişti, bu ona uygun.)

**Sıradaki (Apple onayı ~1-2 gün sonra):** onaylanınca "Release" (otomatik değilse) · AdMob ödeme
profili tamamlanınca reklamlar dolmaya başlar (şu an no-fill) · sandbox'ta Pro satın-alma testi.

## 🍎 2026-07-15 (2. blok) — APPLE APP STORE SÜRÜM SAYFASI NEREDEYSE TAM

Apple'a giriş yapıldı (Team SGMQ8NVKU3, Tuğba Gökcek). **Business/Agreements KONTROL EDİLDİ:
Ücretli Uygulamalar Sözleşmesi + Ziraat banka + W-8BEN vergi HEPSİ AKTİF** (hesap-geneli, Misyon/
Randevio'dan) → Sipling için abonelik oluşturulabilir, finansal engel yok.

**App Store sürüm 1.0 sayfasında YAPILDI (`/apps/6789913186/distribution`):**
- **iPhone 6.5" ekran görüntüleri (5 adet, 1242×2688)** yüklendi. Üretim: `tools/ios-gorseller.js 65`
  → `store/ios-65/`. (Play'inkiler 1080×1920 idi, Apple kabul etmez → iOS boyutunda yeniden üretildi.)
- **Açıklama/keywords/promo/support/marketing URL/copyright** dolduruldu. ⚠️ Apple açıklamada EMOJİ
  KABUL ETMİYOR (Play ediyordu) → emojisiz sürüm: `store/metinler/apple-en.txt`. "İnternet izni yok"
  iddiası reklam yüzünden yanlış olduğu için metinden çıkarıldı.
- **Build 1 (1.0.0)** sürüme bağlandı. **Sign-in required = kapalı** (girişsiz uygulama).
- **İnceleme iletişim:** Asım Gökcek / asim_gokcek@hotmail.com + inceleme notu. ⏳ **TELEFON EKSİK** (kullanıcı).
- **App Information:** Subtitle "Water tracker & reminder", Kategori Primary=Health & Fitness /
  Secondary=Lifestyle, İçerik Hakları = "Hayır (üçüncü taraf içerik yok)".
- **Yaş Derecesi = 9+** (7 adımlı yeni anket). Reklam=YES, Health/Wellness Topics=YES; alkol ⚠️ **None
  seçildi** (Sipling'de "alkol" içecek kaydı var ama tanıtım yok; WaterMinder vb. hidrasyon app'leri
  gibi 4+ mantığı, reklam yüzünden 9+ çıktı). Kullanıcı isterse 12+'a çekilebilir.
- **Fiyat = Free (0)**, 175 ülke; **App Availability = tüm ülkeler**. Model: bedava indirme+reklam,
  Pro (reklamsız) **0,99$/ay** ayrı abonelik (kullanıcı 2026-07-15 netleştirdi).
- **App Privacy:** Gizlilik URL = `/gizlilik`. 5 veri türü (Device ID, Product Interaction,
  Advertising Data, Crash Data, Performance Data) hepsi **"kimliğe bağlı değil + izleme YOK"** dürüst
  beyanla dolduruldu (kodda ATT çağrısı yok → iOS'ta kişiselleştirilmemiş reklam).

### ✅ 2026-07-15 (3. blok) — APPLE NEREDEYSE GÖNDERİLDİ, TEK KALAN ADIM
ATT sorunu çözüldü: `nonPersonalizedAds:true` + Info.plist'ten ATT metni kaldırıldı → commit d0b484f
push → Codemagic build **6a577bf4** başarılı → **Build 2** (ATT'siz) ASC'de. Build 2 sürüme bağlandı,
**App Privacy YAYINLANDI** (izleme yok), yaş 9+, tıbbi cihaz "Hayır", fiyat Free/175 ülke,
iPhone 6.5" (5) + **iPad 13" (4) ekran görüntüleri** yüklendi (`tools/ipad-gorseller.js`), inceleme
iletişim **Asım Gökcek / +905072407015 / asim_gokcek@hotmail.com** + not, **onaydan sonra otomatik
yayın** seçildi. Uygulama sürümü = **"Ready for Review"**, taslak gönderim (Draft Submission) oluştu.

**Pro aboneliği "Ready to Submit":** grup "Sipling Pro" + ürün `sipling_pro_monthly` 0,99$/ay, 175
ülke, localization (Sipling Pro / "Remove all ads..."), **grup görünen adı "Sipling Pro"** (eksikti,
"Missing Metadata"nın sebebi buydu → eklendi), inceleme ekran görüntüsü = paywall
(`store/ios-65/paywall.png`, `tools/ios-paywall.js`), inceleme notu.

**⚠️ UYGULAMA GÖNDERİLDİ (app-only) — "Waiting for Review" (2026-07-15, ~48s):** "Submit for Review"
basıldı, **"1 Item Submitted"** = SADECE uygulama gitti, **Pro aboneliği DAHİL OLMADI.**

Sebep: Sürüm sayfasındaki "In-App Purchases and Subscriptions" gri kutusu **salt-gösterim** (DOM'da
cursor:auto, onClick yok, React event-delegation bile yok — `elementFromPoint` inert P döndürüyor).
Yani abonelik oraya CDP tıklamasıyla EKLENEMİYOR; gerçek insan tıklaması gerekiyor. Abonelik hâlâ
**"Ready to Submit"** (Apple ID 6791177254) ama gönderime bağlanamadı.

**RİSK:** app-only sürümde Pro paywall'ı "Store isn't available right now" gösterir → Apple 2.1'den
**büyük ihtimalle reddeder** (IAP fonksiyonel değil). Kullanıcıya karar soruldu.
**Kurtarma yolları:** (a) gönderimi geri çek → kullanıcı sürüm sayfasında gri kutuya elle tıklayıp
`Sipling Pro Monthly` seçsin → yeniden gönder; (b) app-only inceleme sonucunu bekle, reddedilirse Pro
bağlı yeniden gönder; (c) app onaylanırsa Pro'yu 1.0.1 ile ekle. App Store App ID 6789913186.
⚠️ AdMob ödeme profili hâlâ eksik (kullanıcı) → reklamlar no-fill (inceleme için sorun değil).

### 🔴 AÇIK ENGEL — ATT/izleme tutarsızlığı (Publish kilitli) [ÇÖZÜLDÜ — yukarı bak]
`Info.plist`'te **NSUserTrackingUsageDescription VAR** ama kod ATT prompt'u çağırmıyor. Apple:
"ya bir veri türünü 'izleme için' işaretle, ya binary'yi güncelle" diyor → **App Privacy Publish
kilitli**. Doğru çözüm (marka=gizlilik-öncelikli): **NSUserTrackingUsageDescription'ı Info.plist'ten
kaldır → Codemagic yeniden derle → yeni build'i sürüme bağla → App Privacy no-tracking olarak publish.**
Alternatif (kişiselleştirilmiş reklam + ATT prompt kodu) daha çok gelir ama marka/UX'e ters.
**Kullanıcıya soruldu (ATT kararı) + telefon istendi. Karar gelince: rebuild + Pro aboneliği (0,99$)
oluştur + submit.**

Yardımcı scriptler: `tools/asc-*.js` (upload, fill-version, pickbuild, age-step, priv-flow, click-xy).

## ✅ 2026-07-15 — PLAY DAHİLİ TEST YAYINDA + iOS TESTFLIGHT'TA + TESTÇİ EKLENDİ

Bir önceki blokların "kalan hesap işi" dediklerinin çoğu **yapıldı** (izole, kendi kayıtları altında):

- **Play Dahili test AKTİF** — AAB yüklendi, sürüm 1 (1.0.0) "Etkin". Uygulama "com.sipling.app
  (unreviewed)" durumunda (Play ilk inceleme sürüyor).
- **Testçi listesi (İZOLE):** yeni **"Sipling Testçiler"** e-posta listesi oluşturuldu, içine
  `asim_gokcek@hotmail.com` eklendi ve Dahili test track'ine bağlandı. ⚠️ Randevio Testçiler (19)
  ve Asim Test (Sahip) listelerine DOKUNULMADI — karışma yok.
- **📲 Katılım linki (kullanıcının telefonu için):**
  `https://play.google.com/apps/internaltest/4701060962389165240`
  → bu linke aynı Google hesabıyla (`asim_gokcek@hotmail.com`) gir, "test kullanıcısı ol" de,
  sonra Play Store'dan Sipling'i indir. (İlk inceleme bitene kadar birkaç saat "beklemede" olabilir.)
- **iOS:** Codemagic (bulut Mac) build 5 hata düzeltilerek geçti → `.ipa` App Store Connect'e
  yüklendi. TestFlight işleme durumunu doğrula; iOS testçi eklemek Apple'a 2FA'lı yeniden giriş ister
  (oturum kapandı). App Store yayını için inceleme + IAP + ekran görüntüleri kaldı.
- **Public repo temizliği** (diğer projelerin port/klasör bilgisini içeren CLAUDE.md/wiki) hâlâ
  bekliyor — "clean" orphan branch hazır, force-push kullanıcı onayı bekliyor.

## ▶️ SIRADAKİ OTURUMDA İLK İŞ (2026-07-15 itibarıyla) — İKİSİ DE GÖNDERİLDİ, BEKLEME AŞAMASI

**Android + iOS + Wear kod tarafı TAM. İki mağazaya da gönderildi (yukarıdaki 2026-07-15 blokları).**
Kalan her şey ZAMAN + kullanıcının hesap/para işi:

1. **Play kapalı test incelemesi bekleniyor** (~birkaç gün). Bitince testçiler kurabilir.
   Katılım linki: **`https://play.google.com/apps/testing/com.sipling.app`** (12 kişiye verildi).
2. **12 gerçek kişi × 14 gün** sayacı: link+grup hazır, 12 kişi girip kurunca ve 14 gün geçince
   Play Console **üretim (herkese açık) erişim başvurusu** açılır. Google'ın kişisel-hesap zorunluluğu.
3. **Apple incelemesi bekleniyor** (~1-2 gün). ⚠️ Onaydan sonra yayına-alma MANUEL olabilir →
   onay maili gelince ASC'de **"Release this version"** gerekebilir. Kontrol et.
4. ✅ **AdMob ödeme profili TAMAMLANDI (2026-07-15).** Ayrı IBAN girmeye gerek olmadı — hesabın
   (`randevusayfasi@gmail.com`) **ortak "Oynat ve Reklamlar" profili** (TUĞBA GÖKCEK, profil kimliği
   `7874-4902-7827`) AdMob'a bağlandı ("Gönder" tıklandı, kullanıcı onayladı: tüm projeler aynı IBAN).
   Ödeme profili tüm Google ürünlerinde paylaşılıyor. Kurulum 2/4, "ödeme tamamlanmadı" bandı gitti.
   ⏳ Kalan: AdMob "Hesabınız henüz onaylanmadı" = Google hesabı inceliyor (kendiliğinden biter).
   Play Billing TR fiyatı Console'da görülünce.
5. **Wear OS** → build-hazır iskele (`Sipling-saat-test.apk`), 1.1'de senkron/ambient. → `wiki/10-wear-os.md`.

Test/indirme linki (eski, kapalı test dışı): **https://sipling-app.web.app/indir** — Firebase ücretsiz
plan `.apk` yasakladığı için dosya `sipling-test.bin`, `Content-Disposition` ile `Sipling.apk` iniyor.

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
