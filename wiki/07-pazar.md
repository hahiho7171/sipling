# 🔬 Pazar araştırması (2026-07-09, gerçek kaynaklardan)

## Rakipler — Google Play

| Uygulama | Geliştirici | İndirme | Model |
|---|---|---|---|
| Water Drink Reminder | Leap Fitness Group | **10M+** | Ücretsiz + reklam + Pro |
| Drink Water Reminder | Leap Fitness Group | 5M+ | Ücretsiz |
| WaterMinder | Funn Media | 5M+ | **Tek seferlik $4.99** |
| Plant Nanny 2 (bitki oyunlaştırma) | Fourdesire | 5M+ | Abonelik |
| Hydro Coach | Codium App Ideas | 1M+ | Ücretsiz + reklam |
| Water Reminder | **Nexoft (Türk şirketi)** | 1M+ | Ücretsiz + reklam |

Not: Play sayfaları JS ile yüklendiği için rakamlar apkcombo aynası üzerinden çapraz doğrulandı.
Waterllama'nın Play'e özgü indirme sayısı **doğrulanamadı** (iOS rakamı dolaşıyor).

## 🎯 En çok şikâyet edilen 4 şey = bizim fırsat listemiz

| Şikâyet | Sipling'in cevabı |
|---|---|
| ① "Her dokunuşta reklam çıkıyor" | Ekran geçişlerinde ve kutlamada reklam **yok**. Sadece gün sonu özeti + isteğe bağlı ödüllü reklam. |
| ② "Bildirim gelmiyor / bozuk" (lider uygulamada Mayıs 2024'ten beri güncelleme yok) | Pil rehberi ekranı: `screens/battery_guide_screen.dart`. Sebebi kullanıcıya açıkça anlatan tek uygulama. |
| ③ "Ücretsiz olan özellikler abonelik arkasına kilitlendi" (Plant Nanny) | Pro yalnız kozmetik + reklamsızlık. Takip, hedef, istatistik hep ücretsiz. |
| ④ "Sessizdeyken bile maksimum sesle çalıyor" | Ayarlarda "sessiz bildirim" seçeneği. |

## Standart özellikler (herkeste var — olmazsa olmaz)
Bardak boyutu ayarı · kilo/cinsiyetle hedef hesabı · bildirim aralığı · geçmiş grafiği · widget.

## Ayırt edici özellikler (azınlıkta)
- Bitki/karakter oyunlaştırma → Plant Nanny, Waterllama
- Hava durumuna göre hedef → Waterllama, Hydro Coach
- Wear OS / akıllı saat → Water Drink Reminder, WaterMinder
- Google Fit / Health Connect → Water Drink Reminder, Hydro Coach
- Farklı içecekler + hidrasyon katsayısı → birkaç uygulama
- **Arkadaşla seri yarışması → neredeyse boş alan** (yalnız küçük oyuncu Waltermelon)

## Türkiye

Play'deki Türkçe seçeneklerin çoğu yabancı uygulamaların **lokalizasyonu**, yerli üretim değil.
Gerçekten Türk yapımı olanlar:
- **Nexoft** — 1M+ indirme, ~4,6-4,7 puan → bir Türk ekibin bu kategoride uluslararası ölçeğe
  çıkabildiğinin kanıtı.
- "Su Arkadaşım" (bireysel) — 10+ indirme, fark edilmemiş.

**Sonuç:** Türkiye'de kaliteli, öne çıkmış, "yerli marka" hissi veren bir su uygulaması yok.
Engel teknik değil; ürün kalitesi ve pazarlama.

## Para kazanma modelleri

1. **Ücretsiz + reklam + Pro** (en yaygın) — Leap Fitness, Hydro Coach, Nexoft
2. **Abonelik** — Plant Nanny 2, Waterllama (opsiyonel)
3. **Tek seferlik satın alma** — WaterMinder $4.99 (azınlık ama sadık kullanıcı yaratıyor)

Sipling'in seçimi: **1 numara**, ama reklamı rakiplerin koyduğu yerlere koymadan.


---

## 🔄 2026 güncellemesi (rakip araştırması, kaynaklı)

### Rakiplerin öne çıkanları
| Uygulama | İndirme (bant) | Model | Öne çıkan |
|---|---|---|---|
| Water Drink Reminder (Leap) | 10M+ | ücretsiz+reklam / ~2,99$ tek sefer | Google Fit+Samsung Health, yedekleme, **Wear OS** |
| Plant Nanny (Fourdesire) | ~5,8M (AppBrain tahmini) | reklam / ~19,99$/yıl | bitki büyür, **ihmal edilince solar** (Sipling'in tersi) |
| Hydro Coach | ~2,6M | **tek sefer ~19,99$ (abonelik yok)** | **hava durumuna göre otomatik hedef**, Health Connect+Fitbit |
| WaterMinder | doğrulanamadı | fiyat bölgesel/karışık | **Apple Watch + Siri sesle ekleme**, meydan okuma |
| Waterllama (yalnız iOS) | doğrulanamadı | ~9$ ömür boyu | 140+ karakter, **"Hidrasyon Wrapped" yıllık özet** (viral) |

⚠️ **Plant Nanny ceza kullanıyor (bitki ölür); Sipling "ceza yok, ağaç kurumaz" — bilinçli ayrışma, KORU.**
⚠️ Waterllama Android'de YOK → Sipling için Android'de tasarım/sevimlilik boşluğu.

### En çok istenen (rakipte az/yok olan)
- **Bildirimden doğrudan ekleme** — rakiplerin çoğunda YOK, özellikle Android'de açık boşluk.
- Sesle ekleme (iOS'ta Siri var, **Android'de adanmış su-loglama neredeyse yok**).
- Wear OS / Apple Watch — en çok "keşke olsa" denen.
- **Hava durumuna göre hedef** (Hydro Coach, Waterllama) — ama internet ister.
- **Yıllık "Wrapped" özet** — Waterllama'nınki sosyal medyada paylaşılıyor (bedava pazarlama).

### En çok şikâyet (Sipling'in AVANTAJI)
Aşırı reklam · agresif abonelik (temel özellik paywall arkasında) · **bildirim gelmemesi** (Android pil
tuzağı) · pil tüketimi · gizlilik (cihaz kimliği/IP toplama). Kullanıcılar açıkça "no signup, offline,
no tracking" arıyor. **Sipling'in mimarisi (sunucu yok, cihazda veri, reklamsız Pro) bunları zaten çözüyor
— mağaza metninde ve ekran görüntülerinde NET pazarla.**

Kaynaklar: Play sayfaları, AppBrain, androidauthority.com, habitbox.app, waterllama.com, hydrocoach.com,
pwaterapp.com/compare, techradar Waterllama incelemesi (2026 araştırması).
