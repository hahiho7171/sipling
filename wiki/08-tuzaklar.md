# 🪤 Tuzaklar ve dersler (yaşanmış, tekrar düşme)

## 📦 Play Console'a AAB yükleme (2026-07-20, üç ayrı tuzak birden)

### 1. 🚨 AAB 50 MB'ı aştı → Playwright `setInputFiles` REDDEDER
Hata: `Cannot transfer files larger than 50Mb to a browser not co-located with the server`.
Sebep: `connectOverCDP` ile bağlanınca Playwright tarayıcıyı "uzak" sayar ve dosyayı
base64'e çevirip aktarmaya çalışır; sınır 50 MiB (52.428.800 bayt).
Sipling 1.0.1 AAB'si **50,1 MB** → sınırı 113 KB aşıyor. `tools/_upload.js` bu yüzden çalışmaz.

**Çözüm — `tools/aab-yukle.js`:** "Yükle" butonuna gerçekten tıkla, açılan dosya seçiciyi
CDP'de yakala (`Page.setInterceptFileChooserDialog`), sonra `DOM.setFileInputFiles` ile
**yalnız dosya YOLUNU** ver. Tarayıcı dosyayı kendisi diskten okur → aktarım yok, sınır yok.
```bash
node tools/aab-yukle.js "C:/.../app-release.aab" 120000 sonuc.png
```
⚠️ Doğrudan `querySelector('input[type=file]')` + `DOM.setFileInputFiles` YETMEZ — Play'in
Angular yükleyicisi input'u ancak tıklanınca hazırlıyor. Tıklama adımı şart.

### 2. 🚨 Ekran görüntüsü "yüklenmedi" gösterirken aslında YÜKLENMİŞ olabilir
Yükleme kutusu boş görünüyordu ama sayfada gizli hata metni vardı. Ekran görüntüsüne
bakıp "olmadı" deme — **DOM'dan hata metnini oku:**
```js
document.querySelectorAll('[role=alert],.error,[class*="rror"]')
```
Gerçek hata buradaydı: *"2 sürüm kodu daha önce kullanıldı."*

### 3. 🚨 Başarısız görünen bir yükleme sürüm kodunu YAKAR
İlk deneme (boş görünen) aslında versionCode 2'yi Play'e kaydettirmişti. İkinci deneme
"2 zaten kullanıldı" dedi. **Sürüm kodu geri alınamaz** — her denemede `pubspec.yaml`'da
`version: 1.0.1+N` sayısını bir artırıp yeniden derlemek gerekir. Yüklemeden önce
"En yeni sürümler ve paketler" sayfasından hangi kodların yandığını kontrol et.

### 4. ⏳ `flutter build appbundle` bitmeden AAB dosyası diskte GÖRÜNÜR (yarım)
Gradle önce ara paketi yazıyor, sonra imzalayıp büyütüyor. Ara halde bile `unzip -t`
"OK" diyor — yani zip testi tamamlandığın kanıtı DEĞİL. 48,4 MB'lık ara dosyayı tam sanıp
doğruladım, gerçek çıktı 50,1 MB'tı. **Tek güvenilir işaret derleme günlüğündeki
`√ Built ... app-release.aab (50.1MB)` satırı.**

## Derleme (Android)

### `checkReleaseAarMetadata` hatası → core library desugaring
`flutter_local_notifications` olmadan release APK **derlenmez**.
`app/android/app/build.gradle.kts`:

```kotlin
compileOptions {
    isCoreLibraryDesugaringEnabled = true
    sourceCompatibility = JavaVersion.VERSION_17
    targetCompatibility = JavaVersion.VERSION_17
}
dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}
```

### İzinler her release'de doğrulanmalı
Paketler manifestlerine izin ekler. `SCHEDULE_EXACT_ALARM` sızarsa Play reddeder.
Kontrol komutu → `wiki/04-yayin-play.md`. Beklenen liste tam olarak:
`POST_NOTIFICATIONS`, `RECEIVE_BOOT_COMPLETED`, `VIBRATE`.

