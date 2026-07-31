const { chromium } = require('playwright-core');
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));

  // satırın (radio'yu içeren tr/row) merkez koordinatı
  const pt = await p.evaluate(() => {
    const r = document.querySelector('input[type=radio]');
    if (!r) return null;
    const row = r.closest('tr') || r.closest('[role=row]') || r.parentElement.parentElement;
    const rc = row.getBoundingClientRect();
    return { x: rc.left + rc.width * 0.4, y: rc.top + rc.height / 2, w: rc.width, h: rc.height };
  });
  if (!pt) { console.log('row-yok'); return; }
  console.log('row pt:', JSON.stringify(pt));
  await p.mouse.click(pt.x, pt.y);
  await p.waitForTimeout(1200);

  let done = await p.evaluate(() => {
    const bs = [...document.querySelectorAll('button')].find((e) => (e.textContent || '').trim() === 'Done');
    return bs ? { disabled: bs.disabled } : null;
  });
  console.log('after row-click, Done:', JSON.stringify(done));

  if (done && !done.disabled) {
    await p.evaluate(() => { [...document.querySelectorAll('button')].find((e) => (e.textContent || '').trim() === 'Done').click(); });
    console.log('Done clicked');
    await p.waitForTimeout(3500);
  }
})().catch((e) => { console.error('HATA:', e.message.slice(0, 150)); process.exit(1); });
