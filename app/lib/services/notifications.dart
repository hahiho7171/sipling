import 'dart:convert' show jsonDecode;
import 'dart:ui' show DartPluginRegistrant, Locale, PlatformDispatcher;

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' show WidgetsFlutterBinding;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import '../data/models.dart';
import '../l10n/app_localizations.dart';
import 'home_widget_service.dart';

/// Bildirimdeki "+1 bardak" düğmesine uygulama **KAPALIYKEN** basılınca çalışır.
/// Android arka planda kısa ömürlü bir Dart isolate açar.
///
/// 🚨 Üst düzey (top-level) + `@pragma('vm:entry-point')` olmak ZORUNDA — widget'ın
/// [siplingWidgetTapped]'ıyla aynı kural. Payload widget'ın URI'siyle aynı biçimde
/// (`sipling://add?ml=200&type=water`), o yüzden aynı arka-plan-ekleme yoluna bağlanıyor:
/// AppState kur → su ekle → bildirimleri yeniden planla → widget'ı tazele.
@pragma('vm:entry-point')
Future<void> siplingNotificationAction(NotificationResponse response) async {
  if (response.actionId != NotificationService.addActionId) return;
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  await HomeWidgetService.onWidgetTap(Uri.tryParse(response.payload ?? ''));
}

/// Su hatırlatma bildirimleri — tamamen cihazda, sunucusuz.
///
/// 🚨 EXACT ALARM KULLANILMIYOR. Play politikası `USE_EXACT_ALARM` /
/// `SCHEDULE_EXACT_ALARM` iznini yalnız alarm-saat ve takvim uygulamalarına
/// veriyor; su hatırlatıcısı kapsam dışı ve inceleme reddedilir.
/// Bunun yerine `inexactAllowWhileIdle` kullanıyoruz — 2 saatlik bir
/// hatırlatmada birkaç dakikalık sapma önemsiz.
///
/// Bildirimler tekrarlayan (daily) olarak değil, önümüzdeki [_daysAhead] gün
/// için tek tek planlanır. Böylece "hedefi tamamlayınca sus" kuralı yalnız
/// bugünü etkiler, yarını susturmaz. Uygulama her açıldığında yeniden planlanır.
class NotificationService {
  static final _plugin = FlutterLocalNotificationsPlugin();
  static const _daysAhead = 7;
  static const _channelId = 'sipling_reminders';

  /// Bildirimdeki hızlı-ekle düğmesinin kimliği.
  static const addActionId = 'add_water';

  /// iOS'ta bildirim düğmeleri bir "kategori"ye bağlıdır; bu kimlikle eşleşir.
  /// (Android'de gerek yok, düğme bildirimin içinde tanımlanır.)
  static const _iosCategoryId = 'sipling_water';

  /// iOS düğme başlığı `init()` anında **sabitlenir** (Android gibi bildirime özel
  /// değil). O yüzden kayıtlı ilk bardağı okuyup "+250 ml" gibi yazarız. Bardak
  /// değişirse başlık uygulama yeniden açılınca güncellenir. Anahtar `store.dart`
  /// ile aynı: 'cups'.
  static Future<int> _firstCupMl() async {
    try {
      final raw = (await SharedPreferences.getInstance()).getString('cups');
      if (raw != null) {
        final list = jsonDecode(raw) as List;
        if (list.isNotEmpty) {
          final ml = (list.first as Map)['ml'];
          if (ml is int && ml > 0) return ml;
        }
      }
    } catch (_) {}
    return CupPreset.defaults.first.ml;
  }

  /// Uygulama **AÇIKKEN** bildirim düğmesine basılırsa çağrılır. `main.dart` bunu
  /// çalışan `AppState`'e bağlar; bağlanmazsa (ör. arka plan) sessizce atlanır ve
  /// [siplingNotificationAction] arka-plan yolu devreye girer.
  static Future<void> Function(int ml, DrinkType type)? onForegroundAdd;

  static bool _initialized = false;

  /// Ön plan bildirim yanıtı: gövdeye dokunma uygulamayı açar (varsayılan),
  /// "+1 bardak" düğmesi ise su ekler.
  static void _onResponse(NotificationResponse r) {
    if (r.actionId != addActionId) return;
    final uri = Uri.tryParse(r.payload ?? '');
    final ml = int.tryParse(uri?.queryParameters['ml'] ?? '');
    if (ml == null || ml <= 0) return;
    final type = DrinkType.fromName(uri?.queryParameters['type'] ?? 'water');
    onForegroundAdd?.call(ml, type);
  }

