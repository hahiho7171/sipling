import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../data/tree_species.dart';
import '../theme.dart';

/// Fidanı çizen painter.
///
/// [growth] 0..1 arası: 0 = toprakta tohum, 1 = olgun ağaç.
/// Ara değerler filiz → fidan → genç ağaç geçişlerini verir.
/// [sway] rüzgârda hafif salınım için 0..2π arası faz.
///
/// Bütün kalınlık ve yarıçaplar `unit = min(w,h)`'e orantılıdır. Sabit piksel
/// kullanılırsa küçük ağaçlar lolipop, büyükler sopa gibi görünür.
class TreePainter extends CustomPainter {
  final double growth;
  final double sway;
  final int seed;
  final TreeSpecies species;

  /// Toprak yüzeyinin dikey konumu (yüksekliğin oranı olarak).
  /// Bahçe sahnesinde yeraltı suyuna yer açmak için yukarı çekilir.
  final double groundFactor;

  TreePainter({
    required this.growth,
    this.sway = 0,
    this.seed = 0,
    this.groundFactor = 0.86,
    TreeSpecies? species,
  }) : species = species ?? kTreeSpecies.first;

  @override
  void paint(Canvas canvas, Size size) {
    final g = growth.clamp(0.0, 1.0);
    final groundY = size.height * groundFactor;
    final cx = size.width / 2;
    final unit = math.min(size.width, size.height);

    if (g < 0.04) {
      _drawSeed(canvas, cx, groundY, unit);
      return;
    }

    // Gövde yüksekliği büyümeyle artar, ama başta hızlı sonra yavaş (kök salma hissi).
    final eased = math.pow(g, 0.75).toDouble();
    final trunkH = size.height * 0.46 * eased;
    final trunkW = unit * 0.008 + unit * 0.03 * eased;

    final swayAmount = math.sin(sway) * unit * (0.006 + 0.014 * eased);

    if (g < 0.22) {
      // İlk yudumun karşılığı görünür olmalı: filiz asgari bir boyda çizilir.
      final sproutH = math.max(trunkH, size.height * 0.11);
      _drawSprout(canvas, cx, groundY, sproutH, swayAmount, g, unit);
      return;
    }

    _drawTrunk(canvas, cx, groundY, trunkH, trunkW, swayAmount);
    _drawCanopy(canvas, cx + swayAmount, groundY - trunkH, unit, eased);
  }

