// Yaş anketinde bulunduğun adımdaki HER soruya "NO" (en soldaki radio) işaretler, sonra Next'e basar.
const { chromium } = require('playwright-core');
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));

  // radio gruplarını (name) topla; her grupta en soldaki = NO
  const groups = await p.evaluate(() => {
    const rs = [...document.querySelectorAll('input[type=radio]')].filter((r) => r.offsetParent !== null || r.getClientRects().length);
    const byName = {};
    rs.forEach((r) => {
      const rc = r.getBoundingClientRect();
      if (rc.width === 0 && rc.height === 0 && rc.x === 0) return;
      (byName[r.name] = byName[r.name] || []).push({ x: rc.left + rc.width / 2, y: rc.top + rc.height / 2, checked: r.checked });
    });
    // her grup için en küçük x (NO)
    return Object.entries(byName).map(([name, arr]) => {
      arr.sort((a, c) => a.x - c.x);
      return { name, no: arr[0], count: arr.length, anyChecked: arr.some((a) => a.checked) };
    });
  });
  console.log('grup sayısı:', groups.length);
  for (const g of groups) {
    if (!g.no) continue;
    await p.mouse.click(g.no.x, g.no.y);
    await p.waitForTimeout(180);
  }
  await p.waitForTimeout(600);

  const st = await p.evaluate(() => {
    const nx = [...document.querySelectorAll('button')].find((e) => /^(Next|Done|Submit|Confirm)$/.test((e.textContent || '').trim()));
    return { nextText: nx ? (nx.textContent || '').trim() : null, nextDisabled: nx ? nx.disabled : null };
  });
  console.log('Next durum:', JSON.stringify(st));
})().catch((e) => { console.error('HATA:', e.message.slice(0, 150)); process.exit(1); });
