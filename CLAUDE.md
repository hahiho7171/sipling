# Sipling — proje talimatları

Bu klasör **bağımsız bir projedir.** Randevio, Misyon Koruma, Cozy ASMR, Kaldıraç, Loaf,
Reklam Otomasyonu vb. ile hiçbir ilgisi yok. Onların dosyalarını okuma, onlara referans verme.

## Nasıl başlatılır

`claude-baslat.bat`'a çift tıkla (izin sormadan açılır) — ya da terminalde bu klasöre `cd` yapıp
`claude --dangerously-skip-permissions` yaz.

Sebebi: Claude Code **hafızayı oturumun başladığı klasöre göre** seçer
(`~/.claude/projects/<klasör>/memory/`). Buradan başlatılırsa yalnız Sipling'in hafızası yüklenir.
Ana klasörden (`C:\Users\asim_`) başlatılırsa bütün projelerin ortak listesi yüklenir — bu dosya
yine okunur (alt dizin CLAUDE.md'leri, o dizindeki bir dosyaya dokunulunca yüklenir) ama bağlam
gereksiz şişer. Kaynak: code.claude.com/docs/en/memory.md

## Önce ne okunur

1. `WIKI.md` — harita + 30 saniyelik özet (kısa, hep oku)
2. Sonra **yalnız gereken** alt dosya:

| İş | Dosya |
|---|---|
| Nerede kaldık, kararlar, çalıştırma | `wiki/01-durum.md` |
| "Şu buton hangi kodda?" | `wiki/02-kod-haritasi.md` |
| Renk, ağaç çizimi, çizim tuzakları | `wiki/03-tasarim.md` |
| Google Play, politika, fiyat, izinler | `wiki/04-yayin-play.md` |
| Apple App Store (henüz başlanmadı) | `wiki/05-yayin-apple.md` |
| Tarayıcı işi | `wiki/06-tarayici.md` |
| Rakipler, pazar | `wiki/07-pazar.md` |
| Derleme hataları, paket API tuzakları | `wiki/08-tuzaklar.md` |
| Sıradaki işler | `wiki/09-yapilacaklar.md` |

Hepsini birden okuma — kredi yanar. Kod dosyalarını taramadan önce `wiki/02-kod-haritasi.md`'ye bak.

## Nereye yazılır

- Durum/ilerleme **yalnız** `wiki/01-durum.md`. Başka yere durum yazma.
- Kod değişince `wiki/02-kod-haritasi.md`'deki satır numaralarını güncelle.
- Yeni tuzak çözünce `wiki/08-tuzaklar.md`'ye **ekle** (silme).
- `WIKI.md` kısa kalmalı — detayı `wiki/` altına yaz.

## 🚨 Sipling'in üç sabit kuralı

1. **Exact alarm izni İSTEME.** Play yalnız alarm/takvim uygulamalarına veriyor → reddedilir.
   Manifest'te `tools:node="remove"` ile kaldırılmış durumda. Her release'de izinleri doğrula.
2. **Tarayıcı işinde Playwright MCP KULLANMA.** MCP `localhost:9334`'e sabitli — o Randevio'nun
   tarayıcısı, Play Console oturumu açık, kapatma. Sipling: `bash tools/baslat.sh` → port **9360**,
   sonra `node tools/tarayici.js foto ...`.
3. **Fiyat/rakam uydurma.** TR minimum abonelik fiyatı yalnız Play Console'da görünür.
   Koda ve wiki'ye rakam yazılmadı; doğrulanmadan yazılmayacak.

## Çalışma tarzı (kullanıcının genel kuralları)

- 🚨 **Sadece İSTENENİ yap.** Kafana göre birleştirme, çıkarma, basitleştirme, "iyi olur" ekleme
  yok. Farklı/ekstra bir şey yapacaksan **önce sor**, onaysız kod yazma.
- ✅ **Onaylanmış görevde otonom ilerle.** Hedef onaylandıysa alt adımlarda tek tek onay bekleme;
  yap, sonra topluca rapor ver. (Bu 1. kuralla çelişmez — o, onaysız *ekstra* iş yapmayı yasaklar.)
- 🗣️ **Sade konuş.** Jargon yok, günlük dil, somut benzetme. Tek net öneri ver, dört teknik
  seçenekle boğma. Kodu sen hallet, kullanıcıya etkisini anlat.
- 🚫 **Doğrulamadan rakam/olgu yazma.** Fiyat, kapasite, indirme sayısı, politika — hepsini
  gerçek kaynaktan (resmî sayfa, kod, gerçek veri) doğrula, kaynağıyla ver.
  Doğrulayamıyorsan "doğrulanamadı" de.
- 🤖 **Tarayıcı/hesap işlerini kendin yap** (API veya CDP ile). Sadece şifre/2FA/ödeme kullanıcıda.
- 💸 **Krediyi verimli kullan.** Biten işi tekrar çalıştırma; önce diske bak.

## Hızlı komutlar

```bash
cd app && flutter run                      # telefonda çalıştır
cd app && flutter analyze                  # kod kontrolü
cd app && flutter build apk --release      # APK
cd app && flutter build web --release && cd build/web && python -m http.server 8792

bash tools/baslat.sh                                      # Sipling tarayıcısı (9360)
node tools/tarayici.js foto http://localhost:8792 x.png   # telefon boyutunda ekran görüntüsü
```