  /// Bildirim metinleri için `BuildContext` yok — çeviriyi cihazın diline göre
  /// elle yüklüyoruz. Desteklenmeyen bir dilde İngilizceye düşer.
  static Future<List<(String, String)>> _messages() async {
    final device = PlatformDispatcher.instance.locale;
    final supported = L.supportedLocales
            .any((l) => l.languageCode == device.languageCode)
        ? Locale(device.languageCode)
        : const Locale('en');
    final l = await L.delegate.load(supported);
    return [
      (l.notifTitle1, l.notifBody1),
      (l.notifTitle2, l.notifBody2),
      (l.notifTitle3, l.notifBody3),
      (l.notifTitle4, l.notifBody4),
      (l.notifTitle5, l.notifBody5),
    ];
  }

  static Future<void> init() async {
    if (kIsWeb || _initialized) return;

    tzdata.initializeTimeZones();
    final info = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(info.identifier));

    final cupMl = await _firstCupMl();
    await _plugin.initialize(
      settings: InitializationSettings(
        android: const AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
          // Bildirimdeki "+N ml" düğmesinin iOS karşılığı. Boş `options` =
          // uygulamayı AÇMADAN arka planda çalışır → siplingNotificationAction.
          notificationCategories: [
            DarwinNotificationCategory(
              _iosCategoryId,
              actions: [
                DarwinNotificationAction.plain(
                  addActionId,
                  '+$cupMl ml',
                  options: const <DarwinNotificationActionOption>{},
                ),
              ],
            ),
          ],
        ),
      ),
      onDidReceiveNotificationResponse: _onResponse,
      onDidReceiveBackgroundNotificationResponse: siplingNotificationAction,
    );
    _initialized = true;
  }

  /// Android 13+ (API 33) bildirim izni. Reddedilirse hiç bildirim gitmez.
  static Future<bool> requestPermission() async {
    if (kIsWeb) return false;
    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (android != null) {
      return await android.requestNotificationsPermission() ?? false;
    }
    final ios = _plugin.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();
    if (ios != null) {
      return await ios.requestPermissions(alert: true, badge: true, sound: true) ??
          false;
    }
    return false;
  }

  static Future<bool> hasPermission() async {
    if (kIsWeb) return false;
    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    return await android?.areNotificationsEnabled() ?? false;
  }

  static Future<void> cancelAll() async {
    if (kIsWeb) return;
    await _plugin.cancelAll();
  }

  /// Tüm hatırlatmaları baştan planlar.
  /// [todayCompleted] true ve ayar açıksa bugünün kalan slotları atlanır.
  static Future<void> reschedule({
    required Profile profile,
    required ReminderSettings settings,
    required bool todayCompleted,
    required List<CupPreset> cups,
  }) async {
    if (kIsWeb) return;
    await init();
    await cancelAll();
    if (!settings.enabled) return;

    // Bildirimdeki "+N ml" düğmesi kullanıcının ilk bardağını ekler. Planlama
    // anındaki değer bildirime gömülür; bardak değişirse sonraki yeniden-planlama
    // günceller. "ml" tüm dillerde evrensel, ayrı çeviri gerekmez.
    final cup = cups.isNotEmpty ? cups.first : CupPreset.defaults.first;
    final addPayload = 'sipling://add?ml=${cup.ml}&type=${cup.type.name}';

    final details = NotificationDetails(
      android: AndroidNotificationDetails(
        _channelId,
        'Sipling',
        channelDescription: 'Water reminders',
        importance: Importance.defaultImportance,
        priority: Priority.defaultPriority,
        playSound: !settings.silent,
        enableVibration: !settings.silent,
        actions: [
          AndroidNotificationAction(
            addActionId,
            '+${cup.ml} ml',
            showsUserInterface: false, // uygulamayı AÇMAZ, arka planda ekler
            cancelNotification: true, // basınca bildirim kapanır
          ),
        ],
      ),
      iOS: DarwinNotificationDetails(
        presentSound: !settings.silent,
        categoryIdentifier: _iosCategoryId, // "+N ml" düğmesini bu bildirime bağlar
      ),
    );

    final messages = await _messages();
    final now = tz.TZDateTime.now(tz.local);
    // Son hatırlatma, uykudan bir saat önce.
    final lastCall = profile.sleepMinutes - 60;
    var id = 100;

    for (var day = 0; day < _daysAhead; day++) {
      final isToday = day == 0;
      if (isToday && todayCompleted && settings.stopWhenDone) continue;

      for (var m = profile.wakeMinutes + settings.intervalMinutes;
          m <= lastCall;
          m += settings.intervalMinutes) {
        final base = now.add(Duration(days: day));
        final when = tz.TZDateTime(
            tz.local, base.year, base.month, base.day, m ~/ 60, m % 60);
        if (!when.isAfter(now)) continue;

        final (title, body) = messages[id % messages.length];
        await _plugin.zonedSchedule(
          id: id++,
          title: title,
          body: body,
          scheduledDate: when,
          notificationDetails: details,
          payload: addPayload, // "+N ml" düğmesi bunu okur
          // Play politikası: exact alarm izni istemiyoruz.
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        );
      }
    }
  }
}
