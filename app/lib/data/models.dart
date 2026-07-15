import 'package:flutter/material.dart';

/// İçecek türü. Katsayı = içeceğin **fiziksel su içeriği** (1 litresinin kaç litre
/// suya denk geldiği). Kaynak: USDA FoodData Central gıda-bileşim verileri.
///   çay ~%99,5 · kahve ~%99 · kola ~%90 · süt ~%88 · meyve suyu ~%88
/// Kullanıcı "içindeki su oranı görünsün" dedi (2026-07-11) → hidrasyon indeksi (BHI)
/// yerine somut su içeriği seçildi. Faktör × ml = "≈ kaç ml su" olarak gösterilir.
///
/// 🚨 Alkol İSTİSNA: bira ~%92 su olsa da alkol diüretiktir (susuz bırakır); tek
/// negatif katsayı odur ve arayüzde su-eşdeğeri yerine uyarı gösterilir.
/// Ad taşımaz — kullanıcıya görünen adlar `l10n/labels.dart` içinde.
enum DrinkType {
  water(Icons.water_drop, 1.0, Color(0xFF4FB3E8)),
  tea(Icons.emoji_food_beverage, 0.99, Color(0xFFB4703A)),
  coffee(Icons.coffee, 0.99, Color(0xFF6F4A34)),
  milk(Icons.local_drink, 0.88, Color(0xFFBFC9D1)),
  juice(Icons.local_bar, 0.88, Color(0xFFE99C3C)),
  soda(Icons.bubble_chart, 0.90, Color(0xFF8E6BC4)),
  alcohol(Icons.wine_bar, -0.5, Color(0xFF9E4A5B));

  const DrinkType(this.icon, this.factor, this.color);
  final IconData icon;
  final double factor;
  final Color color;

  static DrinkType fromName(String n) =>
      DrinkType.values.firstWhere((e) => e.name == n, orElse: () => water);
}

/// Tek bir içme kaydı.
class Sip {
  final int ml;
  final DrinkType type;
  final DateTime at;

  const Sip({required this.ml, required this.type, required this.at});

  /// Hedefe sayılan miktar. Alkol negatif katkı verir.
  double get effectiveMl => ml * type.factor;

  Map<String, dynamic> toJson() =>
      {'ml': ml, 't': type.name, 'at': at.millisecondsSinceEpoch};

  factory Sip.fromJson(Map<String, dynamic> j) => Sip(
        ml: j['ml'] as int,
        type: DrinkType.fromName(j['t'] as String),
        at: DateTime.fromMillisecondsSinceEpoch(j['at'] as int),
      );
}

/// Bir günün tamamı.
class DayRecord {
  final String dateKey; // yyyy-MM-dd
  final List<Sip> sips;
  final int goalMl;
  final String treeSpeciesId;

  const DayRecord({
    required this.dateKey,
    required this.sips,
    required this.goalMl,
    required this.treeSpeciesId,
  });

  double get totalMl =>
      sips.fold(0.0, (a, s) => a + s.effectiveMl).clamp(0, double.infinity);

  /// Ham içilen miktar (katsayısız) — istatistikte "ne kadar sıvı aldın" için.
  int get rawMl => sips.fold(0, (a, s) => a + s.ml);

  double get progress => goalMl == 0 ? 0 : (totalMl / goalMl).clamp(0.0, 1.0);
  bool get completed => progress >= 1.0;

  Map<String, dynamic> toJson() => {
        'd': dateKey,
        'g': goalMl,
        'sp': treeSpeciesId,
        's': sips.map((e) => e.toJson()).toList(),
      };

  factory DayRecord.fromJson(Map<String, dynamic> j) => DayRecord(
        dateKey: j['d'] as String,
        goalMl: j['g'] as int,
        treeSpeciesId: (j['sp'] as String?) ?? 'oak',
        sips: (j['s'] as List)
            .map((e) => Sip.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList(),
      );

  DayRecord copyWith({List<Sip>? sips, int? goalMl, String? treeSpeciesId}) =>
      DayRecord(
        dateKey: dateKey,
        sips: sips ?? this.sips,
        goalMl: goalMl ?? this.goalMl,
        treeSpeciesId: treeSpeciesId ?? this.treeSpeciesId,
      );
}

enum Gender { female, male, other }

/// EFSA referansı "orta düzey aktivite" varsayar; bu yüzden [medium] sapması 0'dır.
/// Ad ve açıklama taşımaz — `l10n/labels.dart` içinde dile göre üretilir.
enum ActivityLevel {
  low(-200),
  medium(0),
  high(600);

  const ActivityLevel(this.extraMl);
  final int extraMl;
}

enum Unit { ml, oz }

/// Kullanıcı profili + tercihler. Hepsi cihazda saklanır, hiçbir yere gitmez.
class Profile {
  final Gender gender;
  final int age;
  final int heightCm;
  final int weightKg;
  final ActivityLevel activity;
  final int wakeMinutes; // gün içi dakika (07:00 = 420)
  final int sleepMinutes; // 23:00 = 1380
  final int? customGoalMl; // kullanıcı elle ayarladıysa
  final Unit unit;
  final bool onboarded;

