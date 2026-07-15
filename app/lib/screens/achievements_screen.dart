import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/achievements.dart';
import '../data/store.dart';
import '../l10n/labels.dart';
import '../theme.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final l = context.l;
    final stats = state.achievementStats;
    final p = Palette.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l.achScreenTitle)),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(14, 6, 14, 24),
        itemCount: kAchievements.length,
        itemBuilder: (context, i) {
          final a = kAchievements[i];
          final unlocked = a.unlocked(stats);
          final progress =
              a.progress != null && a.target != null ? a.progress!(stats) : null;

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: p.card,
              borderRadius: BorderRadius.circular(18),
              boxShadow: softShadow(p.dark),
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: unlocked
                        ? SiplingColors.leaf.withValues(alpha: 0.15)
                        : p.inkSoft.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(a.icon,
                      color: unlocked ? SiplingColors.leafDark : p.inkSoft,
                      size: 22),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(a.title(l),
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: unlocked ? p.ink : p.inkSoft)),
                      const SizedBox(height: 2),
                      Text(a.description(l),
                          style: TextStyle(fontSize: 12, color: p.inkSoft)),
                      if (!unlocked && progress != null) ...[
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: (progress / a.target!).clamp(0.0, 1.0),
                            minHeight: 5,
                            backgroundColor: p.inkSoft.withValues(alpha: 0.12),
                            valueColor:
                                const AlwaysStoppedAnimation(SiplingColors.water),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text('$progress / ${a.target}',
                            style: TextStyle(fontSize: 10, color: p.inkSoft)),
                      ],
                    ],
                  ),
                ),
                if (unlocked)
                  const Icon(Icons.check_circle,
                      color: SiplingColors.leafDark, size: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
