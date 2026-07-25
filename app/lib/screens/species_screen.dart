import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/store.dart';
import '../data/tree_species.dart';
import '../l10n/labels.dart';
import '../services/ads_service.dart';
import '../theme.dart';
import '../widgets/tree_painter.dart';

/// Ağaç türleri. Hepsi kozmetik; hiçbiri takibi veya hedefi etkilemez.
class SpeciesScreen extends StatelessWidget {
  const SpeciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final l = context.l;
    final p = Palette.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l.speciesScreenTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(14, 6, 14, 24),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(6, 0, 6, 14),
            child: Text(
              l.speciesScreenIntro,
              style: TextStyle(fontSize: 13, color: p.inkSoft, height: 1.4),
            ),
          ),
          for (final s in kTreeSpecies)
            _SpeciesTile(
              species: s,
              unlocked: state.isSpeciesUnlocked(s),
              selected: state.selectedSpeciesId == s.id,
              onTap: () => _onTap(context, state, s),
            ),
        ],
      ),
    );
  }

  void _onTap(BuildContext context, AppState state, TreeSpecies s) {
    if (state.isSpeciesUnlocked(s)) {
      state.selectSpecies(s.id);
      return;
    }
    if (s.rule == UnlockRule.rewardedAd) {
      showDialog<void>(
        context: context,
        builder: (_) => _RewardDialog(species: s),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(s.unlockText(context.l)),
      ),
    );
  }
}

class _SpeciesTile extends StatelessWidget {
  final TreeSpecies species;
  final bool unlocked;
  final bool selected;
  final VoidCallback onTap;

  const _SpeciesTile({
    required this.species,
    required this.unlocked,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    final p = Palette.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? SiplingColors.leaf.withValues(alpha: 0.12) : p.card,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected ? SiplingColors.leafDark : Colors.transparent,
            width: 1.6,
          ),
          boxShadow: selected ? null : softShadow(p.dark),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 56,
              height: 66,
              // Kilitli türler görünür kalsın — hedef olsunlar, hayalet değil.
              child: Opacity(
                opacity: unlocked ? 1 : 0.5,
                child: CustomPaint(
                  painter: TreePainter(growth: 1, seed: 5, species: species),
                  child: const SizedBox.expand(),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(species.name(l),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: p.ink)),
                  const SizedBox(height: 3),
                  Text(
                    unlocked
                        ? (selected
                            ? l.speciesScreenSelected
                            : l.speciesScreenUnlocked)
                        : species.unlockText(l),
                    style: TextStyle(
                      fontSize: 12,
                      color: unlocked ? p.inkSoft : SiplingColors.streak,
                    ),
                  ),
                ],
              ),
            ),
            if (!unlocked)
              Icon(
                species.rule == UnlockRule.rewardedAd
                    ? Icons.play_circle_outline
                    : (species.rule == UnlockRule.pro
                        ? Icons.workspace_premium
                        : Icons.lock_outline),
                color: p.inkSoft,
                size: 20,
              )
            else if (selected)
              const Icon(Icons.check_circle,
                  color: SiplingColors.leafDark, size: 20),
          ],
        ),
      ),
    );
  }
}

/// Ödüllü reklam yer tutucusu. AdMob bağlanana kadar açıklama gösterir.
class _RewardDialog extends StatelessWidget {
  final TreeSpecies species;
  const _RewardDialog({required this.species});

  @override
  Widget build(BuildContext context) {
    final l = context.l;
    final p = Palette.of(context);
    final messenger = ScaffoldMessenger.of(context);
    return AlertDialog(
      backgroundColor: p.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      title: Text(l.speciesScreenUnlockTitle(species.name(l))),
      content: Text(
        l.speciesScreenRewardBody,
        style: TextStyle(fontSize: 14, color: p.inkSoft, height: 1.45),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l.speciesScreenCancel),
        ),
        FilledButton(
          style: FilledButton.styleFrom(backgroundColor: SiplingColors.leafDark),
          onPressed: () {
            final state = context.read<AppState>();
            Navigator.of(context).pop();
            // Ödüllü reklamı göster; sonuna kadar izlenirse tür açılır.
            // (Pro'da/web'de reklam yok → ödül doğrudan verilir.)
            // Reklam yüklenemezse kullanıcı sessiz kalmasın diye bilgi ver.
            AdsService.showRewarded(
              () => state.unlockWithReward(species.id),
              onUnavailable: () => messenger.showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text(l.speciesScreenAdUnavailable),
                ),
              ),
            );
          },
          child: Text(l.speciesScreenWatchAd),
        ),
      ],
    );
  }
}
