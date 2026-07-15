import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

/// $1/ay **Pro** aboneliği (reklamsız + Pro temalar) — Play / App Store.
///
/// 🚨 Play Console + App Store Connect'te abonelik ürünü **BU KİMLİKLE** oluşturulmalı,
/// yoksa "ürün bulunamadı". Fiyat kademesi (~$1) konsolda seçilir — koda rakam yazılmaz.
///
/// Şu an **istemci doğrulama** (StoreKit/Play imzalı makbuz var → entitlement ver).
/// ⚠️ Sunucu doğrulama (anti-korsanlık + kesin süre kontrolü) 1.1'e planlandı; entitlement
/// verme tek yerde ([_grant]) toplandı, o zaman kolayca sunucuya bağlanır. Apple incelemesi
/// sunucu doğrulama ARAMAZ; istemci akışı + "Geri Yükle" butonu yeterlidir.
class PurchaseService {
  PurchaseService._();

  /// Play + App Store Connect'te oluşturulacak abonelik ürün kimliği (İKİSİNDE AYNI).
  static const productId = 'sipling_pro_monthly';

  static final InAppPurchase _iap = InAppPurchase.instance;
  static StreamSubscription<List<PurchaseDetails>>? _sub;
  static ProductDetails? _product;

  /// Pro entitlement'ı YAZAN geri çağrı. `main.dart` bunu `AppState.setPro`'ya bağlar.
  static Future<void> Function(bool active)? onEntitlement;

  /// Mağazadan gelen yerelleştirilmiş fiyat (ör. "₺39,99", "$0.99"). Ürün gelmeden null.
  static String? get price => _product?.price;

  /// Mağaza satın almaya hazır mı (cihaz destekliyor + ürün yüklendi).
  static bool get ready => !kIsWeb && _available && _product != null;

  static bool _initialized = false;
  static bool _available = false;

  static Future<void> init() async {
    if (kIsWeb || _initialized) return;
    _initialized = true;
    _available = await _iap.isAvailable();
    if (!_available) return;
    // 🚨 Akışı uygulama açılışında dinle: "onay" olayına tek başına güvenme; geri
    // yükleme + bekleyen satın almalar da buradan gelir (playbook dersi).
    _sub = _iap.purchaseStream.listen(
      _onPurchases,
      onError: (Object e) => debugPrint('Sipling satın alma akışı: $e'),
    );
    final resp = await _iap.queryProductDetails({productId});
    if (resp.productDetails.isNotEmpty) _product = resp.productDetails.first;
  }

  /// Aboneliği satın al. (Abonelikler `in_app_purchase`'da non-consumable sayılır.)
  static Future<void> buy() async {
    if (!ready) return;
    await _iap.buyNonConsumable(
        purchaseParam: PurchaseParam(productDetails: _product!));
  }

  /// 🍎 Apple ZORUNLU: geri yükleme. Cihaz değişince / yeniden kurunca Pro'yu geri verir.
  static Future<void> restore() async {
    if (kIsWeb) return;
    await _iap.restorePurchases();
  }

  static Future<void> _onPurchases(List<PurchaseDetails> purchases) async {
    for (final p in purchases) {
      switch (p.status) {
        case PurchaseStatus.pending:
          break; // beklemede — dokunma
        case PurchaseStatus.error:
        case PurchaseStatus.canceled:
          break; // entitlement verme
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          if (p.productID == productId) await _grant(p);
      }
      // 🚨 Yalnız işlenince tamamla — yoksa mağaza aynı satın almayı tekrar sunar.
      if (p.pendingCompletePurchase) await _iap.completePurchase(p);
    }
  }

  /// Entitlement verme TEK YER — sunucu doğrulama buraya eklenecek (1.1).
  static Future<void> _grant(PurchaseDetails p) async {
    await onEntitlement?.call(true);
  }

  static void dispose() => _sub?.cancel();
}
