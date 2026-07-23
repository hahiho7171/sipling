import 'package:flutter_test/flutter_test.dart';
import 'package:sipling/data/models.dart';

void main() {
  group('DayRecord.boostMl — sıcak gün / spor artışı', () {
    DayRecord day({int goal = 2000, int boost = 0, List<Sip> sips = const []}) =>
        DayRecord(
            dateKey: '2026-07-23',
            sips: sips,
            goalMl: goal,
            treeSpeciesId: 'oak',
            boostMl: boost);

    test('efektif hedef = temel hedef + artış', () {
      expect(day(goal: 2000, boost: 500).effectiveGoalMl, 2500);
    });

    test('artış yoksa efektif hedef temel hedefe eşit', () {
      expect(day(goal: 2200).effectiveGoalMl, 2200);
    });

    test('tamamlanma efektif hedefe göre — artış tamamlamayı zorlaştırır', () {
      final sips = [Sip(ml: 2000, type: DrinkType.water, at: DateTime(2026, 7, 23, 10))];
      expect(day(goal: 2000, boost: 0, sips: sips).completed, isTrue);
      expect(day(goal: 2000, boost: 500, sips: sips).completed, isFalse); // 2000/2500
    });

    test('ilerleme efektif hedefe göre hesaplanır', () {
      final sips = [Sip(ml: 1250, type: DrinkType.water, at: DateTime(2026, 7, 23, 10))];
      expect(day(goal: 2000, boost: 500, sips: sips).progress,
          closeTo(0.5, 0.001)); // 1250 / 2500
    });

    test('JSON gidiş-dönüş artışı korur', () {
      final back = DayRecord.fromJson(day(goal: 2000, boost: 750).toJson());
      expect(back.boostMl, 750);
      expect(back.effectiveGoalMl, 2750);
    });

    test('eski kayıtta artış alanı yoksa 0 olur (geriye uyum)', () {
      final json = {'d': '2026-07-01', 'g': 2000, 'sp': 'oak', 's': <dynamic>[]};
      expect(DayRecord.fromJson(json).boostMl, 0);
    });
  });

  group('ReminderSettings.style — hatırlatma stili + eski sürüm göçü', () {
    test('varsayılan stil Normal', () {
      expect(const ReminderSettings().style, ReminderStyle.normal);
    });

    test('yeni stil alanı JSON gidiş-dönüşte korunur', () {
      const r = ReminderSettings(style: ReminderStyle.gentle);
      expect(ReminderSettings.fromJson(r.toJson()).style, ReminderStyle.gentle);
    });

    test('eski sürüm silent=true → Sessiz stiline göç eder', () {
      final json = {'e': true, 'i': 120, 'b': true, 's': true};
      expect(ReminderSettings.fromJson(json).style, ReminderStyle.silent);
    });

    test('eski sürüm silent=false → Normal stiline göç eder', () {
      final json = {'e': true, 'i': 120, 'b': true, 's': false};
      expect(ReminderSettings.fromJson(json).style, ReminderStyle.normal);
    });
  });
}
