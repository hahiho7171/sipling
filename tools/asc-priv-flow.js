// Bir veri türünün tüm gizlilik akışını tamamlar.
// Kullanım: node tools/asc-priv-flow.js "Set Up Product Interaction" "Third-Party Advertising|Analytics"
const { chromium } = require('playwright-core');

const setupText = process.argv[2];
const purposeRx = new RegExp('^(' + process.argv[3] + ')', 'i');

const sleep = (p, ms) => p.waitForTimeout(ms);

async function clickCoord(p, x, y) { await p.mouse.click(x, y); }

(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith('devtools://'));

  // 1) "Set Up X" linkine tıkla (koordinatla)
  const setupPt = await p.evaluate((txt) => {
    const el = [...document.querySelectorAll('a,button,span,div')].find((e) => (e.textContent || '').trim() === txt && e.offsetParent !== null);
    if (!el) return null;
    el.scrollIntoView({ block: 'center' });
    const rc = el.getBoundingClientRect();
    return { x: rc.left + rc.width / 2, y: rc.top + rc.height / 2 };
  }, setupText);
  if (!setupPt) { console.log('SETUP-YOK:', setupText); return; }
  await clickCoord(p, setupPt.x, setupPt.y);
  await sleep(p, 2500);

  // 2) durum makinesi
  for (let step = 0; step < 10; step++) {
    const state = await p.evaluate((purposeRxStr) => {
      const purposeRx = new RegExp('^(' + purposeRxStr + ')', 'i');
      const txt = document.body.innerText;
      const cbs = [...document.querySelectorAll('input[type=checkbox]')];
      const radios = [...document.querySelectorAll('input[type=radio]')];
      const lblOf = (el) => ((el.closest('label') || el.parentElement || {}).textContent || '').trim();

      // amaç ekranı: Third-Party Advertising checkbox var mı
      const purposeCbs = cbs.filter((c) => /Third-Party Advertising|App Functionality|Analytics|Product Personalization/i.test(lblOf(c)));
      // hedef amaç checkbox'ları (henüz seçili değil)
      const toCheck = purposeCbs.filter((c) => purposeRx.test(lblOf(c)) && !c.checked).map((c) => { const r = c.getBoundingClientRect(); return { x: r.left + r.width / 2, y: r.top + r.height / 2 }; });

      // "No, ... not linked" radio
      const noLink = radios.find((r) => /not linked/i.test(lblOf(r)));
      const noLinkChecked = noLink ? noLink.checked : null;
      const noLinkPt = noLink ? (() => { const r = noLink.getBoundingClientRect(); return { x: r.left + r.width / 2, y: r.top + r.height / 2 }; })() : null;

      // "No, we do not use ... for tracking" radio
      const noTrack = radios.find((r) => /do not use .*tracking|not use .*for tracking/i.test(lblOf(r)));
      const noTrackChecked = noTrack ? noTrack.checked : null;
      const noTrackPt = noTrack ? (() => { const r = noTrack.getBoundingClientRect(); return { x: r.left + r.width / 2, y: r.top + r.height / 2 }; })() : null;

      const saveBtn = [...document.querySelectorAll('button')].find((e) => (e.textContent || '').trim() === 'Save');
      const nextBtn = [...document.querySelectorAll('button')].find((e) => (e.textContent || '').trim() === 'Next');
      const dialogOpen = purposeCbs.length > 0 || !!noLink || !!noTrack || /Let's define|put tracking into context|Indicate how/i.test(txt);

      return {
        toCheck, noLinkPt, noLinkChecked, noTrackPt, noTrackChecked,
        save: saveBtn ? { disabled: saveBtn.disabled } : null,
        next: nextBtn ? { disabled: nextBtn.disabled } : null,
        dialogOpen,
        purposeCount: purposeCbs.length,
      };
    }, process.argv[3]);

    if (!state.dialogOpen && !state.save && !state.next) { console.log('BITTI-dialog-kapandi step', step); break; }

    let acted = false;
    // amaçları işaretle
    for (const c of state.toCheck) { await clickCoord(p, c.x, c.y); await sleep(p, 300); acted = true; }
    // bağlı değil = No
    if (state.noLinkPt && state.noLinkChecked === false) { await clickCoord(p, state.noLinkPt.x, state.noLinkPt.y); await sleep(p, 300); acted = true; }
    // izleme = No
    if (state.noTrackPt && state.noTrackChecked === false) { await clickCoord(p, state.noTrackPt.x, state.noTrackPt.y); await sleep(p, 300); acted = true; }
    await sleep(p, 300);

    // Save > Next
    const clicked = await p.evaluate(() => {
      const save = [...document.querySelectorAll('button')].find((e) => (e.textContent || '').trim() === 'Save' && !e.disabled);
      if (save) { save.click(); return 'save'; }
      const next = [...document.querySelectorAll('button')].find((e) => (e.textContent || '').trim() === 'Next' && !e.disabled);
      if (next) { next.click(); return 'next'; }
      return 'none';
    });
    console.log('step', step, '| checked', state.toCheck.length, '| noLink', state.noLinkChecked, '| noTrack', state.noTrackChecked, '| ->', clicked);
    if (clicked === 'save') { await sleep(p, 2500); console.log('SAVE-yapildi'); break; }
    if (clicked === 'none' && !acted) { console.log('takildi step', step); break; }
    await sleep(p, 1800);
  }
})().catch((e) => { console.error('HATA:', e.message.slice(0, 200)); process.exit(1); });
