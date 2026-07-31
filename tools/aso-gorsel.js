/**
 * App Store PAZARLAMA ekran görüntülerini üretir (başlık metni + cihaz ekranı).
 *
 * Neden: çıplak ekran görüntüsü indirmeye ikna etmiyor. Zirvedeki tüm rakipler
 * (Waterllama, Plant Nanny, WaterMinder) görselin üstünde büyük bir başlık kullanıyor.
 *
 *   bash tools/baslat.sh                 # Sipling Chrome, port 9360
 *   node tools/aso-gorsel.js en-US       # → store/ios-65-market/en-US/1..5.png
 *   node tools/aso-gorsel.js tr
 *   node tools/aso-gorsel.js hepsi       # tanımlı bütün diller
 *
 * Çıktı: 1242x2688 (iPhone 6.5") — App Store'un istediği boyut.
 * 🚨 browser.close() ÇAĞIRMA (CDP ile bağlı, kullanıcının Chrome'unu kapatır).
 * 🚨 page.screenshot() cihaz ölçeğini yok sayar → CDP Page.captureScreenshot şart.
 */
const { chromium } = require('playwright-core');
const fs = require('fs');
const path = require('path');

const ROOT = path.resolve(__dirname, '..');
// Apple mağaza dili -> uygulamanın O DİLDEKİ ham ekran görüntülerinin klasörü.
// Bunlar Play için 2026-07-15'te çekilmişti (1080x1920) ve içlerinde GERÇEK VERİ var
// (1035/2300 ml, büyümüş ağaç). iOS boyutunda yeniden çekim denendi ama uygulama BOŞ
// durumda açıldığından (0 ml, çıplak toprak) kullanılmadı → bunlar tercih edilir.
const DIL_KLASOR = {
  'en-US': 'en-US', tr: 'tr-TR', 'de-DE': 'de-DE', 'es-ES': 'es-ES', 'fr-FR': 'fr-FR',
  it: 'it-IT', 'pt-BR': 'pt-BR', 'nl-NL': 'nl-NL', pl: 'pl-PL', ru: 'ru-RU', uk: 'uk',
  ja: 'ja-JP', ko: 'ko-KR', 'zh-Hans': 'zh-CN', 'zh-Hant': 'zh-TW', id: 'id', vi: 'vi',
  th: 'th', hi: 'hi-IN', 'ar-SA': 'ar',
};
const kaynakKlasor = (dil) => {
  const ozel = path.join(ROOT, 'store', DIL_KLASOR[dil] || dil);
  return fs.existsSync(ozel) ? ozel : path.join(ROOT, 'store/ios-65');
};
// Hedef mağaza: 3. argüman `ios` (varsayılan) veya `play`.
//   node tools/aso-gorsel.js hepsi play
// 🚨 PLAY'İN ORAN KURALI: en büyük kenar, en küçük kenarın 2 KATINI GEÇEMEZ.
//    iOS görseli 1242x2688 = 1:2,16 → Play REDDEDER. Play için 1080x1920 (1:1,78) üretilir.
const MAGAZA = (process.argv[3] || 'ios').toLowerCase();
const OLCU = {
  // yaz: başlık üstü boşluk · fnt: başlık punto · bas: başlık kutusu yüksekliği · crc: çerçeve genişliği
  ios: { W: 414, H: 896, DPR: 3, dir: 'ios-65-market', yaz: 52, fnt: 31, bas: 86, crc: 372 },
  play: { W: 540, H: 960, DPR: 2, dir: 'play-market', yaz: 46, fnt: 35, bas: 92, crc: 420 },
}[MAGAZA];
if (!OLCU) { console.error('mağaza: ios | play'); process.exit(1); }
const HEDEF = path.join(ROOT, 'store', OLCU.dir);
const { W, H, DPR } = OLCU;

// Sıra ÖNEMLİ: App Store'da ilk 3 görsel indirmenin çoğunu belirler.
const SIRA = ['2-today', '3-forest', '4-stats', '5-settings', '1-summary'];