  void _drawSeed(Canvas canvas, double cx, double groundY, double unit) {
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(cx, groundY - unit * 0.01),
        width: unit * 0.035,
        height: unit * 0.025,
      ),
      Paint()..color = SiplingColors.soilDark,
    );
  }

  void _drawSprout(Canvas canvas, double cx, double groundY, double h,
      double sway, double g, double unit) {
    final stem = Paint()
      ..color = species.dark
      ..strokeWidth = unit * 0.008
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final top = Offset(cx + sway, groundY - h);
    canvas.drawPath(
      Path()
        ..moveTo(cx, groundY)
        ..quadraticBezierTo(cx + sway * 0.4, groundY - h * 0.6, top.dx, top.dy),
      stem,
    );

    // İki küçük yaprak, büyümeyle açılır.
    final leafSize = unit * 0.045 + unit * 0.05 * (g / 0.22);
    final leaf = Paint()..color = species.main;
    for (final dir in [-1.0, 1.0]) {
      canvas.save();
      canvas.translate(top.dx, top.dy + 2);
      canvas.rotate(dir * 0.7);
      canvas.drawOval(
        Rect.fromCenter(
            center: Offset(dir * leafSize * 0.45, 0),
            width: leafSize,
            height: leafSize * 0.55),
        leaf,
      );
      canvas.restore();
    }
  }

  void _drawTrunk(Canvas canvas, double cx, double groundY, double h, double w,
      double sway) {
    final trunk = Paint()..color = species.trunk;
    final topX = cx + sway;
    canvas.drawPath(
      Path()
        ..moveTo(cx - w / 2, groundY)
        ..quadraticBezierTo(cx - w / 2 + sway * 0.3, groundY - h * 0.5,
            topX - w * 0.18, groundY - h)
        ..lineTo(topX + w * 0.18, groundY - h)
        ..quadraticBezierTo(
            cx + w / 2 + sway * 0.3, groundY - h * 0.5, cx + w / 2, groundY)
        ..close(),
      trunk,
    );

    // Dallar sadece belli bir olgunlukta çıkar. Çamda gövde tek parça kalır.
    if (h > w * 4.5 && species.shape != CanopyShape.conical) {
      final branch = Paint()
        ..color = species.trunk
        ..strokeWidth = math.max(1.2, w * 0.22)
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;
      final by = groundY - h * 0.62;
      canvas.drawLine(Offset(cx + sway * 0.5, by),
          Offset(cx + sway * 0.5 - h * 0.16, by - h * 0.14), branch);
      canvas.drawLine(Offset(cx + sway * 0.5, by - h * 0.08),
          Offset(cx + sway * 0.5 + h * 0.17, by - h * 0.2), branch);
    }
  }

  void _drawCanopy(
      Canvas canvas, double topX, double topY, double unit, double eased) {
    final r = unit * 0.19 * eased + unit * 0.025;
    switch (species.shape) {
      case CanopyShape.round:
        _roundCanopy(canvas, topX, topY, r);
      case CanopyShape.blossom:
        _roundCanopy(canvas, topX, topY, r);
        _blossomDots(canvas, topX, topY, r);
      case CanopyShape.conical:
        _conicalCanopy(canvas, topX, topY, r);
      case CanopyShape.layered:
        _layeredCanopy(canvas, topX, topY, r);
    }
  }

  void _roundCanopy(Canvas canvas, double topX, double topY, double r) {
    final rnd = math.Random(seed);
    // Üç katman: koyu arka, ana renk, açık üst ışık.
    final blobs = <(Offset, double, Color)>[
      (Offset(topX - r * 0.55, topY + r * 0.15), r * 0.85, species.dark),
      (Offset(topX + r * 0.6, topY + r * 0.1), r * 0.8, species.dark),
      (Offset(topX, topY - r * 0.1), r * 1.05, species.main),
      (Offset(topX - r * 0.35, topY - r * 0.35), r * 0.62, species.light),
      (Offset(topX + r * 0.3, topY - r * 0.42), r * 0.5, species.light),
    ];
    for (final (center, radius, color) in blobs) {
      final jitter = Offset((rnd.nextDouble() - 0.5) * r * 0.12,
          (rnd.nextDouble() - 0.5) * r * 0.12);
      canvas.drawCircle(center + jitter, radius, Paint()..color = color);
    }
  }

  void _blossomDots(Canvas canvas, double topX, double topY, double r) {
    final rnd = math.Random(seed + 91);
    final dot = Paint()..color = Colors.white.withValues(alpha: 0.55);
    for (var i = 0; i < 9; i++) {
      final a = rnd.nextDouble() * 2 * math.pi;
      final d = rnd.nextDouble() * r * 0.85;
      canvas.drawCircle(
        Offset(topX + math.cos(a) * d, topY - r * 0.1 + math.sin(a) * d * 0.8),
        r * 0.05,
        dot,
      );
    }
  }

  void _conicalCanopy(Canvas canvas, double topX, double topY, double r) {
    // Çam: üst üste üç üçgen katman, aşağı doğru genişler.
    for (var i = 0; i < 3; i++) {
      final t = i / 2;
      final halfW = r * (0.55 + 0.45 * t);
      final top = topY - r * (1.35 - 0.42 * i);
      final bottom = topY - r * (0.45 - 0.42 * i);
      final color =
          i == 0 ? species.light : (i == 1 ? species.main : species.dark);
      canvas.drawPath(
        Path()
          ..moveTo(topX, top)
          ..lineTo(topX - halfW, bottom)
          ..lineTo(topX + halfW, bottom)
          ..close(),
        Paint()..color = color,
      );
    }
  }

  void _layeredCanopy(Canvas canvas, double topX, double topY, double r) {
    // Akasya/zeytin: yassı, yatay katmanlar.
    canvas.drawOval(
      Rect.fromCenter(
          center: Offset(topX, topY + r * 0.12), width: r * 2.3, height: r * 0.8),
      Paint()..color = species.dark,
    );
    canvas.drawOval(
      Rect.fromCenter(
          center: Offset(topX, topY - r * 0.15),
          width: r * 1.9,
          height: r * 0.72),
      Paint()..color = species.main,
    );
    canvas.drawOval(
      Rect.fromCenter(
          center: Offset(topX - r * 0.15, topY - r * 0.45),
          width: r * 1.1,
          height: r * 0.5),
      Paint()..color = species.light,
    );
  }

  // Renkleri de karşılaştır: mevsim teması türün kimliğini değiştirmeden
  // yapraklarını boyuyor (`season.tint()`), sadece id'ye bakarsak orman
  // mevsim değişince yeniden çizilmez.
  @override
  bool shouldRepaint(covariant TreePainter old) =>
      old.growth != growth ||
      old.sway != sway ||
      old.species.id != species.id ||
      old.species.main != species.main ||
      old.species.dark != species.dark ||
      old.species.light != species.light;
}
