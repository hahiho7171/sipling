import 'dart:async' show Completer;
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Reklamlar — YALNIZ ücretsiz kullanıcıya. Pro alınca [enabled]=false → hiç reklam yok.
///
/// 🚨 Reklam INTERNET izni ekler (google_mobile_ads). Bu, "internet yok" kimliğinin
/// bilinçli olarak bırakıldığı yer — kullanıcı 2026-07-11'de reklam+Pro modelini seçti.
///
/// Reklam birimi kimlikleri GERÇEK (AdMob hesabı randevusayfasi@gmail.com ·
/// yayıncı ca-app-pub-3326866070505611 · "Sipling (Android)" + "Sipling (iOS)").
/// 🚨 TEST ederken emülatör/cihazı test reklamına al ([_forceTestAds]=true) —
/// GERÇEK kimlikte kendi reklamına tıklamak AdMob hesabını KAPATTIRIR.
///
/// Yerleşim: banner (İstatistik) · interstitial (gün-sonu özeti sonrası, 3 dk sınır) ·
/// açılış reklamı (öne gelince, 4 saatte bir, ilk açılış hariç) · ödüllü (kozmetik açar).
class AdsService {
  AdsService._();

  /// 🧪 Test reklamı anahtarı. Emülatör/cihazda butonların çalıştığını KANITLAMAK
  /// için elle `true` yap: Google'ın test reklamları her zaman "dolar" (AdMob hesap
  /// onayından bağımsız) ve tıklaması güvenlidir. 🚨 YAYINDA MUTLAKA `false` kalmalı.
  static final bool _forceTestAds = false;

  // Google resmî test kimlikleri (her zaman dolar, tıklaması banlatmaz).
  static const _testBannerAndroid = 'ca-app-pub-3940256099942544/6300978111';
  static const _testBannerIos = 'ca-app-pub-3940256099942544/2934735716';
  static const _testInterstitialAndroid = 'ca-app-pub-3940256099942544/1033173712';
  static const _testInterstitialIos = 'ca-app-pub-3940256099942544/4411468910';
  static const _testRewardedAndroid = 'ca-app-pub-3940256099942544/5224354917';
  static const _testRewardedIos = 'ca-app-pub-3940256099942544/1712485313';
  static const _testAppOpenAndroid = 'ca-app-pub-3940256099942544/9257395921';
  static const _testAppOpenIos = 'ca-app-pub-3940256099942544/5575463023';

  // App Open (açılış) reklam birimleri — AdMob'da oluşturuldu (2026-07-25,
  // "Sipling App Open Android/iOS", yayıncı ca-app-pub-3326866070505611).
  static const _appOpenAndroid = 'ca-app-pub-3326866070505611/4096053447';
  static const _appOpenIos = 'ca-app-pub-3326866070505611/8573400217';

  static bool get _ios => Platform.isIOS;

  static String get _bannerUnit => _forceTestAds
      ? (_ios ? _testBannerIos : _testBannerAndroid)
      : (_ios
          ? 'ca-app-pub-3326866070505611/8997483187'
          : 'ca-app-pub-3326866070505611/9255101114');
  static String get _interstitialUnit => _forceTestAds
      ? (_ios ? _testInterstitialIos : _testInterstitialAndroid)
      : (_ios
          ? 'ca-app-pub-3326866070505611/1414506632'
          : 'ca-app-pub-3326866070505611/6628937776');
  static String get _rewardedUnit => _forceTestAds
      ? (_ios ? _testRewardedIos : _testRewardedAndroid)
      : (_ios
          ? 'ca-app-pub-3326866070505611/4002774438'
          : 'ca-app-pub-3326866070505611/1637867914');
  static String get _appOpenUnit => _forceTestAds
      ? (_ios ? _testAppOpenIos : _testAppOpenAndroid)
      : (_ios ? _appOpenIos : _appOpenAndroid);

  /// Pro kullanıcıda kapalı. `main.dart` isPro'ya göre ayarlar.
  static bool enabled = true;

  static bool _initialized = false;
  static InterstitialAd? _interstitial;
  static DateTime? _lastInterstitial;

  static AppOpenAd? _appOpenAd;
  static bool _firstResumeSeen = false;
  static const _kLastAppOpen = 'ad_last_app_open';

