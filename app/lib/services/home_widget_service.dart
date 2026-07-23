import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;
import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';

import '../data/models.dart';
import '../data/store.dart';
import '../data/tree_species.dart';
import '../widgets/tree_painter.dart';
import 'notifications.dart';

/// Widget'taki bardak butonunun arka plan giriş noktası.
///
/// 🚨 **Üst düzey (top-level) fonksiyon olmak ZORUNDA.** Bir sınıfın static
/// metodunu verirsek Dart VM şu hatayı verip sessizce vazgeçiyor:
/// `To access '...::HomeWidgetService' from native code, it must be annotated.`
/// Buton çalışmaz, hiçbir uyarı da görünmez. (Emülatörde yakalandı, 2026-07-09.)
@pragma('vm:entry-point')
Future<void> siplingWidgetTapped(Uri? uri) async {
  // Arka planda taze bir isolate açılıyor: ne binding ne de eklentiler kurulu.
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  await HomeWidgetService.onWidgetTap(uri);
}

/// Ana ekran widget'ı ile uygulamanın arasındaki köprü.
///
/// Widget kendi verisini `AppState`'ten okumaz — okuyamaz, çünkü launcher ayrı
/// bir süreçtir. Bunun yerine uygulama her değişiklikte özet veriyi
/// [HomeWidget.saveWidgetData] ile yazar, Kotlin tarafı (`SiplingWidgetProvider`)
/// onu okur.
///
/// 🚨 **Bütün değerler String olarak yazılır.** Paket, Dart `int`'ini Android'de
/// `putInt`, `double`'ı `putLong`+bayrak olarak saklıyor; Kotlin'de yanlış
/// getter çağırmak `ClassCastException` demek. String tek tip, tuzak yok.
class HomeWidgetService {
  /// Kotlin sınıfının tam adı. Dikkat: paket adı `namespace` (com.sipling.sipling),
  /// `applicationId` (com.sipling.app) DEĞİL.
  static const _provider = 'com.sipling.sipling.SiplingWidgetProvider';

  /// iOS WidgetKit widget'ının "kind" adı — `ios/SiplingWidget/SiplingWidget.swift`
  /// içindeki `kind` ile AYNI olmalı.
  static const _iosName = 'SiplingWidget';

  /// iOS'ta uygulama ile widget uzantısı veriyi ortak App Group üzerinden paylaşır.
  /// `Runner.entitlements` + widget entitlements'taki grupla AYNI olmalı.
  static const _iosAppGroup = 'group.com.sipling.app';

  /// iOS'ta veri yazmadan ÖNCE bir kez çağrılmalı; yoksa `home_widget` verileri
  /// uygulamanın kendi kutusuna yazar, widget uzantısı göremez. `main.dart`'ta
  /// açılışta çağrılıyor.
  ///
  /// 🚨 Yalnız iOS'ta çağrılır — `setAppGroupId` iOS'a özgü bir kavram; Android
  /// eklentisinde bu metot yok, çağırırsan açılışta `MissingPluginException` atıp
  /// uygulamayı çökertebilir. `defaultTargetPlatform` web-güvenli (dart:io yok).
  static Future<void> initAppGroup() async {
    if (defaultTargetPlatform != TargetPlatform.iOS) return;
    await HomeWidget.setAppGroupId(_iosAppGroup);
  }

  /// Widget'taki hızlı bardak butonlarının tıklama adresi: `sipling://add?ml=200&type=water`
  static const scheme = 'sipling';

  // Kotlin'in okuduğu anahtarlar. Değiştirirsen SiplingWidgetProvider.kt'yi de değiştir.
  static const _kToday = 'today_ml';
  static const _kGoal = 'goal_ml';
  static const _kPercent = 'percent';
  static const _kStreak = 'streak';
  static const _kTree = 'tree_img';
  static const _kCup = 'cup'; // cup0_ml, cup0_label ...

  /// Ağaç kaç büyüme karesine bölünüyor (0..[_frames]).
  static const _frames = 10;

  static Timer? _debounce;

  /// Launcher, uygulamadan tek-dokunuşla widget yerleştirmeyi destekliyor mu?
  /// (Android 8+ API; bazı launcher'lar yine de kapatabilir.)
  static Future<bool> isPinSupported() async =>
      await HomeWidget.isRequestPinWidgetSupported() ?? false;

  /// Sistemin "bu widget'ı ana ekrana ekle?" diyaloğunu açar. Kullanıcı onaylarsa
  /// widget yerleşir — ana ekrana uzun basıp aramaya gerek kalmaz.
  static Future<void> requestPin() async =>
      HomeWidget.requestPinWidget(qualifiedAndroidName: _provider);

