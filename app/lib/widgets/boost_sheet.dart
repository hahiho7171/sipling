import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/store.dart';
import '../l10n/labels.dart';
import '../theme.dart';

/// "Sıcak gün / spor" — bugünün hedefine geçici ekleme penceresi.
///
/// Seçilen miktarı (250 / 500 / 750) `Navigator.pop` ile döndürür; **0 = sıfırla**.
/// Kaydetme işini çağıran ekran (`home_screen`) yapar; bu pencere yalnız seçtirir.
class BoostSheet extends StatelessWidget {
  const BoostSheet({super.key});

  static const _options = [250, 500, 750];

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    final p = Palette.of(context);
    final boost = context.watch<AppState>().today.boostMl;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.wb_sunny_outlined,
                    color: SiplingColors.streak),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(l.boostTitle,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: p.ink)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(l.boostBody,
                style: TextStyle(fontSize: 13, color: p.inkSoft, height: 1.4)),
            if (boost > 0) ...[
              const SizedBox(height: 10),
              Text(l.boostActive(boost),
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: SiplingColors.streak)),
            ],
            const SizedBox(height: 16),
            Row(
              children: [
                for (final o in _options) ...[
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(o),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: SiplingColors.water.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color:
                                  SiplingColors.water.withValues(alpha: 0.5)),
                        ),
                        child: Column(
                          children: [
                            Text('+$o',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: p.ink)),
                            Text('ml',
                                style: TextStyle(
                                    fontSize: 12, color: p.inkSoft)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (o != _options.last) const SizedBox(width: 10),
                ],
              ],
            ),
            if (boost > 0) ...[
              const SizedBox(height: 6),
              Center(
                child: TextButton.icon(
                  onPressed: () => Navigator.of(context).pop(0),
                  icon: const Icon(Icons.refresh, size: 18),
                  label: Text(l.boostReset),
                  style: TextButton.styleFrom(foregroundColor: p.inkSoft),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
