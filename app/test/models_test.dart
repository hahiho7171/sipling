import 'package:flutter_test/flutter_test.dart';
import 'package:sipling/data/models.dart';

DayRecord _day(List<Sip> sips, {int goal = 2000}) => DayRecord(
      dateKey: '2026-07-09',
      sips: sips,
      goalMl: goal,
      treeSpeciesId: 'oak',
    );

Sip _sip(int ml, DrinkType t) => Sip(ml: ml, type: t, at: DateTime(2026, 7, 9, 10));

void main() {
  group('DayRecord.totalMl — su içeriği katsayısı', () {
    test('su birebir sayılır', () {
      expect(_day([_sip(500, DrinkType.water)]).totalMl, 500);
    });

    test('kahve su içeriğiyle (~%99) sayılır', () {
      // USDA: kahve ~%99 su. 200 × 0.99 = 198.
      expect(_day([_sip(200, DrinkType.coffee)]).totalMl, closeTo(198, 0.001));
    });

    test('alkol hedeften düşer ama toplam eksiye inmez', () {
      // 300 su (+300) + 400 alkol (-200) = 100
      expect(
        _day([_sip(300, DrinkType.water), _sip(400, DrinkType.alcohol)]).totalMl,
        closeTo(100, 0.001),
      );
      // Yalnız alkol içildiyse toplam 0'ın altına düşmez.
      expect(_day([_sip(400, DrinkType.alcohol)]).totalMl, 0);
    });
  });

  group('DayRecord.rawMl — ham hacim', () {
    test('katsayı uygulanmaz, alkol de pozitif sayılır', () {
      final d = _day([_sip(200, DrinkType.coffee), _sip(300, DrinkType.alcohol)]);
      expect(d.rawMl, 500);
    });
  });

  group('DayRecord.progress / completed', () {
    test('hedefe ulaşınca tamamlanır', () {
      final d = _day([_sip(2000, DrinkType.water)]);
      expect(d.progress, 1.0);
      expect(d.completed, isTrue);
    });

    test('hedefi aşmak ilerlemeyi 1.0 üstüne çıkarmaz', () {
      final d = _day([_sip(5000, DrinkType.water)]);
      expect(d.progress, 1.0);
    });

    test('hedef sıfırsa bölme hatası olmaz', () {
      final d = _day([_sip(500, DrinkType.water)], goal: 0);
      expect(d.progress, 0);
      expect(d.completed, isFalse);
    });
  });

  group('JSON gidiş-dönüş', () {
    test('DayRecord kaybolmadan geri okunur', () {
      final d = _day([_sip(250, DrinkType.tea), _sip(100, DrinkType.juice)]);
      final back = DayRecord.fromJson(d.toJson());
      expect(back.dateKey, d.dateKey);
      expect(back.goalMl, d.goalMl);
      expect(back.treeSpeciesId, d.treeSpeciesId);
      expect(back.sips.length, 2);
      expect(back.totalMl, closeTo(d.totalMl, 0.001));
    });

    test('Profile kaybolmadan geri okunur', () {
      const p = Profile(
          gender: Gender.female,
          age: 28,
          heightCm: 165,
          weightKg: 58,
          activity: ActivityLevel.high,
          customGoalMl: 2400,
          onboarded: true);
      final back = Profile.fromJson(p.toJson());
      expect(back.gender, Gender.female);
      expect(back.activity, ActivityLevel.high);
      expect(back.customGoalMl, 2400);
      expect(back.onboarded, isTrue);
    });

    test('bilinmeyen içecek adı suya düşer', () {
      expect(DrinkType.fromName('kolonya'), DrinkType.water);
    });
  });
}