  /// Açılış reklamları arasında en az bu kadar süre — "girince görür ama bunaltmaz".
  static const _appOpenGap = Duration(hours: 4);

  /// İki tam-ekran reklam üst üste binmesin (ör. ödüllü/interstitial kapanırken
  /// tetiklenen resume'de açılış reklamı tekrar açılmasın).
  static bool _showingFullScreenAd = false;

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
    _preloadAppOpen();
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
    if (_adsOff || _showingFullScreenAd) return;
    final last = _lastInterstitial;
    if (last != null && DateTime.now().difference(last) < _interstitialGap) return;
    final ad = _interstitial;
    if (ad == null) {
      _preloadInterstitial();
      return;
    }
    _interstitial = null;
    _lastInterstitial = DateTime.now();
    _showingFullScreenAd = true;
    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        _showingFullScreenAd = false;
        ad.dispose();
        _preloadInterstitial();
      },
      onAdFailedToShowFullScreenContent: (ad, err) {
        _showingFullScreenAd = false;
        ad.dispose();
        _preloadInterstitial();
      },
    );
    await ad.show();
  }

  // ---- App Open (açılış reklamı) ----
  static void _preloadAppOpen() {
    if (_adsOff || _appOpenUnit.isEmpty) return;
    AppOpenAd.load(
      adUnitId: _appOpenUnit,
      request: const AdRequest(nonPersonalizedAds: true),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) => _appOpenAd = ad,
        onAdFailedToLoad: (err) {
          _appOpenAd = null;
          debugPrint('Sipling açılış reklamı yüklenemedi: $err');
        },
      ),
    );
  }

  /// Uygulama öne gelince açılış reklamı. Soğuk açılışın İLK resume'ünde
  /// gösterilmez (kullanıcı doğrudan girsin); sonrasında en fazla 4 saatte bir.
  /// `didChangeAppLifecycleState(resumed)`'dan çağrılır.
  static Future<void> maybeShowAppOpen() async {
    if (_adsOff || _showingFullScreenAd) return;
    if (!_firstResumeSeen) {
      _firstResumeSeen = true;
      _preloadAppOpen();
      return;
    }
    final prefs = await SharedPreferences.getInstance();
    final lastMs = prefs.getInt(_kLastAppOpen);
    if (lastMs != null &&
        DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(lastMs)) <
            _appOpenGap) {
      return;
    }
    final ad = _appOpenAd;
    if (ad == null) {
      _preloadAppOpen();
      return;
    }
    _appOpenAd = null;
    _showingFullScreenAd = true;
    await prefs.setInt(_kLastAppOpen, DateTime.now().millisecondsSinceEpoch);
    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        _showingFullScreenAd = false;
        ad.dispose();
        _preloadAppOpen();
      },
      onAdFailedToShowFullScreenContent: (ad, err) {
        _showingFullScreenAd = false;
        ad.dispose();
        _preloadAppOpen();
      },
    );
    ad.show();
  }

  // ---- Rewarded (ödüllü — "reklam izle, kozmetik aç") ----
  /// Ödüllü reklam gösterir; kullanıcı sonuna kadar izlerse [onReward] çağrılır.
  /// Reklam yüklenemez/gösterilemezse [onUnavailable] çağrılır (kullanıcı sessiz
  /// kalmasın, "reklam hazır değil" mesajı gösterebilsin).
  /// Pro'da/web'de doğrudan ödülü verir (reklam yok).
  static Future<void> showRewarded(VoidCallback onReward,
      {VoidCallback? onUnavailable}) async {
    if (_adsOff) {
      onReward();
      return;
    }
    RewardedAd.load(
      adUnitId: _rewardedUnit,
      request: const AdRequest(nonPersonalizedAds: true),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _showingFullScreenAd = true;
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              _showingFullScreenAd = false;
              ad.dispose();
            },
            onAdFailedToShowFullScreenContent: (ad, err) {
              _showingFullScreenAd = false;
              ad.dispose();
              onUnavailable?.call();
            },
          );
          ad.show(onUserEarnedReward: (_, _) => onReward());
        },
        onAdFailedToLoad: (err) {
          debugPrint('Sipling ödüllü yüklenemedi: $err');
          onUnavailable?.call();
        },
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
