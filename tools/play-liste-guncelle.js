/**
 * Play Console → Mağaza girişi → TAM AÇIKLAMA'yı 20 dil için günceller.
 *
 *   bash tools/baslat.sh                      # Sipling Chrome, port 9360, Play Console girişli
 *   node tools/play-liste-guncelle.js         # KURU DENEME (yazmaz, farkı gösterir)
 *   node tools/play-liste-guncelle.js yaz     # gerçekten yazar + kaydeder
 *   node tools/play-liste-guncelle.js yaz tr-TR
 *
 * Metin = store/metinler/<dil>.json `full` + store/metinler/play-ek.js bloğu.
 *
 * 🪤 `?language=xx` URL parametresi ÇALIŞMIYOR — dil, üstteki açılır menüden seçilmeli.
 * 🪤 Ham JS ile `textarea.value = ...` Angular'da "değişmedi" sayılıyor → Playwright
 *    `fill()` kullanılır (gerçek input olayları üretir).
 * 🚨 browser.close() ÇAĞIRMA (CDP ile bağlı, kullanıcının Chrome'unu kapatır).
 */
const { chromium } = require('playwright-core');
const fs = require('fs');
const path = require('path');

const ROOT = path.resolve(__dirname, '..');
const EK = require(path.join(ROOT, 'store/metinler/play-ek.js'));
const DEV = '7286802637861068803';
const APP = '4974431994893643882';
const URL = `https://play.google.com/console/u/0/developers/${DEV}/app/${APP}/main-store-listing`;

// Play dil kodları — açılır menüde satırın SONU "– <kod>" ile bitiyor, dile bağlı değil.
const DILLER = ['en-US', 'tr-TR', 'de-DE', 'es-ES', 'fr-FR', 'it-IT', 'pt-BR', 'nl-NL',
  'pl-PL', 'ru-RU', 'uk', 'ja-JP', 'ko-KR', 'zh-CN', 'zh-TW', 'id', 'vi', 'th', 'hi-IN', 'ar'];

const metin = (dil) => {
  const j = JSON.parse(fs.readFileSync(path.join(ROOT, 'store/metinler', dil + '.json'), 'utf8'));
  return String(j.full).trimEnd() + EK[dil];
};

(async () => {
  const YAZ = process.argv[2] === 'yaz';
  const TEK = process.argv[3];
  console.log(YAZ ? '✍️  YAZMA MODU' : '👀 KURU DENEME — yazmak için: node tools/play-liste-guncelle.js yaz');

  const b = await chromium.connectOverCDP('http://localhost:9360').catch(() => null);
  if (!b) { console.error('Sipling tarayıcısı kapalı → bash tools/baslat.sh'); process.exit(1); }
  const ctx = b.contexts()[0];
  const page = ctx.pages().find((p) => !p.url().startsWith('devtools://')) || (await ctx.newPage());

  const bekle = (ms) => page.waitForTimeout(ms);
  let ok = 0, atlandi = 0, hata = 0;

  for (const dil of DILLER) {
    if (TEK && dil !== TEK) continue;
    const yeni = metin(dil);
    if (yeni.length > 4000) { console.log(`❌ ${dil} 4000 sınırını aşıyor (${yeni.length})`); hata++; continue; }

    try {
      await page.goto(URL, { waitUntil: 'domcontentloaded' });
      // Sayfa Angular; alanlar geç geliyor.
      await page.getByRole('textbox').first().waitFor({ timeout: 45000 });
      await bekle(1500);

      // --- dil seç (varsayılan en-US zaten açık) ---
      if (dil !== 'en-US') {
        await page.locator('text=/–\\s*en-US$/').first().click();
        await bekle(1500);
        await page.locator(`text=/–\\s*${dil.replace('-', '\\-')}$/`).last().click();
        await bekle(3500);
      }

      // --- tam açıklama, sayfadaki TEK textarea ---
      const ta = page.locator('textarea').first();
      await ta.waitFor({ timeout: 30000 });
      const eski = await ta.inputValue();

      if (eski.trim() === yeni.trim()) { console.log(`= ${dil.padEnd(6)} zaten güncel, atlandı`); atlandi++; continue; }
      if (!YAZ) { console.log(`~ ${dil.padEnd(6)} ${eski.length} -> ${yeni.length} karakter`); continue; }

      await ta.fill(yeni);
      await bekle(1200);

      // --- kaydet ---
      const kaydet = page.getByRole('button', { name: /^Kaydet$|^Save$/ }).first();
      await kaydet.click();
      await bekle(4000);
      const son = await ta.inputValue().catch(() => '');
      if (son.length === yeni.length) { console.log(`✅ ${dil.padEnd(6)} ${eski.length} -> ${yeni.length}`); ok++; }
      else { console.log(`⚠️ ${dil.padEnd(6)} kaydedildi ama doğrulanamadı (${son.length})`); ok++; }
    } catch (e) {
      console.log(`❌ ${dil.padEnd(6)} ${String(e.message).slice(0, 110)}`);
      hata++;
    }
  }
  console.log(`\nBitti — yazıldı ${ok} · atlandı ${atlandi} · hata ${hata}`);
})();
