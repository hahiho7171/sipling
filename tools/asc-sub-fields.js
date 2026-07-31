const { chromium } = require('playwright-core');
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));
  const rn = await p.$('#referenceName');
  const pid = await p.$('#productId');
  if (!rn || !pid) { console.log('input-yok', !!rn, !!pid); return; }
  await rn.fill('Sipling Pro Monthly');
  await p.waitForTimeout(400);
  await pid.fill('sipling_pro_monthly');
  await p.waitForTimeout(500);
  const sels = await p.evaluate(() => [...document.querySelectorAll('select')].map((s) => ({ id: s.id || '-', name: s.name || '-', opts: [...s.options].map((o) => ({ v: o.value, t: o.textContent })).slice(0, 10) })));
  console.log('SELECTS:', JSON.stringify(sels));
})().catch((e) => { console.error('HATA:', e.message.slice(0, 120)); process.exit(1); });