  /// Uygulama ön plandayken çağrılır. Sık çağrılabilir — ağaç çizimi pahalı
  /// olduğu için yarım saniye geciktirilir.
  static void schedulePush(AppState state) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () => push(state));
  }

  /// Widget'ın gösterdiği her şeyi yeniden yazar ve yeniden çizdirir.
  ///
  /// [foreground] yalnız uygulama ekranda açıkken true olmalı — ağaç kareleri
  /// ancak o zaman çizilebilir. Arka plandan (widget butonu) false gelir.
  static Future<void> push(AppState state, {bool foreground = true}) async {
    if (foreground) {
      await _ensureTreeFrames(kTreeSpecies.firstWhere(
        (s) => s.id == state.selectedSpeciesId,
        orElse: () => kTreeSpecies.first,
      ));
    }

    final today = state.today;
    final goal = today.effectiveGoalMl; // "sıcak gün" artışı dahil
    final ml = today.totalMl.round();

    await HomeWidget.saveWidgetData<String>(_kToday, '$ml');
    await HomeWidget.saveWidgetData<String>(_kGoal, '$goal');
    await HomeWidget.saveWidgetData<String>(
        _kPercent, '${(today.progress * 100).round()}');
    await HomeWidget.saveWidgetData<String>(_kStreak, '${state.currentStreak}');

    for (var i = 0; i < 3; i++) {
      final cup = i < state.cups.length ? state.cups[i] : CupPreset.defaults[i];
      await HomeWidget.saveWidgetData<String>('$_kCup${i}_ml', '${cup.ml}');
      await HomeWidget.saveWidgetData<String>('$_kCup${i}_type', cup.type.name);
      await HomeWidget.saveWidgetData<String>('$_kCup${i}_label', cup.label);
    }

    await _selectTreeFrame(state, today.progress);
    await HomeWidget.updateWidget(qualifiedAndroidName: _provider, iOSName: _iosName);
  }

  /// Ağacın bütün büyüme karelerini PNG olarak diske çizer.
  ///
  /// 🚨 Yalnız uygulama **ön plandayken** çalışır: `renderFlutterWidget` bir
  /// görünüm (implicitView) ister, arka plan isolate'inde görünüm yoktur.
  /// Bu yüzden kareleri önden hazırlıyoruz; widget'tan su eklendiğinde arka plan
  /// hiçbir şey çizmez, sadece hazır karelerden doğru olanı seçer. Ağaç böylece
  /// uygulama hiç açılmadan da büyür.
  ///
  /// Kareler tür başına önbelleklenir; ikinci çağrıda hiçbir şey çizilmez.
  static Future<void> _ensureTreeFrames(TreeSpecies species) async {
    for (var i = 0; i <= _frames; i++) {
      final key = _frameKey(species, i);
      if (await HomeWidget.getWidgetData<String>(key) != null) continue;
      try {
        await HomeWidget.renderFlutterWidget(
          CustomPaint(
            painter: TreePainter(growth: i / _frames, species: species),
            child: const SizedBox.expand(),
          ),
          key: key,
          logicalSize: const Size(120, 120),
          pixelRatio: 2,
        );
      } catch (e) {
        debugPrint('Sipling: widget ağacı çizilemedi ($key) — $e');
        return; // Görünüm yoksa kalan kareler de çizilemez.
      }
    }
  }

  static String _frameKey(TreeSpecies s, int frame) => 'tree_${s.id}_$frame';

  /// İlerlemeye en yakın hazır kareyi widget'ın göstereceği yola bağlar.
  /// Çizim yapmaz — bu yüzden arka planda da güvenle çalışır.
  static Future<void> _selectTreeFrame(AppState state, double progress) async {
    final species = kTreeSpecies.firstWhere(
      (s) => s.id == state.selectedSpeciesId,
      orElse: () => kTreeSpecies.first,
    );
    final frame = (progress * _frames).round().clamp(0, _frames);
    final path = await HomeWidget.getWidgetData<String>(_frameKey(species, frame));
    if (path != null) await HomeWidget.saveWidgetData<String>(_kTree, path);
  }

  /// Widget'taki bardak butonuna basılınca uygulama **kapalıyken** çalışır.
  /// Android bunun için arka planda kısa ömürlü bir Dart isolate'i başlatır.
  /// Buraya native koddan doğrudan girilmez — giriş noktası bu dosyanın
  /// başındaki üst düzey [siplingWidgetTapped] fonksiyonudur.
  static Future<void> onWidgetTap(Uri? uri) async {
    if (uri == null || uri.host != 'add') return;

    final ml = int.tryParse(uri.queryParameters['ml'] ?? '');
    if (ml == null || ml <= 0) return;
    final type = DrinkType.fromName(uri.queryParameters['type'] ?? 'water');

    // Arka plan isolate'inde AppState sıfırdan kurulur; aynı SharedPreferences
    // dosyasını okuduğu için uygulamanın gördüğü veriyle aynıdır.
    final state = AppState();
    await state.init();

    // 🚨 Çift-basma koruması. Widget/bildirim güncellemesi ~1 sn sürdüğü için
    // kullanıcı yanıt göremeyince tekrar basıp yanlışlıkla iki kez ekliyordu.
    // Son yudum AYNI miktar+tür ve son 1,5 sn içindeyse yoksay. (Gerçek veriden
    // bakıyoruz; ayrı bayrak yok. Kullanıcı 2026-07-11 telefon testinde bildirdi.)
    final sips = state.today.sips;
    if (sips.isNotEmpty) {
      final last = sips.last;
      if (last.ml == ml &&
          last.type == type &&
          DateTime.now().difference(last.at).inMilliseconds < 1500) {
        return;
      }
    }

    await state.addSip(ml, type);

    // Önce widget'ı tazele (hızlı) → sayı hemen yansısın, kullanıcı tekrar basmasın.
    // foreground: false → hiçbir çizim denenmez, hazır kare seçilir.
    await push(state, foreground: false);

    // "Hedefi tutunca sus" kuralı bozulmasın: bildirimleri yeniden planla.
    // (Yavaş — ~50 bildirim; bu yüzden push'tan SONRA, arka planda.)
    await NotificationService.reschedule(
      profile: state.profile,
      settings: state.reminder,
      todayCompleted: state.today.completed,
      cups: state.cups,
    );
  }
}
