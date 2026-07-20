// "Kitaplıktan ekle" → en yeni kodu isaretle → "Sürüme ekle" — HEPSI TEK BETIKTE
// (betikler arasi diyalog kapaniyor). Kullanim: node tools/_kitaplik-tam.js [foto.png]
const { chromium } = require("playwright-core");
(async () => {
  const foto = process.argv[2];
  const b = await chromium.connectOverCDP("http://localhost:9360");
  const p = b.contexts()[0].pages().find((x) => !x.url().startsWith("devtools://"));
  console.log("sayfa:", p.url());

  await p.getByText("Kitaplıktan ekle", { exact: true }).first().click();
  await p.waitForTimeout(4500);
  console.log("diyalog acildi");

  const dlg = p.locator('[role=dialog]').first();
  const cb = dlg.locator('input[type=checkbox]').first();
  const box = await cb.boundingBox();
  if (!box) { console.log("checkbox-yok"); if (foto) await p.screenshot({path:foto}); return; }
  await p.mouse.click(box.x + box.width / 2, box.y + box.height / 2);
  console.log("en yeni kod (3) isaretlendi");
  await p.waitForTimeout(1800);

  const btn = p.getByRole("button", { name: "Sürüme ekle" });
  const dis = await btn.isDisabled().catch(() => true);
  console.log("'Sürüme ekle' pasif mi:", dis);
  if (!dis) {
    await btn.click();
    console.log("'Sürüme ekle' tiklandi");
    await p.waitForTimeout(6000);
  }

  const durum = await p.evaluate(() => {
    const g = document.body.innerText;
    const sat = (g.match(/[^\n]*(sürüm kodu|App bundle|1\.0\.1|MB|indirilebilir)[^\n]*/gi) || []).slice(0, 8);
    const hata = [];
    document.querySelectorAll('[role=alert],[class*="rror"]').forEach((e) => {
      const t = (e.innerText || "").trim(); if (t.length > 3) hata.push(t.slice(0, 140));
    });
    const dlgAcik = !!document.querySelector('[role=dialog]');
    return { dlgAcik, paket: [...new Set(sat)], hata: [...new Set(hata)] };
  });
  console.log("DURUM:", JSON.stringify(durum, null, 1));
  if (foto) { await p.screenshot({ path: foto }); console.log("foto:", foto); }
  console.log("bitti");
})().catch((e) => console.log("HATA:", e.message));
