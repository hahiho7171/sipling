// Sürüm notları textarea'sini <lang>...</lang> sablonunu koruyarak doldurur.
// notlar.json: { "en-US": "...", "tr-TR": "...", ... }
// Kullanim: node tools/_not-yaz.js <notlar.json> [foto.png]
const { chromium } = require("playwright-core");
const fs = require("fs");
(async () => {
  const notlar = JSON.parse(fs.readFileSync(process.argv[2], "utf-8"));
  const foto = process.argv[3];
  const b = await chromium.connectOverCDP("http://localhost:9360");
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith("devtools://"));

  const ta = p.locator("textarea").first();
  const sablon = await ta.inputValue();

  // Her <lang> blogunun icini notlar[lang] ile degistir.
  const yeni = sablon.replace(/<([^>\/]+)>\n([\s\S]*?)\n<\/\1>/g, (m, lang) => {
    const not = notlar[lang];
    return not ? `<${lang}>\n${not}\n</${lang}>` : m;
  });

  // fill() Angular textarea'da input event dispatch eder — value set'ten guvenli.
  await ta.fill(yeni);
  await p.waitForTimeout(1200);

  const sonrasi = await ta.inputValue();
  const dolan = Object.keys(notlar).filter((l) => sonrasi.includes(notlar[l].split("\n")[0]));
  console.log("dolan dil sayisi:", dolan.length, "/", Object.keys(notlar).length);
  const bosKalan = sonrasi.includes("buraya girin veya yapıştırın");
  console.log("hala sablon metni kaldi mi:", bosKalan);
  if (foto) { await p.screenshot({ path: foto }); console.log("foto:", foto); }
})().catch((e) => console.log("HATA:", e.message));
