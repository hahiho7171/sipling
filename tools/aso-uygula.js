/**
 * App Store ASO metinlerini App Store Connect'e YAZAR (20 dil).
 *
 *   node tools/aso-uygula.js            → KURU DENEME (hiçbir şey yazmaz, ne yapacağını listeler)
 *   node tools/aso-uygula.js yaz        → gerçekten yazar
 *   node tools/aso-uygula.js yaz tr     → yalnız tek dil
 *
 * Yazdığı iki yer:
 *  1) appInfoLocalizations   → ad (name) + alt başlık (subtitle) + gizlilik URL'si   [aramada indekslenir]
 *  2) appStoreVersionLocalizations → anahtar kelime + açıklama + sürüm notu + URL'ler
 *
 * 🚨 Sürüm incelemedeyken çalışmaz — önce reviewSubmission iptal edilip sürüm
 *    DEVELOPER_REJECTED (düzenlenebilir) hale getirilmeli.
 */
const crypto = require('crypto');
const fs = require('fs');
const https = require('https');
const path = require('path');

const ROOT = path.resolve(__dirname, '..');
const KEY_ID = 'JYW9GVD5XJ';
const ISS = 'ce8ece0f-3696-4b3a-96e3-32a060b4e4f8';
const P8 = 'C:/Users/asim_/.playwright-mcp/AuthKey-JYW9GVD5XJ.p8';
const APP_ID = '6789913186';
const SUPPORT = 'https://sipling-app.web.app/destek';
const MARKETING = 'https://sipling-app.web.app';
const PRIVACY = 'https://sipling-app.web.app/gizlilik';

const ASO = require(path.join(ROOT, 'store/metinler/apple-aso.js'));
const { aciklama, surumNotu } = require('./_aso-metin.js');

