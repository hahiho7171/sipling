import 'package:flutter/widgets.dart';

import '../data/achievements.dart';
import '../data/goal_calculator.dart';
import '../data/models.dart';
import '../data/season_theme.dart';
import '../data/tree_species.dart';
import 'app_localizations.dart';

// Ekranlar yalnız bu dosyayı import ediyor; `L` tipini de buradan görsünler
// (ör. `String _intervalLabel(L l, int m)` gibi imzalar için).
export 'app_localizations.dart';

/// Veri katmanı artık metin taşımıyor — yalnız kimlik (`id`) taşıyor.
/// Kullanıcıya görünen adlar burada, seçili dile göre üretilir.
///
/// Neden burada: `DrinkType`, `TreeSpecies`, `Achievement`, `SeasonTheme`
/// birer `const` sabit; içlerine Türkçe metin gömülüydü ve iki dilde
/// yaşayamazlardı.

extension DrinkLabel on DrinkType {
  String label(L l) => switch (this) {
        DrinkType.water => l.drinkWater,
        DrinkType.tea => l.drinkTea,
        DrinkType.coffee => l.drinkCoffee,
        DrinkType.milk => l.drinkMilk,
        DrinkType.juice => l.drinkJuice,
        DrinkType.soda => l.drinkSoda,
        DrinkType.alcohol => l.drinkAlcohol,
      };
}

extension SpeciesLabel on TreeSpecies {
  String name(L l) => switch (id) {
        'oak' => l.speciesOak,
        'pine' => l.speciesPine,
        'cherry' => l.speciesCherry,
        'acacia' => l.speciesAcacia,
        'maple' => l.speciesMaple,
        'olive' => l.speciesOlive,
        'golden' => l.speciesGolden,
        'jacaranda' => l.speciesJacaranda,
        _ => id,
      };

  /// "Nasıl açılır" açıklaması.
  String unlockText(L l) => switch (rule) {
        UnlockRule.free => l.unlockFree,
        UnlockRule.streak => l.unlockStreak(threshold),
        UnlockRule.totalTrees => l.unlockTotalTrees(threshold),
        UnlockRule.rewardedAd => l.unlockRewardedAd,
        UnlockRule.pro => l.unlockPro,
      };
}

extension AchievementLabel on Achievement {
  String title(L l) => switch (id) {
        'first_sprout' => l.achFirstSproutTitle,
        'first_tree' => l.achFirstTreeTitle,
        'streak_3' => l.achStreak3Title,
        'streak_7' => l.achStreak7Title,
        'streak_30' => l.achStreak30Title,
        'trees_10' => l.achTrees10Title,
        'trees_50' => l.achTrees50Title,
        'early_bird' => l.achEarlyBirdTitle,
        'variety' => l.achVarietyTitle,
        'perfect_week' => l.achPerfectWeekTitle,
        _ => id,
      };

  String description(L l) => switch (id) {
        'first_sprout' => l.achFirstSproutDesc,
        'first_tree' => l.achFirstTreeDesc,
        'streak_3' => l.achStreak3Desc,
        'streak_7' => l.achStreak7Desc,
        'streak_30' => l.achStreak30Desc,
        'trees_10' => l.achTrees10Desc,
        'trees_50' => l.achTrees50Desc,
        'early_bird' => l.achEarlyBirdDesc,
        'variety' => l.achVarietyDesc,
        'perfect_week' => l.achPerfectWeekDesc,
        _ => '',
      };
}

extension SeasonLabel on SeasonTheme {
  String name(L l) => switch (id) {
        'classic' => l.seasonClassicName,
        'auto' => l.seasonAutoName,
        'spring' => l.seasonSpringName,
        'summer' => l.seasonSummerName,
        'autumn' => l.seasonAutumnName,
        'winter' => l.seasonWinterName,
        _ => id,
      };

  String description(L l) => switch (id) {
        'classic' => l.seasonClassicDesc,
        'auto' => l.seasonAutoDesc,
        'spring' => l.seasonSpringDesc,
        'summer' => l.seasonSummerDesc,
        'autumn' => l.seasonAutumnDesc,
        'winter' => l.seasonWinterDesc,
        _ => '',
      };
}

extension ActivityLabel on ActivityLevel {
  String label(L l) => switch (this) {
        ActivityLevel.low => l.activityLow,
        ActivityLevel.medium => l.activityMedium,
        ActivityLevel.high => l.activityHigh,
      };

  String hint(L l) => switch (this) {
        ActivityLevel.low => l.activityLowHint,
        ActivityLevel.medium => l.activityMediumHint,
        ActivityLevel.high => l.activityHighHint,
      };
}

/// Bardağın görünen adı. Kullanıcı kendi ad vermediyse (boş), sıradaki
/// varsayılan ad dile göre yazılır — prefs'e Türkçe ad gömülmez.
String cupLabel(L l, CupPreset cup, int index) {
  if (cup.label.isNotEmpty) return cup.label;
  return switch (index) {
    0 => l.cupGlass,
    1 => l.cupBottle,
    _ => l.cupLarge,
  };
}

/// Vücut kitle indeksi etiketi. Sağlık tavsiyesi değil, bilgi amaçlı.
String bmiLabelOf(L l, double bmi) => switch (bmiCategoryOf(bmi)) {
      BmiCategory.underweight => l.bmiUnderweight,
      BmiCategory.normal => l.bmiNormal,
      BmiCategory.overweight => l.bmiOverweight,
      BmiCategory.obese => l.bmiObese,
    };

/// Kısayol: `context.l.drinkWater`
extension LContext on BuildContext {
  L get l => L.of(this);
}
