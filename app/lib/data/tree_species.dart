import 'package:flutter/material.dart';

enum CanopyShape { round, conical, layered, blossom }

/// Ağaçların nasıl açıldığı. Hiçbiri oynanışı etkilemez, tamamen kozmetiktir.
enum UnlockRule {
  free, // baştan açık
  streak, // n gün üst üste hedef
  totalTrees, // toplam n ağaç
  rewardedAd, // ödüllü reklam izleyerek
  pro, // Pro üyelik
}

/// Ad taşımaz — `l10n/labels.dart` → `species.name(context.l)`.
class TreeSpecies {
  final String id;
  final CanopyShape shape;
  final Color dark;
  final Color main;
  final Color light;
  final Color trunk;
  final UnlockRule rule;
  final int threshold;

  const TreeSpecies({
    required this.id,
    required this.shape,
    required this.dark,
    required this.main,
    required this.light,
    this.trunk = const Color(0xFF8D6E5A),
    this.rule = UnlockRule.free,
    this.threshold = 0,
  });

}

const kTreeSpecies = <TreeSpecies>[
  TreeSpecies(
    id: 'oak',
    shape: CanopyShape.round,
    dark: Color(0xFF2F8F5B),
    main: Color(0xFF4CAF7D),
    light: Color(0xFF7ACB9F),
  ),
  TreeSpecies(
    id: 'pine',
    shape: CanopyShape.conical,
    dark: Color(0xFF1F6B4A),
    main: Color(0xFF2E8A5E),
    light: Color(0xFF4FA97B),
    trunk: Color(0xFF6E5245),
    rule: UnlockRule.streak,
    threshold: 3,
  ),
  TreeSpecies(
    id: 'cherry',
    shape: CanopyShape.blossom,
    dark: Color(0xFFD98BA8),
    main: Color(0xFFF0A9C0),
    light: Color(0xFFFBD0DE),
    trunk: Color(0xFF6B4E42),
    rule: UnlockRule.streak,
    threshold: 7,
  ),
  TreeSpecies(
    id: 'acacia',
    shape: CanopyShape.layered,
    dark: Color(0xFF6E8F3F),
    main: Color(0xFF8CB255),
    light: Color(0xFFB2D07F),
    trunk: Color(0xFF7A5C46),
    rule: UnlockRule.totalTrees,
    threshold: 15,
  ),
  TreeSpecies(
    id: 'maple',
    shape: CanopyShape.round,
    dark: Color(0xFFC2562F),
    main: Color(0xFFE3763F),
    light: Color(0xFFF3A268),
    trunk: Color(0xFF6E5245),
    rule: UnlockRule.rewardedAd,
  ),
  TreeSpecies(
    id: 'olive',
    shape: CanopyShape.layered,
    dark: Color(0xFF5C7A5E),
    main: Color(0xFF7D9C78),
    light: Color(0xFFA9C1A0),
    trunk: Color(0xFF7E6A55),
    rule: UnlockRule.totalTrees,
    threshold: 40,
  ),
  TreeSpecies(
    id: 'golden',
    shape: CanopyShape.round,
    dark: Color(0xFFC79A24),
    main: Color(0xFFE8BE45),
    light: Color(0xFFF6DA85),
    trunk: Color(0xFF7A5C46),
    rule: UnlockRule.pro,
  ),
  TreeSpecies(
    id: 'jacaranda',
    shape: CanopyShape.blossom,
    dark: Color(0xFF6C55A8),
    main: Color(0xFF8E75C6),
    light: Color(0xFFB9A6E0),
    trunk: Color(0xFF6B5A4B),
    rule: UnlockRule.pro,
  ),
];

TreeSpecies speciesById(String id) =>
    kTreeSpecies.firstWhere((e) => e.id == id, orElse: () => kTreeSpecies.first);
