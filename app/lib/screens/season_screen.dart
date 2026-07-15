import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/season_theme.dart';
import '../data/store.dart';
import '../data/tree_species.dart';
import '../l10n/labels.dart';
import '../theme.dart';
import '../widgets/tree_painter.dart';
import 'pro_screen.dart';

/// Orman temaları. Hepsi **kozmetik** — takibi, hedefi, seriyi etkilemez.
/// Klasik ücretsiz; mevsimler Pro'ya özel.
class SeasonScreen extends StatelessWidget {
  const SeasonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final l = context.l;
    final p = Palette.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l.seasonScreenTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(14, 6, 14, 24),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(6, 0, 6, 14),
            child: Text(
              l.seasonScreenIntro,
              style: TextStyle(fontSize: 13, color: p.inkSoft, height: 1.4),
            ),
          ),
          for (final s in kSeasonThemes)
            _SeasonTile(
              theme: s,
              locked: s.proOnly && !state.isPro,
              selected: state.seasonId == s.id,
              onTap: () => _onTap(context, state, s),
            ),
        ],
      ),
    );
  }

  void _onTap(BuildContext context, AppState state, SeasonTheme s) {
    if (!s.proOnly || state.isPro) {
      state.setSeason(s.id);
      return;
    }
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const ProScreen()));
  }
}

class _SeasonTile extends StatelessWidget {
  final SeasonTheme theme;
  final bool locked;
  final bool selected;
  final VoidCallback onTap;

  const _SeasonTile({
    required this.theme,
    required this.locked,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    final p = Palette.of(context);
    // "Otomatik" kendi rengi olmayan bir tema; önizlemede bugünün mevsimini göster.
    final preview = resolveSeason(theme.id, DateTime.now());

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? SiplingColors.leaf.withValues(alpha: 0.12) : p.card,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected ? SiplingColors.leafDark : Colors.transparent,
            width: 1.6,
          ),
          boxShadow: selected ? null : softShadow(p.dark),
        ),
        child: Row(
          children: [
            // Kilitli temalar görünür kalır — hedef olsunlar, hayalet değil.
            Opacity(
              opacity: locked ? 0.5 : 1,
              child: _Preview(season: preview, dark: p.dark),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(theme.icon, size: 16, color: p.inkSoft),
                      const SizedBox(width: 6),
                      Text(theme.name(l),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: p.ink)),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    locked
                        ? l.seasonScreenProOnly
                        : (selected
                            ? l.seasonScreenSelected
                            : theme.description(l)),
                    style: TextStyle(
                      fontSize: 12,
                      color: locked ? SiplingColors.streak : p.inkSoft,
                    ),
                  ),
                ],
              ),
            ),
            if (locked)
              Icon(Icons.workspace_premium, color: p.inkSoft, size: 20)
            else if (selected)
              const Icon(Icons.check_circle,
                  color: SiplingColors.leafDark, size: 20),
          ],
        ),
      ),
    );
  }
}

/// Küçük orman kesiti: gökyüzü, tepe ve mevsime boyanmış bir ağaç.
class _Preview extends StatelessWidget {
  final SeasonTheme season;
  final bool dark;
  const _Preview({required this.season, required this.dark});

  @override
  Widget build(BuildContext context) {
    final c = season.colors(dark);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 70,
        height: 66,
        child: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [c.skyTop, c.skyBottom],
                  ),
                ),
              ),
            ),
            Positioned.fill(child: CustomPaint(painter: _HillPreview(c))),
            Positioned.fill(
              child: CustomPaint(
                painter: TreePainter(
                  growth: 1,
                  seed: 3,
                  species: season.tint(kTreeSpecies.first),
                ),
                child: const SizedBox.expand(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HillPreview extends CustomPainter {
  final SeasonColors colors;
  const _HillPreview(this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(
      Path()
        ..moveTo(0, size.height * 0.72)
        ..quadraticBezierTo(size.width * 0.45, size.height * 0.6, size.width,
            size.height * 0.74)
        ..lineTo(size.width, size.height)
        ..lineTo(0, size.height)
        ..close(),
      Paint()..color = colors.hillFar,
    );
    canvas.drawPath(
      Path()
        ..moveTo(0, size.height * 0.86)
        ..quadraticBezierTo(size.width * 0.5, size.height * 0.79, size.width,
            size.height * 0.88)
        ..lineTo(size.width, size.height)
        ..lineTo(0, size.height)
        ..close(),
      Paint()..color = colors.hillNear,
    );
  }

  @override
  bool shouldRepaint(covariant _HillPreview old) =>
      old.colors.hillFar != colors.hillFar;
}
