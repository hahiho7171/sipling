import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/goal_calculator.dart';
import '../data/hydration_facts.dart';
import '../data/models.dart';
import '../data/store.dart';
import '../l10n/labels.dart';
import '../services/notifications.dart';
import '../theme.dart';

/// "Günlük su ihtiyacını hesapla" ekranı.
///
/// İki işi var:
///   1. Boy / kilo / yaş / cinsiyet / hareket düzeyini burada değiştirip günlük
///      ihtiyacı canlı hesaplamak ve istenirse hedefe uygulamak.
///   2. "Su ve vücudun" — suyun vücuttaki rolüyle ilgili kısa bilgiler.
///
/// Hesabı SIFIRDAN yazmıyor; kurulum akışının kullandığı `calculateGoalMl`
/// (EFSA 2010 tabanlı) fonksiyonunun aynısını çağırır — iki yerde iki farklı
/// sonuç çıkmasın diye.
///
/// 🚨 Arapça sağdan sola: `EdgeInsetsDirectional`/`AlignmentDirectional` kullan.
class WaterNeedsScreen extends StatefulWidget {
  const WaterNeedsScreen({super.key});

  @override
  State<WaterNeedsScreen> createState() => _WaterNeedsScreenState();
}

class _WaterNeedsScreenState extends State<WaterNeedsScreen> {
  /// Ekranda oynanan taslak profil. Kullanıcı "Hedefim yap" demeden
  /// kaydedilmez — kaydırıcıyla oynamak kimsenin hedefini bozmasın.
  late Profile _draft;

  @override
  void initState() {
    super.initState();
    _draft = context.read<AppState>().profile;
  }

  /// Hesaplanan ihtiyaç. `calculateGoalMl` elle ayarlanmış hedef varsa onu
  /// döndürdüğü için, burada onu bilerek temizleyip **taze hesabı** alıyoruz.
  int get _calculated =>
      calculateGoalMl(_draft.copyWith(clearCustomGoal: true));