### Yol tuzağı
Bu projenin yolu ASCII (`Desktop\CloudWork\Sipling`) → sorun çıkmadı.
Türkçe karakterli yolda Bash + aapt bozuluyor (Randevio'da yaşandı); o durumda PowerShell + junction.

## Paket API'leri (sürüm tuzakları)

| Paket | Tuzak |
|---|---|
| `flutter_local_notifications` 22.x | Tüm parametreler **adlandırılmış**: `initialize(settings: ...)`, `zonedSchedule(id:, title:, body:, scheduledDate:, notificationDetails:, androidScheduleMode:)` |
| `flutter_timezone` 5.x | `getLocalTimezone()` artık `TimezoneInfo` döner → `.identifier` kullan |
| `shared_preferences` web | Metin değerleri **iki kez** JSON'a çevrilir (`localStorage`'a elle veri yazarken çift `JSON.stringify`) |

## Flutter / çizim

- **Sabit piksel kullanma**, `unit = min(w,h)` çarpanı kullan → `wiki/03-tasarim.md`
- **`CustomPaint` + child yoksa genişlik 0** → ağaç çizilmez → `wiki/03-tasarim.md`

## İkon üretimi

### Chrome `--screenshot` ters bölü yolu kabul etmiyor
`--screenshot="C:\yol\a.png"` → *"Failed to write file: Erişim engellendi (0x5)"*.
Düz bölü şart: `--screenshot="C:/yol/a.png"`. (`tools/ikon-uret.sh` `cygpath -m` kullanıyor.)

### `flutter_launcher_icons` ön katmana %16 inset ekler
Verdiğin `adaptive_icon_foreground` görselini olduğu gibi kullanmaz; `ic_launcher.xml` içine
`android:inset="16%"` yazar. Görseli sen de küçültürsen ikon iki kez küçülür, damla nohut kalır.
Ölçek hesabı ve doğrulama yöntemi → `wiki/03-tasarim.md`.

## Ana ekran widget'ı (`home_widget`)

Üçü de emülatörde yakalandı (2026-07-09). Üçü de **sessizce** başarısız oluyordu.

### 1. 🚨 Arka plan giriş noktası ÜST DÜZEY fonksiyon olmalı
`registerInteractivityCallback`'e bir sınıfın `static` metodunu verirsen buton hiç çalışmaz.
Logcat'te tek ipucu:

```
DartVM: ERROR: To access '...::HomeWidgetService' from native code, it must be annotated.
```

Doğrusu: dosyanın en üstünde `@pragma('vm:entry-point')` işaretli **top-level** fonksiyon
(`siplingWidgetTapped`). Arka plandaki isolate'te ayrıca
`WidgetsFlutterBinding.ensureInitialized()` + `DartPluginRegistrant.ensureInitialized()` şart —
yoksa `shared_preferences` boş döner.

### 2. `renderFlutterWidget` arka planda ÇALIŞMAZ
Bir görünüm (`implicitView`) istiyor; widget butonuna basıldığında görünüm yok.
Ayrıca **`runApp`'ten önce de çalışmaz** — temiz kurulumda ağaç sessizce çizilmiyordu.

Çözüm: ağacın 11 büyüme karesi uygulama **ön plandayken** PNG olarak diske çizilir
(`tree_<tür>_<0..10>.png`), arka planda hiçbir şey çizilmez, sadece doğru kare seçilir.
Ağaç böylece uygulama hiç açılmadan da büyür. İlk `push` `addPostFrameCallback` içinde.

### 3. `home_widget` üç yeni izin getiriyor (WorkManager)
`WAKE_LOCK`, `ACCESS_NETWORK_STATE` (ikisi gerekli), `FOREGROUND_SERVICE` (gereksiz —
`setExpedited` kullanılmıyor, `tools:node="remove"` ile kaldırıldı). Detay ve tam beklenen
izin listesi → `wiki/04-yayin-play.md`.

### 4. Veriyi String olarak yaz
Paket Dart `int`'ini `putInt`, `double`'ı `putLong`+bayrak olarak saklıyor. Kotlin'de yanlış
getter = `ClassCastException`. Her şey `String`, Kotlin'de `toIntOrNull()`.

### 5. Kotlin sınıfının paketi `com.sipling.sipling`, applicationId `com.sipling.app`
`updateWidget(qualifiedAndroidName: 'com.sipling.sipling.SiplingWidgetProvider')`.
`androidName` yerine `qualifiedAndroidName` kullan, tahmin yürütme.

