/**
 * App Store Connect'e dosya yükler (filechooser olayıyla — gizli input'a gerek yok).
 * Kullanım: node tools/asc-upload.js "<tetikleyici-buton-metni>" file1,file2,... <bekleme-ms>
 * Örn: node tools/asc-upload.js "Choose File" store/ios-65/1-summary.png,store/ios-65/2-today.png 30000
 */
const { chromium } = require('playwright-core');
(async () => {
  const trigText = process.argv[2];
  const files = process.argv[3].split(',').filter(Boolean);
  const waitMs = Number(process.argv[4] || 25000);
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));

  const [chooser] = await Promise.all([
    p.waitForEvent('filechooser', { timeout: 20000 }),
    p.evaluate((t) => {
      const els = [...document.querySelectorAll('button, a, span, div, label')];
      const el = els.find((e) => (e.textContent || '').trim() === t && e.offsetParent !== null)
              || els.find((e) => (e.textContent || '').trim().includes(t) && e.offsetParent !== null);
      if (el) el.click();
      return !!el;
    }, trigText),
  ]);
  await chooser.setFiles(files, { timeout: 200000 });
  console.log('dosyalar set edildi:', files.length);
  await p.waitForTimeout(waitMs);
  console.log('bitti');
})().catch((e) => { console.error('HATA:', e.message.slice(0, 200)); process.exit(1); });
