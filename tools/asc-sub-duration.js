const { chromium } = require('playwright-core');
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));
  await p.selectOption('#subscriptionPeriod', 'ONE_MONTH');
  await p.waitForTimeout(700);
  const state = await p.evaluate(() => {
    const s = document.getElementById('subscriptionPeriod');
    const create = [...document.querySelectorAll('button')].find((e) => (e.textContent || '').trim() === 'Create');
    return { period: s ? s.value : null, createDisabled: create ? create.disabled : null };
  });
  console.log('period:', state.period, '| createDisabled:', state.createDisabled);
  if (state.createDisabled === false) {
    await p.evaluate(() => { [...document.querySelectorAll('button')].find((e) => (e.textContent || '').trim() === 'Create' && !e.disabled).click(); });
    await p.waitForTimeout(3500);
    console.log('created, url:', p.url());
  }
})().catch((e) => { console.error('HATA:', e.message.slice(0, 120)); process.exit(1); });
