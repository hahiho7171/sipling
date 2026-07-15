// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class LHi extends L {
  LHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'Sipling';

  @override
  String get drinkWater => 'पानी';

  @override
  String get drinkTea => 'चाय';

  @override
  String get drinkCoffee => 'कॉफ़ी';

  @override
  String get drinkMilk => 'दूध';

  @override
  String get drinkJuice => 'जूस';

  @override
  String get drinkSoda => 'सोडा';

  @override
  String get drinkAlcohol => 'शराब';

  @override
  String get speciesOak => 'बलूत';

  @override
  String get speciesPine => 'चीड़';

  @override
  String get speciesCherry => 'सकुरा';

  @override
  String get speciesAcacia => 'बबूल';

  @override
  String get speciesMaple => 'मेपल';

  @override
  String get speciesOlive => 'जैतून';

  @override
  String get speciesGolden => 'सुनहरा पत्ता';

  @override
  String get speciesJacaranda => 'नीलमोहर';

  @override
  String get unlockFree => 'खुला';

  @override
  String unlockStreak(int days) {
    return '$days दिन लगातार लक्ष्य पूरा करें';
  }

  @override
  String unlockTotalTrees(int count) {
    return 'कुल $count पेड़ उगाएँ';
  }

  @override
  String get unlockRewardedAd => 'एक छोटा विज्ञापन देखें';

  @override
  String get unlockPro => 'केवल Pro सदस्यों के लिए';

  @override
  String get achFirstSproutTitle => 'पहला अंकुर';

  @override
  String get achFirstSproutDesc => 'आपने अपना पहला गिलास पिया';

  @override
  String get achFirstTreeTitle => 'पहला पेड़';

  @override
  String get achFirstTreeDesc => 'आपने एक दिन का लक्ष्य पूरा किया';

  @override
  String get achStreak3Title => 'आदत की शुरुआत';

  @override
  String get achStreak3Desc => 'आपने 3 दिन लगातार लक्ष्य पूरा किया';

  @override
  String get achStreak7Title => 'पूरा एक हफ़्ता';

  @override
  String get achStreak7Desc => 'आपने 7 दिन लगातार लक्ष्य पूरा किया';

  @override
  String get achStreak30Title => 'पूरा महीना, बिना रुके';

  @override
  String get achStreak30Desc => 'आपने 30 दिन लगातार लक्ष्य पूरा किया';

  @override
  String get achTrees10Title => 'छोटा उपवन';

  @override
  String get achTrees10Desc => 'आपने 10 पेड़ उगाए';

  @override
  String get achTrees50Title => 'वन रक्षक';

  @override
  String get achTrees50Desc => 'आपने 50 पेड़ उगाए';

  @override
  String get achEarlyBirdTitle => 'सुबह जल्दी उठने वाले';

  @override
  String get achEarlyBirdDesc => 'आपने सुबह 9 बजे से पहले पानी पिया';

  @override
  String get achVarietyTitle => 'विविध स्वाद';

  @override
  String get achVarietyDesc => 'आपने कम से कम 4 अलग-अलग पेय दर्ज किए';

  @override
  String get achPerfectWeekTitle => 'बेमिसाल हफ़्ता';

  @override
  String get achPerfectWeekDesc => 'आपने लगातार 7 दिन हर दिन लक्ष्य पूरा किया';

  @override
  String get seasonClassicName => 'क्लासिक';

  @override
  String get seasonClassicDesc => 'सदाबहार, साल भर हरा-भरा';

  @override
  String get seasonAutoName => 'स्वचालित';

  @override
  String get seasonAutoDesc => 'आपका वन कैलेंडर के साथ बदलता रहे';

  @override
  String get seasonSpringName => 'वसंत';

  @override
  String get seasonSpringDesc => 'ताज़ी पत्तियाँ, खुला आसमान';

  @override
  String get seasonSummerName => 'गर्मी';

  @override
  String get seasonSummerDesc => 'गहरे, चटख हरे रंग';

  @override
  String get seasonAutumnName => 'पतझड़';

  @override
  String get seasonAutumnDesc => 'नारंगी पत्तियाँ, गुनगुनी रोशनी';

  @override
  String get seasonWinterName => 'सर्दी';

  @override
  String get seasonWinterDesc => 'बर्फ़ीली पहाड़ियाँ, ठंडी रोशनी';

  @override
  String get bmiUnderweight => 'कम वज़न';

  @override
  String get bmiNormal => 'सामान्य';

  @override
  String get bmiOverweight => 'अधिक वज़न';

  @override
  String get bmiObese => 'मोटापा';

  @override
  String get notifTitle1 => 'पानी का समय 💧';

  @override
  String get notifBody1 => 'आपका पौधा इंतज़ार कर रहा है — एक गिलास पी लें?';

  @override
  String get notifTitle2 => 'एक घूँट और';

  @override
  String get notifBody2 => 'छोटे-छोटे घूँट बड़े पेड़ बनाते हैं।';

  @override
  String get notifTitle3 => 'आपका पौधा प्यासा है 🌱';

  @override
  String get notifBody3 => 'एक गिलास पानी इसे थोड़ा और बढ़ने में मदद करेगा।';

  @override
  String get notifTitle4 => 'रिमाइंडर';

  @override
  String get notifBody4 => 'आज के पेड़ की ओर एक कदम और।';

  @override
  String get notifTitle5 => 'पानी का ब्रेक';

  @override
  String get notifBody5 => 'अभी जो गिलास पिएँगे, वही आज रात का पेड़ बनेगा।';

  @override
  String get activityLow => 'कम सक्रिय';

  @override
  String get activityLowHint => 'मेज़ पर काम, कम चलना-फिरना';

  @override
  String get activityMedium => 'मध्यम';

  @override
  String get activityMediumHint => 'हफ़्ते में 1-3 दिन कसरत';

  @override
  String get activityHigh => 'सक्रिय';

  @override
  String get activityHighHint => 'हफ़्ते में 4+ दिन कसरत';

  @override
  String get cupGlass => 'गिलास';

  @override
  String get cupBottle => 'बोतल';

  @override
  String get cupLarge => 'बड़ा';

  @override
  String get homeNewAchievement => 'नई उपलब्धि';

  @override
  String get homeUndoLast => 'आख़िरी प्रविष्टि पूर्ववत करें';

  @override
  String get homeStageSeed =>
      'आपका बीज मिट्टी में है, अपने पहले घूँट का इंतज़ार कर रहा है';

  @override
  String get homeStageSprout => 'अंकुर फूट गया 🌱';

  @override
  String get homeStageSapling => 'आपका पौधा बढ़ रहा है';

  @override
  String get homeStageAlmost => 'बस, पेड़ बनने ही वाला है!';

  @override
  String get homeStageReady => 'आज का पेड़ तैयार है 🌳';

  @override
  String get homePaceDone => 'कल एक नया पौधा आपका इंतज़ार कर रहा है';

  @override
  String get homePaceStart => 'दिन की शुरुआत एक गिलास से करें';

  @override
  String homePaceBehind(int ml) {
    return 'इस समय आप $ml ml पीछे हैं — अब भी पूरा किया जा सकता है';
  }

  @override
  String get homePaceOnTrack => 'आप बिलकुल सही रफ़्तार में हैं 👌';

  @override
  String get homeGoalDone => 'आपने अपना दैनिक लक्ष्य पूरा कर लिया';

  @override
  String homeRemaining(int ml) {
    return '$ml ml बाकी';
  }

  @override
  String homeStreakDays(int days) {
    return '$days दिन';
  }

  @override
  String get homeCelebrateTitle => 'आपका पेड़ बड़ा हो गया!';

  @override
  String get homeCelebrateBody =>
      'आपने आज का लक्ष्य पूरा किया। अब यह पेड़ आपके वन का हिस्सा है।';

  @override
  String homeStreakLabel(int days) {
    return '$days दिन का सिलसिला';
  }

  @override
  String get homeCelebrateOk => 'बढ़िया';

  @override
  String get addWhatTitle => 'आपने क्या पिया?';

  @override
  String get addAmount => 'मात्रा';

  @override
  String get addConfirm => 'जोड़ें';

  @override
  String get addFactorWater => 'यह आपके लक्ष्य में पूरा गिना जाता है।';

  @override
  String get addFactorAlcohol =>
      'शराब शरीर से पानी घटाती है, इसलिए इसे लक्ष्य से घटाया जाता है।';

  @override
  String addFactorPercent(int percent) {
    return 'यह आपके लक्ष्य में $percent% गिना जाता है।';
  }

  @override
  String get sumTitle => 'कल का सारांश';

  @override
  String get sumTreeGrown => 'आपका पेड़ बड़ा हो गया 🌳';

  @override
  String get sumSaplingOnWay => 'आपका पौधा अपने रास्ते पर है 🌱';

  @override
  String get sumBodyDone =>
      'आपने लक्ष्य पूरा किया। यह पेड़ आपके वन का हिस्सा है।';

  @override
  String sumPercent(int percent) {
    return 'कल आप अपने लक्ष्य के $percent% तक पहुँचे। आपका पौधा वहीं इंतज़ार कर रहा है जहाँ आपने छोड़ा था — कोई पेड़ कभी नहीं सूखता।';
  }

  @override
  String get sumStatCounted => 'गिना गया';

  @override
  String get sumStatGoal => 'लक्ष्य';

  @override
  String get sumStatStreak => 'सिलसिला';

  @override
  String sumStreakDays(int days) {
    return '$days दिन';
  }

  @override
  String get sumStartToday => 'आज से शुरू करें';

  @override
  String get sumWhatDrank => 'आपने क्या पिया';

  @override
  String sumDrinkAmount(String name, int ml) {
    return '$name $ml ml';
  }

  @override
  String get navToday => 'आज';

  @override
  String get navForest => 'वन';

  @override
  String get navStats => 'आँकड़े';

  @override
  String get navSettings => 'सेटिंग्स';

  @override
  String get onbContinue => 'आगे बढ़ें';

  @override
  String get onbFinish => 'मेरा पौधा लगाएँ';

  @override
  String get onbWelcomeTagline =>
      'हर घूँट, एक पौधा।\nपानी पिएँ और आपका पेड़ बढ़े; दिन बीतें और आपका वन भी।';

  @override
  String get onbWelcomeNoPenalty =>
      'आपका पेड़ कभी नहीं सूखता। यहाँ कोई सज़ा नहीं है।';

  @override
  String get onbGenderTitle => 'आइए आपको जानें';

  @override
  String get onbGenderSubtitle =>
      'आपका दैनिक पानी का लक्ष्य इसी से तय होता है। सब कुछ आपके फ़ोन में रहता है और कहीं नहीं भेजा जाता।';

  @override
  String get onbGenderFemale => 'महिला';

  @override
  String get onbGenderMale => 'पुरुष';

  @override
  String get onbGenderOther => 'बताना नहीं चाहते';

  @override
  String get onbBodyTitle => 'क़द, वज़न, उम्र';

  @override
  String get onbBodySubtitle => 'समायोजित करने के लिए स्लाइड करें।';

  @override
  String get onbBodyAge => 'उम्र';

  @override
  String get onbBodyHeight => 'क़द';

  @override
  String get onbBodyWeight => 'वज़न';

  @override
  String get onbBodyBmiLabel => 'आपका बॉडी मास इंडेक्स';

  @override
  String get onbBodyDisclaimer => 'केवल जानकारी के लिए, चिकित्सकीय सलाह नहीं।';

  @override
  String get onbActivityTitle => 'आप कितने सक्रिय हैं?';

  @override
  String get onbActivitySubtitle =>
      'जितना ज़्यादा पसीना, उतना ज़्यादा पानी चाहिए।';

  @override
  String get onbGoalTitle => 'आपका दैनिक लक्ष्य';

  @override
  String get onbGoalSubtitle => 'आप इसे कभी भी सेटिंग्स में बदल सकते हैं।';

  @override
  String get onbGoalUnit => 'मिलीलीटर / दिन';

  @override
  String onbGoalGlasses(int glasses) {
    return 'लगभग $glasses गिलास';
  }

  @override
  String get onbGoalReference =>
      'यह लक्ष्य यूरोपीय खाद्य सुरक्षा प्राधिकरण (EFSA, 2010) के पर्याप्त जल सेवन संदर्भ के आधार पर, आपके वज़न और गतिविधि स्तर के अनुसार तय किया गया है। भोजन से मिलने वाला पानी इस संख्या में शामिल नहीं है।';

  @override
  String get proAppBarTitle => 'Sipling Pro';

  @override
  String get proHeaderTitle => 'विज्ञापन-मुक्त Sipling';

  @override
  String get proHeaderSub => 'अपने वन को बढ़ता रखें';

  @override
  String get proPerkNoAdsTitle => 'कोई विज्ञापन नहीं';

  @override
  String get proPerkNoAdsSub => 'रोज़ के सारांश वाला विज्ञापन भी हट जाता है';

  @override
  String get proPerkTreesTitle => 'हर पेड़ की प्रजाति';

  @override
  String get proPerkTreesSub => 'सुनहरा पत्ता और नीलमोहर सहित';

  @override
  String get proPerkHistoryTitle => 'असीमित इतिहास';

  @override
  String get proPerkHistorySub => 'हर महीने के विस्तृत आँकड़े';

  @override
  String get proPerkThemesTitle => 'थीम विकल्प';

  @override
  String get proPerkThemesSub => 'मौसमी वन के रूप';

  @override
  String get proPerkSupportTitle => 'विकास में सहयोग';

  @override
  String get proPerkSupportSub => 'Sipling एक अकेले व्यक्ति की परियोजना है';

  @override
  String get proNotConnectedNote =>
      'ख़रीदारी अभी जुड़ी नहीं है। फ़िलहाल आप Pro को आज़माने के लिए चालू-बंद कर सकते हैं।';

  @override
  String get proButtonOn => 'Pro चालू है — बंद करें';

  @override
  String get proButtonTry => 'Pro आज़माएँ';

  @override
  String get batAppBarTitle => 'अगर सूचनाएँ नहीं आ रहीं';

  @override
  String get batIntro =>
      'कुछ फ़ोन ब्रांड बैटरी बचाने के लिए बैकग्राउंड ऐप्स बंद कर देते हैं, जिससे रिमाइंडर देर से आ सकते हैं या बिलकुल नहीं आते। नीचे दी गई सेटिंग एक बार कर लेना काफ़ी है।';

  @override
  String get batXiaomi1 =>
      'सेटिंग्स → ऐप्स → Sipling → बैटरी सेवर → \"कोई पाबंदी नहीं\"';

  @override
  String get batXiaomi2 => 'सेटिंग्स → ऐप्स → Sipling → ऑटोस्टार्ट → चालू';

  @override
  String get batXiaomi3 =>
      'हाल के ऐप्स स्क्रीन पर, Sipling को नीचे खींचें और लॉक आइकन पर टैप करें';

  @override
  String get batSamsung1 =>
      'सेटिंग्स → ऐप्स → Sipling → बैटरी → \"बिना पाबंदी\"';

  @override
  String get batSamsung2 =>
      'सेटिंग्स → बैटरी → बैकग्राउंड उपयोग सीमाएँ → \"स्लीपिंग ऐप्स\" सूची से Sipling को हटाएँ';

  @override
  String get batHuawei1 =>
      'सेटिंग्स → बैटरी → ऐप लॉन्च → Sipling → स्वतः प्रबंधन बंद करें';

  @override
  String get batHuawei2 =>
      'ऑटो-लॉन्च, सेकंडरी लॉन्च और बैकग्राउंड में चलाना चालू करें';

  @override
  String get batOppo1 =>
      'सेटिंग्स → बैटरी → उच्च बैकग्राउंड बिजली खपत → Sipling को अनुमति दें';

  @override
  String get batOppo2 =>
      'सेटिंग्स → ऐप्स → Sipling → बैटरी उपयोग → बैकग्राउंड गतिविधि की अनुमति दें';

  @override
  String get batFooter =>
      'मेन्यू के नाम आपके फ़ोन मॉडल के अनुसार थोड़े अलग हो सकते हैं। आपको \"बैटरी ऑप्टिमाइज़ेशन\", \"बैकग्राउंड गतिविधि\" या \"ऑटोस्टार्ट\" जैसी सेटिंग ढूँढनी है।';

  @override
  String get setTitle => 'सेटिंग्स';

  @override
  String get setSectionGoal => 'लक्ष्य';

  @override
  String get setSectionReminders => 'रिमाइंडर';

  @override
  String get setSectionCups => 'मेरे गिलास';

  @override
  String get setSectionHealth => 'स्वास्थ्य';

  @override
  String get setSectionAppearance => 'रूप-रंग';

  @override
  String get setSectionApp => 'ऐप';

  @override
  String get setProTagline => 'विज्ञापन-मुक्त, हर पेड़ खुला';

  @override
  String get setDailyGoal => 'दैनिक लक्ष्य';

  @override
  String setMl(int ml) {
    return '$ml ml';
  }

  @override
  String get setProfileInfo => 'मेरी प्रोफ़ाइल';

  @override
  String setWeightKg(int kg) {
    return '$kg kg';
  }

  @override
  String get setRemindersOn => 'रिमाइंडर चालू';

  @override
  String get setFrequency => 'बारंबारता';

  @override
  String get setAwakeHours => 'मेरे जागने के घंटे';

  @override
  String get setStopWhenDone => 'लक्ष्य पूरा होने पर रुक जाएँ';

  @override
  String get setStopWhenDoneSub =>
      'जैसे ही आप दैनिक लक्ष्य पूरा करते हैं, बाकी रिमाइंडर रद्द हो जाते हैं';

  @override
  String get setSilent => 'मौन सूचना';

  @override
  String get setSilentSub => 'न आवाज़, न कंपन';

  @override
  String get setNotifNotArriving => 'सूचनाएँ नहीं आ रहीं?';

  @override
  String get setNotifNotArrivingSub =>
      'हो सकता है आपके फ़ोन की बैटरी सेटिंग्स इन्हें रोक रही हों';

  @override
  String get setHealthWrite => 'Health Connect में लिखें';

  @override
  String get setHealthWriteSub =>
      'आपका पानी का सेवन Android के स्वास्थ्य रिकॉर्ड में भी सहेजा जाता है। Sipling वहाँ से कभी कुछ नहीं पढ़ता।';

  @override
  String get setDarkTheme => 'गहरी थीम';

  @override
  String get setForestTheme => 'वन थीम';

  @override
  String get setTreeSpecies => 'पेड़ की प्रजातियाँ';

  @override
  String get setMyData => 'मेरा डेटा';

  @override
  String get setMyDataSub =>
      'सब कुछ आपके फ़ोन में रहता है और कहीं नहीं भेजा जाता';

  @override
  String get setResetAll => 'सारा डेटा रीसेट करें';

  @override
  String setEveryHours(int h) {
    String _temp0 = intl.Intl.pluralLogic(
      h,
      locale: localeName,
      other: 'हर $h घंटे',
      one: 'हर घंटे',
    );
    return '$_temp0';
  }

  @override
  String setEveryMinutes(int m) {
    String _temp0 = intl.Intl.pluralLogic(
      m,
      locale: localeName,
      other: 'हर $m मिनट',
      one: 'हर मिनट',
    );
    return '$_temp0';
  }

  @override
  String get setHealthNoConnect => 'इस डिवाइस में Health Connect नहीं है।';

  @override
  String get setHealthNotInstalledTitle => 'Health Connect इंस्टॉल नहीं है';

  @override
  String get setHealthNeedsUpdateTitle => 'Health Connect को अपडेट करना होगा';

  @override
  String get setHealthInstallBody =>
      'आपके पानी के सेवन को Android के स्वास्थ्य रिकॉर्ड में लिखने के लिए Health Connect ऐप ज़रूरी है।';

  @override
  String get setOpenPlayStore => 'Play Store में खोलें';

  @override
  String get setHealthPermissionDenied =>
      'अनुमति नहीं मिली, स्वास्थ्य रिकॉर्ड में कुछ नहीं लिखा जाएगा।';

  @override
  String get setHealthEnabled =>
      'अब से आपका पानी का सेवन Health Connect में भी लिखा जाएगा।';

  @override
  String get setCancel => 'रद्द करें';

  @override
  String get setSave => 'सहेजें';

  @override
  String setSuggested(int ml) {
    return 'सुझाव: $ml ml';
  }

  @override
  String get setBackToSuggested => 'सुझाए गए पर लौटें';

  @override
  String get setIntervalDialogTitle => 'हम आपको कितनी बार याद दिलाएँ?';

  @override
  String get setWakeHelp => 'आप कितने बजे उठते हैं?';

  @override
  String get setSleepHelp => 'आप कितने बजे सोते हैं?';

  @override
  String get setAwakeMin4h => 'आपके जागने का समय कम से कम 4 घंटे होना चाहिए';

  @override
  String get setResetConfirmTitle => 'क्या आप निश्चित हैं?';

  @override
  String get setResetConfirmBody =>
      'आपका वन, सिलसिले और सारे रिकॉर्ड मिट जाएँगे। इसे वापस नहीं लाया जा सकता।';

  @override
  String get setResetConfirmButton => 'रीसेट करें';

  @override
  String get statsTitle => 'आँकड़े';

  @override
  String get statsDailyAverage => 'दैनिक औसत';

  @override
  String get statsGoalDays => 'लक्ष्य पूरा करने वाले दिन';

  @override
  String get statsCurrentStreak => 'मौजूदा सिलसिला';

  @override
  String get statsUnitDays => 'दिन';

  @override
  String get statsTotalTrees => 'कुल पेड़';

  @override
  String statsLastDays(int days) {
    return 'पिछले $days दिन';
  }

  @override
  String get statsYourDrinks => 'आपके पेय';

  @override
  String statsRangeDays(int days) {
    return '$days दिन';
  }

  @override
  String get statsWeekdayMon => 'सोम';

  @override
  String get statsWeekdayTue => 'मंगल';

  @override
  String get statsWeekdayWed => 'बुध';

  @override
  String get statsWeekdayThu => 'गुरु';

  @override
  String get statsWeekdayFri => 'शुक्र';

  @override
  String get statsWeekdaySat => 'शनि';

  @override
  String get statsWeekdaySun => 'रवि';

  @override
  String get statsNoRecords => 'अभी तक कोई रिकॉर्ड नहीं।';

  @override
  String get statsBmiTitle => 'बॉडी मास इंडेक्स';

  @override
  String get statsBmiDisclaimer => 'केवल जानकारी के लिए,\nचिकित्सकीय सलाह नहीं';

  @override
  String get statsAchievements => 'उपलब्धियाँ';

  @override
  String statsAchievementsEarned(int count) {
    return '$count हासिल किए';
  }

  @override
  String get achScreenTitle => 'उपलब्धियाँ';

  @override
  String get forestTitle => 'आपका वन';

  @override
  String forestSubtitle(int trees, int days) {
    return '$trees पेड़ • सर्वश्रेष्ठ सिलसिला $days दिन';
  }

  @override
  String get forestSpeciesTooltip => 'पेड़ की प्रजातियाँ';

  @override
  String get forestEmptyTitle => 'आपका वन अभी ख़ाली है';

  @override
  String get forestEmptyBody =>
      'जब आप अपना पहला गिलास पिएँगे, यहाँ एक पौधा दिखाई देगा।';

  @override
  String get speciesScreenTitle => 'पेड़ की प्रजातियाँ';

  @override
  String get speciesScreenIntro =>
      'आप कल के पौधे की प्रजाति चुन सकते हैं। आपके वन के पुराने पेड़ उसी प्रजाति के बने रहते हैं जिस रूप में वे लगाए गए थे।';

  @override
  String get speciesScreenSelected => 'चुना गया';

  @override
  String get speciesScreenUnlocked => 'खुला';

  @override
  String speciesScreenUnlockTitle(String name) {
    return '$name पेड़ को खोलें';
  }

  @override
  String get speciesScreenRewardBody =>
      'इस प्रजाति को हमेशा के लिए खोलने के लिए एक छोटा विज्ञापन देखें। विज्ञापन पूरी तरह वैकल्पिक है — ऐप में कहीं भी ज़बरदस्ती विज्ञापन नहीं है।';

  @override
  String get speciesScreenCancel => 'रद्द करें';

  @override
  String get speciesScreenWatchAd => 'विज्ञापन देखें';

  @override
  String get seasonScreenTitle => 'वन थीम';

  @override
  String get seasonScreenIntro =>
      'आपके वन के रंग बदलते हैं, पेड़ नहीं। कोई भी थीम आपकी ट्रैकिंग, लक्ष्य या सिलसिले को प्रभावित नहीं करती।';

  @override
  String get seasonScreenProOnly => 'केवल Pro सदस्यों के लिए';

  @override
  String get seasonScreenSelected => 'चुना गया';

  @override
  String get setSectionHome => 'होम स्क्रीन';

  @override
  String get setAddWidget => 'होम स्क्रीन पर विजेट जोड़ें';

  @override
  String get setAddWidgetSub => 'ऐप खोले बिना, एक टैप में पानी जोड़ें';

  @override
  String get setAddWidgetManual =>
      'होम स्क्रीन को दबाकर रखें → विजेट → Sipling चुनें';

  @override
  String get wrappedTitle => 'आपके जंगल का सार';

  @override
  String get wrappedHeadline => 'अब तक का आपका सफ़र';

  @override
  String wrappedLiters(int liters) {
    return '$liters L';
  }

  @override
  String get wrappedLitersLabel => 'कुल पानी';

  @override
  String get wrappedTreesLabel => 'पेड़';

  @override
  String get wrappedStreakLabel => 'सर्वश्रेष्ठ सिलसिला';

  @override
  String get wrappedDaysLabel => 'दिन';

  @override
  String get wrappedShare => 'साझा करें';

  @override
  String get wrappedShareText =>
      'मैं Sipling के साथ अपना जंगल बढ़ा रहा हूँ, एक-एक घूँट 🌱 sipling-app.web.app';

  @override
  String get homeMoreDrinks => 'अन्य';

  @override
  String addFactorWaterEq(int ml, int percent) {
    return '≈ $ml ml पानी ($percent%)';
  }

  @override
  String proPerMonth(String price) {
    return '$price / माह';
  }

  @override
  String get proRestore => 'खरीदारी पुनर्स्थापित करें';

  @override
  String get proTerms => 'उपयोग की शर्तें';

  @override
  String get proPrivacyLink => 'गोपनीयता नीति';

  @override
  String get proStoreUnavailable => 'स्टोर अभी उपलब्ध नहीं है';

  @override
  String get proAutoRenew =>
      'मासिक सदस्यता, स्वतः नवीनीकृत होती है। नवीनीकरण से कम से कम 24 घंटे पहले अपने स्टोर खाता सेटिंग में रद्द करें; अन्यथा यह नवीनीकृत हो जाती है।';
}
