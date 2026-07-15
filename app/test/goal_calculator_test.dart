import 'package:flutter_test/flutter_test.dart';
import 'package:sipling/data/goal_calculator.dart';
import 'package:sipling/data/models.dart';

void main() {
  group('calculateGoalMl', () {
    test('referans kilodaki kadın 2000 ml alır', () {
      const p = Profile(gender: Gender.female, weightKg: 60);
      expect(calculateGoalMl(p), 2000);
    });

    test('referans kilodaki erkek 2500 ml alır', () {
      const p = Profile(gender: Gender.male, weightKg: 70);
      expect(calculateGoalMl(p), 2500);
    });

    test('her fazla kilo hedefi 12 ml artırır, 50 ml\'ye yuvarlanır', () {
      const p = Profile(gender: Gender.male, weightKg: 80); // +120 ml → 2620 → 2600
      expect(calculateGoalMl(p), 2600);
    });

    test('hareketsizlik 200 ml düşürür, aktiflik 600 ml ekler', () {
      const low = Profile(
          gender: Gender.male, weightKg: 70, activity: ActivityLevel.low);
      const high = Profile(
          gender: Gender.male, weightKg: 70, activity: ActivityLevel.high);
      expect(calculateGoalMl(low), 2300);
      expect(calculateGoalMl(high), 3100);
    });

    test('elle girilen hedef her şeyi ezer', () {
      const p = Profile(
          gender: Gender.male, weightKg: 120, customGoalMl: 1800);
      expect(calculateGoalMl(p), 1800);
    });

    test('sonuç 1200-5000 ml aralığına sıkıştırılır', () {
      const tiny = Profile(
          gender: Gender.female, weightKg: 20, activity: ActivityLevel.low);
      const huge = Profile(
          gender: Gender.male, weightKg: 300, activity: ActivityLevel.high);
      expect(calculateGoalMl(tiny), greaterThanOrEqualTo(1200));
      expect(calculateGoalMl(huge), lessThanOrEqualTo(5000));
    });
  });

  group('calculateBmi', () {
    test('bilinen değer', () {
      const p = Profile(heightCm: 180, weightKg: 81); // 81 / 3.24 = 25.0
      expect(calculateBmi(p), closeTo(25.0, 0.01));
    });

    test('boy sıfırsa çökmez', () {
      const p = Profile(heightCm: 0, weightKg: 70);
      expect(calculateBmi(p), 0);
    });

    // Metin değil sınıf test edilir: etiketler artık dile göre üretiliyor
    // (l10n/labels.dart → bmiLabelOf), eşikler burada.
    test('sınıf sınırları', () {
      expect(bmiCategoryOf(18.4), BmiCategory.underweight);
      expect(bmiCategoryOf(18.5), BmiCategory.normal);
      expect(bmiCategoryOf(24.9), BmiCategory.normal);
      expect(bmiCategoryOf(25.0), BmiCategory.overweight);
      expect(bmiCategoryOf(30.0), BmiCategory.obese);
    });
  });

  group('expectedProgressAt', () {
    const p = Profile(wakeMinutes: 8 * 60, sleepMinutes: 23 * 60); // son fırsat 22:00

    test('uyanmadan önce sıfır', () {
      expect(expectedProgressAt(p, DateTime(2026, 1, 1, 7)), 0);
    });

    test('son fırsattan sonra tam', () {
      expect(expectedProgressAt(p, DateTime(2026, 1, 1, 22)), 1);
      expect(expectedProgressAt(p, DateTime(2026, 1, 1, 23, 30)), 1);
    });

    test('tam ortada yarım', () {
      // 08:00 → 22:00 arası 14 saat; ortası 15:00.
      expect(expectedProgressAt(p, DateTime(2026, 1, 1, 15)), closeTo(0.5, 0.001));
    });
  });
}
