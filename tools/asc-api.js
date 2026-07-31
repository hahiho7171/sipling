// App Store Connect REST API sürücüsü (JWT ES256, .p8 ile). Tarayıcısız, doğrulanabilir.
// Kullanım: node tools/asc-api.js <komut> [args]
//   state                         mevcut sürüm/build/inceleme durumunu oku
//   raw <METHOD> <path> [jsonBody] ham istek
const crypto = require('crypto');
const fs = require('fs');
const https = require('https');

const KEY_ID = 'JYW9GVD5XJ';
const ISS = 'ce8ece0f-3696-4b3a-96e3-32a060b4e4f8';
const APP_ID = '6789913186';
const P8_PATH = 'C:/Users/asim_/.playwright-mcp/AuthKey-JYW9GVD5XJ.p8';

function b64url(buf) {
  return Buffer.from(buf).toString('base64').replace(/=/g, '').replace(/\+/g, '-').replace(/\//g, '_');
}
function token() {
  const p8 = fs.readFileSync(P8_PATH, 'utf8');
  const header = b64url(JSON.stringify({ alg: 'ES256', kid: KEY_ID, typ: 'JWT' }));
  const now = Math.floor(Date.now() / 1000);
  const payload = b64url(JSON.stringify({ iss: ISS, iat: now, exp: now + 1000, aud: 'appstoreconnect-v1' }));
  const signingInput = header + '.' + payload;
  const sig = crypto.sign('sha256', Buffer.from(signingInput), { key: p8, dsaEncoding: 'ieee-p1363' });
  return signingInput + '.' + b64url(sig);
}
function api(method, path, body) {
  return new Promise((resolve, reject) => {
    const data = body ? JSON.stringify(body) : null;
    const req = https.request(
      { hostname: 'api.appstoreconnect.apple.com', path: '/v1' + path, method,
        headers: { Authorization: 'Bearer ' + token(), 'Content-Type': 'application/json',
          ...(data ? { 'Content-Length': Buffer.byteLength(data) } : {}) } },
      (res) => { let b = ''; res.on('data', (c) => (b += c));
        res.on('end', () => { let j; try { j = b ? JSON.parse(b) : {}; } catch (e) { j = { raw: b }; }
          resolve({ status: res.statusCode, json: j }); }); }
    );
    req.on('error', reject);
    if (data) req.write(data);
    req.end();
  });
}

(async () => {
  const [cmd, ...arg] = process.argv.slice(2);
  if (cmd === 'raw') {
    const r = await api(arg[0], arg[1], arg[2] ? JSON.parse(arg[2]) : undefined);
    console.log(r.status, JSON.stringify(r.json, null, 1));
    return;
  }
  if (cmd === 'state') {
    const vers = await api('GET', `/apps/${APP_ID}/appStoreVersions?limit=6&fields[appStoreVersions]=versionString,appStoreState,platform,createdDate`);
    console.log('=== VERSIONS ===', vers.status);
    for (const v of vers.json.data || []) console.log(' ', v.id, v.attributes.platform, v.attributes.versionString, v.attributes.appStoreState);
    const builds = await api('GET', `/apps/${APP_ID}/builds?limit=5&sort=-uploadedDate&fields[builds]=version,processingState,uploadedDate&include=preReleaseVersion`);
    console.log('=== BUILDS ===', builds.status);
    for (const b of builds.json.data || []) console.log(' ', b.id, 'build#' + b.attributes.version, b.attributes.processingState, b.attributes.uploadedDate);
    const subs = await api('GET', `/reviewSubmissions?filter[app]=${APP_ID}&filter[state]=READY_FOR_REVIEW,WAITING_FOR_REVIEW,IN_REVIEW,UNRESOLVED_ISSUES&fields[reviewSubmissions]=state,platform`);
    console.log('=== REVIEW SUBMISSIONS ===', subs.status);
    for (const s of subs.json.data || []) console.log(' ', s.id, s.attributes.platform, s.attributes.state);
    if (subs.json.errors) console.log('  err', JSON.stringify(subs.json.errors));
    return;
  }
  console.log('komut: state | raw');
})();
