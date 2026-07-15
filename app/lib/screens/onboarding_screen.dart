import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/goal_calculator.dart';
import '../data/models.dart';
import '../data/store.dart';
import '../l10n/labels.dart';
import '../services/notifications.dart';
import '../theme.dart';
import '../widgets/tree_painter.dart';

/// İlk açılış. Beş kısa adım; hiçbiri zorunlu bilgi istemiyor gibi hissettirmemeli.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _page = 0;
  late Profile _p;

  static const _lastPage = 4;

  @override
  void initState() {
    super.initState();
    // Ayarlar'dan tekrar açıldığında mevcut bilgiler yüklü gelmeli,
    // yoksa kaydedince profil sıfırlanır.
    _p = context.read<AppState>().profile;
  }

  void _next() {
    if (_page == _lastPage) {
      _finish();
      return;
    }
    _controller.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  Future<void> _finish() async {
    final state = context.read<AppState>();
    await state.saveProfile(_p.copyWith(onboarded: true));
    await NotificationService.reschedule(
      profile: state.profile,
      settings: state.reminder,
      todayCompleted: false,
      cups: state.cups,
    );
    if (mounted) Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final p = Palette.of(context);
    final l = context.l;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
              child: Row(
                children: [
                  for (var i = 0; i <= _lastPage; i++)
                    Expanded(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        height: 4,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          color: i <= _page
                              ? SiplingColors.water
                              : p.inkSoft.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (i) => setState(() => _page = i),
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _WelcomePage(palette: p),
                  _GenderPage(
                      value: _p.gender,
                      onChanged: (g) => setState(() => _p = _p.copyWith(gender: g))),
                  _BodyPage(
                      profile: _p, onChanged: (v) => setState(() => _p = v)),
                  _ActivityPage(
                      value: _p.activity,
                      onChanged: (a) =>
                          setState(() => _p = _p.copyWith(activity: a))),
                  _GoalPage(profile: _p),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton(
                  onPressed: _next,
                  style: FilledButton.styleFrom(
                    backgroundColor: SiplingColors.water,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  child: Text(
                    _page == _lastPage ? l.onbFinish : l.onbContinue,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Page extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;
  const _Page(
      {required this.title, required this.subtitle, required this.child});

  @override
  Widget build(BuildContext context) {
    final p = Palette.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 26, fontWeight: FontWeight.w700, color: p.ink)),
          const SizedBox(height: 6),
          Text(subtitle,
              style: TextStyle(fontSize: 14, color: p.inkSoft, height: 1.4)),
          const SizedBox(height: 26),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class _WelcomePage extends StatelessWidget {
  final Palette palette;
  const _WelcomePage({required this.palette});

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 180,
            child: CustomPaint(
              painter: TreePainter(growth: 1.0, seed: 3),
              child: const SizedBox.expand(),
            ),
          ),
          const SizedBox(height: 26),
          Text('Sipling',
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  color: palette.ink,
                  letterSpacing: -0.5)),
          const SizedBox(height: 10),
          Text(
            l.onbWelcomeTagline,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: palette.inkSoft, height: 1.5),
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
            decoration: BoxDecoration(
              color: SiplingColors.leaf.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              l.onbWelcomeNoPenalty,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: SiplingColors.leafDark),
            ),
          ),
        ],
      ),
    );
  }
}

class _GenderPage extends StatelessWidget {
  final Gender value;
  final ValueChanged<Gender> onChanged;
  const _GenderPage({required this.value, required this.onChanged});

  // İkonlar sabit; etiketler dile göre üretilir.
  static const _icons = {
    Gender.female: Icons.female,
    Gender.male: Icons.male,
    Gender.other: Icons.person_outline,
  };

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    final labels = {
      Gender.female: l.onbGenderFemale,
      Gender.male: l.onbGenderMale,
      Gender.other: l.onbGenderOther,
    };
    return _Page(
      title: l.onbGenderTitle,
      subtitle: l.onbGenderSubtitle,
      child: Column(
        children: [
          for (final e in _icons.entries)
            _SelectTile(
              selected: value == e.key,
              icon: e.value,
              title: labels[e.key]!,
              onTap: () => onChanged(e.key),
            ),
        ],
      ),
    );
  }
}

