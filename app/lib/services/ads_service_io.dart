import 'dart:async' show Completer;
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// Reklamlar — YALNIZ ücretsiz kullanıcıya. Pro alınca [enabled]=false → hiç reklam yok.
///
/// 🚨 Reklam INTERNET izni ekler (google_mobile_ads). Bu, "internet yok" kimliğinin
/// bilinçli olarak bırakıldığı yer — kullanıcı 2026-07-11'de reklam+Pro modelini seçti.
///
/// Reklam birimi kimlikleri GERÇEK (AdMob hesabı randevusayfasi@gmail.com ·
/// yayıncı ca-app-pub-3326866070505611 · "Sipling (Android)" + "Sipling (iOS)").
/// 🚨 TEST ederken emülatör/cihazı `RequestConfiguration.testDeviceIds` ile test cihazı
/// işaretle — GERÇEK kimlikte kendi reklamına tıklamak AdMob hesabını KAPATTIRIR.
class AdsService {
  AdsService._();

  static String get _bannerUnit => Platform.isIOS
      ? 'ca-app-pub-3326866070505611/8997483187'
      : 'ca-app-pub-3326866070505611/9255101114';
  static String get _interstitialUnit => Platform.isIOS
      ? 'ca-app-pub-3326866070505611/1414506632'
      : 'ca-app-pub-3326866070505611/6628937776';
  static String get _rewardedUnit => Platform.isIOS
      ? 'ca-app-pub-3326866070505611/4002774438'
      : 'ca-app-pub-3326866070505611/1637867914';

  /// Pro kullanıcıda kapalı. `main.dart` isPro'ya göre ayarlar.
  static bool enabled = true;

  static bool _initialized = false;
  static InterstitialAd? _interstitial;
  static DateTime? _lastInterstitial;

  /// İki tam-ekran reklam arasında en az bu kadar süre — "çok bunaltmadan".
  static const _interstitialGap = Duration(minutes: 3);

  static bool get _adsOff => kIsWeb || !enabled;

  /// Uygulama açılışında bir kez. Önce kullanıcı rızası (UMP), sonra SDK.
  static Future<void> init() async {
    if (_adsOff || _initialized) return;
    _initialized = true;
    await _requestConsent();
    await MobileAds.instance.initialize();
    _preloadInterstitial();
  }

  /// AB/İngiltere için zorunlu rıza akışı (UMP). Diğer bölgelerde sessizce geçer.
  /// Callback tabanlı API'yi Completer ile await edilebilir hale getiriyoruz.
  static Future<void> _requestConsent() async {
    try {
      final info = ConsentInformation.instance;
      final update = Completer<void>();
      info.requestConsentInfoUpdate(
        ConsentRequestParameters(),
        update.complete,
        (FormError _) => update.complete(),
      );
      await update.future;
      if (await info.isConsentFormAvailable()) {
        final form = Completer<void>();
        ConsentForm.loadAndShowConsentFormIfRequired((FormError? _) => form.complete());
        await form.future;
      }
    } catch (e) {
      debugPrint('Sipling reklam rızası kurulamadı: $e');
    }
  }

  // ---- Banner ----
  /// Ekrana konacak banner alanı. Pro/web'de boş kutu (yer kaplamaz).
  static Widget banner() => _adsOff ? const SizedBox.shrink() : const _AdBanner();

  // ---- Interstitial (tam ekran) ----
  static void _preloadInterstitial() {
    if (_adsOff) return;
    InterstitialAd.load(
      adUnitId: _interstitialUnit,
      request: const AdRequest(nonPersonalizedAds: true),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitial = ad,
        onAdFailedToLoad: (err) => _interstitial = null,
      ),
    );
  }

  /// Sıklık sınırlı tam-ekran reklam: son gösterimden [_interstitialGap] geçmediyse
  /// ve reklam hazır değilse GÖSTERMEZ. "Standart ama bunaltmayan" için.
  static Future<void> maybeShowInterstitial() async {
    if (_adsOff) return;
    final last = _lastInterstitial;
    if (last != null && DateTime.now().difference(last) < _interstitialGap) return;
    final ad = _interstitial;
    if (ad == null) {
      _preloadInterstitial();
      return;
    }
    _interstitial = null;
    _lastInterstitial = DateTime.now();
    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _preloadInterstitial();
      },
      onAdFailedToShowFullScreenContent: (ad, err) {
        ad.dispose();
        _preloadInterstitial();
      },
    );
    await ad.show();
  }

  // ---- Rewarded (ödüllü — "reklam izle, tema aç") ----
  /// Ödüllü reklam gösterir; kullanıcı sonuna kadar izlerse [onReward] çağrılır.
  /// Pro'da/web'de doğrudan ödülü verir (reklam yok).
  static Future<void> showRewarded(VoidCallback onReward) async {
    if (_adsOff) {
      onReward();
      return;
    }
    RewardedAd.load(
      adUnitId: _rewardedUnit,
      request: const AdRequest(nonPersonalizedAds: true),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) => ad.show(onUserEarnedReward: (_, _) => onReward()),
        onAdFailedToLoad: (err) => debugPrint('Sipling ödüllü yüklenemedi: $err'),
      ),
    );
  }
}

/// Banner reklamı yükleyip yaşam döngüsünü yöneten kutu. Yüklenene kadar yer
/// kaplamaz; yüklenince tam banner yüksekliğini alır.
class _AdBanner extends StatefulWidget {
  const _AdBanner();

  @override
  State<_AdBanner> createState() => _AdBannerState();
}

class _AdBannerState extends State<_AdBanner> {
  BannerAd? _ad;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _ad = BannerAd(
      adUnitId: AdsService._bannerUnit,
      size: AdSize.banner,
      request: const AdRequest(nonPersonalizedAds: true),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          if (mounted) setState(() => _loaded = true);
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('Sipling banner yüklenemedi: $err');
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _ad?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded || _ad == null) return const SizedBox.shrink();
    return SizedBox(
      width: _ad!.size.width.toDouble(),
      height: _ad!.size.height.toDouble(),
      child: AdWidget(ad: _ad!),
    );
  }
}
