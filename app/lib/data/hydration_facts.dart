import '../l10n/app_localizations.dart';

/// Suyun vücuttaki rolüyle ilgili kısa bilgiler.
///
/// İki yerde kullanılır ve **tek kaynak buradadır**:
///   • hatırlatma bildirimleri (`services/notifications.dart`) — kısa olanlar
///   • "Su ve vücudun" bölümü (`screens/water_needs_screen.dart`) — uzun olanlar
///
/// 🚨 BURAYA UYDURMA SAĞLIK İDDİASI YAZMA. Her madde yaygın kabul görmüş,
/// kaynağı gösterilebilir bilgidir; hastalık teşhisi/tedavisi ima etmez.
/// Kaynaklar:
///   - EFSA, "Scientific Opinion on Dietary Reference Values for water" (2010):
///     yeterli alım kadın 2,0 L / erkek 2,5 L (içeceklerden).
///   - Yetişkin vücudunun ~%50-60'ı, beynin ~%73'ü sudur (Mitchell ve ark. 1945;
///     USGS "Water in You" derlemesi).
///   - Vücut kütlesinin ~%1-2'si kadar su kaybı dikkat, ruh hali ve zihinsel
///     performansı olumsuz etkiler (Armstrong ve ark. 2012; Ganio ve ark. 2011).
///   - Susuzluk hissi, su kaybı başladıktan sonra ortaya çıkan gecikmeli bir
///     sinyaldir; idrar rengi pratik bir günlük göstergedir.
///
/// Veri katmanı metin taşımaz (projenin kuralı) — burada yalnız hangi çeviri
/// anahtarının kullanılacağı durur, metni `L` üretir.
class HydrationFact {
  final String title;
  final String body;
  const HydrationFact(this.title, this.body);
}

/// Bildirimlerde dönen kısa bilgiler (başlık + tek cümle).
List<HydrationFact> notificationFacts(L l) => [
      HydrationFact(l.factNotifTitle1, l.factNotifBody1),
      HydrationFact(l.factNotifTitle2, l.factNotifBody2),
      HydrationFact(l.factNotifTitle3, l.factNotifBody3),
      HydrationFact(l.factNotifTitle4, l.factNotifBody4),
      HydrationFact(l.factNotifTitle5, l.factNotifBody5),
    ];

/// "Su ve vücudun" bölümündeki daha uzun açıklamalar.
List<HydrationFact> learnFacts(L l) => [
      HydrationFact(l.factLearn1Title, l.factLearn1Body),
      HydrationFact(l.factLearn2Title, l.factLearn2Body),
      HydrationFact(l.factLearn3Title, l.factLearn3Body),
      HydrationFact(l.factLearn4Title, l.factLearn4Body),
      HydrationFact(l.factLearn5Title, l.factLearn5Body),
    ];
