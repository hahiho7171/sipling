const { chromium } = require('playwright-core');

const BASE = 'C:/Users/asim_/Desktop/CloudWork/Sipling/store/ios-65/';
const FILES = ['1-summary.png', '2-today.png', '3-forest.png', '4-stats.png', '5-settings.png'].map((f) => BASE + f);

(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));

  // filechooser + click "Choose File" (iPhone tab görünür slot)
  const cp = p.waitForEvent('filechooser', { timeout: 15000 });
  const clicked = await p.evaluate(() => {
    const els = [...document.querySelectorAll('span, a, button')];
    const el = els.find((e) => (e.textContent || '').trim() === 'Choose File' && e.offsetParent !== null);
    if (el) { el.click(); return true; }
    return false;
  });
  console.log('choose-clicked:', clicked);
  const chooser = await cp;
  await chooser.setFiles(FILES, { timeout: 200000 });
  console.log('setFiles OK:', FILES.length);
  await p.waitForTimeout(30000);
  console.log('bekleme bitti');
})().catch((e) => { console.error('HATA:', e.stack ? e.stack.slice(0, 400) : e.message); process.exit(1); });
