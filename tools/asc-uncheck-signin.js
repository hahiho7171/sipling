const { chromium } = require('playwright-core');
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));
  const pt = await p.evaluate(() => {
    const c = document.getElementById('appStoreReviewDetails_demoAccountRe')
           || [...document.querySelectorAll('input[type=checkbox]')].find((x) => x.name === 'demoAccountRequired');
    if (!c) return null;
    c.scrollIntoView({ block: 'center' });
    const rc = c.getBoundingClientRect();
    return { x: rc.left + rc.width / 2, y: rc.top + rc.height / 2 };
  });
  if (!pt) { console.log('checkbox-yok'); return; }
  await p.mouse.click(pt.x, pt.y);
  await p.waitForTimeout(1000);
  const checked = await p.evaluate(() => {
    const c = document.getElementById('appStoreReviewDetails_demoAccountRe')
           || [...document.querySelectorAll('input[type=checkbox]')].find((x) => x.name === 'demoAccountRequired');
    return c ? c.checked : null;
  });
  console.log('signin checked now:', checked);
})().catch((e) => { console.error('HATA:', e.message.slice(0, 150)); process.exit(1); });
