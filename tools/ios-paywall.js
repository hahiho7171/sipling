// Pro paywall (pro_screen) ekran görüntüsü — iPhone 6.5" (1242x2688). Abonelik inceleme görseli için.
const { chromium } = require('playwright-core');
const fs = require('fs');
const path = require('path');
const ROOT = path.resolve(__dirname, '..');
const SEED = fs.readFileSync(path.join(__dirname, 'seed-veri.js'), 'utf8');
const URL = 'http://localhost:8792';
const W = 414, H = 896;

(async () => {
  const b = await chromium.connectOverCDP('http://localhost:9360');
  const ctx = b.contexts()[0];
  const p = ctx.pages().find((x) => !x.url().startsWith('devtools://'));
  const cdp = await ctx.newCDPSession(p);
  await cdp.send('Emulation.setDeviceMetricsOverride', { width: W, height: H, deviceScaleFactor: 3, mobile: false });

  await p.addInitScript((lg) => {
    Object.defineProperty(navigator, 'language', { get: () => lg, configurable: true });
    Object.defineProperty(navigator, 'languages', { get: () => [lg], configurable: true });
  }, 'en-US');
  await p.goto(URL, { waitUntil: 'domcontentloaded' });
  await p.evaluate(SEED);
  await p.evaluate(() => localStorage.setItem('flutter.pro', 'false')); // paywall görünsün diye NON-Pro
  await p.reload({ waitUntil: 'domcontentloaded' });
  await p.waitForTimeout(6000);

  // özet modalı varsa kapat (Start today)
  await p.mouse.click(W * 0.5, H - 48);
  await p.waitForTimeout(1200);
  // Settings sekmesi (4. sekme, sağ)
  await p.mouse.click(W * 0.875, H - 34);
  await p.waitForTimeout(1800);
  // Pro banner (Settings appbar altındaki ilk kutu, üstte)
  await p.mouse.click(W * 0.5, 85);
  await p.waitForTimeout(2200);
  await p.mouse.move(W / 2, H * 0.5);
  await p.waitForTimeout(800);

  const out = path.join(ROOT, 'store', 'ios-65', 'paywall.png');
  const { data } = await cdp.send('Page.captureScreenshot', { format: 'png', captureBeyondViewport: false, clip: { x: 0, y: 0, width: W, height: H, scale: 1 } });
  fs.writeFileSync(out, Buffer.from(data, 'base64'));
  await cdp.send('Emulation.clearDeviceMetricsOverride');
  console.log('paywall yazıldı:', out);
})().catch((e) => { console.error('HATA:', e.message.slice(0, 150)); process.exit(1); });
