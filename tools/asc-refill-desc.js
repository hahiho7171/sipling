const { chromium } = require('playwright-core');
const fs = require('fs');
const DESC = fs.readFileSync('C:/Users/asim_/Desktop/CloudWork/Sipling/store/metinler/apple-en.txt', 'utf8').trim();
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));
  const el = await p.$('#description');
  if (!el) { console.log('desc-yok'); return; }
  await el.scrollIntoViewIfNeeded();
  await el.fill('');
  await p.waitForTimeout(300);
  await el.fill(DESC);
  await p.waitForTimeout(700);
  const val = await el.inputValue();
  console.log('OK len:', val.length, '| emojiVar:', /[\u{1F300}-\u{1FAFF}\u{2600}-\u{27BF}]/u.test(val));
})().catch((e) => { console.error('HATA:', e.message.slice(0, 150)); process.exit(1); });
