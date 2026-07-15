# 🤖 Google Play — yayın bilgileri ve politika tuzakları

> Genel Play yükleme sırası zaten var: memory `reference_play_store_yeni_uygulama_playbook.md`.
> Burada **yalnız Sipling'e özel** olanlar var.

## Künye

| Alan | Değer | Durum |
|---|---|---|
| Paket adı (applicationId) | `com.sipling.app` | `app/android/app/build.gradle.kts:25` |
| Uygulama etiketi (ikon altı) | `Sipling` | `app/android/app/src/main/AndroidManifest.xml` |
| Play başlığı — TR | `Sipling: Su Hatırlatıcı` (23/30 karakter) | henüz girilmedi |
| Play başlığı — EN | `Sipling: Water Reminder` (23/30 karakter) | henüz girilmedi |
| Geliştirici hesabı | `randevusayfasi@gmail.com` · "Gökcek" · ID `7286802637861068803` | mevcut |
| İmza | **upload key** — `app/android/upload-keystore.jks` | ✅ AAB imzalı, doğrulandı |
| Play Console kaydı | ✅ **oluşturuldu** (2026-07-10) | app ID `4974431994893643882` |
| Uygulama adı (varsayılan dil) | `Sipling: Water Reminder` (23/30) | |
| Varsayılan dil | **İngilizce (en-US)** — çevirisi olmayan ülkelerde buna düşer | |
| Tür / fiyat | Uygulama · **Ücretsiz** (yayından sonra ücretliye çevrilemez) | |
| Console linki | play.google.com/console/u/0/developers/7286802637861068803/app/4974431994893643882 | |

⚠️ Hesapta iki uyarı var: **"Ödeme hesabınızla ilgili işlem gerekiyor"** (Pro aboneliği için
gerekli, kullanıcı halledecek) ve Android geliştirici doğrulaması — ikincisi **karşılanmış**
("Tüm uygulamalarınız ... başarıyla kaydedildi").

## Mağaza metni — hazır taslak

**Kısa açıklama (80 karakter):**
`Su takibi, içme hatırlatıcısı ve su içtikçe büyüyen kendi ormanın.` (66)

