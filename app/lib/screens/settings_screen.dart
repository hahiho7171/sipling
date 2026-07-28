import 'package:flutter/foundation.dart'
    show kIsWeb, defaultTargetPlatform, TargetPlatform;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/goal_calculator.dart';
import '../data/models.dart';
import '../data/store.dart';
import '../l10n/labels.dart';
import '../services/health/health_bridge.dart';
import '../services/home_widget_service.dart';
import '../services/notifications.dart';
import '../theme.dart';
import 'battery_guide_screen.dart';
import 'onboarding_screen.dart';
import 'pro_screen.dart';
import 'season_screen.dart';
import 'species_screen.dart';

/// Yalnız Android'de anlamı olan bölümler için tek kaynak.
/// Health Connect ve ana ekran widget'ı iOS'ta ÇALIŞMIYOR; gösterilirse
/// kullanıcıya hata/boş vaat veriyor ve Apple bunu 2.1(a)'dan reddediyor.
bool get _androidOnly => !kIsWeb && defaultTargetPlatform == TargetPlatform.android;

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Future<void> _resync(BuildContext context) async {
    final state = context.read<AppState>();
    await NotificationService.reschedule(
      profile: state.profile,
      settings: state.reminder,
      todayCompleted: state.today.completed,
      cups: state.cups,
    );
  }

  /// "Ana ekrana widget ekle" — sistemin tek-dokunuş widget yerleştirme
  /// diyaloğunu açar (Android 8+, minSdk 26 → tüm kullanıcılarda var). Launcher
  /// desteklemiyorsa elle ekleme yolunu anlatır.
  Future<void> _addWidget(BuildContext context) async {
    final l = context.l;
    if (await HomeWidgetService.isPinSupported()) {
      await HomeWidgetService.requestPin();
    } else if (context.mounted) {
      _snack(context, l.setAddWidgetManual);
    }
  }

  static void _snack(BuildContext context, String text) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(text)));
  }

  /// Health Connect anahtarı. Ancak izin gerçekten alınırsa açık konuma geçer —
  /// yoksa kullanıcı "yazılıyor" sanır, hiçbir şey yazılmaz.
  Future<void> _toggleHealth(BuildContext context, bool on) async {
    final l = context.l;
    final state = context.read<AppState>();
    if (!on) {
      await state.setHealthSync(false);
      return;
    }

    final availability = await HealthBridge.availability();
    if (!context.mounted) return;

    switch (availability) {
      case HealthAvailability.unsupported:
        _snack(context, l.setHealthNoConnect);
        return;
      case HealthAvailability.notInstalled:
      case HealthAvailability.needsUpdate:
        final install = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(availability == HealthAvailability.notInstalled
                ? l.setHealthNotInstalledTitle
                : l.setHealthNeedsUpdateTitle),
            content: Text(l.setHealthInstallBody),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(ctx, false),
                  child: Text(l.setCancel)),
              FilledButton(
                  onPressed: () => Navigator.pop(ctx, true),
                  child: Text(l.setOpenPlayStore)),
            ],
          ),
        );
        if (install == true) await HealthBridge.openInstallPage();
        return;
      case HealthAvailability.available:
        break;
    }

    final granted = await HealthBridge.requestPermission();
    if (!context.mounted) return;
    if (!granted) {
      _snack(context, l.setHealthPermissionDenied);
      return;
    }
    await state.setHealthSync(true);
    if (!context.mounted) return;
    _snack(context, l.setHealthEnabled);
  }

  /// "Sıcak gün uyarısı" için şehir girişi (WeatherKit'e verilir; konum izni yok).
  Future<void> _editCity(BuildContext context, AppState state) async {
    final l = context.l;
    final controller = TextEditingController(text: state.reminder.city);
    final city = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.setHotDayCity),
        content: TextField(
          controller: controller,
          autofocus: true,
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(hintText: l.setHotDayCityHint),
          onSubmitted: (v) => Navigator.pop(ctx, v),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: Text(l.setCancel)),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, controller.text),
              child: Text(l.setSave)),
        ],
      ),
    );
    if (city == null) return;
    await state.saveReminder(state.reminder.copyWith(city: city.trim()));
    if (context.mounted) await _resync(context);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    final state = context.watch<AppState>();
    final p = Palette.of(context);
    final r = state.reminder;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 16, 18, 30),
          children: [
            Text(l.setTitle,
                style: TextStyle(
                    fontSize: 26, fontWeight: FontWeight.w700, color: p.ink)),
            const SizedBox(height: 18),

            if (!state.isPro) const _ProBanner(),
            if (!state.isPro) const SizedBox(height: 16),

            _Section(title: l.setSectionGoal, children: [
              _Tile(
                icon: Icons.flag_outlined,
                title: l.setDailyGoal,
                trailing: l.setMl(state.goalMl),
                onTap: () => _editGoal(context, state),
              ),
              _Tile(
                icon: Icons.person_outline,
                title: l.setProfileInfo,
                trailing: l.setWeightKg(state.profile.weightKg),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const OnboardingScreen())),
              ),
            ]),

            _Section(title: l.setSectionReminders, children: [
              _SwitchTile(
                icon: Icons.notifications_active_outlined,
                title: l.setRemindersOn,
                value: r.enabled,
                onChanged: (v) async {
                  if (v) await NotificationService.requestPermission();
                  await state.saveReminder(r.copyWith(enabled: v));
                  if (context.mounted) await _resync(context);
                },
              ),
              _Tile(
                icon: Icons.schedule,
                title: l.setFrequency,
                trailing: _intervalLabel(l, r.intervalMinutes),
                onTap: () => _editInterval(context, state),
              ),
              _Tile(
                icon: Icons.bedtime_outlined,
                title: l.setAwakeHours,
                trailing:
                    '${_hhmm(state.profile.wakeMinutes)} – ${_hhmm(state.profile.sleepMinutes)}',
                onTap: () => _editHours(context, state),
              ),
              _SwitchTile(
                icon: Icons.check_circle_outline,
                title: l.setStopWhenDone,
                subtitle: l.setStopWhenDoneSub,
                value: r.stopWhenDone,
                onChanged: (v) async {
                  await state.saveReminder(r.copyWith(stopWhenDone: v));
                  if (context.mounted) await _resync(context);
                },
              ),
              _Tile(
                icon: Icons.notifications_none_outlined,
                title: l.setReminderStyle,
                trailing: _styleLabel(l, r.style),
                onTap: () => _editStyle(context, state),
              ),
              // Sıcak gün uyarısı — yalnız iPhone (Apple WeatherKit). Android'de
              // ücretsiz+sunucusuz hava kaynağı olmadığı için gizli.
              if (!kIsWeb && defaultTargetPlatform == TargetPlatform.iOS) ...[
                _SwitchTile(
                  icon: Icons.wb_sunny_outlined,
                  title: l.setHotDayTitle,
                  subtitle: l.setHotDaySub,
                  value: r.hotDayEnabled,
                  onChanged: (v) async {
                    await state.saveReminder(r.copyWith(hotDayEnabled: v));
                    if (context.mounted) await _resync(context);
                  },
                ),
                if (r.hotDayEnabled)
                  _Tile(
                    icon: Icons.location_city_outlined,
                    title: l.setHotDayCity,
                    trailing: r.city.isEmpty ? l.setHotDayCitySet : r.city,
                    onTap: () => _editCity(context, state),
                  ),
              ],
              // Pil rehberi Android üreticilerine özgü (Xiaomi/Samsung/Huawei/Oppo
              // agresif pil yönetimi). iOS'ta karşılığı yok → orada gösterilmez.
              if (_androidOnly)
                _Tile(
                  icon: Icons.battery_alert_outlined,
                  title: l.setNotifNotArriving,
                  subtitle: l.setNotifNotArrivingSub,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const BatteryGuideScreen())),
                ),
            ]),

            _Section(title: l.setSectionCups, children: [
              for (var i = 0; i < state.cups.length; i++)
                _Tile(
                  icon: state.cups[i].type.icon,
                  title: cupLabel(l, state.cups[i], i),
                  trailing: l.setMl(state.cups[i].ml),
                  onTap: () => _editCup(context, state, i),
                ),
            ]),

            // 🚨 YALNIZ ANDROID. Apple 1.0.3'ü tam bundan reddetti (guideline 2.1(a),
            // "Error when syncing Apple Health", iPad Air M3): iOS'ta `HealthBridge`
            // her zaman `unsupported` döndüğü için anahtar hata mesajı veriyordu.
            // Sipling iOS'ta HealthKit'e HİÇ yazmıyor → bölüm iOS'ta gösterilmez.
            if (_androidOnly) ...[
              _Section(title: l.setSectionHealth, children: [
                _SwitchTile(
                  icon: Icons.favorite_outline,
                  title: l.setHealthWrite,
                  subtitle: l.setHealthWriteSub,
                  value: state.healthSync,
                  onChanged: (v) => _toggleHealth(context, v),
                ),
              ]),
              const SizedBox(height: 16),
            ],

            // Ana ekran widget'ı — yalnız Android. Tek dokunuşla ekleme.
            // 🚨 iOS build'inde widget hedefi YOK (codemagic.yaml'a eklenmedi) ve
            // `requestPinWidget` zaten Android'e özel → iOS'ta bu satır boş vaat.
            // Aynı 2.1(a) riskini doğurmasın diye Android'e kapatıldı.
            if (_androidOnly) ...[
              _Section(title: l.setSectionHome, children: [
                _Tile(
                  icon: Icons.widgets_outlined,
                  title: l.setAddWidget,
                  subtitle: l.setAddWidgetSub,
                  onTap: () => _addWidget(context),
                ),
              ]),
              const SizedBox(height: 16),
            ],

            _Section(title: l.setSectionAppearance, children: [
              _SwitchTile(
                icon: Icons.dark_mode_outlined,
                title: l.setDarkTheme,
                value: state.darkMode,
                onChanged: state.setDarkMode,
              ),
              _Tile(
                icon: Icons.filter_drama_outlined,
                title: l.setForestTheme,
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const SeasonScreen())),
              ),
              _Tile(
                icon: Icons.park_outlined,
                title: l.setTreeSpecies,
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const SpeciesScreen())),
              ),
            ]),

            _Section(title: l.setSectionApp, children: [
              _Tile(
                icon: Icons.lock_outline,
                title: l.setMyData,
                subtitle: l.setMyDataSub,
                onTap: null,
              ),
              _Tile(
                icon: Icons.delete_outline,
                title: l.setResetAll,
                onTap: () => _confirmReset(context, state),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  static String _hhmm(int minutes) =>
      '${(minutes ~/ 60).toString().padLeft(2, '0')}:${(minutes % 60).toString().padLeft(2, '0')}';

  static String _intervalLabel(L l, int m) =>
      m % 60 == 0 ? l.setEveryHours(m ~/ 60) : l.setEveryMinutes(m);

  static String _styleLabel(L l, ReminderStyle s) => switch (s) {
        ReminderStyle.normal => l.styleNormal,
        ReminderStyle.gentle => l.styleGentle,
        ReminderStyle.silent => l.styleSilent,
      };

  static String _styleSub(L l, ReminderStyle s) => switch (s) {
        ReminderStyle.normal => l.styleNormalSub,
        ReminderStyle.gentle => l.styleGentleSub,
        ReminderStyle.silent => l.styleSilentSub,
      };

  static IconData _styleIcon(ReminderStyle s) => switch (s) {
        ReminderStyle.normal => Icons.notifications_active_outlined,
        ReminderStyle.gentle => Icons.vibration,
        ReminderStyle.silent => Icons.notifications_off_outlined,
      };

  Future<void> _editStyle(BuildContext context, AppState state) async {
    final l = context.l;
    final result = await showDialog<ReminderStyle>(
      context: context,
      builder: (ctx) => SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        title: Text(l.setReminderStyle),
        children: [
          for (final s in ReminderStyle.values)
            ListTile(
              leading: Icon(_styleIcon(s),
                  color: state.reminder.style == s
                      ? SiplingColors.water
                      : null),
              title: Text(_styleLabel(l, s)),
              subtitle: Text(_styleSub(l, s)),
              trailing: state.reminder.style == s
                  ? const Icon(Icons.check, color: SiplingColors.water)
                  : null,
              onTap: () => Navigator.of(ctx).pop(s),
            ),
        ],
      ),
    );
    if (result == null) return;
    await state.saveReminder(state.reminder.copyWith(style: result));
    if (context.mounted) await _resync(context);
  }

  Future<void> _editGoal(BuildContext context, AppState state) async {
    final l = context.l;
    var value = state.goalMl.toDouble();
    final result = await showDialog<int?>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setLocal) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
          title: Text(l.setDailyGoal),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l.setMl(value.round()),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w700)),
              Slider(
                value: value,
                min: 1200,
                max: 5000,
                divisions: 76,
                activeColor: SiplingColors.water,
                onChanged: (v) => setLocal(() => value = (v / 50).round() * 50),
              ),
              const SizedBox(height: 4),
              Text(
                l.setSuggested(
                    calculateGoalMl(state.profile.copyWith(clearCustomGoal: true))),
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(-1),
              child: Text(l.setBackToSuggested),
            ),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(value.round()),
              child: Text(l.setSave),
            ),
          ],
        ),
      ),
    );
    if (result == null) return;
    await state.saveProfile(result == -1
        ? state.profile.copyWith(clearCustomGoal: true)
        : state.profile.copyWith(customGoalMl: result));
  }

  Future<void> _editInterval(BuildContext context, AppState state) async {
    final l = context.l;
    const options = [60, 90, 120, 180];
    final result = await showDialog<int>(
      context: context,
      builder: (ctx) => SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        title: Text(l.setIntervalDialogTitle),
        children: [
          for (final o in options)
            SimpleDialogOption(
              onPressed: () => Navigator.of(ctx).pop(o),
              child: Text(_intervalLabel(l, o)),
            ),
        ],
      ),
    );
    if (result == null) return;
    await state.saveReminder(state.reminder.copyWith(intervalMinutes: result));
    if (context.mounted) await _resync(context);
  }

  Future<void> _editHours(BuildContext context, AppState state) async {
    final l = context.l;
    final wake = await showTimePicker(
      context: context,
      helpText: l.setWakeHelp,
      initialTime: TimeOfDay(
          hour: state.profile.wakeMinutes ~/ 60,
          minute: state.profile.wakeMinutes % 60),
    );
    if (wake == null || !context.mounted) return;
    final sleep = await showTimePicker(
      context: context,
      helpText: l.setSleepHelp,
      initialTime: TimeOfDay(
          hour: state.profile.sleepMinutes ~/ 60,
          minute: state.profile.sleepMinutes % 60),
    );
    if (sleep == null) return;

    final wakeM = wake.hour * 60 + wake.minute;
    final sleepM = sleep.hour * 60 + sleep.minute;
    if (sleepM - wakeM < 240) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(l.setAwakeMin4h),
        ));
      }
      return;
    }
    await state.saveProfile(
        state.profile.copyWith(wakeMinutes: wakeM, sleepMinutes: sleepM));
    if (context.mounted) await _resync(context);
  }

  Future<void> _editCup(BuildContext context, AppState state, int index) async {
    final l = context.l;
    final cup = state.cups[index];
    var ml = cup.ml.toDouble();
    var type = cup.type;

    final result = await showDialog<CupPreset>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setLocal) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
          title: Text(cupLabel(l, cup, index)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l.setMl(ml.round()),
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.w700)),
              Slider(
                value: ml,
                min: 50,
                max: 1000,
                divisions: 38,
                activeColor: type.color,
                onChanged: (v) => setLocal(() => ml = (v / 25).round() * 25),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  for (final t in DrinkType.values)
                    ChoiceChip(
                      label:
                          Text(t.label(l), style: const TextStyle(fontSize: 11)),
                      selected: t == type,
                      onSelected: (_) => setLocal(() => type = t),
                    ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: Text(l.setCancel)),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(
                  CupPreset(ml: ml.round(), type: type, label: cup.label)),
              child: Text(l.setSave),
            ),
          ],
        ),
      ),
    );
    if (result == null) return;
    final cups = List.of(state.cups)..[index] = result;
    await state.saveCups(cups);
  }

  Future<void> _confirmReset(BuildContext context, AppState state) async {
    final l = context.l;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        title: Text(l.setResetConfirmTitle),
        content: Text(l.setResetConfirmBody),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(l.setCancel)),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(l.setResetConfirmButton),
          ),
        ],
      ),
    );
    if (ok != true) return;
    await state.resetAll();
    await NotificationService.cancelAll();
  }
}

