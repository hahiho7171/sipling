const { chromium } = require('playwright-core');
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));

  // Subtitle
  const sub = await p.$('#subtitle');
  if (sub) { await sub.fill('Water tracker & reminder'); await p.waitForTimeout(300); console.log('subtitle OK'); }

  // Categories via selectOption (React-friendly)
  await p.selectOption('#primaryCategory', 'HEALTH_AND_FITNESS');
  await p.waitForTimeout(400);
  await p.selectOption('#secondaryCategory', 'LIFESTYLE');
  await p.waitForTimeout(400);
  const st = await p.evaluate(() => ({
    primary: document.getElementById('primaryCategory').value,
    secondary: document.getElementById('secondaryCategory').value,
    subtitle: document.getElementById('subtitle').value,
  }));
  console.log('state:', JSON.stringify(st));
})().catch((e) => { console.error('HATA:', e.message.slice(0, 150)); process.exit(1); });
