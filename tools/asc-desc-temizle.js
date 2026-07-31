// App Store açıklamalarından üçüncü-taraf platform (Android) referanslarını temizler — 20 dil.
// Guideline 2.3.10 reddi (2026-07-28) için yazıldı.
//   node tools/asc-desc-temizle.js kuru     → hiçbir şeye dokunmadan ne olacağını gösterir
//   node tools/asc-desc-temizle.js uygula   → ASC'ye yazar ve geri okuyup doğrular
const crypto = require('crypto');
const fs = require('fs');
const https = require('https');

const KEY_ID = 'JYW9GVD5XJ';
const ISS = 'ce8ece0f-3696-4b3a-96e3-32a060b4e4f8';
const P8_PATH = 'C:/Users/asim_/.playwright-mcp/AuthKey-JYW9GVD5XJ.p8';
const VERSION_ID = 'd8389187-3be0-4c5f-b3d5-7ff2ce1637ac'; // iOS 1.0.3

// Silinecek bloklar: 6 = ana ekran widget'ı (iOS'ta hedef yok), 7 = Health Connect (Android'e özel)
const SIL_BLOK = [6, 7];
const IDX_HATIRLATMA = 5; // marka cümlesi burada
const YASAK = /android|xiaomi|samsung|huawei|oppo|health\s*connect|google|play store|小米|华为|華為/i;

