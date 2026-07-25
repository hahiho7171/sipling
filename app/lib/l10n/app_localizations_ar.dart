// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class LAr extends L {
  LAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'Sipling';

  @override
  String get drinkWater => 'ماء';

  @override
  String get drinkTea => 'شاي';

  @override
  String get drinkCoffee => 'قهوة';

  @override
  String get drinkMilk => 'حليب';

  @override
  String get drinkJuice => 'عصير';

  @override
  String get drinkSoda => 'مشروب غازي';

  @override
  String get drinkAlcohol => 'كحول';

  @override
  String get speciesOak => 'بلّوط';

  @override
  String get speciesPine => 'صنوبر';

  @override
  String get speciesCherry => 'ساكورا';

  @override
  String get speciesAcacia => 'أكاسيا';

  @override
  String get speciesMaple => 'قيقب';

  @override
  String get speciesOlive => 'زيتون';

  @override
  String get speciesGolden => 'الورقة الذهبية';

  @override
  String get speciesJacaranda => 'جاكاراندا';

  @override
  String get unlockFree => 'مفتوح';

  @override
  String unlockStreak(int days) {
    return 'حقّق هدفك $days أيام متتالية';
  }

  @override
  String unlockTotalTrees(int count) {
    return 'ازرع $count شجرة في المجموع';
  }

  @override
  String get unlockRewardedAd => 'شاهد إعلانًا قصيرًا';

  @override
  String get unlockPro => 'لأعضاء Pro فقط';

  @override
  String get achFirstSproutTitle => 'أول برعم';

  @override
  String get achFirstSproutDesc => 'شربت كأسك الأول';

  @override
  String get achFirstTreeTitle => 'أول شجرة';

  @override
  String get achFirstTreeDesc => 'أكملت هدفًا يوميًا';

  @override
  String get achStreak3Title => 'بداية عادة';

  @override
  String get achStreak3Desc => 'حقّقت هدفك 3 أيام متتالية';

  @override
  String get achStreak7Title => 'أسبوع كامل';

  @override
  String get achStreak7Desc => 'حقّقت هدفك 7 أيام متتالية';

  @override
  String get achStreak30Title => 'شهر دون انقطاع';

  @override
  String get achStreak30Desc => 'حقّقت هدفك 30 يومًا متتاليًا';

  @override
  String get achTrees10Title => 'بستان صغير';

  @override
  String get achTrees10Desc => 'زرعت 10 أشجار';

  @override
  String get achTrees50Title => 'حارس الغابة';

  @override
  String get achTrees50Desc => 'زرعت 50 شجرة';

  @override
  String get achEarlyBirdTitle => 'من يستيقظ باكرًا';

  @override
  String get achEarlyBirdDesc => 'شربت الماء قبل التاسعة صباحًا';

  @override
  String get achVarietyTitle => 'ذوق متنوّع';

  @override
  String get achVarietyDesc => 'سجّلت 4 مشروبات مختلفة على الأقل';

  @override
  String get achPerfectWeekTitle => 'أسبوع مثالي';

  @override
  String get achPerfectWeekDesc => 'حقّقت هدفك كل يوم لمدة 7 أيام';

  @override
  String get seasonClassicName => 'كلاسيكي';

  @override
  String get seasonClassicDesc => 'أخضر دائم، طوال العام';

  @override
  String get seasonAutoName => 'تلقائي';

  @override
  String get seasonAutoDesc => 'دع غابتك تتبع التقويم';

  @override
  String get seasonSpringName => 'الربيع';

  @override
  String get seasonSpringDesc => 'أوراق ناضرة وسماء صافية';

  @override
  String get seasonSummerName => 'الصيف';

  @override
  String get seasonSummerDesc => 'درجات خضراء غامقة وزاهية';

  @override
  String get seasonAutumnName => 'الخريف';

  @override
  String get seasonAutumnDesc => 'أوراق برتقالية وضوء دافئ';

  @override
  String get seasonWinterName => 'الشتاء';

  @override
  String get seasonWinterDesc => 'تلال مكسوّة بالثلج وضوء بارد';

  @override
  String get bmiUnderweight => 'نحافة';

  @override
  String get bmiNormal => 'طبيعي';

  @override
  String get bmiOverweight => 'زيادة في الوزن';

  @override
  String get bmiObese => 'سمنة';

  @override
  String get notifTitle1 => 'حان وقت الماء 💧';

  @override
  String get notifBody1 => 'شتلتك تنتظرك — هل نشرب كأسًا؟';

  @override
  String get notifTitle2 => 'رشفة أخرى';

  @override
  String get notifBody2 => 'الرشفات الصغيرة تصنع أشجارًا كبيرة.';

  @override
  String get notifTitle3 => 'شتلتك عطشى 🌱';

  @override
  String get notifBody3 => 'كأس ماء يساعدها على النمو قليلًا.';

  @override
  String get notifTitle4 => 'تذكير';

  @override
  String get notifBody4 => 'خطوة أقرب إلى شجرة اليوم.';

  @override
  String get notifTitle5 => 'استراحة ماء';

  @override
  String get notifBody5 => 'الكأس الذي تشربه الآن هو شجرة هذه الليلة.';

  @override
  String get activityLow => 'قليل الحركة';

  @override
  String get activityLowHint => 'عمل مكتبي، مشي قليل';

  @override
  String get activityMedium => 'متوسط';

  @override
  String get activityMediumHint => 'تمارين 1-3 أيام في الأسبوع';

  @override
  String get activityHigh => 'نشيط';

  @override
  String get activityHighHint => 'تمارين 4 أيام فأكثر في الأسبوع';

  @override
  String get cupGlass => 'كأس';

  @override
  String get cupBottle => 'زجاجة';

  @override
  String get cupLarge => 'كبير';

  @override
  String get homeNewAchievement => 'إنجاز جديد';

  @override
  String get homeUndoLast => 'التراجع عن آخر إدخال';

  @override
  String get homeStageSeed => 'بذرتك في التربة، تنتظر رشفتها الأولى';

  @override
  String get homeStageSprout => 'لقد أنبتت 🌱';

  @override
  String get homeStageSapling => 'شتلتك تنمو';

  @override
  String get homeStageAlmost => 'أوشكت أن تصبح شجرة!';

  @override
  String get homeStageReady => 'شجرة اليوم جاهزة 🌳';

  @override
  String get homePaceDone => 'شتلة جديدة تنتظرك غدًا';

  @override
  String get homePaceStart => 'ابدأ يومك بكأس ماء';

  @override
  String homePaceBehind(int ml) {
    return 'أنت متأخّر بمقدار $ml ml في هذه الساعة — لا يزال بإمكانك اللحاق';
  }

  @override
  String get homePaceOnTrack => 'أنت في المسار الصحيح تمامًا 👌';

  @override
  String get homeGoalDone => 'لقد حقّقت هدفك اليومي';

  @override
  String homeRemaining(int ml) {
    return 'بقي $ml ml';
  }

  @override
  String homeStreakDays(int days) {
    return '$days يومًا';
  }

  @override
  String get homeCelebrateTitle => 'لقد نمت شجرتك!';

  @override
  String get homeCelebrateBody =>
      'لقد حقّقت هدف اليوم. أصبحت هذه الشجرة الآن جزءًا من غابتك.';

  @override
  String homeStreakLabel(int days) {
    return 'سلسلة $days يومًا';
  }

  @override
  String get homeCelebrateOk => 'رائع';

  @override
  String get addWhatTitle => 'ماذا شربت؟';

  @override
  String get addAmount => 'الكمية';

  @override
  String get addConfirm => 'إضافة';

  @override
  String get addFactorWater => 'يُحتسب بالكامل ضمن هدفك.';

  @override
  String get addFactorAlcohol =>
      'الكحول يسبّب فقدان الماء من الجسم، لذا يُخصم من هدفك.';

  @override
  String addFactorPercent(int percent) {
    return 'يُحتسب بنسبة $percent% ضمن هدفك.';
  }

  @override
  String get sumTitle => 'ملخّص الأمس';

  @override
  String get sumTreeGrown => 'لقد نمت شجرتك 🌳';

  @override
  String get sumSaplingOnWay => 'شتلتك في طريقها 🌱';

  @override
  String get sumBodyDone => 'لقد حقّقت هدفك. هذه الشجرة جزء من غابتك.';

  @override
  String sumPercent(int percent) {
    return 'بلغت $percent% من هدفك أمس. شتلتك تنتظرك حيث تركتها تمامًا — لا تذبل أي شجرة أبدًا.';
  }

  @override
  String get sumStatCounted => 'المُحتسَب';

  @override
  String get sumStatGoal => 'الهدف';

  @override
  String get sumStatStreak => 'السلسلة';

  @override
  String sumStreakDays(int days) {
    return '$days يومًا';
  }

  @override
  String get sumStartToday => 'ابدأ اليوم';

  @override
  String get sumWhatDrank => 'ما شربته';

  @override
  String sumDrinkAmount(String name, int ml) {
    return '$name $ml ml';
  }

  @override
  String get navToday => 'اليوم';

  @override
  String get navForest => 'الغابة';

  @override
  String get navStats => 'الإحصاءات';

  @override
  String get navSettings => 'الإعدادات';

  @override
  String get onbContinue => 'متابعة';

  @override
  String get onbFinish => 'ازرع شتلتي';

  @override
  String get onbWelcomeTagline =>
      'كل رشفة، شتلة.\nاشرب الماء تنمُ شجرتك؛ ومع مرور الأيام تنمو غابتك.';

  @override
  String get onbWelcomeNoPenalty => 'شجرتك لا تذبل أبدًا. لا عقوبات هنا.';

  @override
  String get onbGenderTitle => 'لنتعرّف عليك';

  @override
  String get onbGenderSubtitle =>
      'يُحسب هدفك اليومي من الماء بناءً على هذه المعلومات. تبقى جميعها على هاتفك ولا تُرسل إلى أي مكان.';

  @override
  String get onbGenderFemale => 'أنثى';

  @override
  String get onbGenderMale => 'ذكر';

  @override
  String get onbGenderOther => 'أفضّل عدم الإفصاح';

  @override
  String get onbBodyTitle => 'الطول والوزن والعمر';

  @override
  String get onbBodySubtitle => 'اسحب للضبط.';

  @override
  String get onbBodyAge => 'العمر';

  @override
  String get onbBodyHeight => 'الطول';

  @override
  String get onbBodyWeight => 'الوزن';

  @override
  String get onbBodyBmiLabel => 'مؤشّر كتلة جسمك';

  @override
  String get onbBodyDisclaimer => 'للمعلومة فقط، وليست نصيحة طبية.';

  @override
  String get onbActivityTitle => 'ما مدى نشاطك؟';

  @override
  String get onbActivitySubtitle => 'كلما تعرّقت أكثر، احتجت ماءً أكثر.';

  @override
  String get onbGoalTitle => 'هدفك اليومي';

  @override
  String get onbGoalSubtitle => 'يمكنك تغييره في أي وقت من الإعدادات.';

  @override
  String get onbGoalUnit => 'ملليلتر / يوم';

  @override
  String onbGoalGlasses(int glasses) {
    return 'نحو $glasses كؤوس';
  }

  @override
  String get onbGoalReference =>
      'حُدِّد هذا الهدف وفق وزنك ومستوى نشاطك، استنادًا إلى مرجع كمية الماء الكافية الصادر عن الهيئة الأوروبية لسلامة الأغذية (EFSA, 2010). الماء الذي تحصل عليه من الطعام غير مشمول في هذا الرقم.';

  @override
  String get proAppBarTitle => 'Sipling Pro';

  @override
  String get proHeaderTitle => 'Sipling بلا إعلانات';

  @override
  String get proHeaderSub => 'حافظ على نمو غابتك';

  @override
  String get proPerkNoAdsTitle => 'بلا إعلانات إطلاقًا';

  @override
  String get proPerkNoAdsSub => 'حتى إعلان الملخّص اليومي يختفي';

  @override
  String get proPerkTreesTitle => 'كل أنواع الأشجار';

  @override
  String get proPerkTreesSub => 'بما في ذلك الورقة الذهبية والجاكاراندا';

  @override
  String get proPerkHistoryTitle => 'سجلّ غير محدود';

  @override
  String get proPerkHistorySub => 'إحصاءات مفصّلة لكل شهر';

  @override
  String get proPerkThemesTitle => 'خيارات المظهر';

  @override
  String get proPerkThemesSub => 'مظاهر موسمية للغابة';

  @override
  String get proPerkSupportTitle => 'ادعم التطوير';

  @override
  String get proPerkSupportSub => 'Sipling مشروع فردي';

  @override
  String get proNotConnectedNote =>
      'لم تُربط عمليات الشراء بعد. في الوقت الحالي يمكنك تفعيل Pro وإيقافه لتجربته.';

  @override
  String get proButtonOn => 'Pro مُفعّل — أوقفه';

  @override
  String get proButtonTry => 'جرّب Pro';

  @override
  String get batAppBarTitle => 'إذا لم تصل الإشعارات';

  @override
  String get batIntro =>
      'تُغلق بعض ماركات الهواتف التطبيقات في الخلفية لتوفير البطارية، لذا قد تتأخّر التذكيرات أو لا تصل إطلاقًا. يكفي ضبط الإعداد التالي مرة واحدة.';

  @override
  String get batXiaomi1 =>
      'الإعدادات ← التطبيقات ← Sipling ← موفّر البطارية ← \"دون قيود\"';

  @override
  String get batXiaomi2 =>
      'الإعدادات ← التطبيقات ← Sipling ← التشغيل التلقائي ← تفعيل';

  @override
  String get batXiaomi3 =>
      'في شاشة التطبيقات الأخيرة، اسحب Sipling للأسفل واضغط رمز القفل';

  @override
  String get batSamsung1 =>
      'الإعدادات ← التطبيقات ← Sipling ← البطارية ← \"دون قيود\"';

  @override
  String get batSamsung2 =>
      'الإعدادات ← البطارية ← حدود الاستخدام في الخلفية ← أزِل Sipling من قائمة \"التطبيقات النائمة\"';

  @override
  String get batHuawei1 =>
      'الإعدادات ← البطارية ← تشغيل التطبيقات ← Sipling ← أوقف الإدارة التلقائية';

  @override
  String get batHuawei2 =>
      'فعّل التشغيل التلقائي والتشغيل الثانوي والعمل في الخلفية';

  @override
  String get batOppo1 =>
      'الإعدادات ← البطارية ← استهلاك عالٍ للطاقة في الخلفية ← اسمح لـ Sipling';

  @override
  String get batOppo2 =>
      'الإعدادات ← التطبيقات ← Sipling ← استخدام البطارية ← اسمح بالنشاط في الخلفية';

  @override
  String get batFooter =>
      'قد تختلف أسماء القوائم قليلًا حسب طراز هاتفك. ما تبحث عنه هو إعداد مثل \"تحسين البطارية\" أو \"النشاط في الخلفية\" أو \"التشغيل التلقائي\".';

  @override
  String get setTitle => 'الإعدادات';

  @override
  String get setSectionGoal => 'الهدف';

  @override
  String get setSectionReminders => 'التذكيرات';

  @override
  String get setSectionCups => 'كؤوسي';

  @override
  String get setSectionHealth => 'الصحة';

  @override
  String get setSectionAppearance => 'المظهر';

  @override
  String get setSectionApp => 'التطبيق';

  @override
  String get setProTagline => 'بلا إعلانات، وكل الأشجار مفتوحة';

  @override
  String get setDailyGoal => 'الهدف اليومي';

  @override
  String setMl(int ml) {
    return '$ml ml';
  }

  @override
  String get setProfileInfo => 'ملفّي الشخصي';

  @override
  String setWeightKg(int kg) {
    return '$kg kg';
  }

  @override
  String get setRemindersOn => 'التذكيرات مُفعّلة';

  @override
  String get setFrequency => 'التكرار';

  @override
  String get setAwakeHours => 'ساعات استيقاظي';

  @override
  String get setStopWhenDone => 'التوقّف عند تحقيق الهدف';

  @override
  String get setStopWhenDoneSub =>
      'بمجرّد تحقيق هدفك اليومي، تُلغى التذكيرات المتبقية';

  @override
  String get setSilent => 'إشعار صامت';

  @override
  String get setSilentSub => 'بلا صوت أو اهتزاز';

  @override
  String get setNotifNotArriving => 'الإشعارات لا تصل؟';

  @override
  String get setNotifNotArrivingSub => 'قد تكون إعدادات بطارية هاتفك تمنعها';

  @override
  String get setHealthWrite => 'الكتابة إلى Health Connect';

  @override
  String get setHealthWriteSub =>
      'تُحفظ كمية الماء التي تشربها أيضًا في سجلّ Android الصحي. لا يقرأ Sipling أي شيء من هناك أبدًا.';

  @override
  String get setDarkTheme => 'المظهر الداكن';

  @override
  String get setForestTheme => 'مظهر الغابة';

  @override
  String get setTreeSpecies => 'أنواع الأشجار';

  @override
  String get setMyData => 'بياناتي';

  @override
  String get setMyDataSub => 'يبقى كل شيء على هاتفك ولا يُرسل إلى أي مكان';

  @override
  String get setResetAll => 'إعادة تعيين جميع البيانات';

  @override
  String setEveryHours(int h) {
    String _temp0 = intl.Intl.pluralLogic(
      h,
      locale: localeName,
      other: 'كل $h ساعة',
      many: 'كل $h ساعة',
      few: 'كل $h ساعات',
      two: 'كل ساعتين',
      one: 'كل ساعة',
    );
    return '$_temp0';
  }

  @override
  String setEveryMinutes(int m) {
    String _temp0 = intl.Intl.pluralLogic(
      m,
      locale: localeName,
      other: 'كل $m دقيقة',
      many: 'كل $m دقيقة',
      few: 'كل $m دقائق',
      two: 'كل دقيقتين',
      one: 'كل دقيقة',
    );
    return '$_temp0';
  }

  @override
  String get setHealthNoConnect => 'لا يحتوي هذا الجهاز على Health Connect.';

  @override
  String get setHealthNotInstalledTitle => 'Health Connect غير مُثبَّت';

  @override
  String get setHealthNeedsUpdateTitle => 'يحتاج Health Connect إلى تحديث';

  @override
  String get setHealthInstallBody =>
      'يلزم تطبيق Health Connect لكتابة كمية الماء التي تشربها في سجلّ Android الصحي.';

  @override
  String get setOpenPlayStore => 'افتح في Play Store';

  @override
  String get setHealthPermissionDenied =>
      'رُفض الإذن، ولن يُكتب شيء في السجلّ الصحي.';

  @override
  String get setHealthEnabled =>
      'من الآن فصاعدًا ستُكتب كمية الماء التي تشربها في Health Connect أيضًا.';

  @override
  String get setCancel => 'إلغاء';

  @override
  String get setSave => 'حفظ';

  @override
  String setSuggested(int ml) {
    return 'المقترح: $ml ml';
  }

  @override
  String get setBackToSuggested => 'العودة إلى المقترح';

  @override
  String get setIntervalDialogTitle => 'كم مرة نُذكّرك؟';

  @override
  String get setWakeHelp => 'متى تستيقظ؟';

  @override
  String get setSleepHelp => 'متى تنام؟';

  @override
  String get setAwakeMin4h => 'يجب أن تكون ساعات استيقاظك 4 ساعات على الأقل';

  @override
  String get setResetConfirmTitle => 'هل أنت متأكّد؟';

  @override
  String get setResetConfirmBody =>
      'ستُحذف غابتك وسلاسلك وجميع سجلّاتك. لا يمكن التراجع عن هذا.';

  @override
  String get setResetConfirmButton => 'إعادة تعيين';

  @override
  String get statsTitle => 'الإحصاءات';

  @override
  String get statsDailyAverage => 'المعدّل اليومي';

  @override
  String get statsGoalDays => 'أيام تحقيق الهدف';

  @override
  String get statsCurrentStreak => 'السلسلة الحالية';

  @override
  String get statsUnitDays => 'يوم';

  @override
  String get statsTotalTrees => 'إجمالي الأشجار';

  @override
  String statsLastDays(int days) {
    return 'آخر $days يوم';
  }

  @override
  String get statsYourDrinks => 'مشروباتك';

  @override
  String statsRangeDays(int days) {
    return '$days يوم';
  }

  @override
  String get statsWeekdayMon => 'إثنين';

  @override
  String get statsWeekdayTue => 'ثلاثاء';

  @override
  String get statsWeekdayWed => 'أربعاء';

  @override
  String get statsWeekdayThu => 'خميس';

  @override
  String get statsWeekdayFri => 'جمعة';

  @override
  String get statsWeekdaySat => 'سبت';

  @override
  String get statsWeekdaySun => 'أحد';

  @override
  String get statsNoRecords => 'لا توجد سجلّات بعد.';

  @override
  String get statsBmiTitle => 'مؤشّر كتلة الجسم';

  @override
  String get statsBmiDisclaimer => 'للمعلومة فقط،\nوليست نصيحة طبية';

  @override
  String get statsAchievements => 'الإنجازات';

  @override
  String statsAchievementsEarned(int count) {
    return '$count مُحقَّق';
  }

  @override
  String get achScreenTitle => 'الإنجازات';

  @override
  String get forestTitle => 'غابتك';

  @override
  String forestSubtitle(int trees, int days) {
    return '$trees شجرة • أفضل سلسلة $days يومًا';
  }

  @override
  String get forestSpeciesTooltip => 'أنواع الأشجار';

  @override
  String get forestEmptyTitle => 'غابتك لا تزال فارغة';

  @override
  String get forestEmptyBody => 'عندما تشرب كأسك الأول، ستظهر شتلة هنا.';

  @override
  String get speciesScreenTitle => 'أنواع الأشجار';

  @override
  String get speciesScreenIntro =>
      'يمكنك اختيار نوع شتلة الغد. تحتفظ الأشجار القديمة في غابتك بالنوع الذي زُرعت به.';

  @override
  String get speciesScreenSelected => 'محدَّد';

  @override
  String get speciesScreenUnlocked => 'مفتوح';

  @override
  String speciesScreenUnlockTitle(String name) {
    return 'افتح شجرة $name';
  }

  @override
  String get speciesScreenRewardBody =>
      'شاهد إعلانًا قصيرًا لفتح هذا النوع نهائيًا. الإعلان اختياري تمامًا — لا توجد إعلانات إجبارية في أي مكان في التطبيق.';

  @override
  String get speciesScreenCancel => 'إلغاء';

  @override
  String get speciesScreenWatchAd => 'شاهد الإعلان';

  @override
  String get seasonScreenTitle => 'مظهر الغابة';

  @override
  String get seasonScreenIntro =>
      'تتغيّر ألوان غابتك، لا أشجارها. لا يؤثّر أي مظهر على تتبّعك أو هدفك أو سلسلتك.';

  @override
  String get seasonScreenProOnly => 'لأعضاء Pro فقط';

  @override
  String get seasonScreenSelected => 'محدَّد';

  @override
  String get setSectionHome => 'الشاشة الرئيسية';

  @override
  String get setAddWidget => 'إضافة الأداة إلى الشاشة الرئيسية';

  @override
  String get setAddWidgetSub => 'أضف الماء بلمسة واحدة، دون فتح التطبيق';

  @override
  String get setAddWidgetManual =>
      'اضغط مطولاً على الشاشة الرئيسية ← الأدوات ← اختر Sipling';

  @override
  String get wrappedTitle => 'ملخص غابتك';

  @override
  String get wrappedHeadline => 'رحلتك حتى الآن';

  @override
  String wrappedLiters(int liters) {
    return '$liters L';
  }

  @override
  String get wrappedLitersLabel => 'إجمالي الماء';

  @override
  String get wrappedTreesLabel => 'أشجار';

  @override
  String get wrappedStreakLabel => 'أفضل سلسلة';

  @override
  String get wrappedDaysLabel => 'أيام';

  @override
  String get wrappedShare => 'مشاركة';

  @override
  String get wrappedShareText =>
      'أُنمّي غابتي مع Sipling، رشفة تلو الأخرى 🌱 sipling-app.web.app';

  @override
  String get homeMoreDrinks => 'أخرى';

  @override
  String addFactorWaterEq(int ml, int percent) {
    return '≈ $ml مل ماء ($percent%)';
  }

  @override
  String proPerMonth(String price) {
    return '$price / شهر';
  }

  @override
  String get proRestore => 'استعادة المشتريات';

  @override
  String get proTerms => 'شروط الاستخدام';

  @override
  String get proPrivacyLink => 'الخصوصية';

  @override
  String get proStoreUnavailable => 'المتجر غير متاح حالياً';

  @override
  String get proAutoRenew =>
      'اشتراك شهري يتجدد تلقائياً. ألغِ قبل 24 ساعة على الأقل من التجديد من إعدادات حساب المتجر؛ وإلا فسيتجدد.';

  @override
  String get homeCalcNeed => 'احتياجي من الماء';

  @override
  String get needTitle => 'احتياجك اليومي من الماء';

  @override
  String get needIntro =>
      'أدخل طولك ووزنك ومستوى نشاطك، وسيحسب Sipling كمية الماء التي تحتاجها يوميًا.';

  @override
  String get needResultLabel => 'المقترح لك';

  @override
  String needCurrentGoal(int ml) {
    return 'هدفك الحالي: $ml ml';
  }

  @override
  String get needApply => 'اجعل هذا هدفي';

  @override
  String get needApplied => 'تم تحديث هدفك';

  @override
  String get needMeasuresTitle => 'قياساتك';

  @override
  String get needLearnTitle => 'الماء وجسمك';

  @override
  String get factNotifTitle1 => 'ثلاثة أرباع ماء';

  @override
  String get factNotifBody1 =>
      'نحو ثلاثة أرباع دماغك ماء. حافظ على امتلائه بالماء.';

  @override
  String get factNotifTitle2 => 'التركيز يحتاج إلى ماء';

  @override
  String get factNotifBody2 => 'فقدان 1-2% فقط من ماء جسمك قد يصعّب التركيز.';

  @override
  String get factNotifTitle3 => 'العطش يصل متأخرًا';

  @override
  String get factNotifBody3 =>
      'عندما تشعر بالعطش، يكون جسمك قد بدأ ينفد منه الماء بالفعل.';

  @override
  String get factNotifTitle4 => 'نظام التبريد المدمج فيك';

  @override
  String get factNotifBody4 =>
      'التعرّق هو طريقة جسمك لتبريد نفسه، وهو يستهلك الماء للقيام بذلك.';

  @override
  String get factNotifTitle5 => 'تحقّق من اللون';

  @override
  String get factNotifBody5 =>
      'الأصفر الفاتح يعني عادةً أنك رطّبت جسمك جيدًا. الأغمق يعني اشرب المزيد.';

  @override
  String get factLearn1Title => 'أكثر من نصفك ماء';

  @override
  String get factLearn1Body =>
      'يشكّل الماء نحو 50-60% من جسم الشخص البالغ ونحو 73% من الدماغ. وهو ينقل العناصر الغذائية، ويحمي مفاصلك، ويحافظ على ثبات درجة حرارة جسمك.';

  @override
  String get factLearn2Title => 'ماذا يحدث عندما تشرب القليل جدًا';

  @override
  String get factLearn2Body =>
      'حتى الجفاف الخفيف، أي فقدان نحو 1-2% من ماء جسمك، يرتبط بالتعب والصداع وضعف التركيز وتراجع المزاج. وعلى المدى الأطول، يزيد شرب كمية قليلة جدًا من الماء احتمال الإصابة بالإمساك وحصى الكلى.';

  @override
  String get factLearn3Title => 'العطش إشارة متأخرة';

  @override
  String get factLearn3Body =>
      'يبدأ الشعور بالعطش عادةً بعد أن يكون جسمك قد فقد الماء بالفعل، ويضعف هذا الشعور مع التقدّم في العمر. الشرب على فترات منتظمة أفضل من انتظار الشعور بالعطش.';

  @override
  String get factLearn4Title => 'لون البول هو أبسط وسيلة للتحقّق';

  @override
  String get factLearn4Body =>
      'اللون الأصفر الفاتح كلون القش يعني عادةً أنك رطّبت جسمك جيدًا، بينما يشير الأصفر الغامق إلى أنك تحتاج إلى المزيد. بعض الفيتامينات والأدوية تغيّر اللون، لذا اعتبره مجرّد مؤشّر لا حكمًا قاطعًا.';

  @override
  String get factLearn5Title => 'كم يكفي؟';

  @override
  String get factLearn5Body =>
      'يبلغ مرجع EFSA للكمية الكافية من السوائل نحو 2 لتر يوميًا للنساء و2.5 لتر للرجال، في مناخ معتدل ومستوى نشاط متوسط. يرفع الطقس الحار والتمارين الرياضية والحمل والرضاعة الطبيعية هذه الحاجة. يُعدّل Sipling هذا الرقم وفق وزنك ومستوى نشاطك.';

  @override
  String get homeBoost => 'يوم حار / رياضة';

  @override
  String get boostTitle => 'زد هدف اليوم';

  @override
  String get boostBody =>
      'في يوم حار أو بعد التمرين، أضف قليلاً إلى هدف اليوم. سيُعاد ضبطه تلقائيًا غدًا.';

  @override
  String get boostReset => 'إعادة تعيين';

  @override
  String boostActive(int ml) {
    return 'أُضيف +$ml مل اليوم';
  }

  @override
  String get logTitle => 'سجلات اليوم';

  @override
  String get logEmpty => 'لا توجد سجلات اليوم بعد';

  @override
  String get logOpen => 'سجلات اليوم';

  @override
  String get logDelete => 'حذف';

  @override
  String get setReminderStyle => 'نمط التذكير';

  @override
  String get styleNormal => 'عادي';

  @override
  String get styleNormalSub => 'صوت واهتزاز';

  @override
  String get styleGentle => 'لطيف';

  @override
  String get styleGentleSub => 'اهتزاز فقط، بدون صوت';

  @override
  String get styleSilent => 'صامت';

  @override
  String get styleSilentSub => 'بدون صوت أو اهتزاز';

  @override
  String get speciesScreenAdUnavailable =>
      'الإعلان غير جاهز الآن. حاول مرة أخرى بعد قليل.';

  @override
  String get setHotDayTitle => 'تنبيه اليوم الحار';

  @override
  String get setHotDaySub =>
      'تذكير إضافي بشرب الماء عندما يكون الجو حارًا في مدينتك (آيفون فقط)';

  @override
  String get setHotDayCity => 'المدينة';

  @override
  String get setHotDayCitySet => 'تحديد';

  @override
  String get setHotDayCityHint => 'مثال: إسطنبول';

  @override
  String get notifHotDayTitle => 'الجو حار اليوم 🌡️';

  @override
  String notifHotDayBody(int temp) {
    return 'درجة الحرارة اليوم $temp°م — احرص على شرب الماء أكثر قليلاً.';
  }
}