### Widget'ı emülatörde test etme
Launcher'a widget eklemeden test edilir:
```bash
ADB=".../platform-tools/adb.exe"
# uygulamayı aç, sonra süreci öldür (force-stop DEĞİL — o paketi "stopped" yapar,
# stopped paket hiçbir broadcast almaz ve test yanlış negatif verir)
"$ADB" shell am kill com.sipling.app
# widget'taki "+500 ml" butonuna basmakla aynı şey:
"$ADB" shell "am broadcast --user 0 -a es.antonborri.home_widget.action.BACKGROUND \
  -d 'sipling://add?ml=500&type=water' \
  -n com.sipling.app/es.antonborri.home_widget.HomeWidgetBackgroundReceiver"
"$ADB" shell "run-as com.sipling.app cat shared_prefs/HomeWidgetPreferences.xml"   # debug APK
"$ADB" root && "$ADB" shell cat /data/data/com.sipling.app/shared_prefs/HomeWidgetPreferences.xml  # release
```
⚠️ `-d` içindeki `&` yüzünden komutun tamamını **tek tırnak** içinde ver; `adb shell` uzak
tarafta ikinci bir shell çalıştırıyor ve tırnaksız `&` komutu ikiye böler.

⚠️ Bu makinede `Pixel7`/`Pixel_7` AVD'leri **açılmıyor** (Play Store'lu sistem imajı kurulu değil).
Sipling'in kendi AVD'si: `sipling` (android-34, google_apis). `randevio` AVD'sine dokunma.
Emülatör `-gpu swiftshader_indirect` ile boot sonrası segfault ediyor; **`-gpu guest` kullan.**

## Zamanlanmış hatırlatmalar (`flutter_local_notifications`)

### 0. 🚨🚨 EN BÜYÜK TUZAK — 3 alıcının 3'ü de manifest'e ELLE eklenir, yoksa HİÇ bildirim gelmez
Paketin kendi `AndroidManifest.xml`'i **yalnız izin** tanımlıyor (VIBRATE, POST_NOTIFICATIONS),
**hiçbir receiver tanımlamıyor.** Üçünü de host uygulama eklemek ZORUNDA:
```xml
<!-- Zamanlanmış bildirimi FİİLEN gösteren alıcı. YOKSA zonedSchedule alarmı kurulur
     ama tetiklendiğinde bildirimi post edecek alıcı olmadığı için HİÇBİR HATIRLATMA GELMEZ. -->
<receiver android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver"
    android:exported="false"/>
<!-- Yeniden başlatma / güncelleme sonrası hatırlatmaları geri kurar. -->
<receiver android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver"
    android:exported="false">
    <intent-filter>
        <action android:name="android.intent.action.BOOT_COMPLETED"/>
        <action android:name="android.intent.action.MY_PACKAGE_REPLACED"/>
        <action android:name="android.intent.action.QUICKBOOT_POWERON"/>
        <action android:name="com.htc.intent.action.QUICKBOOT_POWERON"/>
    </intent-filter>
</receiver>
<!-- "+N ml" düğmesi için (aşağıdaki bölüm). -->
<receiver android:name="com.dexterous.flutterlocalnotifications.ActionBroadcastReceiver"
    android:exported="false"/>
```
**2026-07-11'de yakalandı:** kullanıcı "hiç bildirim gelmiyor" dedi. `ActionBroadcastReceiver`
eklenmişti ama `ScheduledNotificationReceiver` UNUTULMUŞTU → hatırlatmalar bir gün boyunca hiç
çıkmadı (izinler verili olmasına rağmen). Doğrulama: `aapt2 dump xmltree app.apk --file
AndroidManifest.xml | grep flutterlocalnotifications` → üç alıcı da görünmeli.

### 0b. Samsung/Xiaomi pil yönetimi ikinci katman
Alıcılar tamam olsa bile `inexactAllowWhileIdle` alarmları Samsung "derin uyku" / Xiaomi
"otomatik başlatma" kısıtı yüzünden gecikip ölebilir. Uygulamada zaten "Bildirim gelmiyor mu?"
rehberi var (`battery_guide_screen.dart`). Exact-alarm KULLANILAMAZ (Play politikası) → bu katman
kullanıcı tarafında pil ayarıyla çözülür.

## Bildirimdeki "+N ml" butonu (`flutter_local_notifications`)

