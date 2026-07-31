const { chromium } = require('playwright-core');
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));
  const inputs = await p.$$('input[type=file]');
  console.log('file inputs:', inputs.length);
  if (inputs.length < 2) { console.log('review-input-yok'); return; }
  // idx 1 = Review Screenshot
  await inputs[1].setInputFiles('C:/Users/asim_/Desktop/CloudWork/Sipling/store/ios-65/paywall.png', { timeout: 120000 });
  console.log('review ss set');
  await p.waitForTimeout(8000);
  // review notes doldur
  const rn = await p.$('#iap-or-subscription-review-notes');
  if (rn) {
    await rn.fill('Sipling Pro is an auto-renewable monthly subscription that removes ads and unlocks cosmetic seasonal forest themes and extra tree species. It is reachable from the Settings tab > the "Sipling Pro" banner at the top. The paywall includes Restore Purchases, an auto-renewal disclosure, and Terms of Use / Privacy Policy links. The app works fully without the subscription; no account or sign-in is required.');
    await p.waitForTimeout(500);
    console.log('review notes filled');
  }
  console.log('done');
})().catch((e) => { console.error('HATA:', e.message.slice(0, 150)); process.exit(1); });
