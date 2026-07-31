const { chromium } = require('playwright-core');
const NOTES = `Sipling is a water-tracking app. It works fully without any account or sign-in - all features are available immediately on first launch, so no demo account is needed.

The free version shows non-personalized ads (Google AdMob); the app does not track users and does not use the IDFA. "Sipling Pro" is an auto-renewable monthly subscription (product ID: sipling_pro_monthly) that removes ads and unlocks cosmetic seasonal forest themes. The paywall is reachable from the Settings tab > the "Sipling Pro" banner at the top, and includes a Restore Purchases button, Terms of Use and Privacy Policy links, and an auto-renewal disclosure.

All user data is stored locally on the device; there is no server. HealthKit is not used on iOS.

Thank you for reviewing.`;

(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));

  // 1) Sign-in required checkbox'ı kaldır (koordinatla)
  const cb = await p.evaluate(() => {
    const c = document.getElementById('appStoreReviewDetails_demoAccountRe') || [...document.querySelectorAll('input[type=checkbox]')].find((x) => x.name === 'demoAccountRequired');
    if (!c) return null;
    c.scrollIntoView({ block: 'center' });
    const r = c.getBoundingClientRect();
    return { checked: c.checked, x: r.left + r.width / 2, y: r.top + r.height / 2 };
  });
  if (cb && cb.checked) { await p.mouse.click(cb.x, cb.y); await p.waitForTimeout(700); console.log('signin unchecked'); }

  // 2) iletişim + notlar
  const fields = [
    ['#contactFirstName', 'Asım'],
    ['#contactLastName', 'Gökcek'],
    ['#contactPhone', '+905072407015'],
    ['#contactEmail', 'asim_gokcek@hotmail.com'],
    ['#notes', NOTES],
  ];
  for (const [sel, val] of fields) {
    const el = await p.$(sel);
    if (!el) { console.log('YOK:', sel); continue; }
    await el.scrollIntoViewIfNeeded();
    await el.fill(val);
    await p.waitForTimeout(300);
    console.log('OK:', sel);
  }
  await p.waitForTimeout(500);
  const st = await p.evaluate(() => {
    const c = document.getElementById('appStoreReviewDetails_demoAccountRe') || [...document.querySelectorAll('input[type=checkbox]')].find((x) => x.name === 'demoAccountRequired');
    return { signin: c ? c.checked : null, phone: (document.getElementById('contactPhone') || {}).value };
  });
  console.log('STATE:', JSON.stringify(st));
})().catch((e) => { console.error('HATA:', e.message.slice(0, 120)); process.exit(1); });
