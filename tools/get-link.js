const { chromium } = require('playwright-core');
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const ctx = b.contexts()[0];
  const p = ctx.pages().find((x) => !x.url().startsWith('devtools://'));
  // clipboard.writeText'i yakalamak için hook
  await p.evaluate(() => {
    window.__caught = [];
    const orig = navigator.clipboard.writeText.bind(navigator.clipboard);
    navigator.clipboard.writeText = (t) => { window.__caught.push(t); return orig(t).catch(() => {}); };
  });
  // "Bağlantıyı kopyala" içeren tüm butonları bul (includes)
  const btns = await p.$$('button, [role=button], a');
  let clicked = 0;
  for (const el of btns) {
    const t = ((await el.textContent()) || '').replace(/\s+/g, ' ').trim();
    if (t.includes('Bağlantıyı kopyala')) {
      await el.scrollIntoViewIfNeeded();
      await el.click();
      await p.waitForTimeout(500);
      clicked++;
    }
  }
  const caught = await p.evaluate(() => window.__caught || []);
  console.log('CLICKED:' + clicked + ' LINKS:' + JSON.stringify(caught));
})().catch((e) => { console.error('HATA:', e.message.slice(0, 150)); process.exit(1); });
