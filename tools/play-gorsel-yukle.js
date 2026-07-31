/**
 * Play Console → Mağaza girişi → TELEFON EKRAN GÖRÜNTÜLERİ'ni dile göre değiştirir.
 *
 *   bash tools/baslat.sh                       # Sipling Chrome, port 9360, Play Console girişli
 *   node tools/play-gorsel-yukle.js            # kuru deneme
 *   node tools/play-gorsel-yukle.js yaz        # 20 dilin hepsi
 *   node tools/play-gorsel-yukle.js yaz tr-TR  # tek dil
 *
 * Kaynak: store/play-market/<apple-dil>/1..5.png (1080x1920).
 *
 * 🪤 ÜÇ ENGEL VARDI, ÜÇÜ DE BURADA ÇÖZÜLÜ (detay → wiki/08-tuzaklar.md):
 *  1. Playwright `.click()` Play'in YAPIŞKAN BAŞLIĞINA takılıyor
 *     ("console-page-header … intercepts pointer events") → tüm tıklamalar DOM'dan (`el.click()`).
 *  2. Silme düğmesi küçük resmin ÜSTÜNE FARE GELİNCE aktifleşiyor → önce hover olayları
 *     (pointerover/mouseover/mouseenter), sonra tıklama. Hover'sız sessizce hiçbir şey olmuyor.
 *  3. "Öğe ekle" düğmesinin aria-label'ı YOK (yalnız metni var) ve bölüm başlığı
 *     "Telefon ekran görüntüleri *" olduğu için yaprak düğüm değil → çapa olarak
 *     sekme etiketi "Telefon" kullanılıyor, ondan SONRAKİ ilk "Öğe ekle".
 *     🚨 Aynı ad UYGULAMA SİMGESİ ve ÖZELLİK GRAFİĞİ bölümlerinde de var; körlemesine
 *        `.first()` alırsan SİMGEYİ değiştirirsin. Bu çapayı kaldırma.
 * 🚨 browser.close() ÇAĞIRMA.
 */
const { chromium } = require('playwright-core');
const fs = require('fs');
const path = require('path');

const ROOT = path.resolve(__dirname, '..');
const DEV = '7286802637861068803';
const APP = '4974431994893643882';
const URL = `https://play.google.com/console/u/0/developers/${DEV}/app/${APP}/main-store-listing`;
const SEL = '[aria-label="Telefon ekran görüntüleri öğesini kaldır"]';

// Play dil kodu -> store/play-market altındaki klasör (Apple dil kodu)
const KLASOR = {
  'en-US': 'en-US', 'tr-TR': 'tr', 'de-DE': 'de-DE', 'es-ES': 'es-ES', 'fr-FR': 'fr-FR',
  'it-IT': 'it', 'pt-BR': 'pt-BR', 'nl-NL': 'nl-NL', 'pl-PL': 'pl', 'ru-RU': 'ru', uk: 'uk',
  'ja-JP': 'ja', 'ko-KR': 'ko', 'zh-CN': 'zh-Hans', 'zh-TW': 'zh-Hant', id: 'id', vi: 'vi',
  th: 'th', 'hi-IN': 'hi', ar: 'ar-SA',
};

// --- sayfada çalışan yardımcılar (tek yerde, hepsi DOM tıklaması) ---
const SAYFA = {
  // Tüm düğümleri shadow DOM dahil belge sırasında toplar.
  gez: `function gez(kok, out = []) {
          for (const el of kok.querySelectorAll('*')) { out.push(el); if (el.shadowRoot) gez(el.shadowRoot, out); }
          return out;
        }`,
};

