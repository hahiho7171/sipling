# 💧 Sipling — giriş kapısı

> Su içme takip + hatırlatma uygulaması. Flutter · Google Play (global + Türkiye).
> **Bu dosya sadece bir haritadır.** Detay `wiki/` altındaki dosyalarda.
> Hepsini okuma — aşağıdaki tablodan **sadece gereken dosyayı** aç.

## 🧭 Ne arıyorsan oradan oku

| Sorun / iş | Aç |
|---|---|
| "Nerede kaldık?" · kararlar · nasıl çalıştırılır | `wiki/01-durum.md` |
| **"Şu buton hangi kodda?"** · dosya:satır tablosu | `wiki/02-kod-haritasi.md` |
| Renkler · ağaç çizimi · tema · çizim tuzakları | `wiki/03-tasarim.md` |
| Google Play · politika · fiyat · izinler | `wiki/04-yayin-play.md` |
| Apple App Store (1.0 YAYINDA · 1.0.3 incelemede) | `wiki/05-yayin-apple.md` |
| **Tarayıcı işi (port 9360)** — MCP kullanma! | `wiki/06-tarayici.md` |
| Rakipler · şikâyetler · pazar boşluğu | `wiki/07-pazar.md` |
| Derleme hataları · paket API tuzakları · yaşanmış dersler | `wiki/08-tuzaklar.md` |
| Sıradaki işler | `wiki/09-yapilacaklar.md` |
| ⌚ Wear OS (Android saat) — build-hazır iskele | `wiki/10-wear-os.md` |
| 💵 Para kazanma (reklam + $1/ay Pro) + yayın planı | `wiki/11-para-yayin.md` |

## 📌 30 saniyelik özet

**Sipling** = "sip" (yudum) + "sapling" (fidan). Her bardak su bir fidanı sular; günlük hedefi
tutturunca fidan ağaç olur ve ormanına eklenir. **Ağaç asla kurumaz — ceza yok.**

- **📍 Durum (2026-07-28, canlı API/panelden doğrulandı):**
  🍎 **App Store: 1.0 YAYINDA (satışta)** · **1.0.3 + build 7 incelemede** (2 kez reddedildi:
  önce 3.1.2 EULA linki, sonra 2.1(a) "Apple Health hatası" — ikisi de düzeltildi).
  🤖 **Play: 1.0.3 (vc5) kapalı testte yayında**, üretimde değil; **12 testçi × 14 gün sayacı
  7. günde** · mağaza girişi güncellemesi (20 dil) **Google incelemesinde**.
  Detay → **`wiki/01-durum.md`** (TEK KAYNAK).
- **🔎 ASO (2026-07-27):** iki mağaza da **20 dilde** ad/alt başlık/anahtar kelime/açıklama/görsel.
  🚨 Apple aramada **açıklamayı indekslemez** (ad+alt başlık+anahtar kelime alanı), Google **indeksler**.
  Araçlar: `tools/aso-dogrula.js` · `aso-uygula.js` · `aso-gorsel.js` · `play-liste-guncelle.js`.
- **🔗 Play katılım linki (12 kişiye):** `https://play.google.com/apps/testing/com.sipling.app`
  → 12 kişi girip kuracak + 14 gün → sonra **üretim erişim başvurusu** (Google zorunluluğu).
- **Paket adı:** `com.sipling.app` · Play app ID `4974431994893643882` · Apple app ID `6789913186`
  · geliştirici `randevusayfasi@gmail.com` · Firebase `sipling-app`.
- **20 dil** (Arapça/RTL dahil), sistem dilini izler. İkon ✓, widget ✓, Health Connect ✓, mevsim temaları ✓.
- **Para:** Ücretsiz + reklam (non-personalized, takip yok), reklamsız **Pro $0,99/ay** (`sipling_pro_monthly`).
- **Test APK (eski):** https://sipling-app.web.app/indir · **Gizlilik:** https://sipling-app.web.app/privacy
- **💰 Reklam gerçeği (2026-07-27 ölçüldü):** AdMob hesabı **onaylı**, Sipling iOS "reklam sunma etkin".
  Son 7 günde istek 355 · gösterim 5 · kazanç **₺0,61** — ve bunun **tamamı Android kapalı testten**.
  iOS'tan ₺0, çünkü **90 günde 2 indirme** var (ASC Analytics). Sorun reklam değil, **görünürlük**.
- **Eksikler:** Play'de 19 dilin görselleri eski tasarımda (araç engeli → `wiki/08`) ·
  Health apps declaration formu · 12 testçi × 14 gün · Wear OS 1.1 → `wiki/10`.

## 🚨 Üç kural (unutma)

1. **Exact alarm izni İSTEME.** Play yalnız alarm/takvim uygulamalarına veriyor → reddedilir.
   Manifest'te `tools:node="remove"` ile kaldırıldı. → `wiki/04-yayin-play.md`
2. **Tarayıcıda doğru MCP'yi kullan.** Genel `playwright` MCP'si **9334'e** sabitli — o Randevio'nun,
   dokunma. Sipling'in kendi MCP'si var: **`mcp__sipling-tarayici__*`** (proje kökündeki `.mcp.json`,
   **9360**'a bağlı) — bunu kullan. Tarayıcıyı önce aç: `bash tools/baslat.sh`. → `wiki/06-tarayici.md`
3. **Fiyat uydurma.** TR minimum abonelik fiyatı yalnız Play Console'da görünür.

## 📂 Klasör

```
Sipling/
  WIKI.md          ← buradasın (harita)
  wiki/            ← konu konu detay, 9 dosya
  app/             ← Flutter kodu (lib/ · android/ · ios/)
  tools/           ← baslat.sh (Chrome 9360) · tarayici.js (sürücü)
```

## ✍️ Bu wiki'yi güncelleme kuralı

- Durum/ilerleme **yalnız** `wiki/01-durum.md`'ye yazılır. Başka yere durum yazma.
- Kod değişince `wiki/02-kod-haritasi.md`'deki satır numaralarını da güncelle.
- Yeni bir tuzağa düşüp çözünce `wiki/08-tuzaklar.md`'ye ekle (silme, üzerine ekle).
- Bu dosya (WIKI.md) **kısa kalmalı** — buraya detay yazma, `wiki/` altına yaz.