const METIN = {
  'en-US': [
    'Every glass grows a tree',
    'Your forest never withers',
    'Your week, at a glance',
    'Reminders that actually arrive',
    'A calm end-of-day recap',
  ],
  tr: [
    'Her bardak bir ağaç büyütür',
    'Ormanın asla kurumaz',
    'Haftan tek bakışta',
    'Gerçekten gelen hatırlatmalar',
    'Güne sakin bir kapanış',
  ],
  'de-DE': [
    'Jedes Glas lässt einen Baum wachsen',
    'Dein Wald verdorrt nie',
    'Deine Woche auf einen Blick',
    'Erinnerungen, die ankommen',
    'Ein ruhiger Tagesabschluss',
  ],
  'es-ES': [
    'Cada vaso hace crecer un árbol',
    'Tu bosque nunca se seca',
    'Tu semana de un vistazo',
    'Recordatorios que sí llegan',
    'Un cierre de día tranquilo',
  ],
  'fr-FR': [
    "Chaque verre fait pousser un arbre",
    "Ta forêt ne se fane jamais",
    "Ta semaine en un coup d'œil",
    "Des rappels qui arrivent vraiment",
    "Un bilan de fin de journée",
  ],
  it: [
    'Ogni bicchiere fa crescere un albero',
    'Il tuo bosco non appassisce mai',
    'La tua settimana a colpo d’occhio',
    'Promemoria che arrivano davvero',
    'Un riepilogo di fine giornata',
  ],
  'pt-BR': [
    'Cada copo faz crescer uma árvore',
    'Sua floresta nunca seca',
    'Sua semana num relance',
    'Lembretes que realmente chegam',
    'Um resumo tranquilo do dia',
  ],
  'nl-NL': [
    'Elk glas laat een boom groeien',
    'Jouw bos verdort nooit',
    'Je week in één oogopslag',
    'Herinneringen die echt aankomen',
    'Een rustige dagafsluiting',
  ],
  pl: [
    'Każda szklanka wyhoduje drzewo',
    'Twój las nigdy nie usycha',
    'Twój tydzień na pierwszy rzut oka',
    'Przypomnienia, które naprawdę docierają',
    'Spokojne podsumowanie dnia',
  ],
  ru: [
    'Каждый стакан растит дерево',
    'Твой лес никогда не засохнет',
    'Твоя неделя одним взглядом',
    'Напоминания, которые доходят',
    'Спокойный итог дня',
  ],
  uk: [
    'Кожна склянка вирощує дерево',
    'Твій ліс ніколи не всихає',
    'Твій тиждень одним поглядом',
    'Нагадування, які справді приходять',
    'Спокійний підсумок дня',
  ],
  ja: [
    '一杯ごとに木が育つ',
    '森は決して枯れない',
    '一週間をひと目で',
    'ちゃんと届くリマインダー',
    '穏やかな一日のまとめ',
  ],
  ko: [
    '한 잔이 나무 한 그루를 키워요',
    '당신의 숲은 마르지 않아요',
    '한 주를 한눈에',
    '진짜로 도착하는 알림',
    '차분한 하루 마무리',
  ],
  'zh-Hans': [
    '每一杯都长成一棵树',
    '你的森林永不枯萎',
    '一周进度一目了然',
    '真正会响的提醒',
    '安静的一日回顾',
  ],
  'zh-Hant': [
    '每一杯都長成一棵樹',
    '你的森林永不枯萎',
    '一週進度一目了然',
    '真正會響的提醒',
    '安靜的一日回顧',
  ],
  id: [
    'Setiap gelas menumbuhkan pohon',
    'Hutanmu tidak pernah layu',
    'Sepekanmu dalam sekilas',
    'Pengingat yang benar-benar datang',
    'Rangkuman hari yang tenang',
  ],
  vi: [
    'Mỗi ly nước trồng một cái cây',
    'Khu rừng của bạn không bao giờ héo',
    'Cả tuần trong một cái nhìn',
    'Lời nhắc thực sự đến nơi',
    'Tổng kết cuối ngày nhẹ nhàng',
  ],
  th: [
    'ทุกแก้วปลูกต้นไม้หนึ่งต้น',
    'ป่าของคุณไม่มีวันเหี่ยวเฉา',
    'ทั้งสัปดาห์ในพริบตา',
    'การเตือนที่มาถึงจริง',
    'สรุปท้ายวันอย่างสงบ',
  ],
  hi: [
    'हर गिलास एक पेड़ उगाता है',
    'आपका वन कभी नहीं सूखता',
    'पूरा हफ़्ता एक नज़र में',
    'ऐसे रिमाइंडर जो सच में आते हैं',
    'दिन का शांत सारांश',
  ],
  'ar-SA': [
    'كل كوب يُنبت شجرة',
    'غابتك لا تذبل أبدًا',
    'أسبوعك في لمحة',
    'تذكيرات تصل فعلًا',
    'خلاصة هادئة لنهاية اليوم',
  ],
};

