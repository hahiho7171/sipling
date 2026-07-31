// Genel: bir input'u doldur (selector, value) ve bir butona tıkla (buttonText).
// Kullanım: node tools/asc-fill-click.js "#groupName" "Sipling Pro" "Create"
const { chromium } = require('playwright-core');
(async () => {
  const [, , sel, val, btnText] = process.argv;
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));
  if (sel && sel !== '-') {
    const el = await p.$(sel);
    if (!el) { console.log('input-yok:', sel); return; }
    await el.fill(val);
    await p.waitForTimeout(600);
  }
  if (btnText && btnText !== '-') {
    await p.waitForTimeout(400);
    const clicked = await p.evaluate((t) => {
      const bb = [...document.querySelectorAll('button')].find((e) => (e.textContent || '').trim() === t && !e.disabled);
      if (bb) { bb.click(); return true; }
      return false;
    }, btnText);
    console.log('filled:', val, '| clicked', btnText, ':', clicked);
    await p.waitForTimeout(2500);
  } else {
    console.log('filled:', val);
  }
})().catch((e) => { console.error('HATA:', e.message.slice(0, 150)); process.exit(1); });
