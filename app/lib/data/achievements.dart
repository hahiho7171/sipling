import 'package:flutter/material.dart';

/// Başarım değerlendirmesi için gereken özet veriler.
class AchievementStats {
  final int totalTrees;
  final int currentStreak;
  final int bestStreak;
  final int totalDaysLogged;
  final int distinctDrinkTypes;
  final bool drankBefore9am;
  final int perfectWeek; // hedefi tutturulan gün sayısı, son 7 gün

  const AchievementStats({
    required this.totalTrees,
    required this.currentStreak,
    required this.bestStreak,
    required this.totalDaysLogged,
    required this.distinctDrinkTypes,
    required this.drankBefore9am,
    required this.perfectWeek,
  });
}

/// Başlık ve açıklama taşımaz — `l10n/labels.dart` → `a.title(context.l)`.
class Achievement {
  final String id;
  final IconData icon;
  final bool Function(AchievementStats s) unlocked;
  final int Function(AchievementStats s)? progress;
  final int? target;

  const Achievement({
    required this.id,
    required this.icon,
    required this.unlocked,
    this.progress,
    this.target,
  });
}

final kAchievements = <Achievement>[
  Achievement(
    id: 'first_sprout',
    icon: Icons.eco,
    unlocked: (s) => s.totalDaysLogged >= 1,
  ),
  Achievement(
    id: 'first_tree',
    icon: Icons.park,
    unlocked: (s) => s.totalTrees >= 1,
  ),
  Achievement(
    id: 'streak_3',
    icon: Icons.local_fire_department,
    unlocked: (s) => s.bestStreak >= 3,
    progress: (s) => s.bestStreak,
    target: 3,
  ),
  Achievement(
    id: 'streak_7',
    icon: Icons.calendar_month,
    unlocked: (s) => s.bestStreak >= 7,
    progress: (s) => s.bestStreak,
    target: 7,
  ),
  Achievement(
    id: 'streak_30',
    icon: Icons.emoji_events,
    unlocked: (s) => s.bestStreak >= 30,
    progress: (s) => s.bestStreak,
    target: 30,
  ),
  Achievement(
    id: 'trees_10',
    icon: Icons.forest,
    unlocked: (s) => s.totalTrees >= 10,
    progress: (s) => s.totalTrees,
    target: 10,
  ),
  Achievement(
    id: 'trees_50',
    icon: Icons.nature,
    unlocked: (s) => s.totalTrees >= 50,
    progress: (s) => s.totalTrees,
    target: 50,
  ),
  Achievement(
    id: 'early_bird',
    icon: Icons.wb_twilight,
    unlocked: (s) => s.drankBefore9am,
  ),
  Achievement(
    id: 'variety',
    icon: Icons.local_cafe,
    unlocked: (s) => s.distinctDrinkTypes >= 4,
    progress: (s) => s.distinctDrinkTypes,
    target: 4,
  ),
  Achievement(
    id: 'perfect_week',
    icon: Icons.workspace_premium,
    unlocked: (s) => s.perfectWeek >= 7,
    progress: (s) => s.perfectWeek,
    target: 7,
  ),
];