function b64url(b) { return Buffer.from(b).toString('base64').replace(/=/g, '').replace(/\+/g, '-').replace(/\//g, '_'); }
function token() {
  const p8 = fs.readFileSync(P8_PATH, 'utf8');
  const h = b64url(JSON.stringify({ alg: 'ES256', kid: KEY_ID, typ: 'JWT' }));
  const now = Math.floor(Date.now() / 1000);
  const p = b64url(JSON.stringify({ iss: ISS, iat: now, exp: now + 1000, aud: 'appstoreconnect-v1' }));
  const sig = crypto.sign('sha256', Buffer.from(h + '.' + p), { key: p8, dsaEncoding: 'ieee-p1363' });
  return h + '.' + p + '.' + b64url(sig);
}
function api(method, path, body) {
  return new Promise((res, rej) => {
    const data = body ? JSON.stringify(body) : null;
    const req = https.request({ hostname: 'api.appstoreconnect.apple.com', path: '/v1' + path, method,
      headers: { Authorization: 'Bearer ' + token(), 'Content-Type': 'application/json',
        ...(data ? { 'Content-Length': Buffer.byteLength(data) } : {}) } },
      // 🪤 Parçaları Buffer olarak topla. `b += chunk` yapılırsa çok baytlı bir harf
      // parça sınırında ikiye bölünüp U+FFFD'ye dönüşüyor (Tayca'da yaşandı, Apple 409 verdi).
      (r) => { const parca = []; r.on('data', (c) => parca.push(c));
        r.on('end', () => { const b = Buffer.concat(parca).toString('utf8');
          let j; try { j = b ? JSON.parse(b) : {}; } catch (e) { j = { raw: b }; }
          res({ status: r.statusCode, json: j }); }); });
    req.on('error', rej);
    if (data) req.write(data);
    req.end();
  });
}

// Hatırlatma bloğunda yalnız BAŞLIK + İLK CÜMLE kalsın; pil rehberi + marka listesi gitsin.
function kisaltHatirlatma(blok, locale) {
  const satir = blok.split('\n');
  const baslik = satir[0];
  const govde = satir.slice(1).join('\n').trim();
  let yeni;
  if (locale === 'th') {
    yeni = govde.split(' ').slice(0, 4).join(' '); // Tayca'da nokta yok → boşlukla ayrılmış ilk 4 öbek
  } else {
    const m = govde.match(/^[\s\S]*?[.。।]/); // ilk cümle sonuna kadar (. 。 ।)
    if (!m) throw new Error(locale + ': ilk cümle sonu bulunamadı');
    yeni = m[0];
  }
  yeni = yeni.trim();
  if (yeni.length < 30) throw new Error(locale + ': ilk cümle şüpheli kısa → ' + JSON.stringify(yeni));
  if (YASAK.test(yeni)) throw new Error(locale + ': kısaltmadan sonra hâlâ yasak kelime var');
  return baslik + '\n' + yeni;
}

function temizle(desc, locale) {
  if (desc.includes('�')) throw new Error(locale + ': metinde bozuk karakter (U+FFFD) var — okuma hatalı, yazma');
  const ps = desc.split(/\n\s*\n/);
  if (ps.length !== 15) throw new Error(locale + ': beklenen 15 blok, gelen ' + ps.length);
  if (!/health\s*connect/i.test(ps[7])) throw new Error(locale + ': 7. blok Health Connect değil');
  if (!/xiaomi/i.test(ps[IDX_HATIRLATMA])) throw new Error(locale + ': 5. blokta marka listesi yok');
  ps[IDX_HATIRLATMA] = kisaltHatirlatma(ps[IDX_HATIRLATMA], locale);
  const yeni = ps.filter((_, i) => !SIL_BLOK.includes(i)).join('\n\n');
  if (YASAK.test(yeni)) throw new Error(locale + ': temizlik sonrası hâlâ yasak kelime: ' + (yeni.match(YASAK) || [])[0]);
  if (yeni.length > 4000) throw new Error(locale + ': 4000 karakter sınırı aşıldı');
  return yeni;
}

(async () => {
  const mod = process.argv[2];
  if (!['kuru', 'uygula'].includes(mod)) { console.log('kullanım: node tools/asc-desc-temizle.js kuru|uygula'); process.exit(1); }

  const r = await api('GET', `/appStoreVersions/${VERSION_ID}/appStoreVersionLocalizations?limit=50&fields[appStoreVersionLocalizations]=locale,description`);
  if (r.status !== 200) { console.log('LİSTE HATASI', r.status, JSON.stringify(r.json)); process.exit(1); }
  const liste = r.json.data;
  console.log('dil sayısı:', liste.length, '\n');

  const isler = [];
  for (const d of liste) {
    const loc = d.attributes.locale;
    if (!YASAK.test(d.attributes.description) && !d.attributes.description.includes('�')) {
      console.log(loc.padEnd(8), '— zaten temiz, atlanıyor');
      continue;
    }
    const yeni = temizle(d.attributes.description, loc); // hata olursa burada patlar, hiçbir şey yazılmaz
    isler.push({ id: d.id, loc, eski: d.attributes.description, yeni });
  }
  if (!isler.length) { console.log('\n✅ yapılacak iş yok, 20 dil de temiz'); return; }
  console.log('\n✅ ' + isler.length + ' dil sorunsuz temizlendi (henüz yazılmadı)\n');
  for (const i of isler) console.log(i.loc.padEnd(8), i.eski.length + ' → ' + i.yeni.length + ' karakter');
  console.log('\n--- ÖNİZLEME (' + isler[0].loc + ') ---\n' + isler[0].yeni + '\n---');

  if (mod === 'kuru') { console.log('\n(kuru deneme — ASC\'ye YAZILMADI)'); return; }

  console.log('\n=== YAZILIYOR ===');
  for (const i of isler) {
    const p = await api('PATCH', `/appStoreVersionLocalizations/${i.id}`,
      { data: { type: 'appStoreVersionLocalizations', id: i.id, attributes: { description: i.yeni } } });
    console.log(i.loc.padEnd(8), p.status === 200 ? 'OK' : 'HATA ' + p.status + ' ' + JSON.stringify(p.json.errors || p.json));
  }

  console.log('\n=== GERİ OKUMA DOĞRULAMASI ===');
  const r2 = await api('GET', `/appStoreVersions/${VERSION_ID}/appStoreVersionLocalizations?limit=50&fields[appStoreVersionLocalizations]=locale,description`);
  let kirli = 0;
  for (const d of r2.json.data) {
    const m = d.attributes.description.match(YASAK);
    if (m) { console.log('❌', d.attributes.locale, 'hâlâ içeriyor:', m[0]); kirli++; }
    if (d.attributes.description.includes('�')) { console.log('❌', d.attributes.locale, 'bozuk karakter (U+FFFD)'); kirli++; }
  }
  console.log(kirli === 0 ? '✅ ' + r2.json.data.length + '/' + r2.json.data.length + ' dil temiz — Android/marka referansı ve bozuk karakter yok'
                          : '❌ ' + kirli + ' dilde sorun var');
})();
