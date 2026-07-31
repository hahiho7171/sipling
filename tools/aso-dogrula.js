/**
 * App Store ASO metinlerini UYGULAMADAN ÖNCE denetler.
 *   node tools/aso-dogrula.js
 * Kontroller: karakter sınırları · adda geçen kelimenin alt başlık/anahtar kelimede tekrarı ·
 * anahtar kelimede boşluk israfı · açıklamada EULA linki · kaynak dosya var mı.
 */
const fs = require('fs');
const path = require('path');

const ROOT = path.resolve(__dirname, '..');
const ASO = require(path.join(ROOT, 'store/metinler/apple-aso.js'));
const BLOK = require(path.join(ROOT, 'store/metinler/apple-blok.js'));
const { aciklama, surumNotu, emojisiz } = require('./_aso-metin.js');
const EMOJI_KALAN = /[\u{1F000}-\u{1FAFF}\u{2600}-\u{27BF}\u{FE0F}]/u;

const LIM = { name: 30, subtitle: 30, keywords: 100, promotionalText: 170, description: 4000, whatsNew: 4000 };

// Kelimeye ayır (Latin + Kiril + Türkçe; CJK/Tay/Arapça için kelime sınırı yok → atla)
const CJK = /[぀-ヿ㐀-鿿฀-๿؀-ۿऀ-ॿ]/;
const kelimeler = (s) =>
  CJK.test(s) ? [] : s.toLowerCase().split(/[^\p{L}\p{N}]+/u).filter((w) => w.length > 2);

let hata = 0, uyari = 0;
const satirlar = [];

for (const [locale, v] of Object.entries(ASO)) {
  const b = BLOK[locale];
  const srcPath = path.join(ROOT, 'store/metinler', v.src + '.json');
  const notlar = [];

  if (!b) { console.log(`❌ ${locale}: apple-blok.js'te karşılığı YOK`); hata++; continue; }
  if (!fs.existsSync(srcPath)) { console.log(`❌ ${locale}: kaynak yok ${v.src}.json`); hata++; continue; }

  const description = aciklama(locale, v.src);
  const whatsNew = surumNotu(locale);

  const alan = { name: v.name, subtitle: v.subtitle, keywords: v.keywords, description, whatsNew };
  for (const [k, val] of Object.entries(alan)) {
    if (val.length > LIM[k]) { notlar.push(`❌ ${k} ${val.length}/${LIM[k]} SINIR AŞILDI`); hata++; }
  }

  // Apple açıklamayı indekslemez ama EULA linki ŞART (guideline 3.1.2)
  if (!description.includes('stdeula')) { notlar.push('❌ açıklamada EULA linki YOK'); hata++; }

  // 🪤 Apple açıklamada/sürüm notunda emoji KABUL ETMİYOR (INVALID_CHARACTERS)
  for (const [k, val] of Object.entries({ description, whatsNew, name: v.name, subtitle: v.subtitle })) {
    if (EMOJI_KALAN.test(val)) { notlar.push(`❌ ${k} içinde EMOJİ var — Apple reddeder`); hata++; }
  }

  // Anahtar kelimede virgülden sonra boşluk = boşa giden karakter
  if (/,\s/.test(v.keywords)) { notlar.push('⚠️ keywords: virgülden sonra BOŞLUK var (karakter israfı)'); uyari++; }

  // Ad + alt başlıktaki kelimeler anahtar kelimede tekrarlanmamalı
  const ustKelimeler = new Set([...kelimeler(v.name), ...kelimeler(v.subtitle)]);
  ustKelimeler.delete('sipling');
  const tekrar = kelimeler(v.keywords.replace(/,/g, ' ')).filter((w) => ustKelimeler.has(w));
  if (tekrar.length) { notlar.push(`⚠️ keywords ad/altbaşlıkla ÇAKIŞIYOR: ${[...new Set(tekrar)].join(', ')}`); uyari++; }

  // Ad ile alt başlık arasında tekrar
  const adK = new Set(kelimeler(v.name)); adK.delete('sipling');
  const cak2 = kelimeler(v.subtitle).filter((w) => adK.has(w));
  if (cak2.length) { notlar.push(`⚠️ alt başlık ADLA çakışıyor: ${[...new Set(cak2)].join(', ')}`); uyari++; }

  satirlar.push(
    `${locale.padEnd(9)} ad ${String(v.name.length).padStart(2)}/30  alt ${String(v.subtitle.length).padStart(2)}/30  ` +
    `anahtar ${String(v.keywords.length).padStart(3)}/100  açıklama ${String(description.length).padStart(4)}/4000` +
    (notlar.length ? '\n            ' + notlar.join('\n            ') : '')
  );
}

console.log(satirlar.join('\n'));
console.log(`\nToplam ${Object.keys(ASO).length} dil · ❌ hata: ${hata} · ⚠️ uyarı: ${uyari}`);
process.exit(hata ? 1 : 0);
