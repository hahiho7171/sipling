const { chromium } = require('playwright-core');
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));
  const name = await p.$('input[aria-label="Grup adı"]');
  const email = await p.$('input[aria-label="Grup e-postası ön eki"], input[aria-label="Grup e-postası"]');
  if (!name || !email) { console.log('input-yok', !!name, !!email); return; }
  await name.click(); await name.fill('Sipling Testers');
  await p.waitForTimeout(400);
  await email.click(); await email.fill('sipling-water-testers');
  await p.waitForTimeout(600);
  const st = await p.evaluate(() => {
    const n = document.querySelector('input[aria-label="Grup adı"]');
    const e = document.querySelector('input[aria-label="Grup e-postası ön eki"], input[aria-label="Grup e-postası"]');
    const next = [...document.querySelectorAll('button,a,[role=button]')].find((x) => (x.textContent || '').trim() === 'Sonraki');
    return { name: n ? n.value : '?', email: e ? e.value : '?', nextFound: !!next };
  });
  console.log('STATE:', JSON.stringify(st));
})().catch((e) => { console.error('HATA:', e.message.slice(0, 120)); process.exit(1); });
