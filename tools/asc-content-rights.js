const { chromium } = require('playwright-core');
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));

  // "No, it does not contain..." radio'sunun koordinatı
  const pt = await p.evaluate(() => {
    const radios = [...document.querySelectorAll('input[type=radio]')];
    // "No" seçeneği: etiketinde "does not contain" geçen
    let target = null;
    for (const r of radios) {
      const lbl = (r.closest('label') || r.parentElement)?.textContent || '';
      if (/does not contain/i.test(lbl)) { target = r; break; }
    }
    if (!target) return null;
    const rc = target.getBoundingClientRect();
    return { x: rc.left + rc.width / 2, y: rc.top + rc.height / 2 };
  });
  if (!pt) { console.log('no-radio-yok'); return; }
  await p.mouse.click(pt.x, pt.y);
  await p.waitForTimeout(1000);

  const done = await p.evaluate(() => {
    const bs = [...document.querySelectorAll('button')].find((e) => (e.textContent || '').trim() === 'Done' && !e.disabled);
    if (bs) { bs.click(); return true; }
    return false;
  });
  console.log('No selected, Done:', done);
  await p.waitForTimeout(2500);
})().catch((e) => { console.error('HATA:', e.message.slice(0, 150)); process.exit(1); });
