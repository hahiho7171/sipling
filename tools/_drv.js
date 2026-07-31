/**
 * Toleranslı Sipling (9360) sürücüsü — AdMob/Play/ASC gibi networkidle olmayan siteler için.
 *   node drv.js goto  <url> [dosya.png]     domcontentloaded ile git + (varsa) foto
 *   node drv.js shot  <dosya.png>           mevcut sayfadan foto
 *   node drv.js url                         mevcut sekmenin URL'i + başlığı
 *   node drv.js eval  "<js>"                sayfada JS çalıştır, sonucu yaz
 *   node drv.js click <x> <y>               koordinata tıkla
 */
const { chromium } = require('playwright-core');
const CDP = 'http://localhost:9360';
const VIEW = { width: 1440, height: 960 };

(async () => {
  const [komut, ...arg] = process.argv.slice(2);
  const browser = await chromium.connectOverCDP(CDP);
  const ctx = browser.contexts()[0];
  const page =
    ctx.pages().find((p) => !p.url().startsWith('devtools://')) ||
    (await ctx.newPage());
  await page.setViewportSize(VIEW).catch(() => {});

  try {
    switch (komut) {
      case 'goto': {
        await page
          .goto(arg[0], { waitUntil: 'domcontentloaded', timeout: 60000 })
          .catch((e) => console.error('goto uyarı:', e.message));
        await page.waitForTimeout(3500);
        if (arg[1]) await page.screenshot({ path: arg[1], fullPage: false });
        console.log('URL:', page.url());
        break;
      }
      case 'shot':
        await page.waitForTimeout(500);
        await page.screenshot({ path: arg[0], fullPage: false });
        console.log('foto:', arg[0], '·', page.url());
        break;
      case 'shotcdp': {
        // Font beklemeden CDP ile görüntü al (Apple portalı gibi takılan sayfalar için).
        await page.waitForTimeout(500);
        const client = await page.context().newCDPSession(page);
        const { data } = await client.send('Page.captureScreenshot', { format: 'png' });
        require('fs').writeFileSync(arg[0], Buffer.from(data, 'base64'));
        console.log('foto(cdp):', arg[0], '·', page.url());
        break;
      }
      case 'url':
        console.log('URL:', page.url());
        console.log('TITLE:', await page.title());
        break;
      case 'tabs': {
        const pages = ctx.pages();
        for (let i = 0; i < pages.length; i++) {
          const pg = pages[i];
          let bl = 0;
          try { bl = (await pg.evaluate(() => (document.body && document.body.innerText || '').length)); } catch (e) {}
          console.log(`[${i}] len=${bl} ${pg.url().slice(0, 80)}`);
        }
        break;
      }
      case 'eval':
        console.log(JSON.stringify(await page.evaluate(arg[0]), null, 1));
        break;
      case 'click':
        await page.mouse.click(Number(arg[0]), Number(arg[1]));
        await page.waitForTimeout(1200);
        console.log('tiklandi:', arg[0], arg[1]);
        break;
      case 'type':
        await page.keyboard.type(arg[0], { delay: 30 });
        await page.waitForTimeout(400);
        console.log('yazildi:', arg[0]);
        break;
      case 'press':
        await page.keyboard.press(arg[0]);
        await page.waitForTimeout(1000);
        console.log('bas:', arg[0]);
        break;
      case 'fill':
        await page.fill(arg[0], arg[1]);
        await page.waitForTimeout(400);
        console.log('dolduruldu:', arg[0]);
        break;
      case 'clickText': {
        const n = await page.evaluate((t) => {
          const els = [...document.querySelectorAll('button,a,span,div,mat-option')];
          const el = els.find((e) => e.textContent.trim() === t || e.textContent.trim().startsWith(t));
          if (el) { el.click(); return true; }
          return false;
        }, arg[0]);
        await page.waitForTimeout(1200);
        console.log('clickText:', arg[0], n);
        break;
      }
      case 'pwrole': {
        // Playwright locator — shadow DOM'u DELER (Play/ASC gibi web-component SPA'lar için).
        const loc = page.getByRole(arg[0], { name: new RegExp(arg[1], 'i') }).first();
        const n = await loc.count();
        if (n > 0) { await loc.click({ timeout: 8000 }); console.log('pwrole tık:', arg[0], arg[1]); }
        else console.log('pwrole bulunamadı:', arg[0], arg[1]);
        await page.waitForTimeout(1500);
        break;
      }
      case 'pwtext': {
        const loc = page.getByText(new RegExp(arg[0], 'i')).first();
        const n = await loc.count();
        if (n > 0) { await loc.click({ timeout: 8000 }); console.log('pwtext tık:', arg[0]); }
        else console.log('pwtext bulunamadı:', arg[0]);
        await page.waitForTimeout(1500);
        break;
      }
      case 'pwfind': {
        // Görünür buton/link metinlerini locator ile çıkar (shadow DOM dahil).
        const roles = ['button', 'link', 'tab'];
        const out = [];
        for (const r of roles) {
          const loc = page.getByRole(r);
          const c = Math.min(await loc.count(), 25);
          for (let i = 0; i < c; i++) {
            const t = (await loc.nth(i).textContent().catch(() => '') || '').trim();
            if (t && t.length < 40) out.push(r + ':' + t);
          }
        }
        console.log(JSON.stringify([...new Set(out)].slice(0, 40), null, 1));
        break;
      }
      default:
        console.log('komut: goto|shot|url|eval|click|type|press|fill|clickText|pwrole|pwtext|pwfind');
    }
  } finally {
    await browser.close(); // sadece CDP bağlantısını keser, pencere açık kalır
  }
})();
