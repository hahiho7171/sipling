const { chromium } = require('playwright-core');
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));
  const y = await p.evaluate(() => {
    const c = [...document.querySelectorAll('*')].filter((e) => e.childElementCount <= 3 && /^1\.0\.0$/.test((e.textContent || '').trim()));
    if (!c.length) return null;
    const rc = c[0].getBoundingClientRect();
    return rc.top + rc.height / 2;
  });
  if (!y) { console.log('row-yok'); return; }
  // satır boyunca birkaç noktada hover et
  for (const x of [980, 1050, 1120, 1180, 320]) {
    await p.mouse.move(x, y);
    await p.waitForTimeout(400);
  }
  await p.waitForTimeout(800);
  // görünür remove/minus/trash butonu ara (satır hizasında)
  const found = await p.evaluate((yy) => {
    const els = [...document.querySelectorAll('button, [role=button], svg, span, a')];
    const near = els.filter((e) => {
      const r = e.getBoundingClientRect();
      if (r.width === 0) return false;
      const cy = r.top + r.height / 2;
      const lbl = (e.getAttribute('aria-label') || e.textContent || '').toLowerCase();
      return Math.abs(cy - yy) < 40 && (/remove|delete|minus|trash|kaldır/.test(lbl) || (e.tagName === 'BUTTON' && r.width < 60 && r.left > 850));
    }).map((e) => { const r = e.getBoundingClientRect(); return { tag: e.tagName, lbl: (e.getAttribute('aria-label') || e.textContent || '').trim().slice(0, 20), x: Math.round(r.left + r.width / 2), y: Math.round(r.top + r.height / 2) }; });
    return near;
  }, y);
  console.log('rowY:', Math.round(y), 'controls:', JSON.stringify(found));
})().catch((e) => { console.error('HATA:', e.message.slice(0, 120)); process.exit(1); });
