import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/goal_calculator.dart';
import '../data/models.dart';
import '../data/store.dart';
import '../data/tree_species.dart';
import '../services/notifications.dart';
import '../theme.dart';
import '../l10n/labels.dart';
import '../widgets/add_drink_sheet.dart';
import '../widgets/boost_sheet.dart';
import '../widgets/day_log_sheet.dart';
import '../widgets/garden_scene.dart';
import 'water_needs_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _record(int ml, DrinkType type) async {
    final state = context.read<AppState>();
    await state.addSip(ml, type);

    if (state.consumeJustCompleted() && mounted) {
      await _celebrate();
    }
    // Hedef tamamlandıysa günün kalan hatırlatmaları susmalı.
    await NotificationService.reschedule(
      profile: state.profile,
      settings: state.reminder,
      todayCompleted: state.today.completed,
      cups: state.cups,
    );
    if (mounted) _showNewAchievements();
  }

  Future<void> _celebrate() async {
    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (_) => const _CelebrationDialog(),
    );
  }

  void _showNewAchievements() {
    final fresh = context.read<AppState>().takeNewAchievements();
    if (fresh.isEmpty) return;
    final l = context.l;
    final a = fresh.first;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: SiplingColors.leafDark,
        content: Row(
          children: [
            Icon(a.icon, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(l.homeNewAchievement,
                      style: const TextStyle(
                          fontSize: 11, color: Colors.white70)),
                  Text(a.title(l),
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openSheet() async {
    final result = await showModalBottomSheet<(int, DrinkType)>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Palette.of(context).bg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
      ),
      builder: (_) => const AddDrinkSheet(),
    );
    if (result != null) await _record(result.$1, result.$2);
  }

  /// "Sıcak gün / spor" — bugünün hedefine geçici ekleme.
  Future<void> _boost() async {
    final state = context.read<AppState>();
    final choice = await showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Palette.of(context).bg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
      ),
      builder: (_) => const BoostSheet(),
    );
    if (choice == null || !mounted) return;
    if (choice == 0) {
      await state.resetBoost();
    } else {
      await state.addBoost(choice);
    }
    if (!mounted) return;
    // Hedef değişti → "hedefi tutunca sus" doğru çalışsın diye yeniden planla.
    await NotificationService.reschedule(
      profile: state.profile,
      settings: state.reminder,
      todayCompleted: state.today.completed,
      cups: state.cups,
    );
  }

  /// "Bugünün kayıtları" — listeler ve tek tek silmeye izin verir.
  Future<void> _openLog() async {
    final state = context.read<AppState>();
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Palette.of(context).bg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
      ),
      builder: (_) => DayLogSheet(
        onDelete: (sip) async {
          await state.removeSip(sip);
          await NotificationService.reschedule(
            profile: state.profile,
            settings: state.reminder,
            todayCompleted: state.today.completed,
            cups: state.cups,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final l = context.l;
    final p = Palette.of(context);
    final day = state.today;
    final remaining = math.max(0, day.effectiveGoalMl - day.totalMl.round());

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _Header(
              total: day.totalMl.round(),
              goal: day.effectiveGoalMl,
              remaining: remaining,
              streak: state.currentStreak,
              boost: day.boostMl,
              onTapLog: _openLog,
            ),
            const SizedBox(height: 6),
            Expanded(
              child: Center(
                child: LayoutBuilder(
                  builder: (context, c) {
                    final d = math.min(c.maxWidth * 0.82, c.maxHeight * 0.94);
                    return SizedBox(
                      width: d,
                      height: d,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            size: Size(d, d),
                            painter: _ProgressRing(progress: day.progress),
                          ),
                          Padding(
                            padding: EdgeInsets.all(d * 0.055),
                            child: GardenScene(
                              progress: day.progress,
                              species: speciesById(day.treeSpeciesId),
                              dark: p.dark,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 4),
            _StageLabel(progress: day.progress, palette: p),
            const SizedBox(height: 4),
            _PaceHint(state: state, day: day, palette: p),
            const SizedBox(height: 14),
            _QuickAddBar(cups: state.cups, onAdd: _record, onMore: _openSheet),
            const SizedBox(height: 4),
            // Geri al + "su ihtiyacım" yan yana. Uzun dillerde taşmasın diye
            // ikisi de Flexible ve tek satıra kırpılıyor.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: TextButton.icon(
                    onPressed: day.sips.isEmpty
                        ? null
                        : () => context.read<AppState>().undoLastSip(),
                    icon: const Icon(Icons.undo, size: 18),
                    label: Text(l.homeUndoLast,
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                    style: TextButton.styleFrom(foregroundColor: p.inkSoft),
                  ),
                ),
                Flexible(
                  child: TextButton.icon(
                    onPressed: _boost,
                    icon: const Icon(Icons.wb_sunny_outlined, size: 18),
                    label: Text(l.homeBoost,
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                    style: TextButton.styleFrom(
                        foregroundColor: day.boostMl > 0
                            ? SiplingColors.streak
                            : p.inkSoft),
                  ),
                ),
                Flexible(
                  child: TextButton.icon(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => const WaterNeedsScreen(),
                      ),
                    ),
                    icon: const Icon(Icons.calculate_outlined, size: 18),
                    label: Text(l.homeCalcNeed,
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                    style: TextButton.styleFrom(foregroundColor: p.inkSoft),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}

class _StageLabel extends StatelessWidget {
  final double progress;
  final Palette palette;
  const _StageLabel({required this.progress, required this.palette});

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    final String label;
    if (progress <= 0) {
      label = l.homeStageSeed;
    } else if (progress < 0.22) {
      label = l.homeStageSprout;
    } else if (progress < 0.6) {
      label = l.homeStageSapling;
    } else if (progress < 1.0) {
      label = l.homeStageAlmost;
    } else {
      label = l.homeStageReady;
    }
    return Text(label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w600, color: palette.inkSoft));
  }
}

/// Günün neresinde olman gerektiğini söyler — suçlayıcı değil, bilgilendirici.
class _PaceHint extends StatelessWidget {
  final AppState state;
  final DayRecord day;
  final Palette palette;
  const _PaceHint(
      {required this.state, required this.day, required this.palette});

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    if (day.completed) {
      return Text(l.homePaceDone,
          style: TextStyle(fontSize: 12, color: palette.inkSoft));
    }
    final expected = expectedProgressAt(state.profile, DateTime.now());
    if (expected <= 0.05) {
      return Text(l.homePaceStart,
          style: TextStyle(fontSize: 12, color: palette.inkSoft));
    }
    final behind = expected - day.progress;
    if (behind > 0.12) {
      final ml = ((expected - day.progress) * day.goalMl).round();
      return Text(l.homePaceBehind(ml),
          style: TextStyle(fontSize: 12, color: SiplingColors.streak));
    }
    return Text(l.homePaceOnTrack,
        style: TextStyle(fontSize: 12, color: SiplingColors.leafDark));
  }
}

class _Header extends StatelessWidget {
  final int total;
  final int goal;
  final int remaining;
  final int streak;
  final int boost;
  final VoidCallback onTapLog;

  const _Header({
    required this.total,
    required this.goal,
    required this.remaining,
    required this.streak,
    required this.boost,
    required this.onTapLog,
  });

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    final p = Palette.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$total',
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                          color: p.ink,
                          height: 1.0),
                    ),
                    TextSpan(
                      text: ' / $goal ml',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: p.inkSoft),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              Text(
                remaining == 0 ? l.homeGoalDone : l.homeRemaining(remaining),
                style: TextStyle(fontSize: 13, color: p.inkSoft),
              ),
              if (boost > 0) ...[
                const SizedBox(height: 3),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.wb_sunny_outlined,
                        size: 13, color: SiplingColors.streak),
                    const SizedBox(width: 4),
                    Text(l.boostActive(boost),
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: SiplingColors.streak)),
                  ],
                ),
              ],
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: onTapLog,
            icon: Icon(Icons.history, color: p.inkSoft),
            tooltip: l.logOpen,
            visualDensity: VisualDensity.compact,
          ),
          const SizedBox(width: 2),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: p.card,
              borderRadius: BorderRadius.circular(20),
              boxShadow: softShadow(p.dark),
            ),
            child: Row(
              children: [
                Icon(Icons.local_fire_department,
                    size: 17,
                    color: streak > 0 ? SiplingColors.streak : p.inkSoft),
                const SizedBox(width: 4),
                Text(l.homeStreakDays(streak),
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: p.ink)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickAddBar extends StatelessWidget {
  final List<CupPreset> cups;
  final void Function(int ml, DrinkType type) onAdd;
  final VoidCallback onMore;

  const _QuickAddBar(
      {required this.cups, required this.onAdd, required this.onMore});

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (final (i, c) in cups.take(3).indexed) ...[
          _AddButton(
              cup: c,
              label: cupLabel(l, c, i),
              onTap: () => onAdd(c.ml, c.type)),
          const SizedBox(width: 12),
        ],
        // "Diğer" = çay/kahve/süt... seçme sayfasını açar. Etiket olmadan
        // kullanıcılar bunu 4. bir su bardağı sanıyordu (2026-07-11 geri bildirimi).
        GestureDetector(
          onTap: onMore,
          child: Container(
            width: 62,
            height: 74,
            decoration: BoxDecoration(
              color: SiplingColors.water,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.local_cafe_outlined,
                    color: Colors.white, size: 22),
                const SizedBox(height: 3),
                Text(l.homeMoreDrinks,
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _AddButton extends StatelessWidget {
  final CupPreset cup;
  final String label;
  final VoidCallback onTap;
  const _AddButton(
      {required this.cup, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final p = Palette.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 78,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: p.card,
          borderRadius: BorderRadius.circular(18),
          boxShadow: softShadow(p.dark, tint: cup.type.color),
        ),
        child: Column(
          children: [
            Icon(cup.type.icon,
                color: cup.type.color, size: 22 + cup.ml / 90),
            const SizedBox(height: 5),
            Text('${cup.ml} ml',
                style: TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w700, color: p.ink)),
            Text(label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 11, color: p.inkSoft)),
          ],
        ),
      ),
    );
  }
}

/// Halka: boşken mavi, hedefte yeşil.
class _ProgressRing extends CustomPainter {
  final double progress;
  _ProgressRing({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(
        center: size.center(Offset.zero), radius: size.width / 2 - 6);
    canvas.drawArc(
      rect,
      0,
      2 * math.pi,
      false,
      Paint()
        ..color = SiplingColors.water.withValues(alpha: 0.14)
        ..strokeWidth = 9
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );
    if (progress <= 0) return;
    canvas.drawArc(
      rect,
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      Paint()
        ..color = Color.lerp(SiplingColors.water, SiplingColors.leafDark, progress)!
        ..strokeWidth = 9
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant _ProgressRing old) => old.progress != progress;
}

/// Hedef tamamlanınca çıkan kutlama. Reklam BURADA gösterilmez —
/// insanların en çok şikâyet ettiği şey tam da bu anın reklamla bölünmesi.
class _CelebrationDialog extends StatelessWidget {
  const _CelebrationDialog();

  @override
  Widget build(BuildContext context) {
    final state = context.read<AppState>();
    final l = context.l;
    final p = Palette.of(context);
    return Dialog(
      backgroundColor: p.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('🌳', style: TextStyle(fontSize: 54)),
            const SizedBox(height: 12),
            Text(l.homeCelebrateTitle,
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.w700, color: p.ink)),
            const SizedBox(height: 8),
            Text(
              l.homeCelebrateBody,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: p.inkSoft, height: 1.45),
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: SiplingColors.streak.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.local_fire_department,
                      color: SiplingColors.streak, size: 18),
                  const SizedBox(width: 6),
                  Text(l.homeStreakLabel(state.currentStreak),
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: SiplingColors.streak)),
                ],
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: FilledButton(
                onPressed: () => Navigator.of(context).pop(),
                style: FilledButton.styleFrom(
                  backgroundColor: SiplingColors.leafDark,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                child: Text(l.homeCelebrateOk),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
