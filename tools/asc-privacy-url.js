const { chromium } = require('playwright-core');
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));
  const el = await p.$('#privacyPolicyUrl');
  if (!el) { console.log('url-input-yok'); return; }
  await el.fill('https://sipling-app.web.app/gizlilik');
  await p.waitForTimeout(500);
  // Save butonu (varsa)
  const saved = await p.evaluate(() => {
    const b2 = [...document.querySelectorAll('button')].find((e) => (e.textContent || '').trim() === 'Save' && !e.disabled);
    if (b2) { b2.click(); return true; }
    return false;
  });
  await p.waitForTimeout(2500);
  const val = await p.evaluate(() => { const e = document.getElementById('privacyPolicyUrl'); return e ? e.value : (document.body.innerText.includes('gizlilik') ? 'metinde-var' : 'yok'); });
  console.log('privacy url:', val, '| saveClicked:', saved);
})().catch((e) => { console.error('HATA:', e.message.slice(0, 150)); process.exit(1); });