  const Profile({
    this.gender = Gender.other,
    this.age = 30,
    this.heightCm = 170,
    this.weightKg = 70,
    this.activity = ActivityLevel.medium,
    this.wakeMinutes = 7 * 60,
    this.sleepMinutes = 23 * 60,
    this.customGoalMl,
    this.unit = Unit.ml,
    this.onboarded = false,
  });

  Map<String, dynamic> toJson() => {
        'g': gender.name,
        'a': age,
        'h': heightCm,
        'w': weightKg,
        'act': activity.name,
        'wake': wakeMinutes,
        'sleep': sleepMinutes,
        'goal': customGoalMl,
        'u': unit.name,
        'ob': onboarded,
      };

  factory Profile.fromJson(Map<String, dynamic> j) => Profile(
        gender: Gender.values.firstWhere((e) => e.name == j['g'],
            orElse: () => Gender.other),
        age: j['a'] as int,
        heightCm: j['h'] as int,
        weightKg: j['w'] as int,
        activity: ActivityLevel.values.firstWhere((e) => e.name == j['act'],
            orElse: () => ActivityLevel.medium),
        wakeMinutes: j['wake'] as int,
        sleepMinutes: j['sleep'] as int,
        customGoalMl: j['goal'] as int?,
        unit: Unit.values
            .firstWhere((e) => e.name == j['u'], orElse: () => Unit.ml),
        onboarded: (j['ob'] as bool?) ?? false,
      );

  Profile copyWith({
    Gender? gender,
    int? age,
    int? heightCm,
    int? weightKg,
    ActivityLevel? activity,
    int? wakeMinutes,
    int? sleepMinutes,
    int? customGoalMl,
    bool clearCustomGoal = false,
    Unit? unit,
    bool? onboarded,
  }) =>
      Profile(
        gender: gender ?? this.gender,
        age: age ?? this.age,
        heightCm: heightCm ?? this.heightCm,
        weightKg: weightKg ?? this.weightKg,
        activity: activity ?? this.activity,
        wakeMinutes: wakeMinutes ?? this.wakeMinutes,
        sleepMinutes: sleepMinutes ?? this.sleepMinutes,
        customGoalMl:
            clearCustomGoal ? null : (customGoalMl ?? this.customGoalMl),
        unit: unit ?? this.unit,
        onboarded: onboarded ?? this.onboarded,
      );
}

/// Bildirim tercihleri.
///
/// Hatırlatmalar yalnız uyanık saatler arasında planlanır; ayrıca
/// [stopWhenDone] açıkken günlük hedef tamamlandığı anda o günün kalan
/// hatırlatmaları iptal edilir.
class ReminderSettings {
  final bool enabled;
  final int intervalMinutes; // 60, 90, 120, 180
  final bool stopWhenDone;
  final bool silent; // sessiz bildirim (ses/titreşim yok)

  const ReminderSettings({
    this.enabled = true,
    this.intervalMinutes = 120,
    this.stopWhenDone = true,
    this.silent = false,
  });

  Map<String, dynamic> toJson() => {
        'e': enabled,
        'i': intervalMinutes,
        'b': stopWhenDone,
        's': silent,
      };

  factory ReminderSettings.fromJson(Map<String, dynamic> j) => ReminderSettings(
        enabled: j['e'] as bool,
        intervalMinutes: j['i'] as int,
        stopWhenDone: (j['b'] as bool?) ?? true,
        silent: (j['s'] as bool?) ?? false,
      );

  ReminderSettings copyWith({
    bool? enabled,
    int? intervalMinutes,
    bool? stopWhenDone,
    bool? silent,
  }) =>
      ReminderSettings(
        enabled: enabled ?? this.enabled,
        intervalMinutes: intervalMinutes ?? this.intervalMinutes,
        stopWhenDone: stopWhenDone ?? this.stopWhenDone,
        silent: silent ?? this.silent,
      );
}

/// Hızlı ekleme butonu.
class CupPreset {
  final int ml;
  final DrinkType type;
  final String label;

  const CupPreset({required this.ml, required this.type, required this.label});

  Map<String, dynamic> toJson() => {'ml': ml, 't': type.name, 'l': label};

  factory CupPreset.fromJson(Map<String, dynamic> j) => CupPreset(
        ml: j['ml'] as int,
        type: DrinkType.fromName(j['t'] as String),
        label: j['l'] as String,
      );

  /// Varsayılan adlar **boş** bırakılır: kullanıcı kendi ad vermediyse ekran
  /// bunları dile göre yazar (`cupLabel()` → `l10n/labels.dart`). Türkçe adı
  /// prefs'e yazsaydık, dil değişince "Bardak" olduğu yerde kalırdı.
  static const defaults = [
    CupPreset(ml: 200, type: DrinkType.water, label: ''),
    CupPreset(ml: 330, type: DrinkType.water, label: ''),
    CupPreset(ml: 500, type: DrinkType.water, label: ''),
  ];
}
