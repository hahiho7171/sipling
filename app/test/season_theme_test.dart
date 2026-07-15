import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sipling/data/season_theme.dart';
import 'package:sipling/data/tree_species.dart';

void main() {
  group('seasonForMonth', () {
    test('kuzey yarımküre ayları', () {
      expect(seasonForMonth(4).id, 'spring');
      expect(seasonForMonth(7).id, 'summer');
      expect(seasonForMonth(10).id, 'autumn');
      expect(seasonForMonth(1).id, 'winter');
      expect(seasonForMonth(12).id, 'winter');
    });
  });

  group('resolveSeason', () {
    test('auto bugünün mevsimine çözülür', () {
      expect(resolveSeason('auto', DateTime(2026, 11, 3)).id, 'autumn');
    });

    test('elle seçilen tema takvimden etkilenmez', () {
      expect(resolveSeason('winter', DateTime(2026, 7, 1)).id, 'winter');
    });

    test('tanınmayan kimlik klasiğe düşer', () {
      expect(resolveSeason('bahar_2', DateTime(2026, 7, 1)).id, 'classic');
    });
  });

  group('SeasonTheme.tint', () {
    test('klasik tema ağacın rengine dokunmaz', () {
      final oak = kTreeSpecies.first;
      expect(identical(kSeasonClassic.tint(oak), oak), isTrue);
    });

    test('sonbahar yaprakları turuncuya çeker, gövdeye dokunmaz', () {
      final oak = kTreeSpecies.first;
      final tinted = kSeasonAutumn.tint(oak);
      expect(tinted.trunk, oak.trunk);
      expect(tinted.id, oak.id);
      expect(tinted.main, isNot(oak.main));
      // Turuncuya doğru → kırmızı bileşen artmalı.
      expect(tinted.main.r, greaterThan(oak.main.r));
    });

    test('tema ağacın kimliğini korur, yalnız rengini değiştirir', () {
      // TreeSpecies metin taşımıyor; kimlik korunuyorsa ad da korunur.
      expect(kSeasonWinter.tint(kTreeSpecies.first).id, kTreeSpecies.first.id);
    });

    test('kimlik ve şekil korunur — tema ağacın türünü değiştirmez', () {
      for (final s in kTreeSpecies) {
        final t = kSeasonWinter.tint(s);
        expect(t.id, s.id);
        expect(t.shape, s.shape);
        expect(t.rule, s.rule);
      }
    });
  });

  group('tema listesi', () {
    test('yalnız klasik ücretsiz', () {
      final free = kSeasonThemes.where((s) => !s.proOnly).toList();
      expect(free.length, 1);
      expect(free.single.id, 'classic');
    });

    test('her temanın açık ve koyu paleti farklı', () {
      for (final s in kSeasonThemes) {
        expect(s.light.skyTop, isNot(s.dark.skyTop), reason: s.id);
        expect(s.light.shadow, isNot(s.dark.shadow), reason: s.id);
      }
    });

    test('gölge rengi asla şeffaf değil', () {
      for (final s in kSeasonThemes) {
        expect(s.light.shadow.a, 1.0, reason: s.id);
      }
    });
  });

  test('WidgetsFlutterBinding gerekmiyor — saf veri', () {
    expect(kSeasonThemes.length, 6);
    expect(kSeasonAuto.icon, isA<IconData>());
  });
}
