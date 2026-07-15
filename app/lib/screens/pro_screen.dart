import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/store.dart';
import '../l10n/labels.dart';
import '../services/purchase_service.dart';
import '../theme.dart';

/// Pro tanıtım ekranı.
///
/// ⚠️ Buradaki satın alma HENÜZ GERÇEK DEĞİL. Google Play Billing bağlanana ve
/// Play Console'da abonelik ürünü oluşturulana kadar buton yalnız yerel bir
/// anahtarı çevirir. Fiyatlar da Console'daki gerçek minimumlar görülmeden
/// yazılmamalı — bu yüzden ekranda rakam göstermiyoruz.
class ProScreen extends StatelessWidget {
  const ProScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    final state = context.watch<AppState>();
    final p = Palette.of(context);

    final perks = <(IconData, String, String)>[
      (Icons.block, l.proPerkNoAdsTitle, l.proPerkNoAdsSub),
      (Icons.park, l.proPerkTreesTitle, l.proPerkTreesSub),
      (Icons.insights, l.proPerkHistoryTitle, l.proPerkHistorySub),
      (Icons.palette_outlined, l.proPerkThemesTitle, l.proPerkThemesSub),
      (Icons.favorite_outline, l.proPerkSupportTitle, l.proPerkSupportSub),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(l.proAppBarTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 6, 20, 30),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 26),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [SiplingColors.leafDark, SiplingColors.water]),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                const Icon(Icons.workspace_premium,
                    color: Colors.white, size: 44),
                const SizedBox(height: 10),
                Text(l.proHeaderTitle,
                    style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                const SizedBox(height: 4),
                Text(l.proHeaderSub,
                    style:
                        const TextStyle(fontSize: 13, color: Colors.white70)),
              ],
            ),
          ),
          const SizedBox(height: 22),
          for (final (icon, title, sub) in perks)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Icon(icon, color: SiplingColors.leafDark, size: 21),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: p.ink)),
                        Text(sub,
                            style: TextStyle(fontSize: 12, color: p.inkSoft)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 10),
          if (state.isPro)
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: SiplingColors.leafDark.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle,
                      color: SiplingColors.leafDark, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(l.proButtonOn,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: SiplingColors.leafDark)),
                  ),
                ],
              ),
            )
          else ...[
            // Abone ol — mağaza fiyatı butonda (ülke para birimiyle). Ürün gelmeden pasif.
            SizedBox(
              width: double.infinity,
              height: 54,
              child: FilledButton(
                onPressed: PurchaseService.ready ? PurchaseService.buy : null,
                style: FilledButton.styleFrom(
                  backgroundColor: SiplingColors.leafDark,
                  disabledBackgroundColor: p.inkSoft.withValues(alpha: 0.4),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                child: Text(
                  PurchaseService.ready
                      ? l.proPerMonth(PurchaseService.price ?? '')
                      : l.proStoreUnavailable,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(height: 4),
            // 🍎 Apple ZORUNLU: geri yükleme.
            TextButton(
              onPressed: PurchaseService.restore,
              child: Text(l.proRestore,
                  style: TextStyle(color: p.inkSoft, fontSize: 13)),
            ),
            // 🍎 Apple ZORUNLU: otomatik-yenileme açıklaması.
            Text(l.proAutoRenew,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11, color: p.inkSoft, height: 1.4)),
            const SizedBox(height: 12),
            // 🍎 Apple ZORUNLU: Kullanım Koşulları + Gizlilik linkleri.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _LegalLink(
                    label: l.proTerms,
                    url: 'https://sipling-app.web.app/kosullar'),
                Text('  ·  ', style: TextStyle(color: p.inkSoft)),
                _LegalLink(
                    label: l.proPrivacyLink,
                    url: 'https://sipling-app.web.app/gizlilik'),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

/// Koşullar / Gizlilik bağlantısı — sistem tarayıcısında açar.
class _LegalLink extends StatelessWidget {
  final String label;
  final String url;
  const _LegalLink({required this.label, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
      child: Text(label,
          style: const TextStyle(
              fontSize: 12,
              color: SiplingColors.water,
              decoration: TextDecoration.underline)),
    );
  }
}
