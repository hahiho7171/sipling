import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../l10n/labels.dart';
import '../theme.dart';

/// İlk kurulumdan sonra bir kez açılan kısa tanıtım (4 adım).
/// Ayarlar > "Sipling nasıl kullanılır?" ile istendiğinde tekrar açılır.
///
/// Kurulum akışıyla (`OnboardingScreen`) karıştırma: o profil bilgisi toplar,
/// bu ise uygulamanın nasıl kullanıldığını anlatır.
const String kTourSeenKey = 'tour_seen_v1';

class _Step {
  final IconData icon;
  final String Function(L) title;
  final String Function(L) body;
  const _Step(this.icon, this.title, this.body);
}

const _steps = <_Step>[
  _Step(Icons.local_drink_outlined, _t1, _b1),
  _Step(Icons.flag_outlined, _t2, _b2),
  _Step(Icons.notifications_active_outlined, _t3, _b3),
  _Step(Icons.park_outlined, _t4, _b4),
];

String _t1(L l) => l.tourT1;
String _b1(L l) => l.tourB1;
String _t2(L l) => l.tourT2;
String _b2(L l) => l.tourB2;
String _t3(L l) => l.tourT3;
String _b3(L l) => l.tourB3;
String _t4(L l) => l.tourT4;
String _b4(L l) => l.tourB4;

/// Turu gösterir. [markSeen] true ise açılır açılmaz "görüldü" işaretlenir
/// (ilk açılış); Ayarlar'dan tekrar izlemede işaretlemeye gerek yok.
Future<void> showSiplingTour(BuildContext context, {bool markSeen = false}) async {
  if (markSeen) {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kTourSeenKey, true);
  }
  if (!context.mounted) return;
  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => const _TourSheet(),
  );
}

/// Tur daha önce gösterildi mi?
Future<bool> tourSeen() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(kTourSeenKey) ?? false;
}

class _TourSheet extends StatefulWidget {
  const _TourSheet();

  @override
  State<_TourSheet> createState() => _TourSheetState();
}

class _TourSheetState extends State<_TourSheet> {
  int _i = 0;

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    final p = Palette.of(context);
    final s = _steps[_i];
    final last = _i == _steps.length - 1;

    return SafeArea(
      top: false,
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.fromLTRB(22, 26, 22, 18),
        decoration: BoxDecoration(
          color: p.card,
          borderRadius: BorderRadius.circular(22),
          boxShadow: softShadow(Theme.of(context).brightness == Brightness.dark),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(s.icon, size: 42, color: SiplingColors.water),
            const SizedBox(height: 14),
            Text(
              s.title(l),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 19, fontWeight: FontWeight.w700, color: p.ink),
            ),
            const SizedBox(height: 10),
            Text(
              s.body(l),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, height: 1.45, color: p.inkSoft),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _steps.length,
                (k) => AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: k == _i ? 20 : 7,
                  height: 7,
                  decoration: BoxDecoration(
                    color: k == _i
                        ? SiplingColors.water
                        : p.inkSoft.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      if (_i > 0) {
                        setState(() => _i--);
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(_i > 0 ? l.tourBack : l.tourSkip),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      if (last) {
                        Navigator.of(context).pop();
                      } else {
                        setState(() => _i++);
                      }
                    },
                    child: Text(last ? l.tourDone : l.tourNext),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
