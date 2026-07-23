// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class LTr extends L {
  LTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'Sipling';

  @override
  String get drinkWater => 'Su';

  @override
  String get drinkTea => 'Çay';

  @override
  String get drinkCoffee => 'Kahve';

  @override
  String get drinkMilk => 'Süt';

  @override
  String get drinkJuice => 'Meyve suyu';

  @override
  String get drinkSoda => 'Gazlı içecek';

  @override
  String get drinkAlcohol => 'Alkol';

  @override
  String get speciesOak => 'Meşe';

  @override
  String get speciesPine => 'Çam';

  @override
  String get speciesCherry => 'Sakura';

  @override
  String get speciesAcacia => 'Akasya';

  @override
  String get speciesMaple => 'Akçaağaç';

  @override
  String get speciesOlive => 'Zeytin';

  @override
  String get speciesGolden => 'Altın Yaprak';

  @override
  String get speciesJacaranda => 'Mor Salkım';

  @override
  String get unlockFree => 'Açık';

  @override
  String unlockStreak(int days) {
    return '$days gün üst üste hedefi tuttur';
  }

  @override
  String unlockTotalTrees(int count) {
    return 'Toplam $count ağaç yetiştir';
  }

  @override
  String get unlockRewardedAd => 'Kısa bir reklam izle';

  @override
  String get unlockPro => 'Pro üyelere özel';

  @override
  String get achFirstSproutTitle => 'İlk Filiz';

  @override
  String get achFirstSproutDesc => 'İlk bardağını içtin';

  @override
  String get achFirstTreeTitle => 'İlk Ağaç';

  @override
  String get achFirstTreeDesc => 'Bir günlük hedefi tamamladın';

  @override
  String get achStreak3Title => 'Alışkanlık Başlıyor';

  @override
  String get achStreak3Desc => '3 gün üst üste hedefi tutturdun';

  @override
  String get achStreak7Title => 'Tam Bir Hafta';

  @override
  String get achStreak7Desc => '7 gün üst üste hedefi tutturdun';

  @override
  String get achStreak30Title => 'Bir Ay Kesintisiz';

  @override
  String get achStreak30Desc => '30 gün üst üste hedefi tutturdun';

  @override
  String get achTrees10Title => 'Küçük Koru';

  @override
  String get achTrees10Desc => '10 ağaç yetiştirdin';

  @override
  String get achTrees50Title => 'Orman Sahibi';

  @override
  String get achTrees50Desc => '50 ağaç yetiştirdin';

  @override
  String get achEarlyBirdTitle => 'Erken Kalkan';

  @override
  String get achEarlyBirdDesc => 'Sabah 9\'dan önce su içtin';

  @override
  String get achVarietyTitle => 'Çeşitli Damak';

  @override
  String get achVarietyDesc => 'En az 4 farklı içecek kaydettin';

  @override
  String get achPerfectWeekTitle => 'Kusursuz Hafta';

  @override
  String get achPerfectWeekDesc => 'Son 7 günün hepsinde hedefi tutturdun';

  @override
  String get seasonClassicName => 'Klasik';

  @override
  String get seasonClassicDesc => 'Her mevsim yemyeşil';

  @override
  String get seasonAutoName => 'Otomatik';

  @override
  String get seasonAutoDesc => 'Ormanın takvimle birlikte değişsin';

  @override
  String get seasonSpringName => 'İlkbahar';

  @override
  String get seasonSpringDesc => 'Taze yapraklar, açık gökyüzü';

  @override
  String get seasonSummerName => 'Yaz';

  @override
  String get seasonSummerDesc => 'Koyu, doygun yeşiller';

  @override
  String get seasonAutumnName => 'Sonbahar';

  @override
  String get seasonAutumnDesc => 'Turuncu yapraklar, sıcak ışık';

  @override
  String get seasonWinterName => 'Kış';

  @override
  String get seasonWinterDesc => 'Karlı tepeler, soğuk ışık';

  @override
  String get bmiUnderweight => 'Zayıf';

  @override
  String get bmiNormal => 'Normal';

  @override
  String get bmiOverweight => 'Fazla kilolu';

  @override
  String get bmiObese => 'Obez';

  @override
  String get notifTitle1 => 'Su vakti 💧';

  @override
  String get notifBody1 => 'Fidanın seni bekliyor, bir bardak içelim mi?';

  @override
  String get notifTitle2 => 'Bir yudum daha';

  @override
  String get notifBody2 => 'Küçük yudumlar büyük ağaçlar yapar.';

  @override
  String get notifTitle3 => 'Fidanın susadı 🌱';

  @override
  String get notifBody3 => 'Bir bardak su, biraz daha büyüsün.';

  @override
  String get notifTitle4 => 'Hatırlatma';

  @override
  String get notifBody4 => 'Bugünkü ağacına bir adım daha yaklaş.';

  @override
  String get notifTitle5 => 'Su molası';

  @override
  String get notifBody5 => 'Şu an içeceğin bardak, akşamki ağacın.';

  @override
  String get activityLow => 'Hareketsiz';

  @override
  String get activityLowHint => 'Masa başı, az yürüyüş';

  @override
  String get activityMedium => 'Orta';

  @override
  String get activityMediumHint => 'Haftada 1-3 gün spor';

  @override
  String get activityHigh => 'Aktif';

  @override
  String get activityHighHint => 'Haftada 4+ gün spor';

  @override
  String get cupGlass => 'Bardak';

  @override
  String get cupBottle => 'Şişe';

  @override
  String get cupLarge => 'Büyük';

  @override
  String get homeNewAchievement => 'Yeni başarım';

  @override
  String get homeUndoLast => 'Son eklemeyi geri al';

  @override
  String get homeStageSeed => 'Tohumun toprakta, ilk yudumu bekliyor';

  @override
  String get homeStageSprout => 'Filizlendi 🌱';

  @override
  String get homeStageSapling => 'Fidanın büyüyor';

  @override
  String get homeStageAlmost => 'Neredeyse bir ağaç!';

  @override
  String get homeStageReady => 'Bugünkü ağacın hazır 🌳';

  @override
  String get homePaceDone => 'Yarın yeni bir fidan seni bekliyor';

  @override
  String get homePaceStart => 'Güne bir bardakla başla';

  @override
  String homePaceBehind(int ml) {
    return 'Bu saatte $ml ml geridesin — telafi edilebilir';
  }

  @override
  String get homePaceOnTrack => 'Temponu tutturuyorsun 👌';

  @override
  String get homeGoalDone => 'Günlük hedefini tamamladın';

  @override
  String homeRemaining(int ml) {
    return '$ml ml kaldı';
  }

  @override
  String homeStreakDays(int days) {
    return '$days gün';
  }

  @override
  String get homeCelebrateTitle => 'Ağacın büyüdü!';

  @override
  String get homeCelebrateBody =>
      'Bugünkü hedefini tamamladın. Bu ağaç artık ormanının bir parçası.';

  @override
  String homeStreakLabel(int days) {
    return '$days günlük seri';
  }

  @override
  String get homeCelebrateOk => 'Harika';

  @override
  String get addWhatTitle => 'Ne içtin?';

  @override
  String get addAmount => 'Miktar';

  @override
  String get addConfirm => 'Ekle';

  @override
  String get addFactorWater => 'Hedefe birebir sayılır.';

  @override
  String get addFactorAlcohol => 'Alkol vücuttan su atar; hedefinden düşülür.';

  @override
  String addFactorPercent(int percent) {
    return 'Hedefe %$percent oranında sayılır.';
  }

  @override
  String get sumTitle => 'Dünün özeti';

  @override
  String get sumTreeGrown => 'Ağacın büyüdü 🌳';

  @override
  String get sumSaplingOnWay => 'Fidanın yolda 🌱';

  @override
  String get sumBodyDone =>
      'Hedefini tutturdun. Bu ağaç ormanının bir parçası.';

  @override
  String sumPercent(int percent) {
    return 'Dün hedefin %$percent\'ine ulaştın. Fidanın olduğu yerde seni bekliyor — hiçbir ağaç kurumaz.';
  }

  @override
  String get sumStatCounted => 'Sayılan';

  @override
  String get sumStatGoal => 'Hedef';

  @override
  String get sumStatStreak => 'Seri';

  @override
  String sumStreakDays(int days) {
    return '$days gün';
  }

  @override
  String get sumStartToday => 'Bugüne başla';

  @override
  String get sumWhatDrank => 'Ne içtin';

  @override
  String sumDrinkAmount(String name, int ml) {
    return '$name $ml ml';
  }

  @override
  String get navToday => 'Bugün';

  @override
  String get navForest => 'Orman';

  @override
  String get navStats => 'İstatistik';

  @override
  String get navSettings => 'Ayarlar';

  @override
  String get onbContinue => 'Devam';

  @override
  String get onbFinish => 'Fidanımı dik';

  @override
  String get onbWelcomeTagline =>
      'Her yudum bir fidan.\nSu içtikçe ağacın büyür, günler geçtikçe ormanın.';

  @override
  String get onbWelcomeNoPenalty => 'Ağacın asla kurumaz. Burada ceza yok.';

  @override
  String get onbGenderTitle => 'Seni tanıyalım';

  @override
  String get onbGenderSubtitle =>
      'Günlük su hedefin bu bilgilerle hesaplanır. Hepsi telefonunda kalır, hiçbir yere gönderilmez.';

  @override
  String get onbGenderFemale => 'Kadın';

  @override
  String get onbGenderMale => 'Erkek';

  @override
  String get onbGenderOther => 'Belirtmek istemiyorum';

  @override
  String get onbBodyTitle => 'Boy, kilo, yaş';

  @override
  String get onbBodySubtitle => 'Kaydırarak ayarla.';

  @override
  String get onbBodyAge => 'Yaş';

  @override
  String get onbBodyHeight => 'Boy';

  @override
  String get onbBodyWeight => 'Kilo';

  @override
  String get onbBodyBmiLabel => 'Vücut kitle indeksin';

  @override
  String get onbBodyDisclaimer => 'Bilgi amaçlıdır, sağlık tavsiyesi değildir.';

  @override
  String get onbActivityTitle => 'Ne kadar hareketlisin?';

  @override
  String get onbActivitySubtitle => 'Terledikçe daha çok suya ihtiyacın olur.';

  @override
  String get onbGoalTitle => 'Günlük hedefin';

  @override
  String get onbGoalSubtitle =>
      'Dilediğin zaman Ayarlar\'dan değiştirebilirsin.';

  @override
  String get onbGoalUnit => 'mililitre / gün';

  @override
  String onbGoalGlasses(int glasses) {
    return 'yaklaşık $glasses bardak';
  }

  @override
  String get onbGoalReference =>
      'Bu hedef, Avrupa Gıda Güvenliği Otoritesi\'nin (EFSA, 2010) yeterli içecek alımı referansından yola çıkılarak kilona ve hareket düzeyine göre uyarlandı. Yiyeceklerden aldığın su bu sayıya dahil değil.';

  @override
  String get proAppBarTitle => 'Sipling Pro';

  @override
  String get proHeaderTitle => 'Reklamsız Sipling';

  @override
  String get proHeaderSub => 'Ormanın büyümeye devam etsin';

  @override
  String get proPerkNoAdsTitle => 'Sıfır reklam';

  @override
  String get proPerkNoAdsSub => 'Gün sonu özetindeki reklam da kalkar';

  @override
  String get proPerkTreesTitle => 'Bütün ağaç türleri';

  @override
  String get proPerkTreesSub => 'Altın Yaprak ve Mor Salkım dahil';

  @override
  String get proPerkHistoryTitle => 'Sınırsız geçmiş';

  @override
  String get proPerkHistorySub => 'Tüm aylara ait detaylı istatistik';

  @override
  String get proPerkThemesTitle => 'Tema seçenekleri';

  @override
  String get proPerkThemesSub => 'Mevsimlik orman görünümleri';

  @override
  String get proPerkSupportTitle => 'Geliştirmeye destek';

  @override
  String get proPerkSupportSub => 'Sipling tek kişilik bir proje';

  @override
  String get proNotConnectedNote =>
      'Satın alma henüz bağlanmadı. Şimdilik Pro\'yu deneme amaçlı açıp kapatabilirsin.';

  @override
  String get proButtonOn => 'Pro açık — kapat';

  @override
  String get proButtonTry => 'Pro\'yu dene';

  @override
  String get batAppBarTitle => 'Bildirimler gelmiyorsa';

  @override
  String get batIntro =>
      'Bazı telefon markaları, pil tasarrufu için arka plandaki uygulamaları kapatır. Bu yüzden hatırlatmalar gecikebilir veya hiç gelmeyebilir. Aşağıdaki ayarı bir kez yapman yeterli.';

  @override
  String get batXiaomi1 =>
      'Ayarlar → Uygulamalar → Sipling → Pil tasarrufu → \"Kısıtlama yok\"';

  @override
  String get batXiaomi2 =>
      'Ayarlar → Uygulamalar → Sipling → Otomatik başlatma → Aç';

  @override
  String get batXiaomi3 =>
      'Son uygulamalar ekranında Sipling\'i aşağı çekip kilit simgesine bas';

  @override
  String get batSamsung1 =>
      'Ayarlar → Uygulamalar → Sipling → Pil → \"Kısıtlanmamış\"';

  @override
  String get batSamsung2 =>
      'Ayarlar → Pil → Arka planda kullanım sınırları → \"Uyuyan uygulamalar\" listesinden Sipling\'i çıkar';

  @override
  String get batHuawei1 =>
      'Ayarlar → Pil → Uygulama başlatma → Sipling → Otomatik yönetimi kapat';

  @override
  String get batHuawei2 =>
      'Otomatik başlat, ikincil başlat ve arka planda çalıştır seçeneklerini aç';

  @override
  String get batOppo1 =>
      'Ayarlar → Pil → Yüksek arka plan güç tüketimi → Sipling\'e izin ver';

  @override
  String get batOppo2 =>
      'Ayarlar → Uygulamalar → Sipling → Pil kullanımı → Arka planda çalışmaya izin ver';

  @override
  String get batFooter =>
      'Menü adları telefon modeline göre biraz değişebilir. Aradığın şey \"pil optimizasyonu\", \"arka planda çalışma\" veya \"otomatik başlatma\" benzeri bir ayar.';

  @override
  String get setTitle => 'Ayarlar';

  @override
  String get setSectionGoal => 'Hedef';

  @override
  String get setSectionReminders => 'Hatırlatmalar';

  @override
  String get setSectionCups => 'Bardaklarım';

  @override
  String get setSectionHealth => 'Sağlık';

  @override
  String get setSectionAppearance => 'Görünüm';

  @override
  String get setSectionApp => 'Uygulama';

  @override
  String get setProTagline => 'Reklamsız, tüm ağaçlar açık';

  @override
  String get setDailyGoal => 'Günlük hedef';

  @override
  String setMl(int ml) {
    return '$ml ml';
  }

  @override
  String get setProfileInfo => 'Profil bilgilerim';

  @override
  String setWeightKg(int kg) {
    return '$kg kg';
  }

  @override
  String get setRemindersOn => 'Hatırlatmalar açık';

  @override
  String get setFrequency => 'Sıklık';

  @override
  String get setAwakeHours => 'Uyanık saatlerim';

  @override
  String get setStopWhenDone => 'Hedefi tutunca sus';

  @override
  String get setStopWhenDoneSub =>
      'Günlük hedefi tamamlayınca kalan hatırlatmalar iptal olur';

  @override
  String get setSilent => 'Sessiz bildirim';

  @override
  String get setSilentSub => 'Ses ve titreşim olmadan';

  @override
  String get setNotifNotArriving => 'Bildirim gelmiyor mu?';

  @override
  String get setNotifNotArrivingSub =>
      'Telefonunun pil ayarları engelliyor olabilir';

  @override
  String get setHealthWrite => 'Health Connect\'e yaz';

  @override
  String get setHealthWriteSub =>
      'İçtiğin su Android\'in sağlık defterine de kaydedilsin. Sipling oradan hiçbir şey okumaz.';

  @override
  String get setDarkTheme => 'Koyu tema';

  @override
  String get setForestTheme => 'Orman teması';

  @override
  String get setTreeSpecies => 'Ağaç türleri';

  @override
  String get setMyData => 'Verilerim';

  @override
  String get setMyDataSub =>
      'Her şey telefonunda saklanır, hiçbir yere gönderilmez';

  @override
  String get setResetAll => 'Tüm verileri sıfırla';

  @override
  String setEveryHours(int h) {
    return '$h saatte bir';
  }

  @override
  String setEveryMinutes(int m) {
    return '$m dakikada bir';
  }

  @override
  String get setHealthNoConnect => 'Bu cihazda Health Connect yok.';

  @override
  String get setHealthNotInstalledTitle => 'Health Connect kurulu değil';

  @override
  String get setHealthNeedsUpdateTitle => 'Health Connect güncellenmeli';

  @override
  String get setHealthInstallBody =>
      'İçtiğin suyu Android\'in sağlık defterine yazabilmek için Health Connect uygulaması gerekiyor.';

  @override
  String get setOpenPlayStore => 'Play Store\'da aç';

  @override
  String get setHealthPermissionDenied =>
      'İzin verilmedi, sağlık defterine yazılmayacak.';

  @override
  String get setHealthEnabled =>
      'İçtiğin su bundan sonra Health Connect\'e de yazılacak.';

  @override
  String get setCancel => 'Vazgeç';

  @override
  String get setSave => 'Kaydet';

  @override
  String setSuggested(int ml) {
    return 'Önerilen: $ml ml';
  }

  @override
  String get setBackToSuggested => 'Önerilene dön';

  @override
  String get setIntervalDialogTitle => 'Ne sıklıkta hatırlatalım?';

  @override
  String get setWakeHelp => 'Kaçta uyanıyorsun?';

  @override
  String get setSleepHelp => 'Kaçta uyuyorsun?';

  @override
  String get setAwakeMin4h => 'Uyanık süren en az 4 saat olmalı';

  @override
  String get setResetConfirmTitle => 'Emin misin?';

  @override
  String get setResetConfirmBody =>
      'Ormanın, serilerin ve tüm kayıtların silinecek. Bu işlem geri alınamaz.';

  @override
  String get setResetConfirmButton => 'Sıfırla';

  @override
  String get statsTitle => 'İstatistik';

  @override
  String get statsDailyAverage => 'Günlük ortalama';

  @override
  String get statsGoalDays => 'Hedef tutan gün';

  @override
  String get statsCurrentStreak => 'Mevcut seri';

  @override
  String get statsUnitDays => 'gün';

  @override
  String get statsTotalTrees => 'Toplam ağaç';

  @override
  String statsLastDays(int days) {
    return 'Son $days gün';
  }

  @override
  String get statsYourDrinks => 'İçeceklerin';

  @override
  String statsRangeDays(int days) {
    return '$days gün';
  }

  @override
  String get statsWeekdayMon => 'Pzt';

  @override
  String get statsWeekdayTue => 'Sal';

  @override
  String get statsWeekdayWed => 'Çar';

  @override
  String get statsWeekdayThu => 'Per';

  @override
  String get statsWeekdayFri => 'Cum';

  @override
  String get statsWeekdaySat => 'Cmt';

  @override
  String get statsWeekdaySun => 'Paz';

  @override
  String get statsNoRecords => 'Henüz kayıt yok.';

  @override
  String get statsBmiTitle => 'Vücut kitle indeksi';

  @override
  String get statsBmiDisclaimer => 'Bilgi amaçlı,\nsağlık tavsiyesi değil';

  @override
  String get statsAchievements => 'Başarımlar';

  @override
  String statsAchievementsEarned(int count) {
    return '$count kazanıldı';
  }

  @override
  String get achScreenTitle => 'Başarımlar';

  @override
  String get forestTitle => 'Ormanın';

  @override
  String forestSubtitle(int trees, int days) {
    return '$trees ağaç • en iyi seri $days gün';
  }

  @override
  String get forestSpeciesTooltip => 'Ağaç türleri';

  @override
  String get forestEmptyTitle => 'Ormanın henüz boş';

  @override
  String get forestEmptyBody =>
      'İlk bardağını içtiğinde burada bir fidan belirecek.';

  @override
  String get speciesScreenTitle => 'Ağaç türleri';

  @override
  String get speciesScreenIntro =>
      'Yarınki fidanının türünü seçebilirsin. Ormanındaki eski ağaçlar dikildikleri türde kalır.';

  @override
  String get speciesScreenSelected => 'Seçili';

  @override
  String get speciesScreenUnlocked => 'Açık';

  @override
  String speciesScreenUnlockTitle(String name) {
    return '$name ağacını aç';
  }

  @override
  String get speciesScreenRewardBody =>
      'Kısa bir reklam izleyerek bu türü kalıcı olarak açabilirsin. Reklam tamamen isteğe bağlı — uygulamanın hiçbir yerinde zorunlu reklam yok.';

  @override
  String get speciesScreenCancel => 'Vazgeç';

  @override
  String get speciesScreenWatchAd => 'Reklamı izle';

  @override
  String get seasonScreenTitle => 'Orman teması';

  @override
  String get seasonScreenIntro =>
      'Ormanının rengi değişir, ağaçların değil. Hiçbir tema takibini, hedefini ya da serini etkilemez.';

  @override
  String get seasonScreenProOnly => 'Pro üyelere özel';

  @override
  String get seasonScreenSelected => 'Seçili';

  @override
  String get setSectionHome => 'Ana ekran';

  @override
  String get setAddWidget => 'Ana ekrana widget ekle';

  @override
  String get setAddWidgetSub => 'Tek dokunuşla, uygulamayı açmadan su ekle';

  @override
  String get setAddWidgetManual =>
      'Ana ekrana uzun bas → Widget\'lar → Sipling\'i seç';

  @override
  String get wrappedTitle => 'Orman Özetin';

  @override
  String get wrappedHeadline => 'Şimdiye kadarki yolculuğun';

  @override
  String wrappedLiters(int liters) {
    return '$liters L';
  }

  @override
  String get wrappedLitersLabel => 'toplam su';

  @override
  String get wrappedTreesLabel => 'ağaç';

  @override
  String get wrappedStreakLabel => 'en iyi seri';

  @override
  String get wrappedDaysLabel => 'gün';

  @override
  String get wrappedShare => 'Paylaş';

  @override
  String get wrappedShareText =>
      'Sipling ile su içiyor, ormanımı büyütüyorum 🌱 sipling-app.web.app';

  @override
  String get homeMoreDrinks => 'Diğer';

  @override
  String addFactorWaterEq(int ml, int percent) {
    return '≈ $ml ml su (%$percent)';
  }

  @override
  String proPerMonth(String price) {
    return '$price / ay';
  }

  @override
  String get proRestore => 'Satın alımları geri yükle';

  @override
  String get proTerms => 'Kullanım Koşulları';

  @override
  String get proPrivacyLink => 'Gizlilik Politikası';

  @override
  String get proStoreUnavailable => 'Mağaza şu an kullanılamıyor';

  @override
  String get proAutoRenew =>
      'Aylık abonelik, otomatik yenilenir. Yenilemeden en az 24 saat önce mağaza hesap ayarlarından iptal edin; iptal etmezseniz yenilenir.';

  @override
  String get homeCalcNeed => 'Su ihtiyacım';

  @override
  String get needTitle => 'Günlük su ihtiyacın';

  @override
  String get needIntro =>
      'Boyunu, kilonu ve hareket düzeyini gir; Sipling günde ne kadar suya ihtiyacın olduğunu hesaplasın.';

  @override
  String get needResultLabel => 'Senin için önerilen';

  @override
  String needCurrentGoal(int ml) {
    return 'Şu anki hedefin: $ml ml';
  }

  @override
  String get needApply => 'Bunu hedefim yap';

  @override
  String get needApplied => 'Hedefin güncellendi';

  @override
  String get needMeasuresTitle => 'Ölçülerin';

  @override
  String get needLearnTitle => 'Su ve vücudun';

  @override
  String get factNotifTitle1 => 'Dörtte üçü su';

  @override
  String get factNotifBody1 =>
      'Beyninin kabaca dörtte üçü sudur. Deposunu dolu tut.';

  @override
  String get factNotifTitle2 => 'Odaklanmak su ister';

  @override
  String get factNotifBody2 =>
      'Vücut suyunun yalnızca %1-2\'sini kaybetmek bile odaklanmayı zorlaştırabilir.';

  @override
  String get factNotifTitle3 => 'Susuzluk geç haber verir';

  @override
  String get factNotifBody3 =>
      'Sen susadığını hissettiğinde vücudun çoktan azalmaya başlamıştır.';

  @override
  String get factNotifTitle4 => 'Vücudunun soğutma sistemi';

  @override
  String get factNotifBody4 =>
      'Terlemek vücudunun serinleme yöntemidir ve bunu suyunu harcayarak yapar.';

  @override
  String get factNotifTitle5 => 'Rengine bak';

  @override
  String get factNotifBody5 =>
      'Açık sarı genelde yeterli su içtiğini gösterir. Koyulaştıysa suyunu artır.';

  @override
  String get factLearn1Title => 'Yarıdan fazlan su';

  @override
  String get factLearn1Body =>
      'Yetişkin bir vücudun kabaca %50-60\'ı, beynin ise yaklaşık %73\'ü sudur. Su besinleri taşır, eklemlerini yastıklar ve vücut ısını dengede tutar.';

  @override
  String get factLearn2Title => 'Az su içince ne olur';

  @override
  String get factLearn2Body =>
      'Hafif su kaybı bile, yani vücut suyunun yaklaşık %1-2\'si, yorgunluk, baş ağrısı, odaklanma güçlüğü ve ruh halinde düşüşle ilişkilendirilir. Uzun vadede az su içmek kabızlık ve böbrek taşı olasılığını artırır.';

  @override
  String get factLearn3Title => 'Susuzluk geç gelen bir sinyaldir';

  @override
  String get factLearn3Body =>
      'Susuzluk hissi genelde vücudun suyunu kaybetmeye başladıktan sonra devreye girer ve yaşla birlikte körelir. Susamayı beklemek yerine düzenli aralıklarla içmek daha iyi çalışır.';

  @override
  String get factLearn4Title => 'En pratik gösterge: idrar rengi';

  @override
  String get factLearn4Body =>
      'Açık saman rengi genelde yeterli su içtiğini gösterir; koyu sarı ise daha fazlasına ihtiyacın olduğunu düşündürür. Bazı vitamin ve ilaçlar rengi değiştirir, bu yüzden kesin hüküm değil ipucu say.';

  @override
  String get factLearn5Title => 'Ne kadar yeterli?';

  @override
  String get factLearn5Body =>
      'EFSA\'nın içeceklerden yeterli alım referansı, ılıman iklimde ve orta düzey hareketlilikte kadınlar için günde yaklaşık 2 litre, erkekler için 2,5 litredir. Sıcak hava, spor, gebelik ve emzirme bu ihtiyacı yükseltir. Sipling bunu kilona ve hareket düzeyine göre ayarlar.';

  @override
  String get homeBoost => 'Sıcak gün / spor';

  @override
  String get boostTitle => 'Bugünün hedefini artır';

  @override
  String get boostBody =>
      'Sıcak havada ya da spor sonrası bugünün hedefine ekstra ekle. Yarın kendiliğinden sıfırlanır.';

  @override
  String get boostReset => 'Sıfırla';

  @override
  String boostActive(int ml) {
    return 'Bugün +$ml ml eklendi';
  }

  @override
  String get logTitle => 'Bugünün kayıtları';

  @override
  String get logEmpty => 'Bugün henüz kayıt yok';

  @override
  String get logOpen => 'Bugünkü kayıtlar';

  @override
  String get logDelete => 'Sil';

  @override
  String get setReminderStyle => 'Hatırlatma stili';

  @override
  String get styleNormal => 'Normal';

  @override
  String get styleNormalSub => 'Ses ve titreşim';

  @override
  String get styleGentle => 'Nazik';

  @override
  String get styleGentleSub => 'Sadece titreşim, ses yok';

  @override
  String get styleSilent => 'Sessiz';

  @override
  String get styleSilentSub => 'Ses ve titreşim yok';
}
