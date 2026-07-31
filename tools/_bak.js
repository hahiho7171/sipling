const { chromium } = require('playwright-core');
const fs = require('fs');
(async () => {
  const url = process.argv[2];
  const out = process.argv[3] || 'asc-bak';
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().filter((x) => !x.url().startsWith('devtools://'))[0];
  if (url && url !== '-') await p.goto(url, { waitUntil: 'domcontentloaded' });
  let t = '';
  for (let i = 0; i < 15; i++) {
    await p.waitForTimeout(3000);
    t = await p.evaluate(() => document.body.innerText);
    if (t.length > 1500) break;
  }
  fs.writeFileSync(out + '.txt', t);
  const s = await p.context().newCDPSession(p);
  const { data } = await s.send('Page.captureScreenshot', { format: 'png' });
  fs.writeFileSync(out + '.png', Buffer.from(data, 'base64'));
  console.log('URL:', p.url(), '| metin', t.length, '→', out + '.txt/.png');
  process.exit(0);
})().catch((e) => { console.error('HATA:', e.message.slice(0, 200)); process.exit(1); });
