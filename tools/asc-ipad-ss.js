const { chromium } = require('playwright-core');
const BASE = 'C:/Users/asim_/Desktop/CloudWork/Sipling/store/ipad-13/';
const FILES = ['1-summary.png', '2-today.png', '3-forest.png', '4-stats.png', '5-settings.png'].map((f) => BASE + f);
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));
  const inp = await p.$('input[type=file][multiple]');
  if (!inp) { console.log('input-yok'); return; }
  await inp.setInputFiles(FILES, { timeout: 200000 });
  console.log('5 iPad ss set');
  await p.waitForTimeout(30000);
  console.log('done');
})().catch((e) => { console.error('HATA:', e.message.slice(0, 150)); process.exit(1); });
