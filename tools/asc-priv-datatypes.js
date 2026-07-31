const { chromium } = require('playwright-core');

const WANT = [/^Device ID/i, /^Product Interaction/i, /^Advertising Data/i, /^Crash Data/i, /^Performance Data/i];

(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));

  for (const rx of WANT) {
    // checkbox'ı bul, görünür alana kaydır, koordinat al
    const pt = await p.evaluate((rxStr) => {
      const rx = new RegExp(rxStr, 'i');
      const cbs = [...document.querySelectorAll('input[type=checkbox]')];
      const cb = cbs.find((c) => rx.test(((c.closest('label') || c.parentElement || {}).textContent || '').trim()));
      if (!cb) return null;
      if (cb.checked) return { checked: true };
      cb.scrollIntoView({ block: 'center' });
      return null;
    }, rx.source);
    if (pt && pt.checked) { console.log('zaten:', rx.source); continue; }
    await p.waitForTimeout(400);
    const coord = await p.evaluate((rxStr) => {
      const rx = new RegExp(rxStr, 'i');
      const cbs = [...document.querySelectorAll('input[type=checkbox]')];
      const cb = cbs.find((c) => rx.test(((c.closest('label') || c.parentElement || {}).textContent || '').trim()));
      if (!cb) return null;
      const rc = cb.getBoundingClientRect();
      return { x: rc.left + rc.width / 2, y: rc.top + rc.height / 2 };
    }, rx.source);
    if (!coord) { console.log('bulunamadı:', rx.source); continue; }
    await p.mouse.click(coord.x, coord.y);
    await p.waitForTimeout(500);
    const chk = await p.evaluate((rxStr) => {
      const rx = new RegExp(rxStr, 'i');
      const cb = [...document.querySelectorAll('input[type=checkbox]')].find((c) => rx.test(((c.closest('label') || c.parentElement || {}).textContent || '').trim()));
      return cb ? cb.checked : null;
    }, rx.source);
    console.log(rx.source, '->', chk);
  }
})().catch((e) => { console.error('HATA:', e.message.slice(0, 150)); process.exit(1); });
