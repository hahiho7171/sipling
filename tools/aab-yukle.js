// AAB'yi Play Console'a yukler — 50 MB Playwright sinirini ASAR.
//
// 🚨 NEDEN AYRI ARAC: Playwright'in setInputFiles'i dosyayi tarayiciya AKTARIR
// ve connectOverCDP'de 50 MiB ustunu reddeder:
//   "Cannot transfer files larger than 50Mb to a browser not co-located..."
// Sipling'in AAB'si 50,1 MB → siniri asiyor.
//
// COZUM: "Yukle" butonuna GERCEKTEN tiklariz, acilan dosya secici penceresini
// CDP'de yakalariz (Page.setInterceptFileChooserDialog) ve DOM.setFileInputFiles
// ile sadece DOSYA YOLUNU veririz. Tarayici dosyayi kendisi diskten okur.
//
// Yukledikten sonra AYNI betikte durumu DOM'dan okur (input.files + hata metni),
// baska betik acip baglanti koparma riski olmasin. Ekran goruntusune GUVENME —
// Play kutuyu bos gosterirken dosya yuklenmis/hata olmus olabilir.
//
// Kullanim: node tools/aab-yukle.js <aab-yolu> [bekleme-ms] [foto.png]
// 🚨 browser.close() CAGIRILMIYOR.

const { chromium } = require("playwright-core");

(async () => {
  const aab = process.argv[2];
  const bekle = Number(process.argv[3] || 150000);
  const foto = process.argv[4];
  if (!aab) { console.log("kullanim: node tools/aab-yukle.js <aab> [ms] [foto]"); process.exit(1); }

  const b = await chromium.connectOverCDP("http://localhost:9360");
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith("devtools://"));
  if (!p) { console.log("sayfa-yok"); return; }
  console.log("sayfa:", p.url());

  const cdp = await p.context().newCDPSession(p);
  await cdp.send("Page.enable");
  await cdp.send("DOM.enable");
  await cdp.send("Page.setInterceptFileChooserDialog", { enabled: true });

  const secici = new Promise((res, rej) => {
    cdp.once("Page.fileChooserOpened", res);
    setTimeout(() => rej(new Error("dosya secici acilmadi (15 sn)")), 15000);
  });

  await p.getByText("Yükle", { exact: true }).first().click();
  console.log("'Yukle' tiklandi, secici bekleniyor...");
  const ev = await secici;
  console.log("secici yakalandi, backendNodeId =", ev.backendNodeId);

  await cdp.send("DOM.setFileInputFiles", { files: [aab], backendNodeId: ev.backendNodeId });
  console.log("dosya yolu verildi, Play isliyor... (" + bekle + " ms)");

  await p.waitForTimeout(bekle);

  // AYNI baglantida durumu oku — ekran goruntusune degil BUNA guven.
  const durum = await p.evaluate(() => {
    const inp = [...document.querySelectorAll('input[type=file]')].map((i) => ({
      accept: i.accept, dosya: i.files ? i.files.length : -1,
      ad: i.files && i.files[0] ? i.files[0].name : null,
    }));
    const hata = [];
    document.querySelectorAll('[role=alert],[class*="rror"]').forEach((e) => {
      const t = (e.innerText || "").trim();
      if (t && t.length > 3) hata.push(t.slice(0, 160));
    });
    // "1.0.1", "50 MB", "sürüm kodu 3" gibi paket satirlarini da yakala
    const govde = document.body.innerText;
    const paket = (govde.match(/[^\n]*(sürüm kodu|1\.0\.1|Ekle|indirilebilir)[^\n]*/gi) || [])
      .slice(0, 8);
    return { inp, hata: [...new Set(hata)], paket: [...new Set(paket)] };
  });
  console.log("DURUM:", JSON.stringify(durum, null, 1));

  if (foto) { await p.screenshot({ path: foto }); console.log("foto:", foto); }
  console.log("bitti");
})().catch((e) => console.log("HATA:", e.message));
