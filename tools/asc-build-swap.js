const { chromium } = require('playwright-core');
(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));
  // hover row then click Delete
  await p.mouse.move(900, 301);
  await p.waitForTimeout(600);
  await p.mouse.move(1189, 301);
  await p.waitForTimeout(600);
  await p.mouse.click(1189, 301);
  await p.waitForTimeout(2500);
  // onay diyaloğu olabilir
  const step1 = await p.evaluate(() => {
    const conf = [...document.querySelectorAll('button')].find((e) => /^(Remove|Delete|Confirm|Yes)$/.test((e.textContent || '').trim()) && !e.disabled);
    if (conf) { conf.click(); return 'confirmed:' + conf.textContent.trim(); }
    return 'no-confirm';
  });
  console.log('delete:', step1);
  await p.waitForTimeout(3000);
  // Add Build göründü mü
  const st = await p.evaluate(() => {
    const addBtn = [...document.querySelectorAll('button,a')].find((e) => /Add Build|Choose|Select.*Build/i.test((e.textContent || '').trim()));
    return { hasAddBuild: !!addBtn, addText: addBtn ? addBtn.textContent.trim() : null, still100: /1\.0\.0/.test(document.body.innerText) };
  });
  console.log('state:', JSON.stringify(st));
})().catch((e) => { console.error('HATA:', e.message.slice(0, 120)); process.exit(1); });
