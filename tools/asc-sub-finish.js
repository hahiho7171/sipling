const { chromium } = require('playwright-core');
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));
  // süreyi seç
  await p.selectOption('#subscriptionPeriod', 'ONE_MONTH');
  await p.waitForTimeout(800);
  // Create butonunun koordinatını al
  const pt = await p.evaluate(() => {
    const create = [...document.querySelectorAll('button')].find((e) => (e.textContent || '').trim() === 'Create' && !e.disabled);
    if (!create) return null;
    const rc = create.getBoundingClientRect();
    return { x: rc.left + rc.width / 2, y: rc.top + rc.height / 2 };
  });
  console.log('create pt:', JSON.stringify(pt));
  if (!pt) { console.log('create-disabled'); return; }
  await p.mouse.click(pt.x, pt.y);
  await p.waitForTimeout(4000);
  console.log('url:', p.url());
})().catch((e) => { console.error('HATA:', e.message.slice(0, 120)); process.exit(1); });
