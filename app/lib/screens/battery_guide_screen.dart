import 'package:flutter/material.dart';
import '../l10n/labels.dart';
import '../theme.dart';

/// Rakiplerin en büyük şikâyeti "bildirim gelmiyor". Sebep neredeyse her zaman
/// üreticinin agresif pil yönetimi (Xiaomi, Samsung, Huawei, Oppo…).
/// Bunu kullanıcıya açıkça anlatan ekran bizim ayrışma noktamız.
class BatteryGuideScreen extends StatelessWidget {
  const BatteryGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    final p = Palette.of(context);

    // Marka adları çevrilmez; adımlar seçili dile göre gelir.
    final brands = <(String, List<String>)>[
      (
        'Xiaomi / Redmi / POCO',
        [l.batXiaomi1, l.batXiaomi2, l.batXiaomi3],
      ),
      (
        'Samsung',
        [l.batSamsung1, l.batSamsung2],
      ),
      (
        'Huawei / Honor',
        [l.batHuawei1, l.batHuawei2],
      ),
      (
        'Oppo / Realme / OnePlus / vivo',
        [l.batOppo1, l.batOppo2],
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: Text(l.batAppBarTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 6, 18, 24),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: SiplingColors.water.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              l.batIntro,
              style: TextStyle(fontSize: 13, color: p.ink, height: 1.5),
            ),
          ),
          const SizedBox(height: 18),
          for (final (brand, steps) in brands) ...[
            Text(brand,
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700, color: p.ink)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: p.card,
                borderRadius: BorderRadius.circular(16),
                boxShadow: softShadow(p.dark),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < steps.length; i++)
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: i == steps.length - 1 ? 0 : 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: SiplingColors.water,
                              shape: BoxShape.circle,
                            ),
                            child: Text('${i + 1}',
                                style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(steps[i],
                                style: TextStyle(
                                    fontSize: 13, color: p.ink, height: 1.45)),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
          Text(
            l.batFooter,
            style: TextStyle(fontSize: 12, color: p.inkSoft, height: 1.5),
          ),
        ],
      ),
    );
  }
}
