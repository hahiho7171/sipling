import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/models.dart';
import '../data/store.dart';
import '../l10n/labels.dart';
import '../theme.dart';

/// "Bugünün kayıtları" — bugün eklenen içecekleri (yeniden eskiye) listeler ve
/// tek tek silmeye izin verir. Eskiden yalnız "son eklemeyi geri al" vardı.
///
/// Silme işini çağıran ekran yapar ([onDelete]); pencere `AppState`'i dinlediği
/// için silinen kayıt anında listeden düşer.
class DayLogSheet extends StatelessWidget {
  final Future<void> Function(Sip sip) onDelete;
  const DayLogSheet({super.key, required this.onDelete});

  static String _hhmm(DateTime d) =>
      '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    final p = Palette.of(context);
    final sips = context.watch<AppState>().today.sips;
    final reversed = sips.reversed.toList();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 18, 12, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8, bottom: 6),
              child: Text(l.logTitle,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: p.ink)),
            ),
            if (reversed.isEmpty)
              Padding(
                padding: const EdgeInsets.only(right: 8, top: 12, bottom: 20),
                child: Text(l.logEmpty,
                    style: TextStyle(fontSize: 14, color: p.inkSoft)),
              )
            else
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: reversed.length,
                  itemBuilder: (context, i) {
                    final s = reversed[i];
                    return ListTile(
                      contentPadding: const EdgeInsets.only(right: 4),
                      leading: Icon(s.type.icon, color: s.type.color),
                      title: Text('${s.ml} ml · ${s.type.label(l)}',
                          style: TextStyle(fontSize: 14, color: p.ink)),
                      subtitle: Text(_hhmm(s.at),
                          style: TextStyle(fontSize: 12, color: p.inkSoft)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete_outline, color: p.inkSoft),
                        tooltip: l.logDelete,
                        onPressed: () => onDelete(s),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
