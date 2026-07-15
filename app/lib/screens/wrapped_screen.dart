import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../data/models.dart';
import '../data/store.dart';
import '../data/tree_species.dart';
import '../l10n/labels.dart';
import '../services/share_image.dart';
import '../theme.dart';
import '../widgets/tree_painter.dart';

/// "Orman Wrapped" — tüm zamanlar özeti, paylaşılabilir kart.
///
/// Kart bir [RepaintBoundary]; "Paylaş" ona PNG çekip sistemin paylaş sayfasını
/// açar (Instagram/WhatsApp...). Tamamen cihazdaki veriden; Sipling internete
/// bağlanmaz — paylaşımı işletim sistemi yapar.
class WrappedScreen extends StatefulWidget {
  const WrappedScreen({super.key});

  @override
  State<WrappedScreen> createState() => _WrappedScreenState();
}

class _WrappedScreenState extends State<WrappedScreen> {
  final _cardKey = GlobalKey();
  bool _sharing = false;

  Future<void> _share() async {
    if (_sharing) return;
    // Metni await'ten önce al — sonrasında context'e dokunmuyoruz.
    final shareText = context.l.wrappedShareText;
    setState(() => _sharing = true);
    try {
      final boundary =
          _cardKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 3);
      final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
      if (bytes != null) {
        await shareImageBytes(bytes.buffer.asUint8List(), text: shareText);
      }
    } finally {
      if (mounted) setState(() => _sharing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final l = context.l;
    final p = Palette.of(context);
    final w = state.wrappedStats;

    return Scaffold(
      backgroundColor: p.bg,
      appBar: AppBar(title: Text(l.wrappedTitle)),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  // Paylaşılan görsel = tam bu kart.
                  child: RepaintBoundary(
                    key: _cardKey,
                    child: _WrappedCard(
                      liters: w.liters,
                      trees: w.trees,
                      bestStreak: w.bestStreak,
                      daysLogged: w.daysLogged,
                      topDrink: w.topDrink,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 16),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton.icon(
                  onPressed: _sharing ? null : _share,
                  style: FilledButton.styleFrom(
                    backgroundColor: SiplingColors.leafDark,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  icon: _sharing
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                              strokeWidth: 2, color: Colors.white))
                      : const Icon(Icons.share, size: 20),
                  label: Text(l.wrappedShare,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Sabit oranlı, koyu yeşil-gökyüzü gradyanlı hikâye kartı. Paylaşılan görüntü budur.
class _WrappedCard extends StatelessWidget {
  final double liters;
  final int trees;
  final int bestStreak;
  final int daysLogged;
  final DrinkType? topDrink;

  const _WrappedCard({
    required this.liters,
    required this.trees,
    required this.bestStreak,
    required this.daysLogged,
    required this.topDrink,
  });

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    // Paylaşımda tema-bağımsız sabit renkler (koyu temada da güzel dursun).
    return Container(
      width: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFEAF6FC), Color(0xFFDCEFE6), Color(0xFFCDE9D6)],
        ),
        boxShadow: const [
          BoxShadow(color: Color(0x1A17384A), blurRadius: 24, offset: Offset(0, 8)),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 26),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('🌱', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 6),
              Text('Sipling',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: SiplingColors.ink)),
            ],
          ),
          const SizedBox(height: 2),
          Text(l.wrappedHeadline,
              style: const TextStyle(
                  fontSize: 14,
                  color: SiplingColors.leafDark,
                  fontWeight: FontWeight.w600)),
          const SizedBox(height: 22),

          _BigStat(
              value: l.wrappedLiters(liters.round()),
              label: l.wrappedLitersLabel),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _SmallStat(value: '$trees', label: l.wrappedTreesLabel),
              _SmallStat(
                  value: '$bestStreak', label: l.wrappedStreakLabel),
              _SmallStat(value: '$daysLogged', label: l.wrappedDaysLabel),
            ],
          ),
          const SizedBox(height: 22),

          // Küçük orman şeridi
          SizedBox(
            height: 96,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned.fill(child: CustomPaint(painter: _CardHills())),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(5, (i) {
                      final sp = kTreeSpecies[i % kTreeSpecies.length];
                      final size = 46.0 + (i % 3) * 8;
                      return SizedBox(
                        width: size,
                        height: size,
                        child: CustomPaint(
                          painter: TreePainter(growth: 1, seed: i * 3, species: sp),
                          child: const SizedBox.expand(),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Text('sipling-app.web.app',
              style: TextStyle(fontSize: 11, color: SiplingColors.inkSoft)),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}

class _BigStat extends StatelessWidget {
  final String value;
  final String label;
  const _BigStat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                fontSize: 46,
                fontWeight: FontWeight.w800,
                color: SiplingColors.waterDeep,
                height: 1.0)),
        const SizedBox(height: 2),
        Text(label,
            style: TextStyle(fontSize: 13, color: SiplingColors.inkSoft)),
      ],
    );
  }
}

class _SmallStat extends StatelessWidget {
  final String value;
  final String label;
  const _SmallStat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: SiplingColors.leafDark)),
        const SizedBox(height: 2),
        SizedBox(
          width: 84,
          child: Text(label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, color: SiplingColors.inkSoft)),
        ),
      ],
    );
  }
}

class _CardHills extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(
      Path()
        ..moveTo(0, size.height * 0.62)
        ..quadraticBezierTo(size.width * 0.4, size.height * 0.5, size.width,
            size.height * 0.64)
        ..lineTo(size.width, size.height)
        ..lineTo(0, size.height)
        ..close(),
      Paint()..color = const Color(0xFFCDE9D6),
    );
    canvas.drawPath(
      Path()
        ..moveTo(0, size.height * 0.8)
        ..quadraticBezierTo(size.width * 0.5, size.height * 0.72, size.width,
            size.height * 0.82)
        ..lineTo(size.width, size.height)
        ..lineTo(0, size.height)
        ..close(),
      Paint()..color = const Color(0xFFB9E0C7),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
