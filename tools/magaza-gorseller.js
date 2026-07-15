/**
 * Play mağaza ekran görüntülerini TÜM diller için çeker.
 *
 * Diller: tools/diller.json (tek kaynak). Çıktı: store/<play-kodu>/1..5-*.png (1080x1920)
 *
 * Önce:  cd app && flutter build web --release
 *        cd build/web && python -m http.server 8792
 *        bash tools/baslat.sh          # Sipling Chrome'u, port 9360
 * Sonra: node tools/magaza-gorseller.js
 *
 * 🚨 browser.close() ÇAĞIRMA — CDP ile bağlanınca Chrome'un kendisini kapatır.
 * 🚨 page.screenshot() cihaz ölçeğini yok sayıyor (540x960 kaydeder).
 *    Tam 1080x1920 için CDP'nin Page.captureScreenshot'ı + deviceScaleFactor: 2 gerekiyor.
 * 🚨 Tıkladıktan sonra fareyi park et; yoksa sekmenin tooltip balonu görüntüye girer.
 */
const { chromium } = require('playwright-core');
const fs = require('fs');
const path = require('path');

const ROOT = path.resolve(__dirname, '..');
const OUT = path.join(ROOT, 'store');
const SEED = path.join(__dirname, 'seed-veri.js');
const URL = 'http://localhost:8792';
const W = 540, H = 960;                    // CSS piksel; DPR 2 ile 1080x1920

const langs = JSON.parse(fs.readFileSync(path.join(__dirname, 'diller.json'), 'utf8')).diller;
const only = process.argv[2];              // tek dil için: node ... ar

(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const ctx = b.contexts()[0];
  const page = ctx.pages().find((p) => !p.url().startsWith('devtools://'));
  const cdp = await ctx.newCDPSession(page);
  await cdp.send('Emulation.setDeviceMetricsOverride',
    { width: W, height: H, deviceScaleFactor: 2, mobile: false });

  const seed = fs.readFileSync(SEED, 'utf8');
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

  for (const L of langs) {
    if (only && L.arb !== only) continue;
    const dir = path.join(OUT, L.play);

    await page.addInitScript((lg) => {
      Object.defineProperty(navigator, 'language',  { get: () => lg, configurable: true });
      Object.defineProperty(navigator, 'languages', { get: () => [lg], configurable: true });
    }, L.web);

    await page.goto(URL, { waitUntil: 'domcontentloaded' });
    await page.evaluate(seed);
    await page.evaluate(() => {
      localStorage.setItem('flutter.season_theme', JSON.stringify('autumn'));
      localStorage.setItem('flutter.last_summary_date', JSON.stringify('1970-01-01'));
    });
    await page.reload({ waitUntil: 'domcontentloaded' });
    await page.waitForTimeout(5000);

    await shot(path.join(dir, '1-summary.png'));
    await page.mouse.click(W * 0.5, H - 48);      // "Bugüne başla" / "Start today"
    await page.waitForTimeout(1500);
    await park();
    await shot(path.join(dir, '2-today.png'));

    // 🚨 RTL dillerde alt sekmelerin sırası TERSTEN gider.
    const order = L.rtl ? [2, 1, 0] : [1, 2, 3];
    await tab(order[0]); await shot(path.join(dir, '3-forest.png'));
    await tab(order[1]); await shot(path.join(dir, '4-stats.png'));
    await tab(order[2]); await shot(path.join(dir, '5-settings.png'));

    console.log('çekildi:', L.play, L.rtl ? '(RTL)' : '');
  }
  console.log('bitti — store/<dil>/ altına yazıldı');
})().catch((e) => { console.error('HATA:', e.message.slice(0, 180)); process.exit(1); });
