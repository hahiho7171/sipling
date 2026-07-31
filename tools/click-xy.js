const { chromium } = require('playwright-core');
(async () => {
  const x = Number(process.argv[2]), y = Number(process.argv[3]);
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((z) => !z.url().startsWith('devtools://'));
  await p.mouse.click(x, y);
  await p.waitForTimeout(700);
  console.log('clicked', x, y);
})().catch((e) => { console.error('HATA:', e.message.slice(0, 120)); process.exit(1); });
