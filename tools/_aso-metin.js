/**
 * App Store açıklama metnini üretir — TEK KAYNAK (hem aso-dogrula.js hem aso-uygula.js kullanır).
 *
 * 🪤 APPLE AÇIKLAMADA EMOJİ KABUL ETMİYOR. Play metinlerimiz emojili yazılmıştı
 *    (💧 ❤ ☕ ✨ 🔔 🌳 🌱 🔒 📱) ve API şu hatayı verdi:
 *    409 ENTITY_ERROR.ATTRIBUTE.INVALID.INVALID_CHARACTERS
 *    "Description can't contain the following character(s): …"
 *    Bu yüzden Play kaynağındaki emojiler burada temizlenir. Play tarafı emojili KALIR.
 */
const fs = require('fs');
const path = require('path');

const ROOT = path.resolve(__dirname, '..');
const BLOK = require(path.join(ROOT, 'store/metinler/apple-blok.js'));

// Emoji + varyasyon seçici + sıfır-genişlik birleştirici
const EMOJI =
  /[\u{1F000}-\u{1FAFF}\u{2190}-\u{21FF}\u{2300}-\u{23FF}\u{2460}-\u{24FF}\u{25A0}-\u{27BF}\u{2B00}-\u{2BFF}\u{FE0F}\u{FE0E}\u{200D}\u{20E3}]/gu;

/** Emojileri atar, satır başında/sonunda kalan boşlukları toplar. */
function emojisiz(s) {
  return String(s)
    .replace(EMOJI, '')
    .split('\n')
    .map((satir) => satir.replace(/[ \t]+/g, ' ').trim())
    .join('\n')
    .replace(/\n{3,}/g, '\n\n')
    .trim();
}

/** Bir mağaza dili için nihai App Store açıklaması: Play metni + abonelik/EULA bloğu. */
function aciklama(locale, src) {
  const j = JSON.parse(fs.readFileSync(path.join(ROOT, 'store/metinler', src + '.json'), 'utf8'));
  return emojisiz(String(j.full)) + BLOK[locale].blok;
}

/** Sürüm notu (What's New) — bunda da emoji olmasın. */
const surumNotu = (locale) => emojisiz(BLOK[locale].yeni);

module.exports = { emojisiz, aciklama, surumNotu };
