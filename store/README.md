# 🖼️ Play Console'a yüklenecek görseller

Hepsi **gerçek uygulamadan** çekildi (web derlemesi, `tools/` altındaki sürücüyle),
Google'ın resmî ölçü şartlarına göre üretildi.
Kaynak: support.google.com/googleplay/android-developer/answer/9866151

| Dosya | Nereye | Şart | Bizimki |
|---|---|---|---|
| `play-icon-512.png` | Mağaza kaydı → Uygulama simgesi | 512×512, **32-bit PNG (alfalı)**, ≤1024 KB | 512×512 RGBA, 74 KB ✅ |
| `tr/feature-graphic.png` · `en/feature-graphic.png` | Öne çıkan grafik | 1024×500, JPEG veya **24-bit PNG (alfasız)** | 1024×500 RGB ✅ |
| `tr/1..5-*.png` · `en/1..5-*.png` | Telefon ekran görüntüleri | 2–8 adet, 9:16, alfasız | 5'er adet, 1080×1920 RGB ✅ |

## 🚨 Ekran görüntülerinde en kolay yapılan hata

Play, **uzun kenarın kısa kenarın iki katını aşmasına izin vermiyor.**
Uygulamanın önizlemede kullandığımız 390×844 telefon oranı **2,16** — reddedilirdi.
Bu yüzden 1080×1920 (tam 9:16, oran 1,78) çekiliyor.

## Nasıl yeniden üretilir

```bash
cd app && flutter build web --release
cd build/web && python -m http.server 8792 &
bash tools/baslat.sh                       # Sipling Chrome'u (9360)
node <scratchpad>/magaza.js                # 10 ekran görüntüsü (tr + en)

# öne çıkan grafik
chrome --headless=new --screenshot=store/tr/feature-graphic.png \
       --window-size=1024,500 file:///.../store/feature-tr.html
```

Ekran görüntüleri sonbahar temasıyla ve 26 günlük sahte bir ormanla çekiliyor
(`scratchpad/seed.js`), böylece orman dolu görünüyor.

## Sürücüde iki tuzak

- **`browser.close()` çağırma.** CDP ile bağlanınca Playwright'ın `close()`'u Chrome'un
  kendisini kapatır. Sadece süreçten çık.
- **`page.screenshot()` cihaz ölçeğini yok sayar** (CSS pikseliyle kaydeder). 1080×1920 için
  CDP'nin `Page.captureScreenshot`'ı + `deviceScaleFactor: 2` gerekiyor.
- Tıkladıktan sonra **fareyi ekranın ortasına park et**, yoksa alt sekmenin tooltip balonu
  ("Ayarlar") ekran görüntüsüne girer.

## Eksik

- [ ] **Tablet ekran görüntüleri** (7"/10") — Play en az 4 tane istiyor, 1080–7680 px arası.
      Yalnız "tablet için tasarlandı" rozeti isteniyorsa gerekli.
- [ ] Mağaza metinleri (kısa/uzun açıklama) → `wiki/04-yayin-play.md`
