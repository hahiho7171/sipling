const { chromium } = require('playwright-core');
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));

  // BUILD radio'su: name/id UUID olan, releaseType OLMAYAN
  const pt = await p.evaluate(() => {
    const r = [...document.querySelectorAll('input[type=radio]')].find((x) => x.name !== 'releaseType');
    if (!r) return null;
    const rc = r.getBoundingClientRect();
    return { x: rc.left + rc.width / 2, y: rc.top + rc.height / 2 };
  });
  if (!pt) { console.log('build-radio-yok'); return; }
  console.log('build radio pt:', JSON.stringify(pt));
  await p.mouse.click(pt.x, pt.y);
  await p.waitForTimeout(1200);

  const st = await p.evaluate(() => {
    const r = [...document.querySelectorAll('input[type=radio]')].find((x) => x.name !== 'releaseType');
    const done = [...document.querySelectorAll('button')].find((e) => (e.textContent || '').trim() === 'Done');
    return { radioChecked: r ? r.checked : null, doneDisabled: done ? done.disabled : null };
  });
  console.log('state:', JSON.stringify(st));

  if (st.doneDisabled === false) {
    await p.evaluate(() => { [...document.querySelectorAll('button')].find((e) => (e.textContent || '').trim() === 'Done').click(); });
    await p.waitForTimeout(3500);
    const still = await p.evaluate(() => /Add Build/.test(document.body.innerText) && [...document.querySelectorAll('button')].some((e) => (e.textContent || '').trim() === 'Done'));
    console.log('Done clicked, modalStillOpen:', still);
  }
})().catch((e) => { console.error('HATA:', e.message.slice(0, 150)); process.exit(1); });
