import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sipling/data/models.dart';
import 'package:sipling/data/store.dart';

/// [plan]: gün ofseti (bugünden kaç gün önce) → o güne eklenecek yudumlar (ml, tür).
Future<AppState> _stateWith(Map<int, List<(int, DrinkType)>> plan) async {
  const goal = 2000;
  final now = DateTime.now();
  final days = <String, dynamic>{};

  plan.forEach((offset, sips) {
    final d = now.subtract(Duration(days: offset));
    final key = dateKeyOf(d);
    days[key] = DayRecord(
      dateKey: key,
      goalMl: goal,
      treeSpeciesId: 'oak',
      sips: [for (final (ml, type) in sips) Sip(ml: ml, type: type, at: d)],
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

  group('wrappedStats', () {
    test('kayıt yoksa her şey sıfır, topDrink null', () async {
      final w = (await _stateWith({})).wrappedStats;
      expect(w.liters, 0);
      expect(w.trees, 0);
      expect(w.bestStreak, 0);
      expect(w.daysLogged, 0);
      expect(w.topDrink, isNull);
    });

    test('litre = ham ml toplamı / 1000 (katsayı uygulanmaz)', () async {
      // Kahve su içeriği 0.99 ama Wrapped HAM hacmi gösterir → tam ml sayılır.
      final w = (await _stateWith({
        0: [(500, DrinkType.water), (250, DrinkType.water)],
        1: [(250, DrinkType.coffee)],
      }))
          .wrappedStats;
      expect(w.liters, closeTo(1.0, 1e-9)); // 500+250+250 = 1000 ml
    });

    test('daysLogged = yudumu olan gün sayısı', () async {
      final w = (await _stateWith({
        0: [(500, DrinkType.water)],
        2: [(300, DrinkType.tea)],
        5: [(200, DrinkType.water)],
      }))
          .wrappedStats;
      expect(w.daysLogged, 3);
    });

    test('topDrink = en çok HACİM içilen tür (adet değil)', () async {
      // Kahve 2 kez ama azar azar; su tek kez ama çok → en çok su.
      final w = (await _stateWith({
        0: [
          (100, DrinkType.coffee),
          (100, DrinkType.coffee),
          (900, DrinkType.water),
        ],
      }))
          .wrappedStats;
      expect(w.topDrink, DrinkType.water);
    });

    test('trees ve bestStreak diğer getterlarla tutarlı', () async {
      final s = await _stateWith({
        0: [(2000, DrinkType.water)],
        1: [(2000, DrinkType.water)],
        2: [(2000, DrinkType.water)],
      });
      final w = s.wrappedStats;
      expect(w.trees, s.totalTrees);
      expect(w.bestStreak, s.bestStreak);
      expect(w.trees, 3); // üç günün üçünde de hedef tuttu
    });
  });
}