**Öne çıkarılacak satış noktaları** (rakiplerin zayıf yanları):
1. **Reklam bombardımanı yok.** Ekran geçişlerinde reklam göstermiyoruz.
2. **İnternet izni bile yok** — verin telefondan çıkmaz. (Derlenmiş APK'da doğrulandı.)
3. **Ağacın kurumaz.** Ceza yok, suçluluk yok.
4. **Bildirim gerçekten gelir** — pil ayarı rehberi uygulamanın içinde.
5. **Ana ekran widget'ı** — uygulamayı açmadan bardak ekle, ağacın büyüsün.
6. **Health Connect** — isteğe bağlı, yalnız yazar, hiçbir şey okumaz.

⚠️ 2. madde hâlâ doğru: `INTERNET` izni yok. Ama widget yüzünden `ACCESS_NETWORK_STATE`
(ağ **durumunu** okur, erişim vermez) ve `WAKE_LOCK` eklendi. Metinde "hiçbir izin yok" deme;
"internete bağlanma izni yok" de. Tam liste aşağıda.

⚠️ AdMob eklendiğinde **INTERNET izni gelecek** ve 2. madde geçersizleşir. O zaman metni,
gizlilik politikasını (`site/gizlilik.html` + `site/privacy.html`) ve Data Safety beyanını güncelle.

## Gizlilik politikası — YAYINDA ✅

| Ne | Adres |
|---|---|
| Türkçe (Play TR kaydına yazılacak) | https://sipling-app.web.app/gizlilik |
| İngilizce (Play EN kaydına) | https://sipling-app.web.app/privacy |
| Giriş sayfası | https://sipling-app.web.app |

Kaynak: `site/` klasörü. İçerik derlenmiş APK'nın **gerçek izin listesinden** yazıldı.
Yeniden yayınlamak için: `firebase deploy --only hosting` (proje kökünden).

### 🚨 Sipling'in Firebase projesi AYRIDIR
| | |
|---|---|
| Firebase projesi | `sipling-app` (Sipling'e ait, başka hiçbir projeyle paylaşılmıyor) |
| Console | https://console.firebase.google.com/project/sipling-app |
| Hesap | `asim_gokcek@hotmail.com` (CLI oturumu makinede açık) |

**Randevio'nun (`randevio-dbf59`) projesine hiçbir şey eklenmeyecek.** Bir kez yanlışlıkla oraya
site açıldı, hemen silindi; `misyonkoruma`, `misyon-koruma-egm`, `randevio-dbf59` siteleri
etkilenmedi (doğrulandı). Her proje kendi Firebase projesinde yaşar.

⚠️ AdMob/Billing gelince politika metni değişecek → `site/` düzenle, yeniden deploy et,
`Son güncelleme` tarihini değiştir.

## 🚨 Politika tuzakları (araştırmayla doğrulandı)

### 1. Exact alarm izni İSTEME
`USE_EXACT_ALARM` / `SCHEDULE_EXACT_ALARM` Play politikasında **yalnız alarm-saat ve takvim**
uygulamalarına açık. Su hatırlatıcısı kapsam dışı → inceleme reddedilir.
`flutter_local_notifications` bu izni kendi manifestine koyduğu için biz
`tools:node="remove"` ile **kaldırıyoruz**; bildirimler `AndroidScheduleMode.inexactAllowWhileIdle`.
📄 `app/android/app/src/main/AndroidManifest.xml` · Kaynak: developer.android.com/about/versions/14/changes/schedule-exact-alarms

**Doğrulama komutu** (her release'de çalıştır — derlenmiş APK'ya bak, kaynağa değil):
```bash
cd app && flutter build apk --release
"$LOCALAPPDATA/Android/sdk/build-tools/35.0.0/aapt.exe" dump permissions \
  build/app/outputs/flutter-apk/app-release.apk | grep uses-permission
```

**Beklenen liste (2026-07-09, widget eklendikten sonra):**

| İzin | Nereden geldi | Neden duruyor |
|---|---|---|
| `POST_NOTIFICATIONS` | bizim | Android 13+ bildirim |
| `RECEIVE_BOOT_COMPLETED` | bizim | yeniden başlatınca hatırlatmaları kur |
| `health.WRITE_HYDRATION` | bizim | Health Connect'e su yazma. **Okuma izni YOK.** |
| `VIBRATE` | flutter_local_notifications | bildirim titreşimi |
| `WAKE_LOCK` | home_widget → WorkManager | iş çalışırken uyumasın; **kaldırırsan çöker** |
| `ACCESS_NETWORK_STATE` | home_widget → WorkManager | ağ durumu izleyicisi; internet erişimi **vermez** |
| `com.sipling.app.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION` | androidx | uygulamaya özel imza izni, zararsız |

**minSdk artık 26** (Health Connect şartı) — Android 7.x cihazlar uygulamayı kuramaz.

**Listede OLMAMASI gerekenler:** `INTERNET`, `SCHEDULE_EXACT_ALARM`, `USE_EXACT_ALARM`,
`FOREGROUND_SERVICE` (üçü de manifest'te `tools:node="remove"` ile kaldırılıyor).

### 2. Health apps declaration formu ZORUNLU
Play Console → Policy → App content → **Health apps**. Su/hidrasyon takibi bu kapsama giriyor.
Sağlık özelliği olmayan uygulamalar bile "yok" diye beyan etmek zorunda.
Ayrıca **Data Safety** bölümü + yayında bir **gizlilik politikası URL'si** şart.

🚨 **Health Connect eklendikten sonra bu artık teorik değil.** `WRITE_HYDRATION` Play'de
*hassas izin* sayılıyor; beyan formu ve **yayında gerçek bir gizlilik politikası URL'si**
olmadan uygulama incelemeden geçmez. Health Connect'in izin ekranı da o politikaya bağlantı
veriyor (`ViewPermissionUsageActivity` → şu an sadece uygulamayı açıyor, politika ekranı yazılınca
oraya yönlendirilmeli).
Not: Sipling Health Connect'ten **hiçbir şey okumuyor**, yalnız yazıyor — beyanda bunu belirt.

### 3. Android 13+ POST_NOTIFICATIONS
Runtime izni alınmazsa hiçbir bildirim gitmez. `services/notifications.dart:56`.

### 4. Abonelik parası
- Google komisyonu abonelikte **%15 sabit** — Türkiye'de bugün geçerli.
  Yeni düşük oran (%10) TR'ye ancak **30 Eylül 2027**'de geliyor.
- Google Türkiye'de **merchant of record** → KDV'yi kendisi toplayıp ödüyor.
- **TR minimum abonelik fiyatı resmî statik bir sayfada YOK.** Yalnız Play Console'da fiyat
  girerken canlı gösteriliyor. "Aylık 5 TL" büyük ihtimalle minimumun altında.
  Örnek hesap: ₺5 → KDV %20 sonrası ₺4,17 → %15 komisyon sonrası cebe **~₺3,54**.
- Bu yüzden `screens/pro_screen.dart`'a **hiçbir fiyat yazılmadı.** Console'da görülünce yazılacak.

Kaynaklar: support.google.com/googleplay/android-developer/answer/112622 ve `.../16954621`

### 5. Hesap-geneli lisans testi uyarısı
Play Console lisans testi listeleri **hesap genelidir**. `randevusayfasi` hesabındaki
"Randevio Testçiler" listesi Sipling'i de etkiler. Bkz. memory `project_misyon_koruma_app`.

## Mağaza kaydı — GİRİLDİ ✅ (2026-07-10, 20 dil)

Kaynak: `store/metinler/<play-kodu>.json` + `store/<play-kodu>/*.png`
Otomasyon betikleri: `scratchpad/pc_*.js` (CDP 9360 üzerinden).

**Yaşanan iki tuzak:**
1. Play, **tüm dilleri birlikte doğruluyor.** Bir dil boşken "Kaydet" çalışmaz;
   her dilden sonra **"Taslak olarak kaydet"**, hepsi dolunca bir kez "Kaydet".
2. Aynı dile görselleri **iki kez yüklersen** sayaç `10/8` olur ve kayıt reddedilir.
   Temizlik: `button[aria-label="Telefon ekran görüntüleri öğesini kaldır"]` — onay sormaz.
   Öne çıkan grafikte sınır `1/1`.

Dosya adları kütüphanede karışmasın diye `store/.yukleme/<dil>__<ad>.png` şeklinde önekli.

## Uygulama içeriği beyanları — TAMAMLANDI ✅ (2026-07-10)

11 zorunlu görevin hepsi girildi:
| Görev | Cevap |
|---|---|
| Gizlilik politikası | https://sipling-app.web.app/privacy |
| Oturum açma bilgileri (App access) | Hayır (hesap/kısıtlı bölüm yok) |
| Reklam | Hayır — **AdMob eklenince "Evet"e çevir** |
| İçerik derecelendirme | IARC anketi, "Diğer Tüm Uygulama Türleri", hepsi Hayır |
| Hedef kitle | 13-15, 16-17, 18+ (çocuk hedefi YOK → Families gerekmez) |
| Veri güvenliği | **Veri toplanmıyor/paylaşılmıyor** (internet izni yok) |
| Resmi kurum uygulaması | Hayır |
| Finans özellikleri | Yok ("finans ile ilgili özellik sağlanmıyor") |
| Sağlık uygulamaları | **Beslenme ve kilo yönetimi** (su/hidrasyon buraya girer) |
| Uygulama kategorisi | **Sağlık ve Fitness** |
| İletişim | asim_gokcek@hotmail.com · https://sipling-app.web.app |

🚨 **AdMob eklenince üç beyan değişir:** Reklam (Evet) + Veri güvenliği (reklam SDK'sı veri
toplar) + gizlilik politikası metni. Şu anki "veri toplanmıyor" beyanı o an yanlış olur.

## Play Console otomasyonu (yaşanan dersler)
- Angular formlarında `element.click()` **çoğu zaman tetiklemiyor**; `page.mouse.click(x,y)`
  koordinatla en güvenilir yol. Onay kutularını tek tek işaretle, sayacı/durumu geri oku.
- Butonları `.last()` ile alma — arkadaki pasif kopyayı yakalar. **Etkin** olanı DOM'dan filtrele:
  `[...buttons].filter(b=>b.innerText==='Kaydet' && !b.disabled)`.
- Ekran görüntüsü + metin oku; ikisi çelişince ekran görüntüsü doğrudur.

## 🚨 AAB yüklemesi — ELLE yapılacak (otomasyon çöküyor)

Bu makinede headless Chrome, 44 MB'lık AAB'yi Play Console'da işlerken sekmeyi çökertiyor
(3 deneme, 3 çökme). Otomasyon burada durdu. Elle adımlar:

1. Sipling tarayıcısında (9360) Play Console → Sipling → **Test etme → Kapalı test → Alpha**
   → **Sürümü düzenle** (taslak zaten var).
2. **Uygulama paketleri** kutusuna `app-release.aab`'yi sürükle-bırak (veya Yükle).
   Dosya: `app/build/app/outputs/bundle/release/app-release.aab`
3. Sürüm notlarını doldur (opsiyonel), **İleri** → **Önizle ve onayla** → yayınla.
4. **Test kullanıcıları:** Play artık 12 testçi / 14 gün istiyor. Testçi e-posta listesini
   Alpha kanalının "Test kullanıcıları" sekmesinden ekle. (Kullanıcı işi.)

İmza HAZIR: "Google Play tarafından imzalanan sürümler ✓", "Otomatik koruma ✓" — bizim upload
key ile imzalı AAB'yi Play kabul edip kendi anahtarıyla yeniden imzalayacak.

## Yükleme sırası (özet)

1. Upload key üret, `key.properties` + `build.gradle.kts` signingConfig
2. `flutter build appbundle --release` → AAB
3. Play Console → yeni uygulama → paket `com.sipling.app`
4. App content: Health apps formu, Data Safety, gizlilik politikası URL'si, Reklam-Kimliği beyanı
5. Kapalı test (Alpha) → 12 testçi / 14 gün → üretim
6. Mağaza kaydını **dil dil** doldur (TR + EN başlıklar farklı)

⚠️ >50 MB AAB Playwright `setFiles` ile yüklenemez — dosya sürükle-bırak kullanıcıda.
(Detay: memory `reference_play_store_yeni_uygulama_playbook.md`)