const esc = (s) => s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');

function sayfa(baslikMetni, pngB64) {
  return `<!doctype html><meta charset="utf-8"><style>
  *{margin:0;padding:0;box-sizing:border-box}
  html,body{width:${W}px;height:${H}px;overflow:hidden}
  body{
    background:linear-gradient(170deg,#EAF4FA 0%,#DCEFF8 45%,#CFE7F4 100%);
    font-family:"Segoe UI",system-ui,-apple-system,"Helvetica Neue",sans-serif;
    display:flex;flex-direction:column;align-items:center;
  }
  h1{
    margin:${OLCU.yaz}px 30px 0;font-size:${OLCU.fnt}px;line-height:1.18;font-weight:700;
    color:#0E3A4C;text-align:center;letter-spacing:-0.4px;
    display:flex;align-items:center;justify-content:center;height:${OLCU.bas}px;
  }
  .cerceve{
    /* Kaynak 1080x1920 (9:16). Çerçeve genişliği mağazaya göre seçilir ki
       başlık + ekran tuvali taşırmadan dengeli doldursun. */
    margin-top:24px;width:${OLCU.crc}px;border-radius:34px;overflow:hidden;
    box-shadow:0 26px 52px rgba(14,58,76,.26),0 3px 10px rgba(14,58,76,.14);
    background:#fff;
  }
  .cerceve img{display:block;width:100%}
  </style>
  <h1>${esc(baslikMetni)}</h1>
  <div class="cerceve"><img src="data:image/png;base64,${pngB64}"></div>`;
}

(async () => {
  const arg = process.argv[2] || 'en-US';
  const diller = arg === 'hepsi' ? Object.keys(METIN) : [arg];
  for (const d of diller) if (!METIN[d]) { console.error(`Bu dil için başlık tanımlı değil: ${d}`); process.exit(1); }

  const b = await chromium.connectOverCDP('http://localhost:9360').catch(() => null);
  if (!b) { console.error('Sipling tarayıcısı kapalı → bash tools/baslat.sh'); process.exit(1); }
  const ctx = b.contexts()[0];
  const page = ctx.pages().find((p) => !p.url().startsWith('devtools://')) || (await ctx.newPage());
  const cdp = await ctx.newCDPSession(page);
  await cdp.send('Emulation.setDeviceMetricsOverride', { width: W, height: H, deviceScaleFactor: DPR, mobile: false });

  for (const dil of diller) {
    const out = path.join(HEDEF, dil);
    const KAYNAK = kaynakKlasor(dil);
    fs.mkdirSync(out, { recursive: true });
    console.log(`\n[${dil}] kaynak: ${path.basename(KAYNAK)}`);
    for (let i = 0; i < SIRA.length; i++) {
      const kaynak = path.join(KAYNAK, SIRA[i] + '.png');
      if (!fs.existsSync(kaynak)) { console.log(`  atlandı (kaynak yok): ${SIRA[i]}`); continue; }
      const b64 = fs.readFileSync(kaynak).toString('base64');
      await page.setContent(sayfa(METIN[dil][i], b64), { waitUntil: 'load' });
      await page.waitForTimeout(280);
      const shot = await cdp.send('Page.captureScreenshot', { format: 'png', captureBeyondViewport: false });
      const dosya = path.join(out, `${i + 1}.png`);
      fs.writeFileSync(dosya, Buffer.from(shot.data, 'base64'));
      console.log(`✅ ${dil}/${i + 1}.png  «${METIN[dil][i]}»`);
    }
  }
  await cdp.send('Emulation.clearDeviceMetricsOverride');
  console.log('\nBitti →', HEDEF);
})();
