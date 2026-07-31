const { chromium } = require('playwright-core');

const NOTES = `Sipling is a water-tracking app. It works fully without any account or sign-in - all features are available immediately on first launch, so no demo account is needed.

The free version shows ads (Google AdMob). "Sipling Pro" is an auto-renewable monthly subscription (product ID: sipling_pro_monthly) that removes ads and unlocks cosmetic seasonal forest themes. The paywall is reachable from the Settings tab > "Sipling Pro" and includes a Restore Purchases button, Terms of Use and Privacy Policy links, and an auto-renewal disclosure.

All user data is stored locally on the device; there is no server and no login. HealthKit is not used on iOS.

Thank you for reviewing.`;

const fields = [
  ['#contactFirstName', 'Asım'],
  ['#contactLastName', 'Gökcek'],
  ['#contactEmail', 'asim_gokcek@hotmail.com'],
  ['#notes', NOTES],
];

(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));
  for (const [sel, val] of fields) {
    const el = await p.$(sel);
    if (!el) { console.log('YOK:', sel); continue; }
    await el.scrollIntoViewIfNeeded();
    await el.fill(val);
    await p.waitForTimeout(400);
    console.log('OK:', sel);
  }
  await p.waitForTimeout(500);
})().catch((e) => { console.error('HATA:', e.message.slice(0, 150)); process.exit(1); });
