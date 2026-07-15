import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/models.dart';
import '../data/store.dart';
import '../l10n/labels.dart';
import '../theme.dart';

/// Wear OS (Android saat) ekranı — telefon arayüzünün saat için sıkıştırılmış hâli.
///
/// 🎯 İskele: bugünkü ilerleme halkası + 3 hızlı bardakla bilekten su ekleme.
/// Kendi cihazındaki veriyle çalışır (aynı `store.dart`); telefon↔saat senkronu
/// (Wearable Data Layer) sonraki adım. Yuvarlak ekrana göre içerik ortalanır.
/// ⚠️ Bu makinede saat/emülatör yok → derlenir ama görünüm saatte doğrulanmalı.
class WearScreen extends StatelessWidget {
  const WearScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final l = context.l;
    final day = state.today;
    final goal = state.goalMl;
    final ml = day.rawMl;

    return Scaffold(
      backgroundColor: Colors.black, // OLED + ambient dostu
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 118,
                height: 118,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: const Size(118, 118),
                      painter: _RingPainter(day.progress),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('$ml',
                            style: const TextStyle(
                                fontSize: 30,
                                height: 1.0,
                                fontWeight: FontWeight.w800,
                                color: Colors.white)),
                        Text('/ $goal ml',
                            style: const TextStyle(
                                fontSize: 11, color: Colors.white70)),
                        if (day.completed)
                          const Padding(
                            padding: EdgeInsets.only(top: 2),
                            child: Icon(Icons.check_circle,
                                size: 14, color: SiplingColors.leafLight),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (final cup in state.cups.take(3))
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: _CupButton(
                        cup: cup,
                        onTap: () => state.addSip(cup.ml, cup.type),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 4),
              Text(l.navToday,
                  style: const TextStyle(fontSize: 10, color: Colors.white38)),
            ],
          ),
        ),
      ),
    );
  }
}

/// Bilekten tek dokunuşla su ekleyen yuvarlak buton.
class _CupButton extends StatelessWidget {
  final CupPreset cup;
  final VoidCallback onTap;
  const _CupButton({required this.cup, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 52,
        height: 52,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: cup.type.color.withValues(alpha: 0.22),
          shape: BoxShape.circle,
          border: Border.all(color: cup.type.color, width: 1.4),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(cup.type.icon, size: 15, color: Colors.white),
            const SizedBox(height: 1),
            Text('${cup.ml}',
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

/// İlerleme halkası: gri taban + su rengi yay.
class _RingPainter extends CustomPainter {
  final double progress; // 0..1
  const _RingPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (size.width - 12) / 2;
    final base = Paint()
      ..color = Colors.white.withValues(alpha: 0.14)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
    final arc = Paint()
      ..color = SiplingColors.water
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, base);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress.clamp(0.0, 1.0),
      false,
      arc,
    );
  }

  @override
  bool shouldRepaint(covariant _RingPainter old) => old.progress != progress;
}
