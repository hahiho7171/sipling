const { chromium } = require('playwright-core');
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));
  // "Advertising" sorusunun YES (en sağdaki) radyosu
  const pt = await p.evaluate(() => {
    const rs = [...document.querySelectorAll('input[type=radio]')];
    let group = null;
    for (const r of rs) {
      const lbl = (r.closest('label') || r.parentElement || {}).textContent || '';
      const rowText = (r.closest('div')?.parentElement?.textContent) || lbl;
      if (/Advertising|Paid promotion of products/i.test(rowText)) { group = r.name; break; }
    }
    if (!group) return null;
    const arr = rs.filter((r) => r.name === group).map((r) => { const rc = r.getBoundingClientRect(); return { r, x: rc.left + rc.width / 2, y: rc.top + rc.height / 2 }; }).sort((a, c) => a.x - c.x);
    const yes = arr[arr.length - 1]; // en sağ = YES
    return { x: yes.x, y: yes.y, alreadyYes: yes.r.checked };
  });
  if (!pt) { console.log('ads-soru-yok'); return; }
  await p.mouse.click(pt.x, pt.y);
  await p.waitForTimeout(700);
  const chk = await p.evaluate(() => {
    const rs = [...document.querySelectorAll('input[type=radio]')];
    for (const r of rs) {
      const rowText = (r.closest('div')?.parentElement?.textContent) || '';
      if (/Advertising|Paid promotion/i.test(rowText) && r.checked) {
        const rc = r.getBoundingClientRect(); return rc.left; // konum
      }
    }
    return null;
  });
  console.log('ads YES tıklandı, checkedX:', chk);
})().catch((e) => { console.error('HATA:', e.message.slice(0, 150)); process.exit(1); });
