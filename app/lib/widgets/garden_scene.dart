import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../data/tree_species.dart';
import '../theme.dart';
import 'tree_painter.dart';

/// Sahnede toprak yüzeyi. Altında kalan şerit yeraltı suyuna ayrılmıştır.
const double kGroundFactor = 0.74;

/// Ana ekranın kalbi: daire içinde bir bahçe kesiti.
///
/// Üstte gökyüzü, ortada toprak, altta yeraltı suyu.
/// Kullanıcı su içtikçe [progress] artar → su yükselir → fidan büyür.
class GardenScene extends StatefulWidget {
  final double progress; // 0..1
  final TreeSpecies species;
  final bool dark;

  const GardenScene({
    super.key,
    required this.progress,
    required this.species,
    required this.dark,
  });

  @override
  State<GardenScene> createState() => _GardenSceneState();
}

class _GardenSceneState extends State<GardenScene>
    with TickerProviderStateMixin {
  late final AnimationController _wave;
  late final AnimationController _sway;
  late final AnimationController _grow;
  late Animation<double> _grownValue;
  double _shownProgress = 0;

  @override
  void initState() {
    super.initState();
    _wave = AnimationController(vsync: this, duration: const Duration(seconds: 3))
      ..repeat();
    _sway = AnimationController(vsync: this, duration: const Duration(seconds: 5))
      ..repeat();
    _grow =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _grownValue = AlwaysStoppedAnimation(widget.progress);
    _shownProgress = widget.progress;
  }

  @override
  void didUpdateWidget(covariant GardenScene old) {
    super.didUpdateWidget(old);
    if (old.progress != widget.progress) {
      // Yeni bardak eklenince su ve fidan yumuşakça yeni seviyeye taşınır.
      _grownValue = Tween<double>(begin: _shownProgress, end: widget.progress)
          .animate(CurvedAnimation(parent: _grow, curve: Curves.easeOutCubic));
      _shownProgress = widget.progress;
      _grow.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _wave.dispose();
    _sway.dispose();
    _grow.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final p = Palette(widget.dark);
    return AnimatedBuilder(
      animation: Listenable.merge([_wave, _sway, _grow]),
      builder: (context, _) {
        final value = _grownValue.value;
        return ClipOval(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [p.skyTop, p.skyBottom],
              ),
            ),
            child: CustomPaint(
              painter: _ScenePainter(
                progress: value,
                wavePhase: _wave.value * 2 * math.pi,
              ),
              foregroundPainter: TreePainter(
                growth: value,
                sway: math.sin(_sway.value * 2 * math.pi),
                groundFactor: kGroundFactor,
                species: widget.species,
              ),
              child: const SizedBox.expand(),
            ),
          ),
        );
      },
    );
  }
}

class _ScenePainter extends CustomPainter {
  final double progress;
  final double wavePhase;

  _ScenePainter({required this.progress, required this.wavePhase});

  @override
  void paint(Canvas canvas, Size size) {
    final groundY = size.height * kGroundFactor;

    // Yeraltı su tabakası: hedef doldukça toprağın içinde yükselir.
    final soilDepth = size.height - groundY;
    final waterTop = size.height - (soilDepth - 18) * progress;

    canvas.drawRect(Rect.fromLTRB(0, groundY, size.width, size.height),
        Paint()..color = SiplingColors.soil);
    if (progress > 0) _drawWater(canvas, size, waterTop);
    canvas.drawRect(Rect.fromLTRB(0, groundY - 5, size.width, groundY + 2),
        Paint()..color = SiplingColors.grass);
  }

  void _drawWater(Canvas canvas, Size size, double top) {
    final path = Path()..moveTo(0, top);
    for (double x = 0; x <= size.width; x += 4) {
      final y = top + math.sin((x / size.width * 3 * math.pi) + wavePhase) * 3;
      path.lineTo(x, y);
    }
    path
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(
      path,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [SiplingColors.water, SiplingColors.waterDeep],
        ).createShader(Rect.fromLTRB(0, top, size.width, size.height)),
    );
  }

  @override
  bool shouldRepaint(covariant _ScenePainter old) => true;
}
