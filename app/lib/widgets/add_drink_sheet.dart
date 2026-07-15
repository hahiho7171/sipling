import 'package:flutter/material.dart';
import '../data/models.dart';
import '../l10n/labels.dart';
import '../theme.dart';

/// "+" butonuna basınca açılan sayfa: içecek türü + serbest miktar.
class AddDrinkSheet extends StatefulWidget {
  const AddDrinkSheet({super.key});

  @override
  State<AddDrinkSheet> createState() => _AddDrinkSheetState();
}

class _AddDrinkSheetState extends State<AddDrinkSheet> {
  DrinkType _type = DrinkType.water;
  int _ml = 250;

  @override
  Widget build(BuildContext context) {
    final p = Palette.of(context);
    final l = context.l;
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 38,
              height: 4,
              decoration: BoxDecoration(
                color: p.inkSoft.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(l.addWhatTitle,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w700, color: p.ink)),
          const SizedBox(height: 14),
          // 7 içecek 2 satıra yayılır — hepsi tek bakışta görünür, yatay kaydırma yok.
          // (Eskiden yatay ListView'di; son 3 içecek ekran dışında gizli kalıyordu.)
          LayoutBuilder(
            builder: (context, c) {
              const gap = 10.0;
              final w = (c.maxWidth - gap * 3) / 4; // satır başına 4 içecek
              return Wrap(
                spacing: gap,
                runSpacing: gap,
                children: [
                  for (final t in DrinkType.values)
                    GestureDetector(
                      onTap: () => setState(() => _type = t),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 160),
                        width: w,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: t == _type
                              ? t.color.withValues(alpha: 0.15)
                              : p.card,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: t == _type ? t.color : Colors.transparent,
                            width: 1.6,
                          ),
                          boxShadow: t == _type ? null : softShadow(p.dark),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(t.icon, color: t.color, size: 22),
                            const SizedBox(height: 6),
                            Text(t.label(l),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 11, color: p.ink)),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          const SizedBox(height: 8),
          _FactorHint(type: _type, ml: _ml),
          const SizedBox(height: 14),
          Row(
            children: [
              Text(l.addAmount, style: TextStyle(fontSize: 14, color: p.inkSoft)),
              const Spacer(),
              Text('$_ml ml',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700, color: p.ink)),
            ],
          ),
          Slider(
            value: _ml.toDouble(),
            min: 50,
            max: 1000,
            divisions: 38,
            activeColor: _type.color,
            onChanged: (v) => setState(() => _ml = (v / 25).round() * 25),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: FilledButton(
              onPressed: () => Navigator.of(context).pop((_ml, _type)),
              style: FilledButton.styleFrom(
                backgroundColor: _type.color,
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: Text(l.addConfirm,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}

/// İçeceğin kaç ml suya denk sayıldığını söyler (su içeriği bazlı).
/// Su → birebir · alkol → uyarı · diğerleri → "≈ N ml su (%oran)".
class _FactorHint extends StatelessWidget {
  final DrinkType type;
  final int ml;
  const _FactorHint({required this.type, required this.ml});

  @override
  Widget build(BuildContext context) {
    final p = Palette.of(context);
    final l = context.l;
    if (type == DrinkType.water) {
      return Text(l.addFactorWater,
          style: TextStyle(fontSize: 12, color: p.inkSoft));
    }
    if (type.factor < 0) {
      return Text(
        l.addFactorAlcohol,
        style: TextStyle(
            fontSize: 12, color: type.color, fontWeight: FontWeight.w600),
      );
    }
    // "içindeki su" = ml × su içeriği. Kaydırıcıyla canlı güncellenir.
    final eq = (ml * type.factor).round();
    final percent = (type.factor * 100).round();
    return Text(l.addFactorWaterEq(eq, percent),
        style: TextStyle(fontSize: 12, color: p.inkSoft));
  }
}