class _ProBanner extends StatelessWidget {
  const _ProBanner();

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const ProScreen())),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [SiplingColors.leafDark, SiplingColors.water]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const Icon(Icons.workspace_premium, color: Colors.white, size: 26),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Sipling Pro',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                  const SizedBox(height: 2),
                  Text(l.setProTagline,
                      style: const TextStyle(fontSize: 12, color: Colors.white70)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _Section({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    final p = Palette.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 4, 8),
          child: Text(title.toUpperCase(),
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                  color: p.inkSoft)),
        ),
        Container(
          decoration: BoxDecoration(
            color: p.card,
            borderRadius: BorderRadius.circular(18),
            boxShadow: softShadow(p.dark),
          ),
          child: Column(children: children),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _Tile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final String? trailing;
  final VoidCallback? onTap;

  const _Tile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final p = Palette.of(context);
    return ListTile(
      leading: Icon(icon, color: p.inkSoft, size: 21),
      title: Text(title, style: TextStyle(fontSize: 14, color: p.ink)),
      subtitle: subtitle == null
          ? null
          : Text(subtitle!, style: TextStyle(fontSize: 11, color: p.inkSoft)),
      trailing: trailing == null
          ? (onTap == null
              ? null
              : Icon(Icons.chevron_right, color: p.inkSoft, size: 20))
          : Text(trailing!,
              style: TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w600, color: p.inkSoft)),
      onTap: onTap,
    );
  }
}

class _SwitchTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SwitchTile({
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final p = Palette.of(context);
    return SwitchListTile(
      secondary: Icon(icon, color: p.inkSoft, size: 21),
      title: Text(title, style: TextStyle(fontSize: 14, color: p.ink)),
      subtitle: subtitle == null
          ? null
          : Text(subtitle!, style: TextStyle(fontSize: 11, color: p.inkSoft)),
      value: value,
      activeThumbColor: SiplingColors.water,
      onChanged: onChanged,
    );
  }
}
