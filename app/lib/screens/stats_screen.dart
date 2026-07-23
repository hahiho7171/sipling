import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/goal_calculator.dart';
import '../data/models.dart';
import '../data/store.dart';
import '../l10n/labels.dart';
import '../services/ads_service.dart';
import '../theme.dart';
import 'achievements_screen.dart';
import 'wrapped_screen.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  int _range = 7; // 7 veya 30 gün

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final l = context.l;
    final p = Palette.of(context);
    final days = state.lastDays(_range);
    final logged = days.where((d) => d.sips.isNotEmpty).toList();

    final avg = logged.isEmpty
        ? 0
        : (logged.fold(0, (a, d) => a + d.rawMl) / logged.length).round();
    final completed = days.where((d) => d.completed).length;
    final bmi = calculateBmi(state.profile);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 16, 18, 24),
          children: [
            Row(
              children: [
                Text(l.statsTitle,
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: p.ink)),
                const Spacer(),
                _RangeToggle(
                  value: _range,
                  onChanged: (v) => setState(() => _range = v),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: _StatCard(
                        label: l.statsDailyAverage,
                        value: '$avg',
                        unit: 'ml',
                        icon: Icons.water_drop_outlined)),
                const SizedBox(width: 12),
                Expanded(
                    child: _StatCard(
                        label: l.statsGoalDays,
                        value: '$completed',
                        unit: '/ $_range',
                        icon: Icons.check_circle_outline)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                    child: _StatCard(
                        label: l.statsCurrentStreak,
                        value: '${state.currentStreak}',
                        unit: l.statsUnitDays,
                        icon: Icons.local_fire_department,
                        tint: SiplingColors.streak)),
                const SizedBox(width: 12),
                Expanded(
                    child: _StatCard(
                        label: l.statsTotalTrees,
                        value: '${state.totalTrees}',
                        unit: '',
                        icon: Icons.park_outlined,
                        tint: SiplingColors.leafDark)),
              ],
            ),
            const SizedBox(height: 20),
            Text(l.statsLastDays(_range),
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700, color: p.ink)),
            const SizedBox(height: 12),
            Container(
              height: 190,
              padding: const EdgeInsets.fromLTRB(10, 16, 10, 8),
              decoration: BoxDecoration(
                color: p.card,
                borderRadius: BorderRadius.circular(20),
                boxShadow: softShadow(p.dark),
              ),
              child: _BarChart(days: days, palette: p),
            ),
            const SizedBox(height: 20),
            Text(l.statsYourDrinks,
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700, color: p.ink)),
            const SizedBox(height: 12),
            _DrinkBreakdown(days: days, palette: p),
            const SizedBox(height: 20),
            _BmiCard(bmi: bmi, palette: p),
            const SizedBox(height: 12),
            _AchievementsButton(count: state.unlockedAchievements.length),
            const SizedBox(height: 12),
            _WrappedButton(palette: p),
            // Banner reklam (yalnız ücretsiz kullanıcı; Pro/web'de boş kutu).
            // `const` → İstatistik yeniden çizilse de reklam yeniden yüklenmez.
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Center(child: _StatsBanner()),
            ),
          ],
        ),
      ),
    );
  }
}

/// İzleyici sarmalayıcı: Pro alınınca reklam anında kalksın diye `isPro`'yu dinler.
class _StatsBanner extends StatelessWidget {
  const _StatsBanner();
  @override
  Widget build(BuildContext context) {
    context.watch<AppState>(); // isPro değişince yeniden çiz
    return AdsService.banner();
  }
}

class _RangeToggle extends StatelessWidget {
  final int value;
  final ValueChanged<int> onChanged;
  const _RangeToggle({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    final p = Palette.of(context);
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: p.card,
        borderRadius: BorderRadius.circular(12),
        boxShadow: softShadow(p.dark),
      ),
      child: Row(
        children: [
          for (final r in [7, 30])
            GestureDetector(
              onTap: () => onChanged(r),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: value == r ? SiplingColors.water : Colors.transparent,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Text(l.statsRangeDays(r),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: value == r ? Colors.white : p.inkSoft,
                    )),
              ),
            ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final IconData icon;
  final Color? tint;

  const _StatCard({
    required this.label,
    required this.value,
    required this.unit,
    required this.icon,
    this.tint,
  });

  @override
  Widget build(BuildContext context) {
    final p = Palette.of(context);
    final color = tint ?? SiplingColors.water;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: p.card,
        borderRadius: BorderRadius.circular(18),
        boxShadow: softShadow(p.dark),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: value,
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.w700, color: p.ink),
              ),
              TextSpan(
                text: unit.isEmpty ? '' : ' $unit',
                style: TextStyle(fontSize: 12, color: p.inkSoft),
              ),
            ]),
          ),
          const SizedBox(height: 2),
          Text(label, style: TextStyle(fontSize: 12, color: p.inkSoft)),
        ],
      ),
    );
  }
}

/// Hedef çizgisi + günlük çubuklar. Hedefi geçen günler yeşil.
class _BarChart extends StatelessWidget {
  final List<DayRecord> days;
  final Palette palette;
  const _BarChart({required this.days, required this.palette});

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    final weekdays = [
      l.statsWeekdayMon,
      l.statsWeekdayTue,
      l.statsWeekdayWed,
      l.statsWeekdayThu,
      l.statsWeekdayFri,
      l.statsWeekdaySat,
      l.statsWeekdaySun,
    ];
    final maxVal = days.fold<double>(
        1,
        (m, d) => [m, d.totalMl, d.effectiveGoalMl.toDouble()]
            .reduce((a, b) => a > b ? a : b));

