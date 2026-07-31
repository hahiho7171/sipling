// iPad 13" App Store ekran görüntüleri (2048x2732). CSS 1024x1366 @ DPR 2.
const { chromium } = require('playwright-core');
const fs = require('fs');
const path = require('path');
const ROOT = path.resolve(__dirname, '..');
const SEED = fs.readFileSync(path.join(__dirname, 'seed-veri.js'), 'utf8');
const URL = 'http://localhost:8792';
const W = 1024, H = 1366;

(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const ctx = b.contexts()[0];
  const p = ctx.pages().find((x) => !x.url().startsWith('devtools://'));
  const cdp = await ctx.newCDPSession(p);
  await cdp.send('Emulation.setDeviceMetricsOverride', { width: W, height: H, deviceScaleFactor: 2, mobile: false });

  const outDir = path.join(ROOT, 'store', 'ipad-13');
  const shot = async (name) => {
    const { data } = await cdp.send('Page.captureScreenshot', { format: 'png', captureBeyondViewport: false, clip: { x: 0, y: 0, width: W, height: H, scale: 1 } });
    fs.mkdirSync(outDir, { recursive: true });
    fs.writeFileSync(path.join(outDir, name), Buffer.from(data, 'base64'));
  };
  const park = async () => { await p.mouse.move(W / 2, H * 0.35); await p.waitForTimeout(900); };
  const tab = async (i) => { await p.mouse.click(W * (0.125 + i * 0.25), H - 34); await p.waitForTimeout(1500); await park(); };

  await p.addInitScript((lg) => {
    Object.defineProperty(navigator, 'language', { get: () => lg, configurable: true });
    Object.defineProperty(navigator, 'languages', { get: () => [lg], configurable: true });
  }, 'en-US');
  await p.goto(URL, { waitUntil: 'domcontentloaded' });
  await p.evaluate(SEED);
  await p.evaluate(() => {
    localStorage.setItem('flutter.season_theme', JSON.stringify('autumn'));
    localStorage.setItem('flutter.last_summary_date', JSON.stringify('1970-01-01'));
  });
  await p.reload({ waitUntil: 'domcontentloaded' });
  await p.waitForTimeout(5000);

  await shot('1-summary.png');
  await p.mouse.click(W * 0.5, H - 48); await p.waitForTimeout(1500); await park();
  await shot('2-today.png');
  await tab(1); await shot('3-forest.png');
  await tab(2); await shot('4-stats.png');
  await tab(3); await shot('5-settings.png');

  await cdp.send('Emulation.clearDeviceMetricsOverride');
  console.log('iPad bitti —', outDir, `(${W * 2}x${H * 2})`);
})().catch((e) => { console.error('HATA:', e.message.slice(0, 150)); process.exit(1); });
