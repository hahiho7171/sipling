# 🖥️ Sipling'e özel tarayıcı — port 9360

> 🚨 **Port 9334'e DOKUNMA.** O, Randevio'nun debug-Chrome'u; Play Console oturumu orada açık
> ve kapatılmamalı. Sipling'in her tarayıcı işi **yalnız 9360'ta** yapılır.

## Port haritası (çakışma yok)

| Port | Proje | Profil |
|---|---|---|
| 9222 | Kling / Suno | `avm-profile` |
| 9334 | **Randevio** (Play Console girişli) | `randevio-play-profile` |
| 9340 | Kaldıraç | `proof-profile` |
| 9350 | Loaf | `loaf-profile` |
| **9360** | **Sipling** | `sipling-profile` |

## Kullanım

```bash
cd /c/Users/asim_/Desktop/CloudWork/Sipling

bash tools/baslat.sh                                     # tarayıcıyı aç (açıksa dokunmaz)

node tools/tarayici.js ac    http://localhost:8792        # sayfayı aç
node tools/tarayici.js foto  http://localhost:8792 x.png  # 390×844 telefon boyutunda foto
node tools/tarayici.js foto  - x.png                      # mevcut sayfadan foto
node tools/tarayici.js tikla 195 798                      # koordinata tıkla
node tools/tarayici.js js    "localStorage.length"        # sayfada JS çalıştır
```

## Hangi MCP? (2026-07-27'de güncellendi — eski "MCP kullanma" kuralı ARTIK EKSİK)

İki ayrı MCP var, karıştırma:

| MCP adı | Bağlı port | Kullan? |
|---|---|---|
| `playwright` (`~/.claude.json`, **genel**) | **9334** = Randevio (Play Console oturumlu) | 🚫 **ASLA** |
| **`sipling-tarayici`** (proje kökü `.mcp.json`) | **9360** = Sipling | ✅ **Bunu kullan** |

```json
// Sipling/.mcp.json
{ "mcpServers": { "sipling-tarayici": {
    "command": "npx", "args": ["-y", "@playwright/mcp@latest", "--cdp-endpoint", "http://localhost:9360"] } } }
```

➡️ Araç adları `mcp__sipling-tarayici__browser_*`. Önce `bash tools/baslat.sh` ile tarayıcıyı aç.
Erişilebilirlik ağacı + `browser_evaluate` işleri çok hızlandırıyor (2026-07-27 ASO işi bununla yapıldı).
Kendi sürücüsü `tools/tarayici.js` de duruyor (foto/koordinat tıklama için pratik).

🪤 **Play Console'da MCP tıklaması sık takılıyor** (yapışkan başlık pointer olaylarını yutuyor)
→ orada `browser_evaluate` içinden **DOM tıklaması** (`el.click()`) kullan. Detay `wiki/08`.

## Notlar

- `tarayici.js` sonundaki `browser.close()` yalnız **CDP bağlantısını** keser; Chrome penceresi açık kalır.
- Profil ayrı olduğu için Sipling'in `localStorage`'ı da ayrı — web önizlemesindeki veriler
  Randevio profilindekilerle karışmaz.
- Flutter web canvas'a çizdiği için erişilebilirlik ağacı boştur → **koordinatla tıklanır**,
  bu ortamda normaldir.
- Web önizlemesine sahte geçmiş yüklemek için: `wiki/02-kod-haritasi.md` → "Veri saklama"
  bölümündeki çift-JSON uyarısına bak.


## 🔌 Sipling'e özel Playwright MCP (2026-07-10)

`.mcp.json` (proje kökü) → **`sipling-tarayici`** sunucusu, `--cdp-endpoint http://localhost:9360`.
Yalnız bu projede görünür; Randevio'nun 9334'üne bağlı global `playwright` sunucusuna dokunulmadı.

```bash
claude mcp add --scope project sipling-tarayici --   npx -y @playwright/mcp@latest --cdp-endpoint http://localhost:9360
```

⚠️ MCP araçları **oturum başında** yüklenir; ekledikten sonra Claude'u yeniden başlat.
⚠️ Önce `bash tools/baslat.sh` ile 9360 açık olmalı, yoksa MCP bağlanamaz.

### MCP mi, kendi betiğim mi?
Play Console gibi **doğrulama isteyen** işlerde (paket adı, karakter sınırı, dosya yükleme)
kendi CDP betikleri daha güvenli: her adımda `assert` koyup yanlış değeri geri okuyabiliyorum.
MCP hızlı gezinme ve keşif için pratik. İkisi de aynı tarayıcıyı (9360) kullanır.

🚨 **`browser.close()` çağırma.** CDP ile bağlanınca Playwright'ın `close()`'u Chrome'u kapatır.
🚨 `page.screenshot()` cihaz ölçeğini yok sayar; tam çözünürlük için CDP `Page.captureScreenshot`.