(async () => {
  const YAZ = process.argv[2] === 'yaz';
  const TEK = process.argv[3];
  console.log(YAZ ? '✍️  YAZMA MODU' : '👀 KURU DENEME — yazmak için: node tools/play-gorsel-yukle.js yaz');

  const b = await chromium.connectOverCDP('http://localhost:9360').catch(() => null);
  if (!b) { console.error('Sipling tarayıcısı kapalı → bash tools/baslat.sh'); process.exit(1); }
  const ctx = b.contexts()[0];
  const page = ctx.pages().find((p) => !p.url().startsWith('devtools://')) || (await ctx.newPage());
  const bekle = (ms) => page.waitForTimeout(ms);

  let ok = 0, hata = 0;
  for (const [dil, klasor] of Object.entries(KLASOR)) {
    if (TEK && dil !== TEK) continue;
    const dizin = path.join(ROOT, 'store/play-market', klasor);
    const dosyalar = fs.existsSync(dizin)
      ? fs.readdirSync(dizin).filter((f) => f.endsWith('.png')).sort().map((f) => path.join(dizin, f))
      : [];
    if (dosyalar.length !== 5) { console.log(`❌ ${dil.padEnd(6)} kaynak eksik (${dosyalar.length}/5)`); hata++; continue; }
    if (!YAZ) { console.log(`~ ${dil.padEnd(6)} 5 görsel ← store/play-market/${klasor}`); continue; }

    try {
      await page.goto(URL, { waitUntil: 'domcontentloaded' });
      await page.waitForFunction(() => /Telefon ekran görüntüleri/.test(document.body.innerText), null, { timeout: 60000 });
      await bekle(2500);

      // --- 1) dili seç (DOM tıklamasıyla) ---
      if (dil !== 'en-US') {
        const secildi = await page.evaluate(async ({ dil, gezSrc }) => {
          const gez = eval(`(${gezSrc})`);
          const uyu = (ms) => new Promise((r) => setTimeout(r, ms));
          const acilir = gez(document).find((e) =>
            (e.tagName === 'BUTTON' || e.getAttribute?.('role') === 'button') &&
            (e.textContent || '').trim().startsWith('Varsayılan – İngilizce'));
          if (!acilir) return 'menü yok';
          acilir.click();
          await uyu(2000);
          const sec = gez(document).find((e) => e.children.length === 0 && new RegExp(`–\\s*${dil}$`).test((e.textContent || '').trim()));
          if (!sec) return 'seçenek yok';
          sec.click();
          return 'ok';
        }, { dil, gezSrc: SAYFA.gez });
        if (secildi !== 'ok') throw new Error(`dil seçilemedi (${secildi})`);
        await bekle(6000);
      }

      // --- 2) mevcut telefon görsellerini sil (hover + DOM tıklaması, tek evaluate içinde) ---
      const silSonuc = await page.evaluate(async ({ sel }) => {
        const uyu = (ms) => new Promise((r) => setTimeout(r, ms));
        for (let i = 0; i < 12; i++) {
          const el = document.querySelector(sel);
          if (!el) break;
          const kart = el.closest('div') || el;
          // 🪤 Düğme sayfanın çok altında olabiliyor (y≈2400). Görünür alana GELMEDEN
          //    hover olayları işlemiyor, tıklama sessizce yutuluyor.
          kart.scrollIntoView({ block: 'center' });
          await uyu(700);
          const r = kart.getBoundingClientRect();
          const o = { clientX: r.x + r.width / 2, clientY: r.y + r.height / 2, bubbles: true, composed: true };
          kart.dispatchEvent(new PointerEvent('pointerover', o));
          kart.dispatchEvent(new MouseEvent('mouseover', o));
          kart.dispatchEvent(new MouseEvent('mouseenter', o));
          await uyu(600);
          el.click();
          await uyu(1400);
        }
        return document.querySelectorAll(sel).length;
      }, { sel: SEL });
      if (silSonuc) throw new Error(`${silSonuc} eski görsel silinemedi`);

      // --- 3) telefon bölümünün "Öğe ekle" düğmesine bas ---
      const basildi = await page.evaluate(({ gezSrc }) => {
        const gez = eval(`(${gezSrc})`);
        const hepsi = gez(document);
        const ai = hepsi.findIndex((e) => e.children.length === 0 && (e.textContent || '').trim() === 'Telefon');
        if (ai < 0) return false;
        const ekle = hepsi.slice(ai + 1).find((e) =>
          (e.tagName === 'BUTTON' || e.getAttribute?.('role') === 'button') &&
          (e.textContent || '').trim() === 'Öğe ekle');
        if (!ekle) return false;
        ekle.click();
        return true;
      }, { gezSrc: SAYFA.gez });
      if (!basildi) throw new Error('"Öğe ekle" düğmesi bulunamadı');
      await bekle(2500);

      // --- 4) açılan pencerenin gizli dosya girişine 5 görseli ver ---
      const giris = page.locator('input[type="file"]').first();
      await giris.waitFor({ state: 'attached', timeout: 20000 });
      await giris.setInputFiles(dosyalar);
      await bekle(8000);

      // --- 5) kaydet ---
      const kaydedildi = await page.evaluate(({ gezSrc }) => {
        const gez = eval(`(${gezSrc})`);
        const k = gez(document).find((e) =>
          (e.tagName === 'BUTTON' || e.getAttribute?.('role') === 'button') && (e.textContent || '').trim() === 'Kaydet');
        if (!k) return false;
        k.click();
        return true;
      }, { gezSrc: SAYFA.gez });
      if (!kaydedildi) throw new Error('Kaydet düğmesi bulunamadı');
      await bekle(5000);

      const son = await page.evaluate((s) => document.querySelectorAll(s).length, SEL);
      console.log(`✅ ${dil.padEnd(6)} 5 görsel yüklendi (sayfada ${son})`);
      ok++;
    } catch (e) {
      console.log(`❌ ${dil.padEnd(6)} ${String(e.message).slice(0, 110)}`);
      hata++;
    }
  }
  console.log(`\nBitti — başarılı ${ok} · hatalı ${hata}`);
})();
