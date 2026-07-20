# 🗺️ Kod Haritası — hangi buton hangi dosyada

> Amaç: bir şeyi değiştirmeden önce **tüm kodu okumak zorunda kalmamak.**
> Satır numaraları **2026-07-10** itibarıyla doğru (20 dil yerelleştirmesi her ekranı kaydırdı).
> Kod değişince bu tabloyu güncelle. Kök: `Sipling/app/lib/`
> ⚠️ Ekranlar artık metni `l.xxx` ile alıyor (`import '../l10n/labels.dart'`, `final l = context.l`).

## 📱 Ana ekran — "Bugün" sekmesi

| Ekranda gördüğün şey | Dosya : satır | Sınıf |
|---|---|---|
| Üstteki `2400 / 2100 ml` + "X ml kaldı" + 🔥 seri rozeti | `screens/home_screen.dart:222` | `_Header` |
| Daireyi çevreleyen ilerleme halkası (mavi→yeşil) | `screens/home_screen.dart:381` | `_ProgressRing` |
| Daire içi sahne: gökyüzü, toprak, yükselen yeraltı suyu | `widgets/garden_scene.dart:107` | `_ScenePainter` |
| Sahnenin animasyonu (dalga, salınım, büyüme) | `widgets/garden_scene.dart:30` | `_GardenSceneState` |
| Ağacın kendisi (tohum→filiz→fidan→ağaç) | `widgets/tree_painter.dart:14` | `TreePainter` |
| "Fidanın büyüyor" / "Bugünkü ağacın hazır" yazısı | `screens/home_screen.dart:165` | `_StageLabel` |
| "Bu saatte 539 ml geridesin" tempo ipucu | `screens/home_screen.dart:192` | `_PaceHint` |
| Alttaki 3 hızlı bardak butonu | `screens/home_screen.dart:303` ve `:341` | `_QuickAddBar`, `_AddButton` |
| Mavi **"Diğer"** butonu (kahve ikonu + `l.homeMoreDrinks`) | `screens/home_screen.dart:303` → `:80` | `_QuickAddBar` → `_openSheet()` (eskiden düz "+", 4. bardak sanılıyordu) |
| Açılan içecek sayfası (7 içecek + miktar kaydırıcı) | `widgets/add_drink_sheet.dart:7` | `AddDrinkSheet` — 7 içecek `Wrap` ile 2 satır (eskiden yatay ListView'di, 3'ü gizli kalıyordu) |
| "Hedefe %80 oranında sayılır" / alkol uyarısı | `widgets/add_drink_sheet.dart:133` | `_FactorHint` |
| Hedef dolunca çıkan 🌳 kutlama penceresi | `screens/home_screen.dart:420` | `_CelebrationDialog` |
| "Yeni başarım" yeşil bildirim çubuğu | `screens/home_screen.dart:47` | `_showNewAchievements()` |
| "Son eklemeyi geri al" | `screens/home_screen.dart` (buton) → `data/store.dart:171` | `undoLastSip()` |
| **"Su ihtiyacım"** butonu (geri al'ın yanında) | `screens/home_screen.dart` → `screens/water_needs_screen.dart:24` | `WaterNeedsScreen` |
| **Su eklendiğinde ne olur** (kayıt + kutlama + bildirim + widget + Health Connect) | `screens/home_screen.dart:23` | `_record()` |

## 🌲 Orman sekmesi

| Ekranda gördüğün şey | Dosya : satır | Sınıf |
|---|---|---|
| Başlık + "15 ağaç • en iyi seri 3 gün" | `screens/forest_screen.dart:16` | `ForestScreen` |
| Sağ üstteki ağaç türleri butonu | `screens/forest_screen.dart:16` → `screens/species_screen.dart:11` | IconButton |
| "Ormanın henüz boş" ekranı | `screens/forest_screen.dart:117` | `_EmptyForest` |
| Tek bir ağaç + boyut çeşitliliği (mevsime boyanır) | `screens/forest_screen.dart:148` | `_ForestTree` |
| Ağaç dibindeki gölge (rengi mevsimden) | `screens/forest_screen.dart:193` | `_ShadowPainter` |
| Arkadaki yumuşak tepeler (rengi mevsimden) | `screens/forest_screen.dart:221` | `_HillsPainter` |
| Orman teması (Klasik/mevsimler) | `screens/season_screen.dart:14` | `SeasonScreen` → `data/season_theme.dart` |

## 📊 İstatistik sekmesi

| Ekranda gördüğün şey | Dosya : satır | Sınıf |
|---|---|---|
| "7 gün / 30 gün" seçici | `screens/stats_screen.dart:124` | `_RangeToggle` |
| 4 özet kart (ortalama, hedef tutan gün, seri, ağaç) | `screens/stats_screen.dart:165` | `_StatCard` |
| Çubuk grafik | `screens/stats_screen.dart:218` | `_BarChart` |
| Grafikteki kesikli hedef çizgisi | `screens/stats_screen.dart:305` | `_DashedLine` |
| İçecek dağılımı çubukları | `screens/stats_screen.dart:323` | `_DrinkBreakdown` |
| BMI kartı | `screens/stats_screen.dart:398` | `_BmiCard` |
| "Başarımlar" satırı | `screens/stats_screen.dart:442` → `screens/achievements_screen.dart:9` | `_AchievementsButton` |
| **"Orman Özetin" (Wrapped) satırı** | `screens/stats_screen.dart:119` → `screens/wrapped_screen.dart:20` | `_WrappedButton` `:485` |
| Wrapped kartı → PNG → paylaş | `screens/wrapped_screen.dart:31` `_share()` → `services/share_image.dart` | `RepaintBoundary`→`SharePlus` |
| Wrapped verisi (tüm zaman: L/ağaç/seri/gün/top) | `data/store.dart:265` `wrappedStats` | record getter |

## ⚙️ Ayarlar sekmesi

| Ayar satırı | Ekranı açan kod | İşi yapan kod |
|---|---|---|
| Sipling Pro afişi | `screens/settings_screen.dart:439` `_ProBanner` | `screens/pro_screen.dart:14` |
| Günlük hedef (kaydırıcı + "önerilene dön") | `screens/settings_screen.dart:247` | `_editGoal()` → `data/goal_calculator.dart:15` |
| Profil bilgilerim | `screens/onboarding_screen.dart:13` | `OnboardingScreen` (mevcut profili yükler) |
| Hatırlatmalar açık/kapalı | `screens/settings_screen.dart:124` | `services/notifications.dart:69` (izin ister) |
| Sıklık (1 / 1,5 / 2 / 3 saat) | `screens/settings_screen.dart:297` | `_editInterval()` |
| Uyanık saatlerim | `screens/settings_screen.dart:319` | `_editHours()` (min. 4 saat kontrolü) |
| Hedefi tutunca sus · Sessiz bildirim | `screens/settings_screen.dart:124` | `services/notifications.dart:99` `reschedule()` |
| **Health Connect'e yaz** (izin akışı) | `screens/settings_screen.dart:189` | `_toggleHealth()` `:37` |
| **Orman teması** | `screens/settings_screen.dart:201` | `SeasonScreen` |
| **"Ana ekrana widget ekle"** (tek dokunuş) | `screens/settings_screen.dart:217` `_addWidget()` `:35` | `home_widget_service.dart:60` `isPinSupported`/`requestPin` (web'de gizli) |
| **Bildirim gelmiyor mu?** (pil rehberi) | `screens/battery_guide_screen.dart:8` | statik içerik |
| Bardaklarım (3 bardak düzenle) | `screens/settings_screen.dart:177` | `_editCup()` |
| Koyu tema | `data/store.dart` `setDarkMode()` | `theme.dart:51` `siplingTheme()` |
| Ağaç türleri | `screens/species_screen.dart:11` | `SpeciesScreen` |
| Tüm verileri sıfırla | `screens/settings_screen.dart:232` | `_confirmReset()` `:413` → `store.resetAll()` |

## 🚪 Kurulum akışı (ilk açılış)

| Adım | Dosya : satır |
|---|---|
| Akışı yöneten sayfa | `screens/onboarding_screen.dart:13` `OnboardingScreen` |
| 1. Karşılama ("Her yudum bir fidan") | `:166` `_WelcomePage` |
| 2. Cinsiyet | `:220` `_GenderPage` |
| 3. Boy / kilo / yaş + BMI | `:258` `_BodyPage` |
| 4. Hareket düzeyi | `:331` `_ActivityPage` |
| 5. Hesaplanan hedef + EFSA açıklaması | `:362` `_GoalPage` |
| Kurulum + dünün özeti ne zaman açılır | `main.dart:88` `_bootstrap()` |

## 💧 Su ihtiyacı hesaplayıcı + "Su ve vücudun"

| Ekranda gördüğün şey | Dosya : satır |
|---|---|
| Ekranın tamamı | `screens/water_needs_screen.dart:24` `WaterNeedsScreen` |
| Ana ekrandaki giriş butonu | `screens/home_screen.dart` (geri al butonunun yanındaki `Row`) |
| Canlı hesap (elle hedefi yok sayar) | `water_needs_screen.dart` `_calculated` → `goal_calculator.dart:15` |
| "Bunu hedefim yap" | `water_needs_screen.dart` `_apply()` → `store.saveProfile` + `reschedule` |
| Hareket düzeyi seçim satırı | `water_needs_screen.dart` `_ActivityTile` |
| Bilgi kartlarının metni | `data/hydration_facts.dart` `learnFacts(l)` |
| Bildirimlerdeki bilgiler | `data/hydration_facts.dart` `notificationFacts(l)` → `services/notifications.dart` `_messages()` |

🚨 Hesap **sıfırdan yazılmadı** — kurulum akışıyla aynı `calculateGoalMl` çağrılıyor ki iki
yerde iki farklı sonuç çıkmasın. Ekran hesaplarken `clearCustomGoal: true` veriyor; vermezse
`calculateGoalMl` elle ayarlanmış hedefi döndürür ve kaydırıcılar hiçbir şeyi değiştirmez
(testi var: `test/goal_calculator_test.dart` "su ihtiyacı hesabı elle hedefi yok sayar").

🚨 `hydration_facts.dart` içindeki bilgiler **kaynaklı** (EFSA 2010, USGS, Armstrong 2012).
Dosyanın başındaki kaynak listesine bakmadan yeni madde ekleme, uydurma sağlık iddiası yazma.

## 🧮 Hesaplar ve kurallar (ekran değil, mantık)

| Soru | Cevap nerede |
|---|---|
| Günlük hedef nasıl hesaplanıyor? | `data/goal_calculator.dart:15` `calculateGoalMl()` |
| BMI nasıl hesaplanıyor? | `data/goal_calculator.dart:33` `calculateBmi()` · sınıf `:43` `bmiCategoryOf()` |
| "Bu saatte ne kadar içmiş olmalıyım?" | `data/goal_calculator.dart:52` `expectedProgressAt()` |
| Seri (streak) nasıl sayılıyor? | `data/store.dart:202` `currentStreak` · `:217` `bestStreak` |
| İçeceklerin hidrasyon katsayıları | `data/models.dart:8` `enum DrinkType` |
| Bir günün "tamamlandı" sayılması | `data/models.dart:68` `DayRecord.completed` |
| Başarım listesi ve koşulları | `data/achievements.dart:41` `kAchievements` |
| Ağaç türleri ve açılma kuralları | `data/tree_species.dart:38` `kTreeSpecies` |
| Bir tür açık mı? | `data/store.dart:275` `isSpeciesUnlocked()` |
| Dünün özeti gösterilmeli mi? | `data/store.dart:355` `pendingSummary` → `screens/day_summary_screen.dart` |
| Mevsim teması ne çizilecek? | `data/store.dart:66` `seasonTheme` → `data/season_theme.dart` |
| Bildirimlerin planlanması | `services/notifications.dart:137` `reschedule()` (artık `cups` alır) |
| **Bildirimdeki "+N ml" butonu** (uygulama kapalı) | `services/notifications.dart:22` `siplingNotificationAction` (üst düzey, `vm:entry-point`) → `home_widget_service.dart:156` `onWidgetTap` | manifest'te `ActionBroadcastReceiver` şart |
| Bildirim butonu (uygulama açık) | `services/notifications.dart:57` `_onResponse` → `onForegroundAdd` (`main.dart`'ta bağlanır) | `store.addSip` |
| Renkler ve tema | `theme.dart:5` `SiplingColors` · `:35` `Palette` |

## 💾 Veri saklama

Her şey `data/store.dart` içindeki `AppState` (bir `ChangeNotifier`) üzerinden geçer.
Depolama: **SharedPreferences** — cihazda, sunucu yok.

| Anahtar | İçerik |
|---|---|
| `profile` | cinsiyet, yaş, boy, kilo, aktivite, uyanık saatler, özel hedef, birim |
| `days` | gün → `{hedef, ağaç türü, içilenler[]}` (son 400 gün, `store.dart:183`) |
| `reminder` | bildirim ayarları |
| `cups` | 3 hızlı bardak (varsayılan adları **boş** — dile göre yazılır) |
| `pro`, `unlocked_species`, `selected_species`, `dark_mode`, `seen_achievements` | — |
| `health_sync` | Health Connect'e yazma açık mı (varsayılan kapalı) |
| `season_theme` | seçili orman teması (`classic`/`auto`/`spring`...) |
| `last_summary_date` | dünün özeti hangi güne kadar gösterildi |

Yükleme: `store.dart:74` `init()` · Kaydetme: her `save*()`/`set*()` metodu anında yazar.

⚠️ **Web önizlemesinde** SharedPreferences `localStorage`'a yazar; değer **tek** `json.encode`'dan
geçer (`shared_preferences_web` → `_encodeValue`). Karışıklık şuradan çıkıyor: `days`/`profile`
zaten JSON **metni** olarak saklandığı için localStorage'da iki kat kaçışlı görünür, ama
`season_theme` gibi düz metinler tek kat.

```js
// days / profile  → Dart değeri bir JSON metni  → iki kez
localStorage.setItem('flutter.days', JSON.stringify(JSON.stringify(obj)));
// season_theme / selected_species → düz metin   → BİR kez
localStorage.setItem('flutter.season_theme', JSON.stringify('winter'));
// pro / dark_mode → bool                        → düz
localStorage.setItem('flutter.pro', true);
```
İki kez yazarsan değer `"\"winter\""` olur, `seasonById` bulamaz ve sessizce klasiğe düşer.

## 🏠 Ana ekran widget'ı

| Parça | Dosya |
|---|---|
| Veri köprüsü + arka plan giriş noktası | `lib/services/home_widget_service.dart` |
| Kayıt + her değişimde tazeleme | `lib/main.dart` (`main()` içinde) |
| Widget'ı çizen Kotlin | `android/app/src/main/kotlin/com/sipling/sipling/SiplingWidgetProvider.kt` |
| Görünüm | `android/app/src/main/res/layout/sipling_widget.xml` |
| Renkler (açık/koyu) | `res/values/colors.xml` · `res/values-night/colors.xml` |
| Launcher'a tanıtım (boyut, önizleme) | `res/xml/sipling_widget_info.xml` |
| Alıcı kayıtları | `AndroidManifest.xml` (2 receiver) |
| **iOS widget kaynağı** (WidgetKit/SwiftUI) | `ios/SiplingWidget/SiplingWidget.swift` · `Info.plist` · `.entitlements` |
| iOS App Group bağlama | `home_widget_service.dart` `initAppGroup()` (`main.dart`'ta çağrı) + `iOSName` |

Akış: uygulama `push()` ile özet veriyi (ml, hedef, yüzde, seri, 3 bardak, ağaç PNG yolu)
paylaşılan bir SharedPreferences'a yazar → Kotlin (Android) / App Group UserDefaults (iOS) okur.
Widget'taki bardak butonu → broadcast → `siplingWidgetTapped()` → `addSip` + bildirimleri
yeniden planla + `push(foreground: false)`. (iOS widget'ı şimdilik gösterim + dokun-aç.)

🚨 Buraya dokunmadan önce `wiki/08-tuzaklar.md` → "Ana ekran widget'ı" bölümünü oku.
Üç tuzağın üçü de sessizce başarısız oluyor. iOS widget hedefi → `wiki/05-yayin-apple.md`.

## 🍎⌚ iOS & Wear OS dosyaları

| Parça | Dosya |
|---|---|
| iOS bildirim "+N ml" (Darwin kategorisi) | `lib/services/notifications.dart` (`_iosCategoryId`, `_firstCupMl`) |
| iOS izin/dil/entitlements | `ios/Runner/Info.plist` (20 dil, HealthKit) · `ios/Runner/Runner.entitlements` (App Group) |
| iOS CI (derle+imzala+TestFlight) | `codemagic.yaml` (repo kökü) |
| iOS widget Xcode entegrasyonu | `ios/tools/add_widget_target.rb` (Mac/CI'da çalışır) |
| **Wear OS giriş noktası** | `lib/main_wear.dart` (ayrı entrypoint) |
| **Wear OS ekranı** | `lib/wear/wear_screen.dart` (ilerleme halkası + bardaklar) |

## 🌍 Diller (20 dil)

**Tek kaynak: `tools/diller.json`.** Yeni dil eklerken oraya satır ekle, gerisi betiklerle gelir.

| Parça | Dosya |
|---|---|
| Çeviri kaynakları | `lib/l10n/app_<dil>.arb` — **20 dosya × 255 anahtar** |
| Üretilen sınıf `L` | `lib/l10n/app_localizations*.dart` (`flutter gen-l10n`) |
| `context.l` kısayolu + veri katmanı adları | `lib/l10n/labels.dart` |
| Ekran parçalarını birleştiren betik | `tools/arb-birlestir.py` |
| Widget'ın (Kotlin) metinleri | `res/values*/strings.xml` — **`tools/widget-diller.py` üretir, elle yazma** |
| Mağaza metinleri | `store/metinler/<play-kodu>.json` (20 dil) |
| Mağaza ekran görüntüleri | `tools/magaza-gorseller.js` → `store/<play-kodu>/` |
| Öne çıkan grafikler | `tools/feature-grafik.py` → `store/<play-kodu>/feature-graphic.png` |

Diller: en tr es pt de fr it ru id hi ja ko zh zh_Hant vi th pl nl uk **ar (RTL)**

🚨 **Arapça sağdan sola.** Yeni ekran yazarken `EdgeInsets.only(left:)` ve `Alignment.centerRight`
KULLANMA; `EdgeInsetsDirectional` ve `AlignmentDirectional` kullan. Yoksa Arapçada ekran bozulur.

🚨 **Widget metinleri `.arb`'yi göremez** (Kotlin tarafı). `tools/widget-diller.py` onları
`.arb` + mağaza sloganlarından türetip 20 `values-*/strings.xml` yazıyor. Metin değişince
betiği yeniden çalıştır.

**Veri katmanı artık metin taşımıyor.** `DrinkType`, `TreeSpecies`, `Achievement`,
`SeasonTheme`, `ActivityLevel` yalnız `id` taşır; adlar `labels.dart` içinde dile göre üretilir:
`type.label(l)`, `species.name(l)`, `a.title(l)`, `theme.name(l)`, `bmiLabelOf(l, bmi)`.

Dil seçici **yok** — sistem dili Türkçeyse Türkçe, değilse İngilizce.
Bardakların varsayılan adı prefs'e yazılmaz (boş kalır), ekranda `cupLabel(l, cup, i)` yazar.

🚨 Çeviri eklerken `wiki/08-tuzaklar.md` → "Yerelleştirme" bölümünü oku (ICU tırnak tuzağı).

## ❤️ Health Connect (yalnız yazar)

| Parça | Dosya |
|---|---|
| Platform seçici (koşullu import) | `lib/services/health/health_bridge.dart` |
| Gerçek uygulama (Android) | `lib/services/health/health_bridge_io.dart` |
| Web/boş uygulama | `lib/services/health/health_bridge_stub.dart` |
| Açma/kapama + izin akışı | `lib/screens/settings_screen.dart` → `_toggleHealth()` |
| Tercih + yazma/silme çağrıları | `lib/data/store.dart` → `healthSync`, `addSip`, `undoLastSip` |
| İzin, `queries`, gizlilik bağlantısı | `AndroidManifest.xml` |

Varsayılan **kapalı**. Kullanıcı Ayarlar'dan açar, Health Connect izin ekranı çıkar, izin
verilirse anahtar açık konuma geçer. Su eklenince gerçek hacim (katsayısız) yazılır, geri
alınca silinir. Widget'tan gelen eklemeler de `addSip`'ten geçtiği için sağlık defterine düşer.

🚨 `wiki/08-tuzaklar.md` → "Health Connect": litre/mililitre ve "kayıt bir aralıktır" tuzakları.

## 🖼️ Kod olmayan varlıklar

| Ne | Nerede |
|---|---|
| Uygulama ikonu kaynağı (SVG) | `app/assets/icon/icon.svg` · `icon_fg.svg` · `icon_bg.svg` |
| SVG → PNG üreten betik | `tools/ikon-uret.sh` |
| İkonu android/ios/web'e bağlayan ayar | `app/pubspec.yaml` → `flutter_launcher_icons:` |
| Üretilen Android ikonları | `android/app/src/main/res/mipmap-*` · `drawable-*dpi/ic_launcher_*` |
| Play mağaza ikonu (512×512) | `app/assets/icon/play_icon.png` |

⚠️ `assets/icon/` **pubspec'in `flutter: assets:` listesinde değil** — bilerek. Bu görseller
yalnız derleme anında ikon üretmek için var, uygulamanın içine gömülmezler (APK şişmesin).

## 🧩 Yeni bir şey eklerken

- **Yeni içecek türü** → `data/models.dart:8` `DrinkType` enum'una bir satır +
  `l10n/labels.dart` `DrinkLabel` + 20 `.arb`'ye `drinkXxx` anahtarı.
- **Yeni ağaç türü** → `data/tree_species.dart:38` listesine bir kayıt (adı yok, `id`'li) +
  `labels.dart` `SpeciesLabel` + 20 `.arb`'ye `speciesXxx`. Yeni kanopi şekli gerekiyorsa
  `CanopyShape` + `tree_painter.dart` `_drawCanopy` switch'i.
- **Yeni başarım** → `data/achievements.dart:41` listesine bir kayıt (adı yok) + `labels.dart`
  `AchievementLabel` + `.arb`. Gereken veri `AchievementStats`'te yoksa `store.dart:235`.
- **Yeni ayar** → `models.dart` ilgili sınıfa alan + `toJson/fromJson/copyWith`,
  `store.dart`'a `save*()`, `settings_screen.dart`'a satır (metin `l.setXxx`).
- **Yeni ekran** → `screens/` altına, `main.dart:73` `_pages` listesine veya `Navigator.push` ile.
- **Yeni kullanıcı metni** → hangi ekranda ise `l.<önek>Xxx`; anahtarı 20 `.arb`'ye ekle,
  `flutter gen-l10n`. 🚨 RTL için `EdgeInsetsDirectional`/`AlignmentDirectional`.
  🚨 Yer tutuculu metinde kesme işaretini İKİLEME (`wiki/08-tuzaklar.md`).
