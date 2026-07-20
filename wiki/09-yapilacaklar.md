# ✅ Yapılacaklar

> Sıra önerisi: önce **uygulama düzgün çalışsın**, sonra para bağlansın.
> Rakiplerin battığı yer ürün kalitesi; reklam ve abonelik en sona.

## Yayın öncesi zorunlu (bunlar olmadan Play'e yüklenemez)

- [x] **Uygulama ikonu** — damla-yaprak. Android (adaptive) + iOS + web bağlandı. → `wiki/03-tasarim.md`
- [x] **Gizlilik politikası sayfası** — **YAYINDA**: https://sipling-app.web.app/gizlilik (TR)
      ve /privacy (EN). Kendi Firebase projesinde (`sipling-app`). → `wiki/04-yayin-play.md`
- [x] **Upload key** üretildi: `app/android/upload-keystore.jks` + `key.properties`,
      `signingConfig` bağlandı. Anahtar yoksa derleme debug anahtarına düşer (o APK Play'e giremez).
      🚨 **İkisini de yedekle.** Kaybolursa uygulama bir daha güncellenemez. `.gitignore`'da.
- [x] **Play mağaza görselleri — 20 DİL** — `store/<play-kodu>/`.
      100 telefon ekran görüntüsü (1080×1920), 20 öne çıkan grafik (1024×500),
      512×512 alfalı ikon, 20 dilde başlık/kısa/uzun açıklama (`store/metinler/`).
      Ölçüler ve karakter sınırları doğrulandı. → `store/README.md`
      ⚠️ Tablet ekran görüntüleri (en az 4) yok — yalnız tablet rozeti isteniyorsa gerekli.
- [x] **Mağaza kaydı Play Console'a girildi — 20 dil** (2026-07-10).
      Her dilde başlık + kısa/uzun açıklama + 5 ekran görüntüsü + öne çıkan grafik.
      Uygulama simgesi varsayılan (en-US) dilde bir kez. Hepsi doğrulandı, kaydedildi.
      🚨 Aynı dile iki kez görsel yüklersen sayaç 10/8 olur ve Play kaydetmez —
      `button[aria-label="Telefon ekran görüntüleri öğesini kaldır"]` ile temizlenir.
- [~] Play Console beyanları: Data Safety ✅ + Reklam-Kimliği (AD_ID) ✅ (2026-07-15 girildi).
      ⬜ **Health apps declaration** formu HÂLÂ EKSİK — `WRITE_HYDRATION` izni Play'de "hassas"
      sayılıyor. Üretime çıkmadan önce zorunlu. (2026-07-20: Play Console oturumu düşmüş,
      kullanıcı şifre+2FA verince doldurulacak.)
- [~] **Kapalı test sürümü + AAB yükleme** — Alpha kanalı hazır (`tracks/4699878750164991262`),
      taslak sürüm oluşturuldu, Play imzalama otomatik kuruldu ("Google Play tarafından imzalanan
      sürümler ✓"). AAB HENÜZ YÜKLENEMEDİ: bu makinede headless Chrome 44 MB'lık AAB'yi işlerken
      sekmeyi üç kez çökertti. **Yüklemeyi kullanıcı elle yapacak** (aşağıya bak).

## 🆕 1.0 kapsamına alınan 6 özellik (kullanıcı kararı, 2026-07-09)

Eskiden "sonraki sürümler" listesindeydiler. Kullanıcı **"5 madde hariç hepsini ekle"** dedi;
hariç tutulan tek madde **arkadaşla seri yarışması** (sunucu gerektiriyor). Sıra değere+riske göre:

- [x] **1. Ana ekran widget'ı** — bitti. Ağaç + ml/hedef + ilerleme + seri + 3 hızlı bardak.
      Bardak butonu uygulama kapalıyken de su ekler, bildirimleri yeniden planlar, ağacı büyütür.
      Emülatörde debug **ve** release derlemesinde doğrulandı. → `wiki/08-tuzaklar.md`
      ➕ (2026-07-10) Ayarlar → "Ana ekrana widget ekle" tek-dokunuş butonu eklendi
      (`HomeWidgetService.requestPin`, Android 8+ destekliyorsa sistem diyaloğu; değilse elle
      ekleme ipucu). Kullanıcı widget'ı bulamadığı için eklendi. `if (!kIsWeb)` — web'de gizli.
      ⚠️ Kalan: widget'ın launcher'daki **görünümü** gerçek telefonda gözle kontrol edilmedi
      (emülatörde ana ekrana widget eklemek mümkün olmadı).
      ⚠️ iOS widget'ı YOK — `home_widget` iOS'ta ayrı bir WidgetKit eklentisi + App Group ister.
- [x] **2. Health Connect** — bitti. Ayarlar → "Health Connect'e yaz" (varsayılan kapalı).
      🩺 **2026-07-20 DÜZELTME:** gerçek telefonda izin ekranı hiç açılmıyordu ("İzin verilmedi"
      diyordu). Sebep `MainActivity`'nin `FlutterActivity` olması — `health` paketi
      `FlutterFragmentActivity` istiyor. Düzeltildi → `wiki/08-tuzaklar.md` "Health Connect §0".
      Yalnız **yazar**, hiçbir şey okumaz. Widget'tan eklenen su da yazılır, geri alınca silinir.
      Emülatörde (Android 14) uçtan uca doğrulandı: izin ekranı, yazma, `0.3 L` kaydı.
      ⚠️ minSdk 24 → **26** oldu; Android 7.x cihazlar düştü.
      ⚠️ "Geri al" ile **silme** gerçek cihazda doğrulanmadı (emülatörde tetiklemek zordu).
      ⚠️ iOS'ta HealthKit bağlanmadı (Info.plist + Xcode capability gerekir) → 5. madde.
- [x] **3. Mevsimlik orman temaları** — bitti. Klasik (ücretsiz) + Otomatik/İlkbahar/Yaz/
      Sonbahar/Kış (Pro). Ayarlar → Görünüm → Orman teması. Beş tema gerçek uygulamada
      (web, port 8792) gözle doğrulandı. → `wiki/03-tasarim.md`
- [x] **4. Wear OS iskelesi** — BİTTİ (2026-07-11), build-hazır → `wiki/10-wear-os.md`.
      Ayrı entrypoint `lib/main_wear.dart` + saat ekranı `lib/wear/wear_screen.dart` (ilerleme
      halkası + 3 bardakla bilekten ekleme). **APK'ya derlendi** (42,7 MB, Desktop `Sipling-saat-test.apk`).
      Telefon derlemesini etkilemez (aynı applicationId, ayrı target). ⚠️ Saat/emülatör olmadığı
      için görünüm saatte doğrulanmadı. Kalan (1.1): telefon↔saat senkronu, ambient mod, ayrı Play paketi.
- [~] **5. iOS sürümü** — kod tarafı BİTTİ (2026-07-11) → `wiki/05-yayin-apple.md`.
      Yapıldı: bildirimden "+N ml" iOS Darwin kategorisi, App Group entitlements, `CFBundleLocalizations`
      20 dil, iOS ikonları, **ana ekran widget'ı kaynağı** (`ios/SiplingWidget/`), `codemagic.yaml`
      (derle+imzala+TestFlight), widget entegrasyon scripti (`ios/tools/add_widget_target.rb`).
      **Kalan (hepsi Mac/hesap):** git remote + Codemagic bağlama, ASC kaydı + API anahtarı,
      App Group'u Apple'da tanımlama, widget Xcode hedefini ekleme, iPad ekran görüntüleri.

## Ürün (yayından önce yapılması güçlü tavsiye)

- [x] **Yerelleştirme — 20 DİL** (kullanıcı kararı 2026-07-10). 255 anahtar × 20 dil.
      Sistem dilini izler, dil seçici yok. Veri katmanı metin taşımıyor.
      Arapça dahil (RTL) — ekranlar `EdgeInsetsDirectional`'a çevrildi, gözle doğrulandı.
      Widget metinleri de 20 dilde (`tools/widget-diller.py`, APK'da doğrulandı).
      → `wiki/02-kod-haritasi.md` · tuzaklar: `wiki/08-tuzaklar.md`
      ⚠️ Çeviriler LLM ile yapıldı, anadili konuşan kontrolünden geçmedi.
- [x] **Gün sonu özeti ekranı** — `screens/day_summary_screen.dart`. Ertesi gün ilk açılışta
      bir kez çıkar. Reklamın yaşayacağı tek yer burası olacak.
- [x] Birim testleri — 45 test geçiyor: hedef hesabı, BMI, tempo, katsayılar, seri, özet.

## Para (uygulama çalıştığı kanıtlandıktan sonra)

- [ ] **AdMob** — `google_mobile_ads`. Yalnız iki yer: gün sonu özeti + ödüllü reklam.
      ⚠️ Bu paket **INTERNET izni** getirir; mağaza metnindeki "internet izni yok" iddiası
      o an geçersizleşir, metni güncelle (`wiki/04-yayin-play.md`).
      Şu an sahte: `screens/species_screen.dart:150` `_RewardDialog`
- [ ] **Play Billing** — `in_app_purchase`. Pro aboneliği.
      Fiyat **Play Console'da gerçek minimum görülmeden yazılmayacak**.
      Şu an sahte: `screens/pro_screen.dart` (yerel anahtar çeviriyor)
- [ ] Sunucu-doğrulamalı satın alma → memory `reference_play_abonelik_anti_korsanlik_playbook.md`

## 💡 Aday özellikler (2026 rakip araştırması + kullanıcı gözlemi)

Öncelik sırasıyla. Hepsi "sunucu yok, veri cihazda, ceza yok" ilkesine uyacak şekilde seçildi.
Detay + kaynaklar → `wiki/07-pazar.md`.

- [x] **🔔 Bildirimden hızlı ekleme** — BİTTİ (2026-07-10). Hatırlatma bildirimindeki **"+N ml"**
      butonu uygulama açılmadan su ekler. `flutter_local_notifications` action + üst düzey
      `@pragma('vm:entry-point') siplingNotificationAction` → widget'ın `HomeWidgetService.onWidgetTap`
      altyapısını yeniden kullanır. Manifest'e `ActionBroadcastReceiver` eklendi (zorunlu).
      `reschedule` artık `cups` alıyor, ilk bardağı butona koyuyor. **INTERNET izni gelmedi.**
      ⚠️ Gerçek telefonda bildirim butonu henüz tıklanmadı (arka-plan ekleme yolu widget'la kanıtlı).
- [x] **🐛 İçecek şeridi görünürlüğü** — BİTTİ (2026-07-11). `add_drink_sheet.dart` yatay
      ListView → `LayoutBuilder + Wrap` (satır başına 4, 2 satır). 7 içecek de tek bakışta
      görünür, kaydırma yok, gizli öğe yok. Web'de doğrulandı (Su/Çay/Kahve/Süt · Meyve suyu/Gazlı/Alkol).
- [x] **🌲 "Orman Özetin" (Wrapped)** — BİTTİ (2026-07-10). İstatistik → "Orman Özetin" kartı
      (tüm zaman: L, ağaç, en iyi seri, gün, en çok içilen). `RepaintBoundary`→PNG→`share_plus`
      sistem paylaşımı. `store.dart wrappedStats` getter, `wrapped_screen.dart`,
      `share_image.dart` (web koşullu import). Web'de render doğrulandı. **INTERNET izni gelmedi.**
- [ ] **☀️ Manuel "sıcak gün / spor yaptım" hedef artırıcı** — hava durumuna göre otomatik hedefin
      internetsiz alternatifi. Tek dokunuş, günlük hedefi geçici yükseltir. İnternet ilkesini korur.
- [ ] **🔊 Ücretsiz özel ses/titreşim + CSV/PDF dışa aktarma** — rakiplerin en nefret edilen iki
      şikâyetini (paywall arkasında ses / veri kilidi) avantaja çevirir. Cihazda.
- [ ] **⌚ Wear OS companion** — orta vadeli büyük hamle; bilekten bardak ekleme + ormanı görme.
      ⚠️ Test edilemiyor (saat yok) → yine 1.1.

ℹ️ **Etkileşimli widget (dokun-ekle) ZATEN VAR** — araştırma önerdi ama Sipling'de bardak butonları
zaten uygulama kapalıyken su ekliyor. Yeniden yapma.

⚠️ **Felsefeyi bozacağı için YAPILMAYACAKLAR:** otomatik hava durumu (internet), gerçek zamanlı
arkadaş yarışması (sunucu), bulut yedekleme (sunucu). Offline alternatifleri yukarıda.

## Sonraki sürümler

- [ ] **Arkadaşla seri yarışması** — pazarda neredeyse boş alan (`wiki/07-pazar.md`), ama sunucu
      gerektirir ve "sunucu yok, aylık maliyet sıfır" kararını bozar.
      **Kullanıcı bunu bilerek 1.0 dışında bıraktı.**
- [ ] ~~Hava durumuna göre hedef artırma~~ — **kullanıcı iptal etti (2026-07-09).**
      Sebep: INTERNET + KONUM izni getiriyor, "internet izni bile yok" vaadini bitiriyor,
      hava servisi ticari lisans ve muhtemelen aylık ücret istiyor. Tek bir "sıcakta +ml"
      özelliği için ağır bedel. Tekrar gündeme gelirse önce servis lisansı doğrulanacak.

Diğer 5 madde 1.0 kapsamına alındı → yukarı bak.

## Bilerek yapılmayacaklar

- ❌ Ekran geçişlerinde geçiş reklamı (rakiplerin 1 numaralı şikâyeti)
- ❌ Kutlama anında reklam
- ❌ Ağacın kuruması / ceza mekaniği (Forest'ın yaptığı)
- ❌ Exact alarm izni (Play reddeder)
- ❌ Takip/hedef/istatistik gibi temel özellikleri Pro arkasına kilitlemek
