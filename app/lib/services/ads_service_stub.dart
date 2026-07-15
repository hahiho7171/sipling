import 'package:flutter/widgets.dart';

/// Web (ve reklam eklentisi olmayan hedefler) için no-op reklam servisi.
/// `google_mobile_ads` web'de derlenmez; köprü bu stub'ı verir.
class AdsService {
  AdsService._();

  static bool enabled = false;

  static Future<void> init() async {}

  static Widget banner() => const SizedBox.shrink();

  static Future<void> maybeShowInterstitial() async {}

  /// Reklam yoksa ödülü doğrudan ver.
  static Future<void> showRewarded(VoidCallback onReward) async => onReward();
}
