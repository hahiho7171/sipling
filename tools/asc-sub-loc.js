const { chromium } = require('playwright-core');
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));
  const dn = await p.$('#displayName');
  const de = await p.$('#description');
  if (!dn || !de) { console.log('input-yok', !!dn, !!de); return; }
  await dn.fill('Sipling Pro');
  await p.waitForTimeout(400);
  await de.fill('Remove all ads and unlock seasonal forest themes.');
  await p.waitForTimeout(600);
  const pt = await p.evaluate(() => {
    const add = [...document.querySelectorAll('button')].find((e) => (e.textContent || '').trim() === 'Add' && !e.disabled);
    if (!add) return null;
    const rc = add.getBoundingClientRect();
    return { x: rc.left + rc.width / 2, y: rc.top + rc.height / 2 };
  });
  console.log('add pt:', JSON.stringify(pt));
  if (pt) { await p.mouse.click(pt.x, pt.y); await p.waitForTimeout(3000); }
  console.log('done, url:', p.url());
})().catch((e) => { console.error('HATA:', e.message.slice(0, 120)); process.exit(1); });
