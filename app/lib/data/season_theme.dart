import 'package:flutter/material.dart';

import 'tree_species.dart';

/// Bir mevsimin orman ekranında kullandığı renkler. Açık ve koyu tema için
/// ayrı ayrı verilir — koyu temada aynı renkler okunmaz hale gelir.
class SeasonColors {
  final Color skyTop;
  final Color skyBottom;
  final Color hillFar;
  final Color hillNear;

  /// Ağaçların dibindeki gölge. Mevsimle değişmezse kışın karın üstünde
  /// yeşil bir leke kalır — sabit yeşil gölge ilk denemede öyle görünmüştü.
  final Color shadow;

  const SeasonColors({
    required this.skyTop,
    required this.skyBottom,
    required this.hillFar,
    required this.hillNear,
    required this.shadow,
  });
}

/// Orman ekranının mevsimlik görünümü. **Tamamen kozmetik** — takibi, hedefi,
/// seriyi, ağaç türlerini hiçbir şekilde etkilemez.
///
/// Ağacın kendisi yeniden çizilmez: [tint] ile ağaç türünün yeşil tonları
/// mevsimin rengine doğru karıştırılır (sonbaharda turuncu, kışta karlı gri).
/// Böylece `tree_painter.dart`'a dokunmadan bütün türler mevsime uyar.
/// Ad ve açıklama taşımaz — `l10n/labels.dart` → `theme.name(context.l)`.
class SeasonTheme {
  final String id;
  final IconData icon;
  final SeasonColors light;
  final SeasonColors dark;

  /// Yaprakların karışacağı renk. `null` ise ağaç kendi rengiyle çizilir.
  final Color? leafTint;

  /// Karışım oranı: 0 = hiç, 1 = tamamen mevsim rengi.
  final double leafTintAmount;

  final bool proOnly;

  const SeasonTheme({
    required this.id,
    required this.icon,
    required this.light,
    required this.dark,
    this.leafTint,
    this.leafTintAmount = 0,
    this.proOnly = true,
  });

  SeasonColors colors(bool isDark) => isDark ? dark : light;

  /// Ağaç türünün yapraklarını mevsime boyar. Gövde rengine dokunmaz.
  TreeSpecies tint(TreeSpecies s) {
    final t = leafTint;
    if (t == null || leafTintAmount <= 0) return s;
    Color mix(Color c) => Color.lerp(c, t, leafTintAmount)!;
    return TreeSpecies(
      id: s.id,
      shape: s.shape,
      dark: mix(s.dark),
      main: mix(s.main),
      light: mix(s.light),
      trunk: s.trunk,
      rule: s.rule,
      threshold: s.threshold,
    );
  }
}

/// Takvime göre mevsim seçen özel tema. Renkleri kendi başına taşımaz;
/// [resolveSeason] onu gerçek bir mevsimle değiştirir.
const kSeasonAuto = SeasonTheme(
  id: 'auto',
  icon: Icons.auto_awesome,
  light: SeasonColors(
    skyTop: Color(0xFFEAF6FC),
    skyBottom: Color(0xFFDDF0E4),
    hillFar: Color(0xFFCDE9D6),
    hillNear: Color(0xFFB9E0C7),
    shadow: Color(0xFF2F8F5B),
  ),
  dark: SeasonColors(
    skyTop: Color(0xFF23394A),
    skyBottom: Color(0xFF1E3830),
    hillFar: Color(0xFF25453A),
    hillNear: Color(0xFF2C5244),
    shadow: Color(0xFF7ACB9F),
  ),
);

/// Uygulamanın ilk günden beri kullandığı görünüm. Tek ücretsiz tema.
const kSeasonClassic = SeasonTheme(
  id: 'classic',
  icon: Icons.forest,
  proOnly: false,
  light: SeasonColors(
    skyTop: Color(0xFFEAF6FC),
    skyBottom: Color(0xFFDDF0E4),
    hillFar: Color(0xFFCDE9D6),
    hillNear: Color(0xFFB9E0C7),
    shadow: Color(0xFF2F8F5B),
  ),
  dark: SeasonColors(
    skyTop: Color(0xFF23394A),
    skyBottom: Color(0xFF1E3830),
    hillFar: Color(0xFF25453A),
    hillNear: Color(0xFF2C5244),
    shadow: Color(0xFF7ACB9F),
  ),
);