const b64 = (b) => Buffer.from(b).toString('base64').replace(/=/g, '').replace(/\+/g, '-').replace(/\//g, '_');
function token() {
  const h = b64(JSON.stringify({ alg: 'ES256', kid: KEY_ID, typ: 'JWT' }));
  const now = Math.floor(Date.now() / 1000);
  const p = b64(JSON.stringify({ iss: ISS, iat: now, exp: now + 900, aud: 'appstoreconnect-v1' }));
  const si = h + '.' + p;
  return si + '.' + b64(crypto.sign('sha256', Buffer.from(si), { key: fs.readFileSync(P8, 'utf8'), dsaEncoding: 'ieee-p1363' }));
}
function api(method, p, body) {
  return new Promise((res, rej) => {
    const d = body ? JSON.stringify(body) : null;
    const r = https.request(
      { hostname: 'api.appstoreconnect.apple.com', path: '/v1' + p, method,
        headers: { Authorization: 'Bearer ' + token(), 'Content-Type': 'application/json',
          ...(d ? { 'Content-Length': Buffer.byteLength(d) } : {}) } },
      (x) => { let b = ''; x.on('data', (c) => (b += c));
        x.on('end', () => { let j; try { j = b ? JSON.parse(b) : {}; } catch (e) { j = { raw: b }; }
          res({ status: x.statusCode, json: j }); }); });
    r.on('error', rej); if (d) r.write(d); r.end();
  });
}
const hataMetni = (j) => (j.errors || []).map((e) => `${e.status} ${e.code} ${e.detail || e.title}`).join(' | ') || JSON.stringify(j).slice(0, 200);

(async () => {
  const YAZ = process.argv[2] === 'yaz';
  const TEK = process.argv[3];
  console.log(YAZ ? '✍️  YAZMA MODU' : '👀 KURU DENEME (yazmaz) — gerçekten yazmak için: node tools/aso-uygula.js yaz');

  // 1) Düzenlenebilir appInfo'yu ve düzenlenebilir sürümü bul
  const infos = await api('GET', `/apps/${APP_ID}/appInfos?fields[appInfos]=state`);
  const info = (infos.json.data || []).find((i) => i.attributes.state !== 'READY_FOR_DISTRIBUTION');
  if (!info) return console.log('❌ Düzenlenebilir appInfo yok (sürüm incelemede olabilir).');

  const vers = await api('GET', `/apps/${APP_ID}/appStoreVersions?limit=5&fields[appStoreVersions]=versionString,appStoreState`);
  const ver = (vers.json.data || []).find((v) => !['READY_FOR_SALE', 'REPLACED_WITH_NEW_VERSION'].includes(v.attributes.appStoreState));
  if (!ver) return console.log('❌ Düzenlenebilir sürüm yok.');
  console.log(`appInfo ${info.id} (${info.attributes.state}) · sürüm ${ver.attributes.versionString} (${ver.attributes.appStoreState})\n`);

  // 2) Mevcut yerelleştirmeleri oku
  const [infoLocs, verLocs] = await Promise.all([
    api('GET', `/appInfos/${info.id}/appInfoLocalizations?limit=50`),
    api('GET', `/appStoreVersions/${ver.id}/appStoreVersionLocalizations?limit=50`),
  ]);
  const infoVar = Object.fromEntries((infoLocs.json.data || []).map((d) => [d.attributes.locale, d.id]));
  const verVar = Object.fromEntries((verLocs.json.data || []).map((d) => [d.attributes.locale, d.id]));
  console.log('Mevcut diller:', Object.keys(infoVar).join(', ') || '(yok)', '\n');

  let ok = 0, fail = 0;
  for (const [locale, v] of Object.entries(ASO)) {
    if (TEK && locale !== TEK) continue;
    const description = aciklama(locale, v.src);
    const whatsNew = surumNotu(locale);

    const infoAttrs = { name: v.name, subtitle: v.subtitle, privacyPolicyUrl: PRIVACY };
    const verAttrs = { keywords: v.keywords, description, whatsNew, supportUrl: SUPPORT, marketingUrl: MARKETING };

    if (!YAZ) {
      console.log(`${locale.padEnd(9)} ${infoVar[locale] ? 'GÜNCELLE' : 'OLUŞTUR '} ad="${v.name}" alt="${v.subtitle}"`);
      console.log(`${' '.repeat(9)} ${verVar[locale] ? 'GÜNCELLE' : 'OLUŞTUR '} anahtar=${v.keywords.length}k açıklama=${description.length}k`);
      continue;
    }

    // --- ad + alt başlık ---
    let r;
    if (infoVar[locale]) {
      r = await api('PATCH', `/appInfoLocalizations/${infoVar[locale]}`,
        { data: { type: 'appInfoLocalizations', id: infoVar[locale], attributes: infoAttrs } });
    } else {
      r = await api('POST', '/appInfoLocalizations', {
        data: { type: 'appInfoLocalizations', attributes: { locale, ...infoAttrs },
          relationships: { appInfo: { data: { type: 'appInfos', id: info.id } } } } });
    }
    if (r.status >= 300) { console.log(`❌ ${locale} ad/altbaşlık → ${hataMetni(r.json)}`); fail++; continue; }

    // --- anahtar kelime + açıklama + sürüm notu ---
    if (verVar[locale]) {
      r = await api('PATCH', `/appStoreVersionLocalizations/${verVar[locale]}`,
        { data: { type: 'appStoreVersionLocalizations', id: verVar[locale], attributes: verAttrs } });
    } else {
      r = await api('POST', '/appStoreVersionLocalizations', {
        data: { type: 'appStoreVersionLocalizations', attributes: { locale, ...verAttrs },
          relationships: { appStoreVersion: { data: { type: 'appStoreVersions', id: ver.id } } } } });
    }
    if (r.status >= 300) { console.log(`❌ ${locale} sürüm metni → ${hataMetni(r.json)}`); fail++; continue; }

    console.log(`✅ ${locale.padEnd(9)} "${v.name}" | "${v.subtitle}"`);
    ok++;
  }
  if (YAZ) console.log(`\nBitti — başarılı ${ok} · hatalı ${fail}`);
})();
