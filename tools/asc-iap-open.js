const { chromium } = require('playwright-core');
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));
  // metni içeren kutuyu bul, Playwright ile force click
  const loc = p.getByText('Select the in-app purchases or subscriptions', { exact: false });
  const n = await loc.count();
  console.log('matches:', n);
  if (n > 0) {
    await loc.first().scrollIntoViewIfNeeded();
    await loc.first().click({ force: true });
    await p.waitForTimeout(3000);
  }
  const st = await p.evaluate(() => {
    const t = document.body.innerText;
    const rows = [...document.querySelectorAll('input[type=checkbox], tr')].map((e) => (e.textContent || '').replace(/\s+/g, ' ').trim()).filter((x) => /Sipling Pro Monthly|sipling_pro_monthly/.test(x));
    return { modal: /Add In-App Purchases|Select in-app purchases to add|Choose in-app/i.test(t), subRows: rows.slice(0, 3) };
  });
  console.log('after click:', JSON.stringify(st));
})().catch((e) => { console.error('HATA:', e.message.slice(0, 150)); process.exit(1); });
