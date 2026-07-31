const { chromium } = require('playwright-core');
const fs = require('fs');
(async () => {
  const out = process.argv[2] || 'shot.png';
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));
  const session = await p.context().newCDPSession(p);
  const { data } = await session.send('Page.captureScreenshot', { format: 'png' });
  fs.writeFileSync(out, Buffer.from(data, 'base64'));
  console.log('OK ' + out);
})().catch((e) => { console.error('HATA:', e.message.slice(0, 150)); process.exit(1); });
