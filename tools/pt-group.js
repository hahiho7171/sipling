const { chromium } = require('playwright-core');
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));
  const inp = await p.$('input[aria-label^="Google Grubu"], input[placeholder^="Google Grubu"]');
  if (!inp) { console.log('input-yok'); return; }
  await inp.click();
  await inp.fill('sipling-water-testers@googlegroups.com');
  await p.waitForTimeout(500);
  await p.keyboard.press('Enter');
  await p.waitForTimeout(1500);
  const val = await inp.inputValue().catch(() => '');
  const bodyHas = await p.evaluate(() => /sipling-water-testers/.test(document.body.innerText));
  const save = await p.evaluate(() => { const s = [...document.querySelectorAll('button')].find((e) => (e.textContent || '').trim() === 'Kaydet'); return s ? s.disabled : null; });
  console.log('inputVal:', val, '| bodyHasGroup:', bodyHas, '| saveDisabled:', save);
})().catch((e) => { console.error('HATA:', e.message.slice(0, 120)); process.exit(1); });
