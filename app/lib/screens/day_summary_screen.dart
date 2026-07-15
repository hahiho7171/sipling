import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../data/models.dart';
import '../data/store.dart';
import '../data/tree_species.dart';
import '../l10n/labels.dart';
import '../theme.dart';
import '../widgets/tree_painter.dart';

/// Dünün özeti. Ertesi gün uygulama ilk açıldığında bir kez çıkar.
///
/// 🚨 **Reklamın yaşayacağı tek yer burası olacak** (`wiki/09-yapilacaklar.md`).
/// Ekran geçişlerinde ve kutlamada reklam gösterilmeyecek — rakiplerin
/// bir numaralı şikâyeti bu.
///
/// Ton: hedefi kaçıran günü suçlamaz. "Kaybettin" yok, "yarım fidan" var.
class DaySummaryScreen extends StatelessWidget {
  final DayRecord day;
  const DaySummaryScreen({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    final state = context.read<AppState>();
    final l = context.l;
    final p = Palette.of(context);
    final percent = (day.progress * 100).round();
    final done = day.completed;

    return Scaffold(
      backgroundColor: p.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 10, 22, 18),
          child: Column(
            children: [
              Align(
                // Directional: Arapçada (RTL) kapat butonu sola geçmeli.
                alignment: AlignmentDirectional.centerEnd,
                child: IconButton(
                  icon: Icon(Icons.close, color: p.inkSoft),
                  onPressed: () => _close(context, state),
                ),
              ),
              Text(l.sumTitle,
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700, color: p.ink)),
              const SizedBox(height: 4),
              Text(_prettyDate(context, day.dateKey),
                  style: TextStyle(fontSize: 13, color: p.inkSoft)),

              const SizedBox(height: 10),
              SizedBox(
                height: 150,
                width: 150,
                child: CustomPaint(
                  painter: TreePainter(
                    growth: day.progress,
                    seed: day.dateKey.hashCode,
                    species: speciesById(day.treeSpeciesId),
                  ),
                  child: const SizedBox.expand(),
                ),
              ),

              Text(
                done ? l.sumTreeGrown : l.sumSaplingOnWay,
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w700, color: p.ink),
              ),
              const SizedBox(height: 6),
              Text(
                done ? l.sumBodyDone : l.sumPercent(percent),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: p.inkSoft, height: 1.4),
              ),

              const SizedBox(height: 18),
              Row(
                children: [
                  // Hedefle karşılaştırılan sayı, ham hacim değil hidrasyon
                  // katsayısı uygulanmış hâlidir. Ham hacmi "Ne içtin" kartı
                  // gösteriyor; ikisini karıştırmak "2300/2300 ama %93" gibi
                  // anlaşılmaz bir ekran doğuruyordu.
                  _Stat(
                      label: l.sumStatCounted,
                      value: '${day.totalMl.round()} ml',
                      icon: Icons.local_drink_outlined,
                      palette: p),
                  const SizedBox(width: 10),
                  _Stat(
                      label: l.sumStatGoal,
                      value: '${day.goalMl} ml',
                      icon: Icons.flag_outlined,
                      palette: p),
                  const SizedBox(width: 10),
                  _Stat(
                      label: l.sumStatStreak,
                      value: l.sumStreakDays(state.currentStreak),
                      icon: Icons.local_fire_department_outlined,
                      palette: p),
                ],
              ),

              const SizedBox(height: 16),
              _DayBreakdown(day: day, palette: p),

              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: SiplingColors.water,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: () => _close(context, state),
                  child: Text(l.sumStartToday,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _close(BuildContext context, AppState state) {
    state.markSummarySeen(day.dateKey);
    Navigator.of(context).pop();
  }

  static String _prettyDate(BuildContext context, String key) {
    final date = DateTime.tryParse(key);
    if (date == null) return key;
    return DateFormat.MMMMd(Localizations.localeOf(context).toString())
        .format(date);
  }
}

class _Stat extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Palette palette;
  const _Stat(
      {required this.label,
      required this.value,
      required this.icon,
      required this.palette});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: palette.card,
          borderRadius: BorderRadius.circular(16),
          boxShadow: softShadow(palette.dark),
        ),
        child: Column(
          children: [
            Icon(icon, size: 18, color: palette.inkSoft),
            const SizedBox(height: 6),
            Text(value,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: palette.ink)),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(fontSize: 11, color: palette.inkSoft)),
          ],
        ),
      ),
    );
  }
}

/// Günün içecek dağılımı — tek satırlık renk çubuğu.
class _DayBreakdown extends StatelessWidget {
  final DayRecord day;
  final Palette palette;
  const _DayBreakdown({required this.day, required this.palette});

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    final totals = <DrinkType, int>{};
    for (final s in day.sips) {
      totals[s.type] = (totals[s.type] ?? 0) + s.ml;
    }
    if (totals.isEmpty) return const SizedBox.shrink();
    final total = totals.values.fold(0, (a, b) => a + b);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: palette.card,
        borderRadius: BorderRadius.circular(18),
        boxShadow: softShadow(palette.dark),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l.sumWhatDrank,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: palette.ink)),
          const SizedBox(height: 10),
          // 🚨 İki tuzak birden:
          //  • `width: double.infinity` olmazsa Column'un gevşek genişlik kısıtı
          //    altında Expanded'lı Row sıfır genişliğe düşer.
          //  • `CrossAxisAlignment.stretch` olmazsa child'sız ColoredBox gevşek
          //    yükseklik kısıtında sıfır yüksekliğe düşer — çubuk görünmez.
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: SizedBox(
              width: double.infinity,
              height: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (final e in totals.entries)
                    Expanded(
                      flex: (e.value * 1000 ~/ total).clamp(1, 1000),
                      child: ColoredBox(color: e.key.color),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 14,
            runSpacing: 6,
            children: [
              for (final e in totals.entries)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 9,
                      height: 9,
                      decoration: BoxDecoration(
                          color: e.key.color, shape: BoxShape.circle),
                    ),
                    const SizedBox(width: 5),
                    Text(l.sumDrinkAmount(e.key.label(l), e.value),
                        style:
                            TextStyle(fontSize: 11, color: palette.inkSoft)),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