    return Column(
      children: [
        Expanded(
          child: LayoutBuilder(
            builder: (context, c) {
              final goalY = days.isEmpty
                  ? 0.0
                  : c.maxHeight * (1 - days.first.effectiveGoalMl / maxVal);
              return Stack(
                children: [
                  Positioned(
                    top: goalY,
                    left: 0,
                    right: 0,
                    child: CustomPaint(
                      size: Size(c.maxWidth, 1),
                      painter: _DashedLine(palette.inkSoft.withValues(alpha: 0.4)),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      for (final d in days)
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: days.length > 10 ? 1 : 4),
                            child: Container(
                              height: (c.maxHeight * (d.totalMl / maxVal))
                                  .clamp(2.0, c.maxHeight),
                              decoration: BoxDecoration(
                                color: d.completed
                                    ? SiplingColors.leafDark
                                    : SiplingColors.water
                                        .withValues(alpha: 0.55),
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(days.length > 10 ? 2 : 5)),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 6),
        if (days.length <= 10)
          Row(
            children: [
              for (final d in days)
                Expanded(
                  child: Text(
                    weekdays[DateTime.parse(d.dateKey).weekday - 1],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10, color: palette.inkSoft),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}

class _DashedLine extends CustomPainter {
  final Color color;
  const _DashedLine(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;
    for (double x = 0; x < size.width; x += 8) {
      canvas.drawLine(Offset(x, 0), Offset(x + 4, 0), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _DashedLine old) => false;
}

class _DrinkBreakdown extends StatelessWidget {
  final List<DayRecord> days;
  final Palette palette;
  const _DrinkBreakdown({required this.days, required this.palette});

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    final totals = <DrinkType, int>{};
    for (final d in days) {
      for (final s in d.sips) {
        totals[s.type] = (totals[s.type] ?? 0) + s.ml;
      }
    }
    if (totals.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: palette.card,
          borderRadius: BorderRadius.circular(18),
          boxShadow: softShadow(palette.dark),
        ),
        child: Text(l.statsNoRecords,
            style: TextStyle(fontSize: 13, color: palette.inkSoft)),
      );
    }

    final grand = totals.values.fold(0, (a, b) => a + b);
    final sorted = totals.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: palette.card,
        borderRadius: BorderRadius.circular(18),
        boxShadow: softShadow(palette.dark),
      ),
      child: Column(
        children: [
          for (final e in sorted)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Icon(e.key.icon, size: 18, color: e.key.color),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 84,
                    child: Text(e.key.label(l),
                        style: TextStyle(fontSize: 13, color: palette.ink)),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: e.value / grand,
                        minHeight: 7,
                        backgroundColor: palette.inkSoft.withValues(alpha: 0.12),
                        valueColor: AlwaysStoppedAnimation(e.key.color),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text('${e.value} ml',
                      style: TextStyle(fontSize: 12, color: palette.inkSoft)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _BmiCard extends StatelessWidget {
  final double bmi;
  final Palette palette;
  const _BmiCard({required this.bmi, required this.palette});

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: palette.card,
        borderRadius: BorderRadius.circular(18),
        boxShadow: softShadow(palette.dark),
      ),
      child: Row(
        children: [
          Icon(Icons.monitor_weight_outlined, color: palette.inkSoft, size: 20),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l.statsBmiTitle,
                  style: TextStyle(fontSize: 13, color: palette.inkSoft)),
              Text('${bmi.toStringAsFixed(1)} · ${bmiLabelOf(l, bmi)}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: palette.ink)),
            ],
          ),
          const Spacer(),
          Flexible(
            child: Text(l.statsBmiDisclaimer,
                // .end: RTL'de metin otomatik sola hizalanır.
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 10, color: palette.inkSoft)),
          ),
        ],
      ),
    );
  }
}

class _AchievementsButton extends StatelessWidget {
  final int count;
  const _AchievementsButton({required this.count});

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    final p = Palette.of(context);
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const AchievementsScreen()),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: p.card,
          borderRadius: BorderRadius.circular(18),
          boxShadow: softShadow(p.dark),
        ),
        child: Row(
          children: [
            const Icon(Icons.emoji_events_outlined,
                color: SiplingColors.streak, size: 20),
            const SizedBox(width: 12),
            Text(l.statsAchievements,
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w600, color: p.ink)),
            const Spacer(),
            Text(l.statsAchievementsEarned(count),
                style: TextStyle(fontSize: 13, color: p.inkSoft)),
            const SizedBox(width: 6),
            Icon(Icons.chevron_right, color: p.inkSoft, size: 20),
          ],
        ),
      ),
    );
  }
}

/// "Orman Özetin" — paylaşılabilir yıllık özet kartına götürür.
class _WrappedButton extends StatelessWidget {
  final Palette palette;
  const _WrappedButton({required this.palette});

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const WrappedScreen()),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              SiplingColors.leaf.withValues(alpha: 0.18),
              SiplingColors.water.withValues(alpha: 0.14),
            ],
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: softShadow(palette.dark),
        ),
        child: Row(
          children: [
            const Icon(Icons.auto_awesome,
                color: SiplingColors.leafDark, size: 20),
            const SizedBox(width: 12),
            Text(l.wrappedTitle,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: palette.ink)),
            const Spacer(),
            Icon(Icons.share_outlined, color: palette.inkSoft, size: 18),
          ],
        ),
      ),
    );
  }
}
