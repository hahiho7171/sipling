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
| Apple App Store (kod build-hazır, Codemagic bekliyor) | `wiki/05-yayin-apple.md` |
| **Tarayıcı işi (port 9360)** — MCP kullanma! | `wiki/06-tarayici.md` |
| Rakipler · şikâyetler · pazar boşluğu | `wiki/07-pazar.md` |
| Derleme hataları · paket API tuzakları · yaşanmış dersler | `wiki/08-tuzaklar.md` |
| Sıradaki işler | `wiki/09-yapilacaklar.md` |
| ⌚ Wear OS (Android saat) — build-hazır iskele | `wiki/10-wear-os.md` |
| 💵 Para kazanma (reklam + $1/ay Pro) + yayın planı | `wiki/11-para-yayin.md` |

## 📌 30 saniyelik özet

**Sipling** = "sip" (yudum) + "sapling" (fidan). Her bardak su bir fidanı sular; günlük hedefi
tutturunca fidan ağaç olur ve ormanına eklenir. **Ağaç asla kurumaz — ceza yok.**

- **Durum (2026-07-10):** Uygulama **tam**, Play'e yüklemeye hazır. Play Console kurulumu bitti
  (20 dil mağaza kaydı + 11 beyan + Alpha kanalı). ⏳ Kalan tek adım: **AAB'yi kutuya sürükle**
  (kullanıcı elle — otomasyon 44 MB'da çöküyor). Kullanıcı şu an APK'yı telefonda deniyor.
- **Paket adı:** `com.sipling.app` · app ID `4974431994893643882` · geliştirici `randevusayfasi@gmail.com`
- **20 dil** (Arapça/RTL dahil), sistem dilini izler. İkon ✓, widget ✓, Health Connect ✓, mevsim temaları ✓.
- **Para:** Ücretsiz + reklam, reklamsız Pro. Reklam yalnız gün sonu özeti + ödüllü. AdMob/Billing **en sonda**.
- **Sunucu yok.** Bildirimler cihazda. APK'nın **internet izni bile yok.** Firebase projesi `sipling-app`.
- **Test APK:** https://sipling-app.web.app/indir · **Gizlilik:** https://sipling-app.web.app/privacy
- **iOS:** kod build-hazır (bildirim aksiyonu, App Group, 20 dil, ikon, widget kaynağı, `codemagic.yaml`) → `wiki/05`. **Wear OS:** build-hazır iskele → `wiki/10`.
- **Eksikler:** AAB yüklemesi (kullanıcı) · AdMob/Play Billing fiyatı (kullanıcı kararı) · iOS: Codemagic+ASC kurulumu (kullanıcı hesabı) · widget Xcode hedefi (Mac).

## 🚨 Üç kural (unutma)

1. **Exact alarm izni İSTEME.** Play yalnız alarm/takvim uygulamalarına veriyor → reddedilir.
   Manifest'te `tools:node="remove"` ile kaldırıldı. → `wiki/04-yayin-play.md`
2. **Tarayıcı işinde MCP kullanma.** MCP 9334'e (Randevio, Play Console oturumlu) sabitli.
   Sipling'in kendi tarayıcısı: `bash tools/baslat.sh` → port 9360. → `wiki/06-tarayici.md`
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
