# 🎨 Tasarım sistemi ve çizim kuralları

## Palet — `app/lib/theme.dart:5`

| Rol | Açık tema | Koyu tema |
|---|---|---|
| Su | `#4FB3E8` → derin `#2E9BD6` | aynı |
| Yaprak | `#4CAF7D` · koyu `#2F8F5B` · açık `#7ACB9F` | aynı |
| Toprak | `#8D6E5A` · koyu `#6E5245` · çim `#5FBF85` | aynı |
| Gökyüzü | `#EAF6FC` → `#CDE7F5` | `#23394A` → `#1A2C39` |
| Metin | `#17384A` · soluk `#5A7A8A` | `#E6F1F6` · soluk `#9FB4C0` |
| Zemin / kart | `#F5FAFD` / beyaz | `#101C24` / `#172833` |
| Seri (ateş) | `#FF8A47` | aynı |

**Tema-duyarlı renk okumak için tek yol:** `Palette.of(context)` → `theme.dart:35`.
Ekranlarda `SiplingColors.ink` doğrudan kullanma; koyu temada okunmaz olur.

Kart gölgesi: `softShadow(dark, tint:)` → `theme.dart:75`.

## Görsel dil

- **Ağaç bir resim dosyası değil**, kodla çizilir (`widgets/tree_painter.dart`).
  Böylece her boyutta net, uygulama boyutu şişmiyor, renk/şekil parametreyle değişiyor.
- Tek bir `growth` (0..1) değeri her şeyi sürer: 0 tohum · <0.22 filiz · <0.6 fidan · 1.0 ağaç.
- **Su içmek = ağacı sulamak.** Sahnede toprağın altındaki su, ilerlemeyle yükselir.
- İlerleme halkası boşken **mavi**, hedefte **yeşil**: `Color.lerp(water, leafDark, progress)`.
- Kutlama sadece hedef ilk kez tamamlandığında çıkar (`store.dart:130` `justCompletedToday`).

## Ton

- **Ceza yok.** Ağaç kurumaz, "kaybettin" yazmaz. Yarım gün yarım fidan olarak kalır.
- Tempo ipucu suçlamaz: "539 ml geridesin — **telafi edilebilir**".
- Kilitli ağaç türleri **görünür** kalır (opaklık 0.5), hayalet değil — hedef olsunlar.

## 🚨 Çizim tuzakları (ikisi de bir kez yaşandı)

### 1. Sabit piksel kullanma
Bütün kalınlık ve yarıçaplar `unit = min(width, height)`'e orantılı olmalı.
Sabit piksel yazarsan küçük ağaçlar **lolipop**, büyükler **sopa** gibi görünür.
`tree_painter.dart` içinde `trunkW`, `r`, `leafSize`, gölge — hepsi `unit` çarpanı.

### 2. `CustomPaint`'e child vermezsen genişlik 0 olur
Loose constraint altında (`Align`, `Center` içinde) child'sız `CustomPaint` **sıfır genişliğe**
düşer. Sonuç: gövde ve yapraklar hiç çizilmez, yalnız sabit kalınlıktaki dallar görünür.

```dart
// YANLIŞ — ağaç kaybolur
CustomPaint(painter: _ShadowPainter(...), child: CustomPaint(painter: TreePainter(...)))

// DOĞRU
CustomPaint(
  painter: _ShadowPainter(...),
  foregroundPainter: TreePainter(...),
  child: const SizedBox.expand(),
)
```

### 3. Sahne zemini
`garden_scene.dart` → `kGroundFactor = 0.74` (toprak yüzeyi yukarıda, altta yeraltı suyuna yer var).
Orman ekranında `TreePainter` varsayılanı `0.86` kullanılır (su yok, ağaç aşağıda otursun).

## 💧 Uygulama ikonu — `app/assets/icon/`

Konsept **"damla-yaprak"**: tek şekil, tepesi su damlası ucu, gövdesi yaprak.
Dolgusu yukarıda su mavisi (`#66C2F0`), aşağıda yaprak yeşili (`#2F8F5B`) — su yeşile dönüşüyor.
Üstünde beyaz yaprak damarları. Arka plan gökyüzü gradyanı (`#EAF6FC` → `#CDE7F5`).

