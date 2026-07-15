import 'models.dart';

/// Günlük içecek hedefini hesaplar.
///
/// Taban değer EFSA'nın "Dietary Reference Values for water" (2010) görüşünden:
/// orta sıcaklık ve orta düzey fiziksel aktivitede yeterli alım kadınlar için
/// 2,0 L, erkekler için 2,5 L (İÇECEKLERDEN — yiyecekteki su hariç).
///
/// Bilerek NASEM'in 2,7 / 3,7 L rakamını kullanmıyoruz: o toplam su alımıdır ve
/// yaklaşık %20'si yiyeceklerden gelir. Bu uygulama yalnız içilenleri saydığı için
/// o rakamı hedef yapmak kullanıcıyı gereğinden fazla içmeye iter.
///
/// Kilo ve aktivite düzeltmeleri kaba tahmindir; kullanıcı Ayarlar'dan
/// hedefi elle değiştirebilir.
int calculateGoalMl(Profile p) {
  if (p.customGoalMl != null) return p.customGoalMl!;

  final (base, refWeight) = switch (p.gender) {
    Gender.female => (2000, 60),
    Gender.male => (2500, 70),
    Gender.other => (2250, 65),
  };

  final weightAdjustment = (p.weightKg - refWeight) * 12;
  final raw = base + weightAdjustment + p.activity.extraMl;

  // 50 ml'ye yuvarla, makul sınırlar içinde tut.
  final rounded = (raw / 50).round() * 50;
  return rounded.clamp(1200, 5000);
}

/// Vücut kitle indeksi. Sağlık tavsiyesi değil, bilgi amaçlı gösterilir.
double calculateBmi(Profile p) {
  final m = p.heightCm / 100.0;
  if (m <= 0) return 0;
  return p.weightKg / (m * m);
}

/// BMI sınıfı. Metni `l10n/labels.dart` → `bmiLabelOf()` üretir; burada yalnız
/// eşikler durur, böylece dilden bağımsız test edilebilir.
enum BmiCategory { underweight, normal, overweight, obese }

BmiCategory bmiCategoryOf(double bmi) {
  if (bmi < 18.5) return BmiCategory.underweight;
  if (bmi < 25) return BmiCategory.normal;
  if (bmi < 30) return BmiCategory.overweight;
  return BmiCategory.obese;
}

/// Uyanık geçen sürede, şu an hedefin ne kadarının içilmiş olması beklenir.
/// "Geride kalınca hatırlat" ayarı bunu kullanır.
double expectedProgressAt(Profile p, DateTime now) {
  final minutes = now.hour * 60 + now.minute;
  // Son içme fırsatı uykudan 1 saat önce sayılır.
  final lastCall = p.sleepMinutes - 60;
  if (minutes <= p.wakeMinutes) return 0;
  if (minutes >= lastCall) return 1;
  return (minutes - p.wakeMinutes) / (lastCall - p.wakeMinutes);
}
