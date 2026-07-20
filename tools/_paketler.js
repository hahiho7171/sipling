// Play Console "En yeni sürümler ve paketler" sayfasindan kullanilmis
// versionCode'lari okur. Yuklemeden ONCE bak — yanmis kod tekrar kullanilamaz.
// Kullanim: node tools/_paketler.js [foto.png]
const { chromium } = require("playwright-core");
(async () => {
  const b = await chromium.connectOverCDP("http://localhost:9360");
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith("devtools://"));
  await p.goto(
    "https://play.google.com/console/u/0/developers/7286802637861068803/app/4974431994893643882/bundle-explorer",
    { waitUntil: "domcontentloaded", timeout: 60000 }
  );
  await p.waitForTimeout(9000);
  const metin = await p.evaluate(() => document.body.innerText.slice(0, 2500));
  console.log(metin);
  if (process.argv[2]) await p.screenshot({ path: process.argv[2] });
})().catch((e) => console.log("HATA:", e.message));
