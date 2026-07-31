const { chromium } = require('playwright-core');
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));
  const radio = await p.$('input[type=radio]');
  if (!radio) { console.log('radio-yok'); return; }
  await radio.click({ force: true });
  await p.waitForTimeout(800);
  const checked = await radio.isChecked();
  console.log('radio checked:', checked);
  // Done
  const done = await p.$('button:has-text("Done")');
  if (done) {
    await done.click();
    console.log('Done clicked');
  }
  await p.waitForTimeout(3000);
})().catch((e) => { console.error('HATA:', e.message.slice(0, 150)); process.exit(1); });
