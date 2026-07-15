import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sipling/data/models.dart';
import 'package:sipling/data/store.dart';

/// [offsets] bugünden kaç gün önce, hedefin ne kadarı içilmiş.
/// Örn. {0: 1.0, 1: 0.5} → bugün tamamlandı, dün yarım kaldı.
Future<AppState> _stateWith(Map<int, double> offsets) async {
  const goal = 2000;
  final now = DateTime.now();
  final days = <String, dynamic>{};

  offsets.forEach((offset, fraction) {
    final d = now.subtract(Duration(days: offset));
    final key = dateKeyOf(d);
    days[key] = DayRecord(
      dateKey: key,
      goalMl: goal,
      treeSpeciesId: 'oak',
      sips: [
        Sip(ml: (goal * fraction).round(), type: DrinkType.water, at: d),
      ],
    ).toJson();
  });

  SharedPreferences.setMockInitialValues({
    'flutter.days': jsonEncode(days),
    'flutter.profile': jsonEncode(const Profile(onboarded: true).toJson()),
  });

  final state = AppState();
  await state.init();
  return state;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('currentStreak', () {
    test('hiç kayıt yoksa sıfır', () async {
      final s = await _stateWith({});
      expect(s.currentStreak, 0);
    });

    test('bugün yarım kaldıysa seri SIFIRLANMAZ — dünden geriye sayılır', () async {
      // Gün ortasında hedefi tutturmamış olmak paniğe yol açmamalı.
      final s = await _stateWith({0: 0.3, 1: 1.0, 2: 1.0});
      expect(s.currentStreak, 2);
    });

    test('bugün tamamlandıysa bugün de sayılır', () async {
      final s = await _stateWith({0: 1.0, 1: 1.0, 2: 1.0});
      expect(s.currentStreak, 3);
    });

    test('araya giren eksik gün seriyi keser', () async {
      final s = await _stateWith({0: 1.0, 1: 1.0, 2: 0.4, 3: 1.0});
      expect(s.currentStreak, 2);
    });

    test('dün eksikse ve bugün tamamsa seri 1', () async {
      final s = await _stateWith({0: 1.0, 1: 0.2});
      expect(s.currentStreak, 1);
    });
  });

  group('bestStreak', () {
    test('en uzun kesintisiz diziyi bulur', () async {
      // 5,4,3 tam (3 gün) · 2 eksik · 1,0 tam (2 gün) → en iyi 3
      final s = await _stateWith(
          {5: 1.0, 4: 1.0, 3: 1.0, 2: 0.5, 1: 1.0, 0: 1.0});
      expect(s.bestStreak, 3);
    });

    test('kayıt yoksa sıfır', () async {
      final s = await _stateWith({});
      expect(s.bestStreak, 0);
    });
  });

  group('totalTrees', () {
    test('yalnız tamamlanan günler ağaç sayılır', () async {
      final s = await _stateWith({0: 1.0, 1: 0.9, 2: 1.0, 3: 0.1});
      expect(s.totalTrees, 2);
    });
  });

  group('pendingSummary', () {
    test('dün içilmişse ve özet görülmemişse dünün kaydını döndürür', () async {
      final s = await _stateWith({1: 0.6});
      expect(s.pendingSummary, isNotNull);
      expect(s.pendingSummary!.dateKey,
          dateKeyOf(DateTime.now().subtract(const Duration(days: 1))));
    });

    test('özet görüldüyse bir daha çıkmaz', () async {
      final s = await _stateWith({1: 0.6});
      await s.markSummarySeen(s.pendingSummary!.dateKey);
      expect(s.pendingSummary, isNull);
    });

    test('dün hiç içilmemişse özet yok', () async {
      final s = await _stateWith({0: 1.0});
      expect(s.pendingSummary, isNull);
    });
  });
}
