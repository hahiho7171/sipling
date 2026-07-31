import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
import 'package:provider/provider.dart';

import 'data/store.dart';
import 'l10n/labels.dart';
import 'services/ads_service.dart';
import 'services/purchase_service.dart';
import 'screens/day_summary_screen.dart';
import 'screens/forest_screen.dart';
import 'screens/home_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/stats_screen.dart';
import 'screens/tour_sheet.dart';
import 'services/home_widget_service.dart';
import 'services/notifications.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final state = AppState();
  await state.init();
  await NotificationService.init();

  // Reklamlar YALNIZ ücretsiz kullanıcıya. Pro'da hiç reklam yok. (Web'de no-op.)
  AdsService.enabled = !state.isPro;
  await AdsService.init();

  // $1/ay Pro aboneliği. Satın alma/geri yükleme doğrulanınca Pro'yu yazar
  // → dinleyici reklamları kapatır. (Web'de no-op.)
  PurchaseService.onEntitlement = (active) => state.setPro(active);
  await PurchaseService.init();

  // Ana ekran widget'ı. Web'de eklenti yok, dokunma.
  if (!kIsWeb) {
    // iOS'ta veri paylaşımı App Group üzerinden — yazmadan önce kurulmalı.
    await HomeWidgetService.initAppGroup();
    await HomeWidget.registerInteractivityCallback(siplingWidgetTapped);
    // Veri her değiştiğinde widget tazelensin: su eklendi, hedef değişti,
    // ağaç türü değişti, bardaklar düzenlendi — hepsi buradan geçiyor.
    state.addListener(() {
      HomeWidgetService.schedulePush(state);
      AdsService.enabled = !state.isPro; // Pro alınınca reklamlar susar
    });
    // Uygulama AÇIKKEN bildirimin "+1 bardak" düğmesine basılırsa çalışan
    // AppState'e ekle (arka planda ayrı isolate hallediyor).
    NotificationService.onForegroundAdd = (ml, type) async {
      await state.addSip(ml, type);
      await NotificationService.reschedule(
        profile: state.profile,
        settings: state.reminder,
        todayCompleted: state.today.completed,
        cups: state.cups,
      );
    };
  }

  runApp(
    ChangeNotifierProvider.value(value: state, child: const SiplingApp()),
  );

  // 🚨 İlk push runApp'ten SONRA, ilk kare çizildikten sonra olmalı.
  // Ağaç `renderFlutterWidget` ile çiziliyor; o da bir görünüm (implicitView)
  // istiyor. runApp'ten önce çağırınca temiz kurulumda ağaç sessizce çizilmiyordu.
  if (!kIsWeb) {
    WidgetsBinding.instance.addPostFrameCallback((_) => HomeWidgetService.push(state));
  }
}

class SiplingApp extends StatelessWidget {
  const SiplingApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Tema: "system" seçiliyse cihazın açık/koyu ayarını izler (varsayılan).
    final mode = context.watch<AppState>().themeMode;
    return MaterialApp(
      title: 'Sipling',
      debugShowCheckedModeBanner: false,
      theme: siplingTheme(dark: false),
      darkTheme: siplingTheme(dark: true),
      themeMode: mode == kThemeLight
          ? ThemeMode.light
          : mode == kThemeDark
              ? ThemeMode.dark
              : ThemeMode.system,
      // Cihazın dili Türkçeyse Türkçe, değilse İngilizce. Uygulama içinde
      // dil seçici yok — sistem dilini izliyoruz.
      localizationsDelegates: L.localizationsDelegates,
      supportedLocales: L.supportedLocales,
      home: const RootShell(),
    );
  }
}

class RootShell extends StatefulWidget {
  const RootShell({super.key});

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> with WidgetsBindingObserver {
  int _index = 0;

  static const _pages = [
    HomeScreen(),
    ForestScreen(),
    StatsScreen(),
    SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => _bootstrap());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// Uygulama arka plandan öne gelince diskteki en güncel veriyi tekrar oku.
  /// Bildirimdeki "+N ml" düğmesi ya da ana ekran widget'ı, uygulama arka
  /// plandayken ayrı bir isolate'te suyu diske yazmış olabilir; bunu ancak
  /// yeniden okuyunca görürüz. Okumazsak eklenen su hem görünmez hem de bir
  /// sonraki elle eklemede üzerine yazılıp SİLİNİR. → `AppState.reload()`
  @override
  void didChangeAppLifecycleState(AppLifecycleState lifecycle) {
    if (lifecycle == AppLifecycleState.resumed) {
      final state = context.read<AppState>();
      state.reload();
      // Açılış reklamı — yalnız ücretsiz kullanıcı, ilk açılış hariç, 4 saatte bir.
      // Su ekleme/kutlama akışını etkilemez; su eklerken reklam çıkmaz.
      AdsService.maybeShowAppOpen();
    }
  }

  /// İlk açılışta kurulum akışını göster, sonra dünün özetini, sonra
  /// bildirimleri yeniden planla.
  Future<void> _bootstrap() async {
    final state = context.read<AppState>();
    if (!state.profile.onboarded) {
      await Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => const OnboardingScreen(),
      ));
      await NotificationService.requestPermission();
    }
    if (!mounted) return;

    // Kurulumdan sonra bir kez: uygulamanın nasıl kullanıldığını anlatan kısa tur.
    // (Kurulumu daha önce bitirmiş kullanıcılara da bir kez gösterilir.)
    if (!await tourSeen()) {
      if (!mounted) return;
      await showSiplingTour(context, markSeen: true);
    }
    if (!mounted) return;

    // Dün su içilmişse ve özeti henüz görmediyse, günde bir kez göster.
    final summary = state.pendingSummary;
    if (summary != null) {
      await Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => DaySummaryScreen(day: summary),
      ));
      if (!mounted) return;
      // Gün özeti kapandıktan sonra tam-ekran reklam (yalnız ücretsiz; günde bir
      // kez, 3 dk sıklık sınırlı). Su ekleme/kutlama akışı reklamsız kalır.
      await AdsService.maybeShowInterstitial();
    }
    await NotificationService.reschedule(
      profile: state.profile,
      settings: state.reminder,
      todayCompleted: state.today.completed,
      cups: state.cups,
    );
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    final p = Palette.of(context);
    final l = context.l;
    return Scaffold(
      body: IndexedStack(index: _index, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        backgroundColor: p.card,
        indicatorColor: SiplingColors.water.withValues(alpha: 0.15),
        destinations: [
          NavigationDestination(
              icon: const Icon(Icons.water_drop_outlined),
              selectedIcon: const Icon(Icons.water_drop),
              label: l.navToday),
          NavigationDestination(
              icon: const Icon(Icons.forest_outlined),
              selectedIcon: const Icon(Icons.forest),
              label: l.navForest),
          NavigationDestination(
              icon: const Icon(Icons.bar_chart_outlined),
              selectedIcon: const Icon(Icons.bar_chart),
              label: l.navStats),
          NavigationDestination(
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              label: l.navSettings),
        ],
      ),
    );
  }
}