const kSeasonSpring = SeasonTheme(
  id: 'spring',
  icon: Icons.local_florist,
  leafTint: Color(0xFF8FE0A8),
  leafTintAmount: 0.28,
  light: SeasonColors(
    skyTop: Color(0xFFF3FBF5),
    skyBottom: Color(0xFFE1F5E8),
    hillFar: Color(0xFFC9EBD3),
    hillNear: Color(0xFFA9DEBB),
    shadow: Color(0xFF2F8F5B),
  ),
  dark: SeasonColors(
    skyTop: Color(0xFF203A2E),
    skyBottom: Color(0xFF182C24),
    hillFar: Color(0xFF244438),
    hillNear: Color(0xFF2B5343),
    shadow: Color(0xFF8FE0A8),
  ),
);

const kSeasonSummer = SeasonTheme(
  id: 'summer',
  icon: Icons.wb_sunny_outlined,
  leafTint: Color(0xFF2F8F5B),
  leafTintAmount: 0.20,
  light: SeasonColors(
    skyTop: Color(0xFFE6F6FF),
    skyBottom: Color(0xFFD6EFDC),
    hillFar: Color(0xFFBCE5C7),
    hillNear: Color(0xFF9FD6AF),
    shadow: Color(0xFF267A4B),
  ),
  dark: SeasonColors(
    skyTop: Color(0xFF1F3746),
    skyBottom: Color(0xFF1B3129),
    hillFar: Color(0xFF224036),
    hillNear: Color(0xFF294E40),
    shadow: Color(0xFF6FC495),
  ),
);

const kSeasonAutumn = SeasonTheme(
  id: 'autumn',
  icon: Icons.park,
  leafTint: Color(0xFFE08A3C),
  leafTintAmount: 0.62,
  light: SeasonColors(
    skyTop: Color(0xFFFFF4E6),
    skyBottom: Color(0xFFF6E4D0),
    hillFar: Color(0xFFE8CDA4),
    hillNear: Color(0xFFD8B183),
    shadow: Color(0xFF8A5A2B),
  ),
  dark: SeasonColors(
    skyTop: Color(0xFF3A2C22),
    skyBottom: Color(0xFF2A2018),
    hillFar: Color(0xFF463225),
    hillNear: Color(0xFF573E2C),
    shadow: Color(0xFFC9975E),
  ),
);

const kSeasonWinter = SeasonTheme(
  id: 'winter',
  icon: Icons.ac_unit,
  // 0.48'de kırmızı/pembe yapraklı türler (akçaağaç, sakura) somon rengine
  // dönüyordu. 0.60'ta hepsi kar altında soğumuş gibi duruyor.
  leafTint: Color(0xFFC6DCE6),
  leafTintAmount: 0.60,
  light: SeasonColors(
    skyTop: Color(0xFFEFF7FC),
    skyBottom: Color(0xFFE2EEF5),
    hillFar: Color(0xFFEAF2F7),
    hillNear: Color(0xFFD3E4EE),
    shadow: Color(0xFF5A7A8A),
  ),
  dark: SeasonColors(
    skyTop: Color(0xFF1E2C38),
    skyBottom: Color(0xFF16212B),
    hillFar: Color(0xFF27394A),
    hillNear: Color(0xFF31465A),
    shadow: Color(0xFF9FB4C0),
  ),
);

/// Ayarlar ekranındaki sıra. `classic` ücretsiz, gerisi Pro.
const kSeasonThemes = <SeasonTheme>[
  kSeasonClassic,
  kSeasonAuto,
  kSeasonSpring,
  kSeasonSummer,
  kSeasonAutumn,
  kSeasonWinter,
];

SeasonTheme seasonById(String id) =>
    kSeasonThemes.firstWhere((s) => s.id == id, orElse: () => kSeasonClassic);

/// Takvim ayından mevsim (kuzey yarımküre — uygulamanın ilk pazarı Türkiye).
SeasonTheme seasonForMonth(int month) => switch (month) {
      3 || 4 || 5 => kSeasonSpring,
      6 || 7 || 8 => kSeasonSummer,
      9 || 10 || 11 => kSeasonAutumn,
      _ => kSeasonWinter,
    };

/// Seçilen temayı gerçek renklere çevirir: `auto` ise bugünün mevsimi.
SeasonTheme resolveSeason(String id, DateTime now) =>
    id == kSeasonAuto.id ? seasonForMonth(now.month) : seasonById(id);