### 1. 🚨 `ActionBroadcastReceiver` manifest'e ELLE eklenir → yoksa buton SESSİZCE ölür
Paketin kendi manifest'i yalnız izin tanımlıyor; aksiyon alıcısını host uygulama ekler.
`AndroidManifest.xml`:
```xml
<receiver android:name="com.dexterous.flutterlocalnotifications.ActionBroadcastReceiver"
    android:exported="false"/>
```
Bu satır olmadan bildirim çıkar, butona basılır, **hiçbir şey olmaz** (hata da yok).

### 2. Uygulama açık ve kapalı iki AYRI yol
- **Kapalı:** üst düzey `@pragma('vm:entry-point') siplingNotificationAction` (widget'ın arka-plan
  giriş noktasıyla aynı desen) → `HomeWidgetService.onWidgetTap`. `onDidReceiveBackgroundNotificationResponse` ile bağlanır.
- **Açık:** `_onResponse` → `NotificationService.onForegroundAdd` (`main.dart`'ta `state.addSip`'e bağlanır).
İkisi de kurulmazsa buton bazı durumlarda çalışıp bazılarında ölür.

### 3. `showsUserInterface: false` + `cancelNotification: true`
`false` → butona basınca uygulama AÇILMAZ (amaç bu: tek dokunuşla ekle, ekran açma).
`true` → ekleme sonrası bildirim kapansın. `AndroidNotificationAction(addActionId, '+$ml ml', ...)`.

### 4. Butonu emülatörde/telefonda test etme
Zamanlanmış bildirimi beklemeden, aksiyon broadcast'ini elle at:
```bash
"$ADB" shell "am broadcast --user 0 \
  -a com.dexterous.flutterlocalnotifications.ActionBroadcastReceiver.ACTION_TAPPED \
  -n com.sipling.app/com.dexterous.flutterlocalnotifications.ActionBroadcastReceiver"
```
⚠️ En temizi: gerçek telefonda hatırlatma gelince butona basıp `store`'daki toplamı kontrol et.

## Health Connect (`health` paketi)

### 0. 🚨🚨 EN BÜYÜK TUZAK — `MainActivity` **FlutterFragmentActivity** olmalı
**Belirti:** Ayarlar → "Health Connect'e yaz" açılınca izin ekranı **hiç görünmez**,
anahtar kendiliğinden kapanır, kullanıcı *"İzin verilmedi, sağlık defterine yazılmayacak"*
görür. Kodda hata yok, log da temiz — bu yüzden aylarca "çalışmıyor" sanıldı.

**Sebep:** `health` paketi izin isterken `registerForActivityResult` kullanıyor; bunun için
Activity'nin `ComponentActivity`'ye cast edilebilmesi gerek. Flutter'ın varsayılanı
`FlutterActivity` bunu **karşılamıyor** → çağrı sessizce `false` dönüyor.

**Çözüm** (`android/app/src/main/kotlin/com/sipling/sipling/MainActivity.kt`):
```kotlin
import io.flutter.embedding.android.FlutterFragmentActivity
class MainActivity : FlutterFragmentActivity()
```
Kaynak: `health` 13.3.1 README, "Android 14" bölümü (satır 135-151).
🚨 Bu satırı `FlutterActivity`'ye geri çevirme — Health Connect bir daha açılmaz.
(Bulunma tarihi: 2026-07-20.)

### 1. 🚨 Su hacmi LİTRE yazılır, mililitre değil
`writeHealthData(value: ...)` Kotlin tarafında `Volume.liters(value)` oluyor.
`value: 250` yazarsan sağlık defterine **250 litre** düşer. Doğrusu `ml / 1000.0`.

### 2. 🚨 Kayıt bir ARALIK, tek an değil
`startTime == endTime` verirsen Health Connect reddeder:
`PlatformException(... startTime must be before endTime ...)`. Yazma **sessizce** düşer,
uygulamada hiçbir belirti olmaz. Bitişe 1 ms ekliyoruz (`_span`), silme de aynı aralığı hedefliyor.

### 3. `health` paketi `dart:io` kullanıyor → web derlemesi çöker
Doğrudan import edersen `flutter build web` biter. Koşullu import şart:
`export 'health_bridge_stub.dart' if (dart.library.io) 'health_bridge_io.dart';`
Stub ile gerçek uygulamanın **arayüzü birebir aynı olmalı.**

