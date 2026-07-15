import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/health/health_bridge.dart';
import 'achievements.dart';
import 'goal_calculator.dart';
import 'models.dart';
import 'season_theme.dart';
import 'tree_species.dart';

String dateKeyOf(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

/// Uygulamanın tek durum kaynağı. Her şey cihazda, SharedPreferences'ta durur.
/// Hiçbir veri sunucuya gitmez — uygulamanın internet izni bile yok.
class AppState extends ChangeNotifier {
  static const _kProfile = 'profile';
  static const _kReminder = 'reminder';
  static const _kCups = 'cups';
  static const _kDays = 'days';
  static const _kPro = 'pro';
  static const _kUnlocked = 'unlocked_species';
  static const _kSelected = 'selected_species';
  static const _kDark = 'dark_mode';
  static const _kSeenAchievements = 'seen_achievements';
  static const _kHealthSync = 'health_sync';
  static const _kSeason = 'season_theme';
  static const _kLastSummary = 'last_summary_date';

  late SharedPreferences _prefs;
  bool _ready = false;
  bool get ready => _ready;

  Profile _profile = const Profile();
  ReminderSettings _reminder = const ReminderSettings();
  List<CupPreset> _cups = List.of(CupPreset.defaults);
  final Map<String, DayRecord> _days = {};
  bool _isPro = false;
  Set<String> _rewardUnlocked = {};
  String _selectedSpecies = 'oak';
  bool _darkMode = false;
  Set<String> _seenAchievements = {};
  bool _healthSync = false;
  String _seasonId = kSeasonClassic.id;
  String? _lastSummaryDate;

  Profile get profile => _profile;
  ReminderSettings get reminder => _reminder;
  List<CupPreset> get cups => List.unmodifiable(_cups);
  bool get isPro => _isPro;
  bool get darkMode => _darkMode;
  String get selectedSpeciesId => _selectedSpecies;

  /// İçilen su Android'in ortak sağlık defterine (Health Connect) de yazılsın mı?
  /// Varsayılan **kapalı** — kullanıcı Ayarlar'dan açıp izin verene kadar
  /// uygulamadan hiçbir yere veri çıkmaz.
  bool get healthSync => _healthSync;

  /// Kullanıcının seçtiği orman teması (Pro değilse anlamsız olabilir).
  String get seasonId => _seasonId;

  /// Ormanın **gerçekten** çizileceği tema.
  /// Pro biterse mevsimler kilitlenir ve görünüm sessizce Klasik'e döner —
  /// veri kaybı yok, sadece kozmetik.
  SeasonTheme get seasonTheme {
    final s = seasonById(_seasonId);
    if (s.proOnly && !_isPro) return kSeasonClassic;
    return resolveSeason(_seasonId, DateTime.now());
  }

  int get goalMl => calculateGoalMl(_profile);

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();

    final p = _prefs.getString(_kProfile);
    if (p != null) _profile = Profile.fromJson(jsonDecode(p));

    final r = _prefs.getString(_kReminder);
    if (r != null) _reminder = ReminderSettings.fromJson(jsonDecode(r));

    final c = _prefs.getString(_kCups);
    if (c != null) {
      _cups = (jsonDecode(c) as List)
          .map((e) => CupPreset.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();
    }

    final d = _prefs.getString(_kDays);
    if (d != null) {
      final map = jsonDecode(d) as Map<String, dynamic>;
      for (final entry in map.entries) {
        _days[entry.key] =
            DayRecord.fromJson(Map<String, dynamic>.from(entry.value as Map));
      }
    }

    _isPro = _prefs.getBool(_kPro) ?? false;
    _darkMode = _prefs.getBool(_kDark) ?? false;
    _healthSync = _prefs.getBool(_kHealthSync) ?? false;
    _seasonId = _prefs.getString(_kSeason) ?? kSeasonClassic.id;
    _lastSummaryDate = _prefs.getString(_kLastSummary);
    _rewardUnlocked = (_prefs.getStringList(_kUnlocked) ?? []).toSet();
    _seenAchievements = (_prefs.getStringList(_kSeenAchievements) ?? []).toSet();
    _selectedSpecies = _prefs.getString(_kSelected) ?? 'oak';

    _ready = true;
    notifyListeners();
  }

  // ---------------------------------------------------------------- günler

  DayRecord dayFor(DateTime date) {
    final key = dateKeyOf(date);
    return _days[key] ??
        DayRecord(
            dateKey: key,
            sips: const [],
            goalMl: goalMl,
            treeSpeciesId: _selectedSpecies);
  }

  DayRecord get today => dayFor(DateTime.now());

  /// Son [count] günün kaydı, en eskiden yeniye.
  List<DayRecord> lastDays(int count) {
    final now = DateTime.now();
    return List.generate(count, (i) {
      final d = now.subtract(Duration(days: count - 1 - i));
      return dayFor(d);
    });
  }

  Future<void> addSip(int ml, DrinkType type) async {
    final now = DateTime.now();
    final key = dateKeyOf(now);
    final current = _days[key] ??
        DayRecord(
            dateKey: key,
            sips: const [],
            goalMl: goalMl,
            treeSpeciesId: _selectedSpecies);

    final wasCompleted = current.completed;
    _days[key] = current.copyWith(
      sips: [...current.sips, Sip(ml: ml, type: type, at: now)],
      goalMl: goalMl,
    );
    await _saveDays();
    notifyListeners();

    // Sağlık defterine gerçek hacim yazılır — hidrasyon katsayısı uygulanmadan.
    // HydrationRecord "içilen sıvı miktarı" demek; kahvenin 250 ml'si de 250 ml'dir.
    // Widget'tan gelen eklemeler de buradan geçtiği için orada da çalışır.
    if (_healthSync) await HealthBridge.writeWater(ml, now);

    // Hedef bu eklemeyle tamamlandıysa çağıran taraf kutlama gösterebilir.
    justCompletedToday = !wasCompleted && _days[key]!.completed;
  }

  /// Bir kere okunup sıfırlanan bayrak: hedef az önce tamamlandı mı?
  bool justCompletedToday = false;
  bool consumeJustCompleted() {
    final v = justCompletedToday;
    justCompletedToday = false;
    return v;
  }

  Future<void> undoLastSip() async {
    final key = dateKeyOf(DateTime.now());
    final current = _days[key];
    if (current == null || current.sips.isEmpty) return;
    final removed = current.sips.last;
    _days[key] = current.copyWith(sips: current.sips.sublist(0, current.sips.length - 1));
    await _saveDays();
    notifyListeners();

    // Sağlık defterindeki karşılığı da gitsin; yoksa geri alınan su orada kalır.
    if (_healthSync) await HealthBridge.deleteWaterAt(removed.at);
  }

  Future<void> _saveDays() async {
    // Ekran ve depolama için 400 günden eskisi gereksiz.
    if (_days.length > 400) {
      final keys = _days.keys.toList()..sort();
      for (final k in keys.take(_days.length - 400)) {
        _days.remove(k);
      }
    }
    await _prefs.setString(
        _kDays, jsonEncode(_days.map((k, v) => MapEntry(k, v.toJson()))));
  }

  // ------------------------------------------------------------- istatistik

  int get totalTrees => _days.values.where((d) => d.completed).length;

  /// Bugün henüz bitmediği için seri bugünden değil, dünden geriye sayılır;
  /// bugün tamamlandıysa o da eklenir. Böylece "gün ortası seriyi kaybettim"
  /// paniği yaşanmaz.
  int get currentStreak {
    var streak = 0;
    final now = DateTime.now();
    if (dayFor(now).completed) streak++;
    for (var i = 1; i < 400; i++) {
      final d = now.subtract(Duration(days: i));
      if (dayFor(d).completed) {
        streak++;
      } else {
        break;
      }
    }
    return streak;
  }

  int get bestStreak {
    final keys = _days.keys.toList()..sort();
    var best = 0, run = 0;
    DateTime? prev;
    for (final k in keys) {
      if (!_days[k]!.completed) {
        run = 0;
        prev = null;
        continue;
      }
      final d = DateTime.parse(k);
      run = (prev != null && d.difference(prev).inDays == 1) ? run + 1 : 1;
      prev = d;
      if (run > best) best = run;
    }
    return best;
  }

  AchievementStats get achievementStats {
    final all = _days.values;
    final types = <DrinkType>{};
    var early = false;
    for (final d in all) {
      for (final s in d.sips) {
        types.add(s.type);
        if (s.at.hour < 9) early = true;
      }
    }
    final week = lastDays(7).where((d) => d.completed).length;
    return AchievementStats(
      totalTrees: totalTrees,
      currentStreak: currentStreak,
      bestStreak: bestStreak,
      totalDaysLogged: all.where((d) => d.sips.isNotEmpty).length,
      distinctDrinkTypes: types.length,
      drankBefore9am: early,
      perfectWeek: week,
    );
  }

  List<Achievement> get unlockedAchievements {
    final s = achievementStats;
    return kAchievements.where((a) => a.unlocked(s)).toList();
  }

  /// "Orman Wrapped" paylaşım kartı için tüm-zamanlar özeti.
  /// Ham hacim (katsayısız) — kullanıcı "ne kadar sıvı içtim" görmek ister.
  ({double liters, int trees, int bestStreak, int daysLogged, DrinkType? topDrink})
      get wrappedStats {
    var ml = 0;
    final counts = <DrinkType, int>{};
    for (final d in _days.values) {
      for (final s in d.sips) {
        ml += s.ml;
        counts[s.type] = (counts[s.type] ?? 0) + s.ml;
      }
    }
    DrinkType? top;
    var most = 0;
    counts.forEach((k, v) {
      if (v > most) {
        most = v;
        top = k;
      }
    });
    return (
      liters: ml / 1000,
      trees: totalTrees,
      bestStreak: bestStreak,
      daysLogged: _days.values.where((d) => d.sips.isNotEmpty).length,
      topDrink: top,
    );
  }

  /// Henüz kullanıcıya gösterilmemiş yeni başarımlar.
  List<Achievement> takeNewAchievements() {
    final fresh =
        unlockedAchievements.where((a) => !_seenAchievements.contains(a.id));
    if (fresh.isEmpty) return const [];
    final list = fresh.toList();
    _seenAchievements.addAll(list.map((e) => e.id));
    _prefs.setStringList(_kSeenAchievements, _seenAchievements.toList());
    return list;
  }

  // ----------------------------------------------------------- ağaç türleri

  bool isSpeciesUnlocked(TreeSpecies s) => switch (s.rule) {
        UnlockRule.free => true,
        UnlockRule.pro => _isPro,
        UnlockRule.rewardedAd => _isPro || _rewardUnlocked.contains(s.id),
        UnlockRule.streak => bestStreak >= s.threshold,
        UnlockRule.totalTrees => totalTrees >= s.threshold,
      };

  Future<void> unlockWithReward(String speciesId) async {
    _rewardUnlocked.add(speciesId);
    await _prefs.setStringList(_kUnlocked, _rewardUnlocked.toList());
    notifyListeners();
  }

  Future<void> selectSpecies(String id) async {
    _selectedSpecies = id;
    await _prefs.setString(_kSelected, id);
    // Bugünün ağacı henüz tamamlanmadıysa türü değiştir.
    final key = dateKeyOf(DateTime.now());
    final d = _days[key];
    if (d != null && !d.completed) {
      _days[key] = d.copyWith(treeSpeciesId: id);
      await _saveDays();
    }
    notifyListeners();
  }

  // ---------------------------------------------------------------- ayarlar

  Future<void> saveProfile(Profile p) async {
    _profile = p;
    await _prefs.setString(_kProfile, jsonEncode(p.toJson()));
    notifyListeners();
  }

  Future<void> saveReminder(ReminderSettings r) async {
    _reminder = r;
    await _prefs.setString(_kReminder, jsonEncode(r.toJson()));
    notifyListeners();
  }

  Future<void> saveCups(List<CupPreset> c) async {
    _cups = c;
    await _prefs.setString(
        _kCups, jsonEncode(c.map((e) => e.toJson()).toList()));
    notifyListeners();
  }

  Future<void> setDarkMode(bool v) async {
    _darkMode = v;
    await _prefs.setBool(_kDark, v);
    notifyListeners();
  }

  /// Gerçek satın alma bağlanana kadar Pro'yu açan geçici anahtar.
  Future<void> setPro(bool v) async {
    _isPro = v;
    await _prefs.setBool(_kPro, v);
    notifyListeners();
  }

  /// Health Connect'e yazmayı açar/kapatır. İzin isteme işi çağıran ekrana ait
  /// (`settings_screen.dart`); burada yalnız tercih saklanır.
  Future<void> setHealthSync(bool v) async {
    _healthSync = v;
    await _prefs.setBool(_kHealthSync, v);
    notifyListeners();
  }

  Future<void> setSeason(String id) async {
    _seasonId = id;
    await _prefs.setString(_kSeason, id);
    notifyListeners();
  }

  // -------------------------------------------------------- gün sonu özeti

  /// Dünün özeti gösterilmeli mi? Koşullar: dün bir şey içilmiş olacak ve o gün
  /// için özet daha önce açılmamış olacak. Böylece özet günde en fazla bir kez,
  /// yalnız ertesi gün uygulama ilk açıldığında çıkar.
  DayRecord? get pendingSummary {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    final key = dateKeyOf(yesterday);
    if (_lastSummaryDate == key) return null;
    final record = _days[key];
    if (record == null || record.sips.isEmpty) return null;
    return record;
  }

  Future<void> markSummarySeen(String dateKey) async {
    _lastSummaryDate = dateKey;
    await _prefs.setString(_kLastSummary, dateKey);
  }

  Future<void> resetAll() async {
    await _prefs.clear();
    _profile = const Profile();
    _reminder = const ReminderSettings();
    _cups = List.of(CupPreset.defaults);
    _days.clear();
    _isPro = false;
    _rewardUnlocked = {};
    _seenAchievements = {};
    _selectedSpecies = 'oak';
    _darkMode = false;
    _healthSync = false;
    _seasonId = kSeasonClassic.id;
    _lastSummaryDate = null;
    notifyListeners();
  }
}
