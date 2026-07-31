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
  await p.waitForTimeout(600);
  const clicked = await p.evaluate(() => {
    const bb = [...document.querySelectorAll('button')].find((e) => (e.textContent || '').trim() === 'Create' && !e.disabled);
    if (bb) { bb.click(); return true; }
    return false;
  });
  console.log('created clicked:', clicked);
  await p.waitForTimeout(3000);
  console.log('url:', p.url());
})().catch((e) => { console.error('HATA:', e.message.slice(0, 150)); process.exit(1); });