### 4. minSdk 24 → 26
`androidx.health.connect` ve `health` paketi minSdk 26 istiyor. Android 7.x cihazlar düştü.

### Emülatörde Health Connect testi
`sipling` AVD'si Android 14 → Health Connect **sistemde gömülü**, ayrıca kurmaya gerek yok.
```bash
# HC'nin uygulamamızı tanıdığını gör (izin ekranı):
"$ADB" shell "am start -a android.health.connect.action.MANAGE_HEALTH_PERMISSIONS \
  --es android.intent.extra.PACKAGE_NAME com.sipling.app"
# izni komut satırından ver:
"$ADB" shell pm grant com.sipling.app android.permission.health.WRITE_HYDRATION
# yazılan kaydı gör: HC → Data and access → Nutrition → Hydration → See all entries
"$ADB" shell am start -a android.health.connect.action.HEALTH_HOME_SETTINGS
```
⚠️ `adb push /data/...` ve `uiautomator dump /sdcard/...` Git Bash'te yolu bozar
(`C:/Program Files/Git/data/...`). Başına **`MSYS_NO_PATHCONV=1`** koy.

## Yerelleştirme (l10n)

### 1. Kesme işaretini `.arb` içinde İKİLEME
Yaygın bir inanış, "yer tutuculu mesajlarda tek tırnak ICU kaçış karakteridir, ikilemek gerekir"
der. **Bu projede yanlış:** `flutter gen-l10n` basit yer tutuculu mesajlarda ICU kaçışını
uygulamıyor. `"%{percent}''ine"` yazarsan ekranda `%93''ine` (çift tırnak gibi) görünür.

Doğrusu tek tırnak: `"%{percent}'ine ulaştın"` → üretilen Dart `'...%$percent\'ine...'`.
İngilizce `"You're {ml} ml behind"` de tek tırnakla sorunsuz çalışıyor.
📄 Ekran görüntüsünde yakalandı (`store/tr/1-ozet.png`), varsayımla değil.

### 2. `flutter build web` `dart:io` kullanan paketi affetmez
`health` paketi `dart:io` import ediyor. Koşullu import şart:
`export 'x_stub.dart' if (dart.library.io) 'x_io.dart';` → `lib/services/health/health_bridge.dart`

### 3. Widget'ın metinleri ayrı yaşar
Ana ekran widget'ı Kotlin ile çizildiği için `.arb` çevirilerini **göremez**.
Metinleri `res/values/strings.xml` (İngilizce, varsayılan) ve `res/values-tr/strings.xml`'de.
Birini değiştirince diğerini unutma.

### 4. Bildirimlerde `BuildContext` yok
`NotificationService` çeviriyi elle yüklüyor:
`L.delegate.load(Locale(PlatformDispatcher.instance.locale.languageCode))`, desteklenmeyen
dilde İngilizceye düşer.

### 5. `labels.dart` `L`'yi yeniden dışa aktarır
Ekranlar yalnız `import '../l10n/labels.dart'` yazıyor. `L l` parametreli imzalar derlensin diye
o dosya `export 'app_localizations.dart';` yapıyor.

## Mantık hataları (yakalandı, düzeltildi)

- **Onboarding Ayarlar'dan tekrar açılabiliyor.** Başlangıç profili `AppState`'ten okunmazsa
  kullanıcı kaydedince tüm bilgileri sıfırlanır. → `onboarding_screen.dart` `initState`
- **Seri (streak) bugünden geriye sayılmamalı.** Gün ortasında hedefi tutturmamış olmak seriyi
  sıfır göstermemeli. `store.dart:165` önce dünden geriye sayar, bugünü ancak tamamlandıysa ekler.

## Politika (Play)

Tam liste → `wiki/04-yayin-play.md`. Özet: exact alarm izni **isteme**, Health apps formunu
**doldur**, abonelikte komisyon TR'de **%15**, TR minimum fiyatı **yalnız Console'da** görünür.

## Süreç dersi

**Tarayıcı işi Sipling'de MCP ile yapılmaz** — MCP 9334'e (Randevio) sabitli.
Sipling'in kendi tarayıcısı var: `wiki/06-tarayici.md`.
