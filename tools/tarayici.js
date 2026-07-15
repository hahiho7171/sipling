/**
 * Sipling'e ÖZEL tarayıcı sürücüsü.
 *
 * 🚨 Bu proje 9334 portunu KULLANMAZ. O port Randevio'ya ait ve orada
 * Play Console oturumu açık; başka proje o tarayıcıda sekme açmamalı.
 * Sipling = CDP portu 9360, profil C:\Users\asim_\sipling-profile
 *
 * Kullanım:
 *   node tarayici.js ac <url>                     sayfayı aç
 *   node tarayici.js foto <url> <dosya.png> [g h] ekran görüntüsü al
 *   node tarayici.js tikla <x> <y>                mevcut sayfada tıkla
 *   node tarayici.js js "<ifade>"                 sayfada JS çalıştır
 */
const { chromium } = require('playwright-core');

const CDP = 'http://localhost:9360';
const PHONE = { width: 390, height: 844 };

async function baglan() {
  const browser = await chromium.connectOverCDP(CDP).catch(() => {
    console.error(
      'Sipling tarayıcısı kapalı. Önce çalıştır:\n' +
        '  bash Sipling/tools/baslat.sh'
    );
    process.exit(1);
  });
  const ctx = browser.contexts()[0];
  const page = ctx.pages().find((p) => !p.url().startsWith('devtools://')) || (await ctx.newPage());
  return { browser, page };
}

(async () => {
  const [komut, ...arg] = process.argv.slice(2);
  const { browser, page } = await baglan();

  switch (komut) {
    case 'ac':
      await page.goto(arg[0], { waitUntil: 'networkidle' });
      await page.setViewportSize(PHONE);
      console.log('acildi:', page.url());
      break;

    case 'foto': {
      const [url, dosya, g, h] = arg;
      if (url && url !== '-') await page.goto(url, { waitUntil: 'networkidle' });
      await page.setViewportSize({
        width: Number(g) || PHONE.width,
        height: Number(h) || PHONE.height,
      });
      // Flutter web ilk boyamayı canvas'a yapar; ölçü değişiminden sonra yerleşsin.
      await page.waitForTimeout(2500);
      await page.screenshot({ path: dosya });
      console.log('foto:', dosya);
      break;
    }

    case 'tikla':
      await page.mouse.click(Number(arg[0]), Number(arg[1]));
      await page.waitForTimeout(800);
      console.log('tiklandi:', arg[0], arg[1]);
      break;

    case 'js':
      console.log(JSON.stringify(await page.evaluate(arg[0]), null, 1));
      break;

    default:
      console.log('komutlar: ac | foto | tikla | js');
  }

  // Tarayıcıyı KAPATMA — bağlantıyı kes, pencere açık kalsın.
  await browser.close();
})();