  Future<void> _apply() async {
    final l = context.l;
    final state = context.read<AppState>();
    // Girilen ölçüleri kaydet + elle hedefi temizle ki hesaplanan değer geçerli olsun.
    await state.saveProfile(_draft.copyWith(clearCustomGoal: true));
    // Hedef değişti → günün kalan hatırlatmaları yeniden planlanmalı.
    await NotificationService.reschedule(
      profile: state.profile,
      settings: state.reminder,
      todayCompleted: state.today.completed,
      cups: state.cups,
    );
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l.needApplied)),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    final p = Palette.of(context);
    final state = context.watch<AppState>();
    final goal = _calculated;
    final glasses = (goal / 250).round();
    final bmi = calculateBmi(_draft);
    final currentGoal = state.today.goalMl;

    return Scaffold(
      backgroundColor: p.bg,
      appBar: AppBar(
        title: Text(l.needTitle),
        backgroundColor: p.bg,
        foregroundColor: p.ink,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
        children: [
          Text(l.needIntro,
              style: TextStyle(fontSize: 13, color: p.inkSoft, height: 1.4)),
          const SizedBox(height: 18),

          // ——— Sonuç kartı (üstte: değiştirdikçe canlı değişsin, görülsün) ———
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 26),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [SiplingColors.water, SiplingColors.waterDeep],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                Text(l.needResultLabel,
                    style:
                        const TextStyle(fontSize: 13, color: Colors.white70)),
                const SizedBox(height: 6),
                Text('$goal',
                    style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        height: 1.0)),
                const SizedBox(height: 4),
                Text(l.onbGoalUnit,
                    style:
                        const TextStyle(fontSize: 14, color: Colors.white70)),
                const SizedBox(height: 6),
                Text(l.onbGoalGlasses(glasses),
                    style:
                        const TextStyle(fontSize: 13, color: Colors.white70)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(l.needCurrentGoal(currentGoal),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: p.inkSoft)),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: goal == currentGoal ? null : _apply,
              style: FilledButton.styleFrom(
                backgroundColor: SiplingColors.leafDark,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              ),
              child: Text(l.needApply,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w700)),
            ),
          ),

          const SizedBox(height: 26),
          _SectionTitle(l.needMeasuresTitle),
          const SizedBox(height: 8),

          // ——— Cinsiyet ———
          Wrap(
            spacing: 8,
            children: [
              for (final g in Gender.values)
                ChoiceChip(
                  selected: _draft.gender == g,
                  label: Text(switch (g) {
                    Gender.female => l.onbGenderFemale,
                    Gender.male => l.onbGenderMale,
                    Gender.other => l.onbGenderOther,
                  }),
                  onSelected: (_) => setState(
                      () => _draft = _draft.copyWith(gender: g)),
                ),
            ],
          ),
          const SizedBox(height: 6),

          // ——— Yaş / boy / kilo ———
          _Slider(
            label: l.onbBodyAge,
            value: _draft.age.toDouble(),
            min: 12,
            max: 90,
            suffix: '',
            onChanged: (v) =>
                setState(() => _draft = _draft.copyWith(age: v.round())),
          ),
          _Slider(
            label: l.onbBodyHeight,
            value: _draft.heightCm.toDouble(),
            min: 120,
            max: 220,
            suffix: ' cm',
            onChanged: (v) =>
                setState(() => _draft = _draft.copyWith(heightCm: v.round())),
          ),
          _Slider(
            label: l.onbBodyWeight,
            value: _draft.weightKg.toDouble(),
            min: 30,
            max: 200,
            suffix: ' kg',
            onChanged: (v) =>
                setState(() => _draft = _draft.copyWith(weightKg: v.round())),
          ),

          const SizedBox(height: 6),
          // ——— BMI (bilgi amaçlı) ———
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: p.card,
              borderRadius: BorderRadius.circular(16),
              boxShadow: softShadow(p.dark),
            ),
            child: Row(
              children: [
                Icon(Icons.monitor_weight_outlined, color: p.inkSoft, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(l.onbBodyBmiLabel,
                      style: TextStyle(fontSize: 14, color: p.inkSoft)),
                ),
                Text('${bmi.toStringAsFixed(1)} · ${bmiLabelOf(l, bmi)}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: p.ink)),
              ],
            ),
          ),

          const SizedBox(height: 18),
          _SectionTitle(l.onbActivityTitle),
          const SizedBox(height: 8),
          for (final a in ActivityLevel.values)
            _ActivityTile(
              selected: _draft.activity == a,
              icon: switch (a) {
                ActivityLevel.low => Icons.chair_outlined,
                ActivityLevel.medium => Icons.directions_walk,
                ActivityLevel.high => Icons.directions_run,
              },
              title: a.label(l),
              subtitle: a.hint(l),
              onTap: () =>
                  setState(() => _draft = _draft.copyWith(activity: a)),
            ),

          const SizedBox(height: 8),
          Text(l.onbGoalReference,
              style: TextStyle(fontSize: 11, color: p.inkSoft, height: 1.4)),
          const SizedBox(height: 6),
          Text(l.onbBodyDisclaimer,
              style: TextStyle(fontSize: 11, color: p.inkSoft)),

          // ——— Su ve vücudun ———
          const SizedBox(height: 28),
          _SectionTitle(l.needLearnTitle),
          const SizedBox(height: 10),
          for (final f in learnFacts(l))
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: p.card,
                borderRadius: BorderRadius.circular(16),
                boxShadow: softShadow(p.dark),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.water_drop_outlined,
                          size: 18, color: SiplingColors.waterDeep),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(f.title,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: p.ink)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(f.body,
                      style: TextStyle(
                          fontSize: 13, color: p.inkSoft, height: 1.45)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// Hareket düzeyi seçim satırı. (Kurulum akışındaki `_SelectTile` orada
/// `private`; aynısını kopyalamak yerine buranın ihtiyacına göre sade tutuldu.)
class _ActivityTile extends StatelessWidget {
  final bool selected;
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ActivityTile({
    required this.selected,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final p = Palette.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: selected
                ? SiplingColors.water.withValues(alpha: 0.14)
                : p.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected ? SiplingColors.waterDeep : Colors.transparent,
              width: 1.6,
            ),
          ),
          child: Row(
            children: [
              Icon(icon,
                  size: 22,
                  color: selected ? SiplingColors.waterDeep : p.inkSoft),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: p.ink)),
                    Text(subtitle,
                        style: TextStyle(fontSize: 12, color: p.inkSoft)),
                  ],
                ),
              ),
              if (selected)
                const Icon(Icons.check_circle,
                    size: 20, color: SiplingColors.waterDeep),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Palette.of(context).ink));
  }
}

/// Kurulum akışındaki kaydırıcının aynısı (orada `private`, buradan görünmüyor).
class _Slider extends StatelessWidget {
  final String label;
  final double value;
  final double min;
  final double max;
  final String suffix;
  final ValueChanged<double> onChanged;

  const _Slider({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.suffix,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final p = Palette.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label, style: TextStyle(fontSize: 14, color: p.inkSoft)),
            const Spacer(),
            Text('${value.round()}$suffix',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: p.ink)),
          ],
        ),
        Slider(
          value: value.clamp(min, max),
          min: min,
          max: max,
          activeColor: SiplingColors.waterDeep,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
