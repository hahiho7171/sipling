const { chromium } = require('playwright-core');
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));

  // radio'nun (ya da onun görünür label/row'unun) merkez koordinatını al
  const pt = await p.evaluate(() => {
    const r = document.querySelector('input[type=radio]');
    if (!r) return null;
    // görünür tıklama hedefi: radio'yu saran label ya da en yakın row
    let target = r;
    const rect0 = r.getBoundingClientRect();
    if (rect0.width < 3 || rect0.height < 3) {
      target = r.closest('label') || r.parentElement;
    }
    const rc = target.getBoundingClientRect();
    return { x: rc.left + Math.min(20, rc.width / 2), y: rc.top + rc.height / 2 };
  });
  if (!pt) { console.log('radio-yok'); return; }
  console.log('tıklama noktası:', JSON.stringify(pt));
  await p.mouse.click(pt.x, pt.y);
  await p.waitForTimeout(1000);
  const checked = await p.evaluate(() => (document.querySelector('input[type=radio]') || {}).checked);
  console.log('checked:', checked);

  const done = await p.evaluate(() => {
    const bs = [...document.querySelectorAll('button')].find((e) => (e.textContent || '').trim() === 'Done' && !e.disabled);
    if (bs) { bs.click(); return true; }
    return false;
  });
  console.log('Done clicked:', done);
  await p.waitForTimeout(3500);
})().catch((e) => { console.error('HATA:', e.message.slice(0, 150)); process.exit(1); });
