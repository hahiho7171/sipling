import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/store.dart';
import 'l10n/labels.dart';
import 'theme.dart';
import 'wear/wear_screen.dart';

/// Wear OS (Android akıllı saat) giriş noktası.
///
/// Telefon uygulamasından AYRI, sade bir giriş: bildirim/widget kurulumu yok
/// (saatte gerekmez), sadece store + saat ekranı. Telefon derlemesini hiç
/// etkilemez — ayrı `--target lib/main_wear.dart` ile derlenir.
/// Çalıştırma:  flutter build apk --target lib/main_wear.dart --release
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final state = AppState();
  await state.init();
  runApp(
    ChangeNotifierProvider.value(value: state, child: const SiplingWearApp()),
  );
}

class SiplingWearApp extends StatelessWidget {
  const SiplingWearApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sipling',
      debugShowCheckedModeBanner: false,
      theme: siplingTheme(dark: true),
      localizationsDelegates: L.localizationsDelegates,
      supportedLocales: L.supportedLocales,
      home: const WearScreen(),
    );
  }
}