**Kaynak SVG'dir, PNG değil.** Üç dosya:

| Dosya | Ne için | Damla ölçeği |
|---|---|---|
| `icon.svg` | legacy Android + iOS + web + Play mağaza ikonu (arka planlı, opak) | `0.88` |
| `icon_fg.svg` | Android adaptive **ön** katman (şeffaf) | `0.90` |
| `icon_bg.svg` | Android adaptive **arka** katman (yalnız gradyan) | — |

```bash
bash tools/ikon-uret.sh              # SVG → PNG (headless Chrome, ayrı profil)
cd app && dart run flutter_launcher_icons   # PNG → android/ios/web
```

### 🚨 Ön katman ölçeğine dokunma
`flutter_launcher_icons` ön katmana **ayrıca %16 inset** uygular (`pubspec.yaml` →
`adaptive_icon_foreground_inset`). Adaptive ikonun tuvali 108dp, görünen kısım 72dp,
**garantili güvenli daire 66dp**. Damla `icon_fg.svg` içinde canvas'ın %80'i kadar yüksek:

```
damla yüksekliği (dp) = 108 × 0.803 × ölçek × (1 − 2×0.16)
0.90 → ~53dp  ✅ güvenli, legacy ikonla aynı dolgunluk
1.06 → ~63dp  ⚠️ daire maskede damlanın ucu kenara teğet
```

Değiştirirsen gerçek çıktıyı doğrula: `drawable-xxxhdpi/ic_launcher_{background,foreground}.png`
dosyalarını al, ön katmana %16 inset uygula, üst üste bindir, ortadaki %66,7'yi kırp ve
daire/squircle maskeyle bak. Telefondaki hâli budur.

## 🍂 Mevsimlik orman temaları — `data/season_theme.dart`

Yalnız **orman ekranını** boyar (Bugün sekmesindeki bahçe sahnesi değişmez).
Tamamen kozmetik: takip, hedef, seri, ağaç türleri etkilenmez.

| Tema | Kim | Yaprak karışımı |
|---|---|---|
| Klasik | **ücretsiz** | yok (özgün renkler) |
| Otomatik | Pro | takvim ayına göre mevsim (`seasonForMonth`, kuzey yarımküre) |
| İlkbahar | Pro | açık yeşil %28 |
| Yaz | Pro | koyu yeşil %20 |
| Sonbahar | Pro | turuncu %62 |
| Kış | Pro | soğuk gri-mavi %60 |

**Ağaç yeniden çizilmiyor.** `season.tint(species)` ağaç türünün üç yeşil tonunu mevsim rengine
doğru `Color.lerp`'liyor; `tree_painter.dart`'a hiç dokunulmadı. Gövde rengi değişmez.

### Öğrenilen iki şey
- **`TreePainter.shouldRepaint` yalnız `species.id`'ye bakıyordu.** Mevsim id'yi değiştirmediği
  için orman yeniden çizilmiyordu. Artık renkler de karşılaştırılıyor.
- **Gölge rengi sabit yeşildi** (`SiplingColors.leafDark`). Kışın karın üstünde yeşil leke
  bırakıyordu; gölge artık `SeasonColors.shadow`'dan geliyor.
- Kış karışımı %48'de akçaağaç/sakura'yı **somon** rengine çeviriyordu → %60.

Pro biterse `AppState.seasonTheme` sessizce Klasik'e döner (veri kaybı yok).

## Ağaç türleri — `data/tree_species.dart`

Her tür = 3 yeşil ton + gövde rengi + **kanopi şekli**:

| Şekil | Kullanan | Çizen |
|---|---|---|
| `round` | Meşe, Akçaağaç, Altın Yaprak | `_roundCanopy` — 5 daire, 3 katman |
| `blossom` | Sakura, Mor Salkım | `_roundCanopy` + `_blossomDots` (beyaz noktalar) |
| `conical` | Çam | `_conicalCanopy` — 3 üçgen katman (dal çizilmez) |
| `layered` | Akasya, Zeytin | `_layeredCanopy` — 3 yassı elips |

Yeni tür eklemek için listeye bir kayıt yeter; yeni **şekil** gerekiyorsa `CanopyShape` enum'u
ve `_drawCanopy` switch'i.
