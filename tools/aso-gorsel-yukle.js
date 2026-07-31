/**
 * App Store'a ekran görüntüsü yükler (App Store Connect REST API, tarayıcısız).
 *
 *   node tools/aso-gorsel-yukle.js en-US store/ios-65-market/en-US
 *   node tools/aso-gorsel-yukle.js en-US store/ios-65-market/en-US sil   # önce eskileri siler
 *
 * Apple'ın 3 adımlı akışı: (1) appScreenshots POST → rezervasyon + uploadOperations
 * (2) her parçayı verilen URL'e PUT (3) PATCH uploaded:true + md5 sourceFileChecksum.
 * 🚨 Sürüm incelemedeyken çalışmaz; DEVELOPER_REJECTED/PREPARE_FOR_SUBMISSION olmalı.
 */
const crypto = require('crypto');
const fs = require('fs');
const https = require('https');
const path = require('path');

const KEY_ID = 'JYW9GVD5XJ';
const ISS = 'ce8ece0f-3696-4b3a-96e3-32a060b4e4f8';
const P8 = 'C:/Users/asim_/.playwright-mcp/AuthKey-JYW9GVD5XJ.p8';
const APP_ID = '6789913186';
const TIP = 'APP_IPHONE_65';   // 1242x2688

const b64 = (b) => Buffer.from(b).toString('base64').replace(/=/g, '').replace(/\+/g, '-').replace(/\//g, '_');
function token() {
  const h = b64(JSON.stringify({ alg: 'ES256', kid: KEY_ID, typ: 'JWT' }));
  const now = Math.floor(Date.now() / 1000);
  const p = b64(JSON.stringify({ iss: ISS, iat: now, exp: now + 1200, aud: 'appstoreconnect-v1' }));
  const si = h + '.' + p;
  return si + '.' + b64(crypto.sign('sha256', Buffer.from(si), { key: fs.readFileSync(P8, 'utf8'), dsaEncoding: 'ieee-p1363' }));
}
function api(method, p, body) {
  return new Promise((res, rej) => {
    const d = body ? JSON.stringify(body) : null;
    const r = https.request({ hostname: 'api.appstoreconnect.apple.com', path: '/v1' + p, method,
      headers: { Authorization: 'Bearer ' + token(), 'Content-Type': 'application/json',
        ...(d ? { 'Content-Length': Buffer.byteLength(d) } : {}) } },
      (x) => { let b = ''; x.on('data', (c) => (b += c));
        x.on('end', () => { let j; try { j = b ? JSON.parse(b) : {}; } catch (e) { j = { raw: b }; }
          res({ status: x.statusCode, json: j }); }); });
    r.on('error', rej); if (d) r.write(d); r.end();
  });
}
function parcaYukle(op, buf) {
  return new Promise((res, rej) => {
    const u = new URL(op.url);
    const govde = buf.subarray(op.offset, op.offset + op.length);
    const headers = {};
    for (const h of op.requestHeaders || []) headers[h.name] = h.value;
    headers['Content-Length'] = govde.length;
    const r = https.request({ hostname: u.hostname, path: u.pathname + u.search, method: op.method, headers },
      (x) => { x.resume(); x.on('end', () => res(x.statusCode)); });
    r.on('error', rej); r.write(govde); r.end();
  });
}
const hataMetni = (j) => (j.errors || []).map((e) => `${e.status} ${e.code} ${e.detail || e.title}`).join(' | ') || JSON.stringify(j).slice(0, 250);

(async () => {
  const [locale, klasor, sil] = process.argv.slice(2);
  if (!locale || !klasor) { console.error('kullanım: node tools/aso-gorsel-yukle.js <locale> <klasör> [sil]'); process.exit(1); }

  const vers = await api('GET', `/apps/${APP_ID}/appStoreVersions?limit=5&fields[appStoreVersions]=versionString,appStoreState`);
  const ver = (vers.json.data || []).find((v) => !['READY_FOR_SALE', 'REPLACED_WITH_NEW_VERSION'].includes(v.attributes.appStoreState));
  if (!ver) return console.error('❌ Düzenlenebilir sürüm yok.');
  console.log(`sürüm ${ver.attributes.versionString} (${ver.attributes.appStoreState}) · dil ${locale}`);

  const locs = await api('GET', `/appStoreVersions/${ver.id}/appStoreVersionLocalizations?limit=50`);
  const loc = (locs.json.data || []).find((d) => d.attributes.locale === locale);
  if (!loc) return console.error(`❌ ${locale} yerelleştirmesi yok.`);

  // Bu dil için 6.5" seti var mı, yoksa oluştur
  const sets = await api('GET', `/appStoreVersionLocalizations/${loc.id}/appScreenshotSets`);
  let set = (sets.json.data || []).find((s) => s.attributes.screenshotDisplayType === TIP);
  if (!set) {
    const r = await api('POST', '/appScreenshotSets', { data: { type: 'appScreenshotSets',
      attributes: { screenshotDisplayType: TIP },
      relationships: { appStoreVersionLocalization: { data: { type: 'appStoreVersionLocalizations', id: loc.id } } } } });
    if (r.status >= 300) return console.error('❌ set oluşmadı →', hataMetni(r.json));
    set = r.json.data;
    console.log('set oluşturuldu', set.id);
  } else {
    console.log('mevcut set', set.id);
  }

  if (sil) {
    const eski = await api('GET', `/appScreenshotSets/${set.id}/appScreenshots?limit=20`);
    for (const s of eski.json.data || []) {
      const r = await api('DELETE', `/appScreenshots/${s.id}`);
      console.log(`  eski silindi ${s.id} → ${r.status}`);
    }
  }

  const dosyalar = fs.readdirSync(path.resolve(klasor)).filter((f) => f.endsWith('.png')).sort();
  for (const f of dosyalar) {
    const tam = path.join(path.resolve(klasor), f);
    const buf = fs.readFileSync(tam);
    const r = await api('POST', '/appScreenshots', { data: { type: 'appScreenshots',
      attributes: { fileName: f, fileSize: buf.length },
      relationships: { appScreenshotSet: { data: { type: 'appScreenshotSets', id: set.id } } } } });
    if (r.status >= 300) { console.log(`❌ ${f} rezervasyon → ${hataMetni(r.json)}`); continue; }
    const id = r.json.data.id;
    for (const op of r.json.data.attributes.uploadOperations || []) {
      const kod = await parcaYukle(op, buf);
      if (kod >= 300) console.log(`  ⚠️ parça ${kod}`);
    }
    const md5 = crypto.createHash('md5').update(buf).digest('hex');
    const c = await api('PATCH', `/appScreenshots/${id}`,
      { data: { type: 'appScreenshots', id, attributes: { uploaded: true, sourceFileChecksum: md5 } } });
    console.log(c.status < 300 ? `✅ ${f} yüklendi` : `❌ ${f} onay → ${hataMetni(c.json)}`);
  }
})();
