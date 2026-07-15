import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/models.dart';
import '../data/season_theme.dart';
import '../data/store.dart';
import '../data/tree_species.dart';
import '../l10n/labels.dart';
import '../theme.dart';
import '../widgets/tree_painter.dart';
import 'species_screen.dart';

/// Geçmiş günlerin ağaçları. Hedefi tutturulan gün = tam ağaç,
/// yarım kalan gün = o oranda fidan. Kuruyan/ölen ağaç YOK — ceza yok.
class ForestScreen extends StatelessWidget {
  const ForestScreen({super.key});

  static const _windowDays = 60;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final l = context.l;
    final p = Palette.of(context);
    final days = state.lastDays(_windowDays);
    final grown = days.where((d) => d.sips.isNotEmpty).toList();
    // Mevsim yalnız burayı boyar; hesap, hedef ve seri etkilenmez.
    final season = state.seasonTheme;
    final sc = season.colors(p.dark);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              // Directional: RTL'de 20'lik boşluk sağa geçsin.
              padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 12, 4),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l.forestTitle,
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                              color: p.ink)),
                      const SizedBox(height: 2),
                      Text(
                          l.forestSubtitle(state.totalTrees, state.bestStreak),
                          style: TextStyle(fontSize: 13, color: p.inkSoft)),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    tooltip: l.forestSpeciesTooltip,
                    icon: const Icon(Icons.park_outlined),
                    color: p.ink,
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SpeciesScreen()),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(14, 12, 14, 14),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [sc.skyTop, sc.skyBottom],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(child: CustomPaint(painter: _HillsPainter(sc))),
                    if (grown.isEmpty)
                      _EmptyForest(palette: p)
                    else
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GridView.builder(
                          shrinkWrap: true,
                          reverse: true,
                          padding: const EdgeInsets.fromLTRB(6, 14, 6, 18),
                          itemCount: grown.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 0.82,
                          ),
                          itemBuilder: (context, i) {
                            // reverse:true → i=0 en alt satırın solu = en yeni gün.
                            final day = grown[grown.length - 1 - i];
                            return _ForestTree(
                                day: day, seed: i, season: season, colors: sc);
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyForest extends StatelessWidget {
  final Palette palette;
  const _EmptyForest({required this.palette});

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.grass, size: 46, color: palette.inkSoft),
            const SizedBox(height: 12),
            Text(l.forestEmptyTitle,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: palette.ink)),
            const SizedBox(height: 6),
            Text(l.forestEmptyBody,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: palette.inkSoft)),
          ],
        ),
      ),
    );
  }
}

class _ForestTree extends StatelessWidget {
  final DayRecord day;
  final int seed;
  final SeasonTheme season;
  final SeasonColors colors;
  const _ForestTree({
    required this.day,
    required this.seed,
    required this.season,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    // Aynı boyda 60 ağaç yapay durur; her ağaca küçük, sabit bir ölçek verilir.
    final rnd = math.Random(seed * 7 + 3);
    final scale = 0.86 + rnd.nextDouble() * 0.22;

    return Tooltip(
      message: '${day.dateKey} · ${day.rawMl} ml',
      child: Align(
        alignment: Alignment.bottomCenter,
        child: FractionallySizedBox(
          widthFactor: 1,
          heightFactor: scale.clamp(0.0, 1.0),
          // Gölge arkada, ağaç önde. SizedBox.expand olmadan CustomPaint
          // sıfır genişliğe düşer ve ağaç çizilmez.
          child: CustomPaint(
            painter: _ShadowPainter(growth: day.progress, color: colors.shadow),
            foregroundPainter: TreePainter(
              growth: day.progress,
              seed: seed,
              // Ağacın türü değişmez, yalnız yaprakları mevsime boyanır.
              species: season.tint(speciesById(day.treeSpeciesId)),
            ),
            child: const SizedBox.expand(),
          ),
        ),
      ),
    );
  }
}

/// Ağacın dibindeki yumuşak gölge — ağaçları zemine oturtur.
/// Rengi mevsimden gelir; sabit yeşil bırakılırsa karın üstünde yeşil leke olur.
class _ShadowPainter extends CustomPainter {
  final double growth;
  final Color color;
  const _ShadowPainter({required this.growth, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (growth < 0.05) return;
    final w = size.width * 0.42 * growth.clamp(0.3, 1.0);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.87),
        width: w,
        height: w * 0.26,
      ),
      Paint()
        ..color = color.withValues(alpha: 0.13)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2),
    );
  }

  @override
  bool shouldRepaint(covariant _ShadowPainter old) =>
      old.growth != growth || old.color != color;
}

/// Arka plandaki yumuşak tepeler — ormana derinlik verir.
/// Renkleri mevsim temasından gelir (`data/season_theme.dart`).
class _HillsPainter extends CustomPainter {
  final SeasonColors colors;
  const _HillsPainter(this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    final farColor = colors.hillFar;
    final nearColor = colors.hillNear;

    canvas.drawPath(
      Path()
        ..moveTo(0, size.height * 0.62)
        ..quadraticBezierTo(size.width * 0.28, size.height * 0.52,
            size.width * 0.55, size.height * 0.63)
        ..quadraticBezierTo(size.width * 0.82, size.height * 0.72, size.width,
            size.height * 0.6)
        ..lineTo(size.width, size.height)
        ..lineTo(0, size.height)
        ..close(),
      Paint()..color = farColor,
    );

    canvas.drawPath(
      Path()
        ..moveTo(0, size.height * 0.82)
        ..quadraticBezierTo(size.width * 0.35, size.height * 0.74,
            size.width * 0.68, size.height * 0.84)
        ..quadraticBezierTo(size.width * 0.9, size.height * 0.9, size.width,
            size.height * 0.84)
        ..lineTo(size.width, size.height)
        ..lineTo(0, size.height)
        ..close(),
      Paint()..color = nearColor,
    );
  }

  @override
  bool shouldRepaint(covariant _HillsPainter old) =>
      old.colors.hillFar != colors.hillFar ||
      old.colors.hillNear != colors.hillNear;
}