class _BodyPage extends StatelessWidget {
  final Profile profile;
  final ValueChanged<Profile> onChanged;
  const _BodyPage({required this.profile, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final p = Palette.of(context);
    final l = context.l;
    final bmi = calculateBmi(profile);
    return _Page(
      title: l.onbBodyTitle,
      subtitle: l.onbBodySubtitle,
      child: ListView(
        children: [
          _Slider(
            label: l.onbBodyAge,
            value: profile.age.toDouble(),
            min: 12,
            max: 90,
            suffix: '',
            onChanged: (v) => onChanged(profile.copyWith(age: v.round())),
          ),
          _Slider(
            label: l.onbBodyHeight,
            value: profile.heightCm.toDouble(),
            min: 120,
            max: 220,
            suffix: ' cm',
            onChanged: (v) => onChanged(profile.copyWith(heightCm: v.round())),
          ),
          _Slider(
            label: l.onbBodyWeight,
            value: profile.weightKg.toDouble(),
            min: 30,
            max: 200,
            suffix: ' kg',
            onChanged: (v) => onChanged(profile.copyWith(weightKg: v.round())),
          ),
          const SizedBox(height: 12),
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
                Text(l.onbBodyBmiLabel,
                    style: TextStyle(fontSize: 14, color: p.inkSoft)),
                const Spacer(),
                Text('${bmi.toStringAsFixed(1)} · ${bmiLabelOf(l, bmi)}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: p.ink)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l.onbBodyDisclaimer,
            style: TextStyle(fontSize: 11, color: p.inkSoft),
          ),
        ],
      ),
    );
  }
}

class _ActivityPage extends StatelessWidget {
  final ActivityLevel value;
  final ValueChanged<ActivityLevel> onChanged;
  const _ActivityPage({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    return _Page(
      title: l.onbActivityTitle,
      subtitle: l.onbActivitySubtitle,
      child: Column(
        children: [
          for (final a in ActivityLevel.values)
            _SelectTile(
              selected: value == a,
              icon: switch (a) {
                ActivityLevel.low => Icons.chair_outlined,
                ActivityLevel.medium => Icons.directions_walk,
                ActivityLevel.high => Icons.directions_run,
              },
              title: a.label(l),
              subtitle: a.hint(l),
              onTap: () => onChanged(a),
            ),
        ],
      ),
    );
  }
}

class _GoalPage extends StatelessWidget {
  final Profile profile;
  const _GoalPage({required this.profile});

  @override
  Widget build(BuildContext context) {
    final p = Palette.of(context);
    final l = context.l;
    final goal = calculateGoalMl(profile);
    final glasses = (goal / 250).round();

    return _Page(
      title: l.onbGoalTitle,
      subtitle: l.onbGoalSubtitle,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [SiplingColors.water, SiplingColors.waterDeep],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                Text('$goal',
                    style: const TextStyle(
                        fontSize: 54,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        height: 1.0)),
                const SizedBox(height: 4),
                Text(l.onbGoalUnit,
                    style: const TextStyle(fontSize: 15, color: Colors.white70)),
                const SizedBox(height: 10),
                Text(l.onbGoalGlasses(glasses),
                    style: const TextStyle(
                        fontSize: 13, color: Colors.white, height: 1.2)),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text(
            l.onbGoalReference,
            style: TextStyle(fontSize: 12, color: p.inkSoft, height: 1.5),
          ),
        ],
      ),
    );
  }
}

class _SelectTile extends StatelessWidget {
  final bool selected;
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  const _SelectTile({
    required this.selected,
    required this.icon,
    required this.title,
    required this.onTap,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final p = Palette.of(context);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: selected ? SiplingColors.water.withValues(alpha: 0.12) : p.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? SiplingColors.water : Colors.transparent,
            width: 1.6,
          ),
          boxShadow: selected ? null : softShadow(p.dark),
        ),
        child: Row(
          children: [
            Icon(icon,
                color: selected ? SiplingColors.water : p.inkSoft, size: 22),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: p.ink)),
                if (subtitle != null)
                  Text(subtitle!,
                      style: TextStyle(fontSize: 12, color: p.inkSoft)),
              ],
            ),
            const Spacer(),
            if (selected)
              const Icon(Icons.check_circle,
                  color: SiplingColors.water, size: 20),
          ],
        ),
      ),
    );
  }
}

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
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(label, style: TextStyle(fontSize: 14, color: p.inkSoft)),
              const Spacer(),
              Text('${value.round()}$suffix',
                  style: TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w700, color: p.ink)),
            ],
          ),
          Slider(
            value: value,
            min: min,
            max: max,
            activeColor: SiplingColors.water,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
