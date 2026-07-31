/**
 * iOS App Store ekran görüntüleri — iPhone 6.5" (1242x2688) ve 6.9" (1290x2796).
 * Play scriptinin (magaza-gorseller.js) iOS boyutuna uyarlanmış hali.
 *
 * Önce:  app/build/web hazır + `python -m http.server 8792` (build/web içinde) + Sipling Chrome 9360.
 * Çalıştır: node tools/ios-gorseller.js 65     # 6.5"  → store/ios-65/
 *           node tools/ios-gorseller.js 69     # 6.9"  → store/ios-69/
 *
 * 🚨 browser.close() ÇAĞIRMA. 🚨 Bitince Emulation.clearDeviceMetricsOverride ile eski hale döndürür.
 */
const { chromium } = require('playwright-core');
const fs = require('fs');
const path = require('path');

const ROOT = path.resolve(__dirname, '..');
const OUT = path.join(ROOT, 'store');
const SEED = path.join(__dirname, 'seed-veri.js');
// 🪤 8792 PROJELER ARASI ORTAK — başka bir projenin web build'i orada açıksa
// sessizce YANLIŞ UYGULAMANIN ekran görüntüsünü çekersin (2026-07-27'de "Akış — Odak" çıktı).
// Port'u SIPLING_WEB_PORT ile ver ve <title>sipling</title> olduğunu DOĞRULA.
const PORT = process.env.SIPLING_WEB_PORT || '8792';
const URL = `http://localhost:${PORT}`;

// CSS px @ DPR 3 → hedef piksel
const SIZES = {
  65: { W: 414, H: 896, dir: 'ios-65' },   // 1242 x 2688  (6.5")
  69: { W: 430, H: 932, dir: 'ios-69' },   // 1290 x 2796  (6.9")
};
const pick = SIZES[process.argv[2] || '65'];
if (!pick) { console.error('boyut 65 veya 69 olmalı'); process.exit(1); }
// 2. argüman: uygulama dili (navigator.language taklit edilir). Yoksa en-US, klasör değişmez.
//   node tools/ios-gorseller.js 65 tr-TR   → store/ios-65-tr-TR/
const LANG = process.argv[3] || 'en-US';
const { W, H } = pick;
const dir = process.argv[3] ? `${pick.dir}-${LANG}` : pick.dir;

(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const ctx = b.contexts()[0];
  const page = ctx.pages().find((p) => !p.url().startsWith('devtools://'));
  const cdp = await ctx.newCDPSession(page);
  await cdp.send('Emulation.setDeviceMetricsOverride',
    { width: W, height: H, deviceScaleFactor: 3, mobile: false });

  const seed = fs.readFileSync(SEED, 'utf8');
  const outDir = path.join(OUT, dir);
  const shot = async (file) => {
    const { data } = await cdp.send('Page.captureScreenshot', {
      format: 'png', captureBeyondViewport: false,
      clip: { x: 0, y: 0, width: W, height: H, scale: 1 },
    });
    fs.mkdirSync(path.dirname(file), { recursive: true });
    fs.writeFileSync(file, Buffer.from(data, 'base64'));
  };
  const park = async () => { await page.mouse.move(W / 2, H * 0.35); await page.waitForTimeout(900); };
  const tab = async (i) => {
    await page.mouse.click(W * (0.125 + i * 0.25), H - 34);
    await page.waitForTimeout(1500);
    await park();
  };

  await page.addInitScript((lg) => {
    Object.defineProperty(navigator, 'language',  { get: () => lg, configurable: true });
    Object.defineProperty(navigator, 'languages', { get: () => [lg], configurable: true });
  }, LANG);

  await page.goto(URL, { waitUntil: 'domcontentloaded' });
  // 🚨 Yanlış uygulamayı çekmemek için başlığı doğrula (yukarıdaki 8792 tuzağı).
  const baslik = await page.title();
  if (!/sipling/i.test(baslik)) {
    throw new Error(`${URL} Sipling DEĞİL — sayfa başlığı "${baslik}". Doğru portu SIPLING_WEB_PORT ile ver.`);
  }
  await page.evaluate(seed);
  await page.evaluate(() => {
    localStorage.setItem('flutter.season_theme', JSON.stringify('autumn'));
    localStorage.setItem('flutter.last_summary_date', JSON.stringify('1970-01-01'));
  });
  await page.reload({ waitUntil: 'domcontentloaded' });
  await page.waitForTimeout(5000);

  await shot(path.join(outDir, '1-summary.png'));
  await page.mouse.click(W * 0.5, H - 48);       // "Start today"
  await page.waitForTimeout(1500);
  await park();
  await shot(path.join(outDir, '2-today.png'));

  await tab(1); await shot(path.join(outDir, '3-forest.png'));
  await tab(2); await shot(path.join(outDir, '4-stats.png'));
  await tab(3); await shot(path.join(outDir, '5-settings.png'));

  await cdp.send('Emulation.clearDeviceMetricsOverride');
  console.log('bitti —', outDir, `(${W * 3}x${H * 3})`);
})().catch((e) => { console.error('HATA:', e.message.slice(0, 200)); process.exit(1); });
