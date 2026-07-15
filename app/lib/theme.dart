import 'package:flutter/material.dart';

/// Sipling marka paleti.
/// Su = mavi, büyüme = yeşil. İkisi de yumuşak, ferah tonlarda.
class SiplingColors {
  static const skyTop = Color(0xFFEAF6FC);
  static const skyBottom = Color(0xFFCDE7F5);
  static const nightTop = Color(0xFF23394A);
  static const nightBottom = Color(0xFF1A2C39);

  static const water = Color(0xFF4FB3E8);
  static const waterDeep = Color(0xFF2E9BD6);

  static const leaf = Color(0xFF4CAF7D);
  static const leafDark = Color(0xFF2F8F5B);
  static const leafLight = Color(0xFF7ACB9F);

  static const soil = Color(0xFF8D6E5A);
  static const soilDark = Color(0xFF6E5245);
  static const grass = Color(0xFF5FBF85);

  static const ink = Color(0xFF17384A);
  static const inkSoft = Color(0xFF5A7A8A);
  static const bg = Color(0xFFF5FAFD);

  static const darkInk = Color(0xFFE6F1F6);
  static const darkInkSoft = Color(0xFF9FB4C0);
  static const darkBg = Color(0xFF101C24);
  static const darkCard = Color(0xFF172833);

  static const streak = Color(0xFFFF8A47);
}

/// Ekranlarda tema-duyarlı renk okumak için tek yer.
class Palette {
  final bool dark;
  const Palette(this.dark);

  Color get ink => dark ? SiplingColors.darkInk : SiplingColors.ink;
  Color get inkSoft => dark ? SiplingColors.darkInkSoft : SiplingColors.inkSoft;
  Color get bg => dark ? SiplingColors.darkBg : SiplingColors.bg;
  Color get card => dark ? SiplingColors.darkCard : Colors.white;
  Color get skyTop => dark ? SiplingColors.nightTop : SiplingColors.skyTop;
  Color get skyBottom =>
      dark ? SiplingColors.nightBottom : SiplingColors.skyBottom;

  static Palette of(BuildContext context) =>
      Palette(Theme.of(context).brightness == Brightness.dark);
}

ThemeData siplingTheme({required bool dark}) {
  final base =
      dark ? ThemeData.dark(useMaterial3: true) : ThemeData.light(useMaterial3: true);
  final p = Palette(dark);
  return base.copyWith(
    scaffoldBackgroundColor: p.bg,
    colorScheme: base.colorScheme.copyWith(
      primary: SiplingColors.water,
      secondary: SiplingColors.leaf,
      surface: p.card,
    ),
    cardColor: p.card,
    dividerColor: p.inkSoft.withValues(alpha: 0.15),
    textTheme: base.textTheme.apply(bodyColor: p.ink, displayColor: p.ink),
    appBarTheme: AppBarTheme(
      backgroundColor: p.bg,
      foregroundColor: p.ink,
      elevation: 0,
      centerTitle: false,
    ),
  );
}

/// Kartlarda tekrar eden yumuşak gölge.
List<BoxShadow> softShadow(bool dark, {Color? tint}) => [
      BoxShadow(
        color: (tint ?? (dark ? Colors.black : SiplingColors.ink))
            .withValues(alpha: dark ? 0.35 : 0.07),
        blurRadius: 14,
        offset: const Offset(0, 4),
      ),
    ];
