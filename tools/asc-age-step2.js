// Modal içini kaydırarak HER soruya NO işaretler (görünür alandaki radyolara mouse ile tıklar), sonra Next.
const { chromium } = require('playwright-core');
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));

  // modal scroll container'ı bul
  const findScroller = () => p.evaluate(() => {
    const rs = document.querySelector('input[type=radio]');
    if (!rs) return false;
    let el = rs.parentElement;
    while (el && el !== document.body) {
      if (el.scrollHeight > el.clientHeight + 20 && getComputedStyle(el).overflowY !== 'visible') return true;
      el = el.parentElement;
    }
    return false;
  });

  for (let pass = 0; pass < 12; pass++) {
    // görünür alandaki, henüz seçili olmayan NO radyolarını tıkla
    const clicks = await p.evaluate(() => {
      const rs = [...document.querySelectorAll('input[type=radio]')];
      const byName = {};
      rs.forEach((r) => {
        const rc = r.getBoundingClientRect();
        if (rc.width === 0 && rc.height === 0) return;
        (byName[r.name] = byName[r.name] || []).push({ r, x: rc.left + rc.width / 2, y: rc.top + rc.height / 2 });
      });
      const pts = [];
      for (const name in byName) {
        const arr = byName[name].sort((a, c) => a.x - c.x);
        const anyChecked = byName[name].some((o) => o.r.checked);
        const no = arr[0];
        // sadece modal görünür alanında (y 240..760) ve seçili değilse
        if (!anyChecked && no.y > 240 && no.y < 758) pts.push({ x: no.x, y: no.y });
      }
      return pts;
    });
    for (const pt of clicks) { await p.mouse.click(pt.x, pt.y); await p.waitForTimeout(150); }

    const st = await p.evaluate(() => {
      const nx = [...document.querySelectorAll('button')].find((e) => /^(Next|Done|Submit|Confirm)$/.test((e.textContent || '').trim()));
      return { nextDisabled: nx ? nx.disabled : null };
    });
    if (st.nextDisabled === false) { console.log('tüm sorular yanıtlandı, pass', pass); break; }

    // modal içini aşağı kaydır
    await p.evaluate(() => {
      const rs = document.querySelector('input[type=radio]');
      let el = rs && rs.parentElement;
      while (el && el !== document.body) {
        if (el.scrollHeight > el.clientHeight + 20 && getComputedStyle(el).overflowY !== 'visible') { el.scrollTop += 320; return; }
        el = el.parentElement;
      }
      window.scrollBy(0, 320);
    });
    await p.waitForTimeout(500);
  }

  const fin = await p.evaluate(() => {
    const nx = [...document.querySelectorAll('button')].find((e) => /^(Next|Done|Submit|Confirm)$/.test((e.textContent || '').trim()));
    return { nextText: nx ? (nx.textContent || '').trim() : null, nextDisabled: nx ? nx.disabled : null };
  });
  console.log('SON:', JSON.stringify(fin));
})().catch((e) => { console.error('HATA:', e.message.slice(0, 150)); process.exit(1); });
