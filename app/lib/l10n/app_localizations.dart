import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L
/// returned by `L.of(context)`.
///
/// Applications need to include `L.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L.localizationsDelegates,
///   supportedLocales: L.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L.supportedLocales
/// property.
abstract class L {
  L(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L of(BuildContext context) {
    return Localizations.of<L>(context, L)!;
  }

  static const LocalizationsDelegate<L> delegate = _LDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('vi'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Sipling'**
  String get appName;

  /// No description provided for @drinkWater.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get drinkWater;

  /// No description provided for @drinkTea.
  ///
  /// In en, this message translates to:
  /// **'Tea'**
  String get drinkTea;

  /// No description provided for @drinkCoffee.
  ///
  /// In en, this message translates to:
  /// **'Coffee'**
  String get drinkCoffee;

  /// No description provided for @drinkMilk.
  ///
  /// In en, this message translates to:
  /// **'Milk'**
  String get drinkMilk;

  /// No description provided for @drinkJuice.
  ///
  /// In en, this message translates to:
  /// **'Juice'**
  String get drinkJuice;

  /// No description provided for @drinkSoda.
  ///
  /// In en, this message translates to:
  /// **'Soda'**
  String get drinkSoda;

  /// No description provided for @drinkAlcohol.
  ///
  /// In en, this message translates to:
  /// **'Alcohol'**
  String get drinkAlcohol;

  /// No description provided for @speciesOak.
  ///
  /// In en, this message translates to:
  /// **'Oak'**
  String get speciesOak;

  /// No description provided for @speciesPine.
  ///
  /// In en, this message translates to:
  /// **'Pine'**
  String get speciesPine;

  /// No description provided for @speciesCherry.
  ///
  /// In en, this message translates to:
  /// **'Sakura'**
  String get speciesCherry;

  /// No description provided for @speciesAcacia.
  ///
  /// In en, this message translates to:
  /// **'Acacia'**
  String get speciesAcacia;

  /// No description provided for @speciesMaple.
  ///
  /// In en, this message translates to:
  /// **'Maple'**
  String get speciesMaple;

  /// No description provided for @speciesOlive.
  ///
  /// In en, this message translates to:
  /// **'Olive'**
  String get speciesOlive;

  /// No description provided for @speciesGolden.
  ///
  /// In en, this message translates to:
  /// **'Golden Leaf'**
  String get speciesGolden;

  /// No description provided for @speciesJacaranda.
  ///
  /// In en, this message translates to:
  /// **'Jacaranda'**
  String get speciesJacaranda;

  /// No description provided for @unlockFree.
  ///
  /// In en, this message translates to:
  /// **'Unlocked'**
  String get unlockFree;

  /// No description provided for @unlockStreak.
  ///
  /// In en, this message translates to:
  /// **'Hit your goal {days} days in a row'**
  String unlockStreak(int days);

  /// No description provided for @unlockTotalTrees.
  ///
  /// In en, this message translates to:
  /// **'Grow {count} trees in total'**
  String unlockTotalTrees(int count);

  /// No description provided for @unlockRewardedAd.
  ///
  /// In en, this message translates to:
  /// **'Watch a short ad'**
  String get unlockRewardedAd;

  /// No description provided for @unlockPro.
  ///
  /// In en, this message translates to:
  /// **'Pro members only'**
  String get unlockPro;

  /// No description provided for @achFirstSproutTitle.
  ///
  /// In en, this message translates to:
  /// **'First Sprout'**
  String get achFirstSproutTitle;

  /// No description provided for @achFirstSproutDesc.
  ///
  /// In en, this message translates to:
  /// **'You drank your first glass'**
  String get achFirstSproutDesc;

  /// No description provided for @achFirstTreeTitle.
  ///
  /// In en, this message translates to:
  /// **'First Tree'**
  String get achFirstTreeTitle;

  /// No description provided for @achFirstTreeDesc.
  ///
  /// In en, this message translates to:
  /// **'You completed a daily goal'**
  String get achFirstTreeDesc;

  /// No description provided for @achStreak3Title.
  ///
  /// In en, this message translates to:
  /// **'A Habit Begins'**
  String get achStreak3Title;

  /// No description provided for @achStreak3Desc.
  ///
  /// In en, this message translates to:
  /// **'You hit your goal 3 days in a row'**
  String get achStreak3Desc;

  /// No description provided for @achStreak7Title.
  ///
  /// In en, this message translates to:
  /// **'A Full Week'**
  String get achStreak7Title;

  /// No description provided for @achStreak7Desc.
  ///
  /// In en, this message translates to:
  /// **'You hit your goal 7 days in a row'**
  String get achStreak7Desc;

  /// No description provided for @achStreak30Title.
  ///
  /// In en, this message translates to:
  /// **'A Month Unbroken'**
  String get achStreak30Title;

  /// No description provided for @achStreak30Desc.
  ///
  /// In en, this message translates to:
  /// **'You hit your goal 30 days in a row'**
  String get achStreak30Desc;

  /// No description provided for @achTrees10Title.
  ///
  /// In en, this message translates to:
  /// **'Little Grove'**
  String get achTrees10Title;

  /// No description provided for @achTrees10Desc.
  ///
  /// In en, this message translates to:
  /// **'You grew 10 trees'**
  String get achTrees10Desc;

  /// No description provided for @achTrees50Title.
  ///
  /// In en, this message translates to:
  /// **'Forest Keeper'**
  String get achTrees50Title;

  /// No description provided for @achTrees50Desc.
  ///
  /// In en, this message translates to:
  /// **'You grew 50 trees'**
  String get achTrees50Desc;

  /// No description provided for @achEarlyBirdTitle.
  ///
  /// In en, this message translates to:
  /// **'Early Riser'**
  String get achEarlyBirdTitle;

  /// No description provided for @achEarlyBirdDesc.
  ///
  /// In en, this message translates to:
  /// **'You drank water before 9 a.m.'**
  String get achEarlyBirdDesc;

  /// No description provided for @achVarietyTitle.
  ///
  /// In en, this message translates to:
  /// **'Varied Palate'**
  String get achVarietyTitle;

  /// No description provided for @achVarietyDesc.
  ///
  /// In en, this message translates to:
  /// **'You logged at least 4 different drinks'**
  String get achVarietyDesc;

  /// No description provided for @achPerfectWeekTitle.
  ///
  /// In en, this message translates to:
  /// **'Perfect Week'**
  String get achPerfectWeekTitle;

  /// No description provided for @achPerfectWeekDesc.
  ///
  /// In en, this message translates to:
  /// **'You hit your goal every day for 7 days'**
  String get achPerfectWeekDesc;

  /// No description provided for @seasonClassicName.
  ///
  /// In en, this message translates to:
  /// **'Classic'**
  String get seasonClassicName;

  /// No description provided for @seasonClassicDesc.
  ///
  /// In en, this message translates to:
  /// **'Evergreen, all year round'**
  String get seasonClassicDesc;

  /// No description provided for @seasonAutoName.
  ///
  /// In en, this message translates to:
  /// **'Automatic'**
  String get seasonAutoName;

  /// No description provided for @seasonAutoDesc.
  ///
  /// In en, this message translates to:
  /// **'Let your forest follow the calendar'**
  String get seasonAutoDesc;

  /// No description provided for @seasonSpringName.
  ///
  /// In en, this message translates to:
  /// **'Spring'**
  String get seasonSpringName;

  /// No description provided for @seasonSpringDesc.
  ///
  /// In en, this message translates to:
  /// **'Fresh leaves, bright sky'**
  String get seasonSpringDesc;

  /// No description provided for @seasonSummerName.
  ///
  /// In en, this message translates to:
  /// **'Summer'**
  String get seasonSummerName;

  /// No description provided for @seasonSummerDesc.
  ///
  /// In en, this message translates to:
  /// **'Deep, saturated greens'**
  String get seasonSummerDesc;

  /// No description provided for @seasonAutumnName.
  ///
  /// In en, this message translates to:
  /// **'Autumn'**
  String get seasonAutumnName;

  /// No description provided for @seasonAutumnDesc.
  ///
  /// In en, this message translates to:
  /// **'Orange leaves, warm light'**
  String get seasonAutumnDesc;

  /// No description provided for @seasonWinterName.
  ///
  /// In en, this message translates to:
  /// **'Winter'**
  String get seasonWinterName;

  /// No description provided for @seasonWinterDesc.
  ///
  /// In en, this message translates to:
  /// **'Snowy hills, cold light'**
  String get seasonWinterDesc;

  /// No description provided for @bmiUnderweight.
  ///
  /// In en, this message translates to:
  /// **'Underweight'**
  String get bmiUnderweight;

  /// No description provided for @bmiNormal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get bmiNormal;

  /// No description provided for @bmiOverweight.
  ///
  /// In en, this message translates to:
  /// **'Overweight'**
  String get bmiOverweight;

  /// No description provided for @bmiObese.
  ///
  /// In en, this message translates to:
  /// **'Obese'**
  String get bmiObese;

  /// No description provided for @notifTitle1.
  ///
  /// In en, this message translates to:
  /// **'Time for water 💧'**
  String get notifTitle1;

  /// No description provided for @notifBody1.
  ///
  /// In en, this message translates to:
  /// **'Your sapling is waiting — shall we have a glass?'**
  String get notifBody1;

  /// No description provided for @notifTitle2.
  ///
  /// In en, this message translates to:
  /// **'One more sip'**
  String get notifTitle2;

  /// No description provided for @notifBody2.
  ///
  /// In en, this message translates to:
  /// **'Small sips make big trees.'**
  String get notifBody2;

  /// No description provided for @notifTitle3.
  ///
  /// In en, this message translates to:
  /// **'Your sapling is thirsty 🌱'**
  String get notifTitle3;

  /// No description provided for @notifBody3.
  ///
  /// In en, this message translates to:
  /// **'A glass of water helps it grow a little more.'**
  String get notifBody3;

  /// No description provided for @notifTitle4.
  ///
  /// In en, this message translates to:
  /// **'Reminder'**
  String get notifTitle4;

  /// No description provided for @notifBody4.
  ///
  /// In en, this message translates to:
  /// **'One step closer to today\'s tree.'**
  String get notifBody4;

  /// No description provided for @notifTitle5.
  ///
  /// In en, this message translates to:
  /// **'Water break'**
  String get notifTitle5;

  /// No description provided for @notifBody5.
  ///
  /// In en, this message translates to:
  /// **'The glass you drink now is tonight\'s tree.'**
  String get notifBody5;

  /// No description provided for @activityLow.
  ///
  /// In en, this message translates to:
  /// **'Sedentary'**
  String get activityLow;

  /// No description provided for @activityLowHint.
  ///
  /// In en, this message translates to:
  /// **'Desk job, little walking'**
  String get activityLowHint;

  /// No description provided for @activityMedium.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get activityMedium;

  /// No description provided for @activityMediumHint.
  ///
  /// In en, this message translates to:
  /// **'Exercise 1-3 days a week'**
  String get activityMediumHint;

  /// No description provided for @activityHigh.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get activityHigh;

  /// No description provided for @activityHighHint.
  ///
  /// In en, this message translates to:
  /// **'Exercise 4+ days a week'**
  String get activityHighHint;

  /// No description provided for @cupGlass.
  ///
  /// In en, this message translates to:
  /// **'Glass'**
  String get cupGlass;

  /// No description provided for @cupBottle.
  ///
  /// In en, this message translates to:
  /// **'Bottle'**
  String get cupBottle;

  /// No description provided for @cupLarge.
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get cupLarge;

  /// No description provided for @homeNewAchievement.
  ///
  /// In en, this message translates to:
  /// **'New achievement'**
  String get homeNewAchievement;

  /// No description provided for @homeUndoLast.
  ///
  /// In en, this message translates to:
  /// **'Undo last entry'**
  String get homeUndoLast;

  /// No description provided for @homeStageSeed.
  ///
  /// In en, this message translates to:
  /// **'Your seed is in the soil, waiting for its first sip'**
  String get homeStageSeed;

  /// No description provided for @homeStageSprout.
  ///
  /// In en, this message translates to:
  /// **'It sprouted 🌱'**
  String get homeStageSprout;

  /// No description provided for @homeStageSapling.
  ///
  /// In en, this message translates to:
  /// **'Your sapling is growing'**
  String get homeStageSapling;

  /// No description provided for @homeStageAlmost.
  ///
  /// In en, this message translates to:
  /// **'Almost a tree!'**
  String get homeStageAlmost;

  /// No description provided for @homeStageReady.
  ///
  /// In en, this message translates to:
  /// **'Today\'s tree is ready 🌳'**
  String get homeStageReady;

  /// No description provided for @homePaceDone.
  ///
  /// In en, this message translates to:
  /// **'A new sapling is waiting for you tomorrow'**
  String get homePaceDone;

  /// No description provided for @homePaceStart.
  ///
  /// In en, this message translates to:
  /// **'Start your day with a glass'**
  String get homePaceStart;

  /// No description provided for @homePaceBehind.
  ///
  /// In en, this message translates to:
  /// **'You\'re {ml} ml behind for this hour — you can still catch up'**
  String homePaceBehind(int ml);

  /// No description provided for @homePaceOnTrack.
  ///
  /// In en, this message translates to:
  /// **'You\'re right on pace 👌'**
  String get homePaceOnTrack;

  /// No description provided for @homeGoalDone.
  ///
  /// In en, this message translates to:
  /// **'You\'ve hit your daily goal'**
  String get homeGoalDone;

  /// No description provided for @homeRemaining.
  ///
  /// In en, this message translates to:
  /// **'{ml} ml left'**
  String homeRemaining(int ml);

  /// No description provided for @homeStreakDays.
  ///
  /// In en, this message translates to:
  /// **'{days} days'**
  String homeStreakDays(int days);

  /// No description provided for @homeCelebrateTitle.
  ///
  /// In en, this message translates to:
  /// **'Your tree has grown!'**
  String get homeCelebrateTitle;

  /// No description provided for @homeCelebrateBody.
  ///
  /// In en, this message translates to:
  /// **'You\'ve hit today\'s goal. This tree is now part of your forest.'**
  String get homeCelebrateBody;

  /// No description provided for @homeStreakLabel.
  ///
  /// In en, this message translates to:
  /// **'{days}-day streak'**
  String homeStreakLabel(int days);

  /// No description provided for @homeCelebrateOk.
  ///
  /// In en, this message translates to:
  /// **'Great'**
  String get homeCelebrateOk;

  /// No description provided for @addWhatTitle.
  ///
  /// In en, this message translates to:
  /// **'What did you drink?'**
  String get addWhatTitle;

  /// No description provided for @addAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get addAmount;

  /// No description provided for @addConfirm.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get addConfirm;

  /// No description provided for @addFactorWater.
  ///
  /// In en, this message translates to:
  /// **'Counts fully toward your goal.'**
  String get addFactorWater;

  /// No description provided for @addFactorAlcohol.
  ///
  /// In en, this message translates to:
  /// **'Alcohol dehydrates you, so it\'s subtracted from your goal.'**
  String get addFactorAlcohol;

  /// No description provided for @addFactorPercent.
  ///
  /// In en, this message translates to:
  /// **'Counts {percent}% toward your goal.'**
  String addFactorPercent(int percent);

  /// No description provided for @sumTitle.
  ///
  /// In en, this message translates to:
  /// **'Yesterday\'s summary'**
  String get sumTitle;

  /// No description provided for @sumTreeGrown.
  ///
  /// In en, this message translates to:
  /// **'Your tree has grown 🌳'**
  String get sumTreeGrown;

  /// No description provided for @sumSaplingOnWay.
  ///
  /// In en, this message translates to:
  /// **'Your sapling is on its way 🌱'**
  String get sumSaplingOnWay;

  /// No description provided for @sumBodyDone.
  ///
  /// In en, this message translates to:
  /// **'You hit your goal. This tree is part of your forest.'**
  String get sumBodyDone;

  /// No description provided for @sumPercent.
  ///
  /// In en, this message translates to:
  /// **'You reached {percent}% of your goal yesterday. Your sapling is waiting right where you left it — no tree ever withers.'**
  String sumPercent(int percent);

  /// No description provided for @sumStatCounted.
  ///
  /// In en, this message translates to:
  /// **'Counted'**
  String get sumStatCounted;

  /// No description provided for @sumStatGoal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get sumStatGoal;

  /// No description provided for @sumStatStreak.
  ///
  /// In en, this message translates to:
  /// **'Streak'**
  String get sumStatStreak;

  /// No description provided for @sumStreakDays.
  ///
  /// In en, this message translates to:
  /// **'{days} days'**
  String sumStreakDays(int days);

  /// No description provided for @sumStartToday.
  ///
  /// In en, this message translates to:
  /// **'Start today'**
  String get sumStartToday;

  /// No description provided for @sumWhatDrank.
  ///
  /// In en, this message translates to:
  /// **'What you drank'**
  String get sumWhatDrank;

  /// No description provided for @sumDrinkAmount.
  ///
  /// In en, this message translates to:
  /// **'{name} {ml} ml'**
  String sumDrinkAmount(String name, int ml);

  /// No description provided for @navToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get navToday;

  /// No description provided for @navForest.
  ///
  /// In en, this message translates to:
  /// **'Forest'**
  String get navForest;

  /// No description provided for @navStats.
  ///
  /// In en, this message translates to:
  /// **'Stats'**
  String get navStats;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @onbContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get onbContinue;

  /// No description provided for @onbFinish.
  ///
  /// In en, this message translates to:
  /// **'Plant my sapling'**
  String get onbFinish;

  /// No description provided for @onbWelcomeTagline.
  ///
  /// In en, this message translates to:
  /// **'Every sip, a sapling.\nDrink water and your tree grows; as the days pass, so does your forest.'**
  String get onbWelcomeTagline;

  /// No description provided for @onbWelcomeNoPenalty.
  ///
  /// In en, this message translates to:
  /// **'Your tree never withers. No penalties here.'**
  String get onbWelcomeNoPenalty;

  /// No description provided for @onbGenderTitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s get to know you'**
  String get onbGenderTitle;

  /// No description provided for @onbGenderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your daily water goal is calculated from this. It all stays on your phone and is never sent anywhere.'**
  String get onbGenderSubtitle;

  /// No description provided for @onbGenderFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get onbGenderFemale;

  /// No description provided for @onbGenderMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get onbGenderMale;

  /// No description provided for @onbGenderOther.
  ///
  /// In en, this message translates to:
  /// **'Prefer not to say'**
  String get onbGenderOther;

  /// No description provided for @onbBodyTitle.
  ///
  /// In en, this message translates to:
  /// **'Height, weight, age'**
  String get onbBodyTitle;

  /// No description provided for @onbBodySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Slide to adjust.'**
  String get onbBodySubtitle;

  /// No description provided for @onbBodyAge.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get onbBodyAge;

  /// No description provided for @onbBodyHeight.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get onbBodyHeight;

  /// No description provided for @onbBodyWeight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get onbBodyWeight;

  /// No description provided for @onbBodyBmiLabel.
  ///
  /// In en, this message translates to:
  /// **'Your body mass index'**
  String get onbBodyBmiLabel;

  /// No description provided for @onbBodyDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'For information only, not medical advice.'**
  String get onbBodyDisclaimer;

  /// No description provided for @onbActivityTitle.
  ///
  /// In en, this message translates to:
  /// **'How active are you?'**
  String get onbActivityTitle;

  /// No description provided for @onbActivitySubtitle.
  ///
  /// In en, this message translates to:
  /// **'The more you sweat, the more water you need.'**
  String get onbActivitySubtitle;

  /// No description provided for @onbGoalTitle.
  ///
  /// In en, this message translates to:
  /// **'Your daily goal'**
  String get onbGoalTitle;

  /// No description provided for @onbGoalSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You can change it anytime in Settings.'**
  String get onbGoalSubtitle;

  /// No description provided for @onbGoalUnit.
  ///
  /// In en, this message translates to:
  /// **'milliliters / day'**
  String get onbGoalUnit;

  /// No description provided for @onbGoalGlasses.
  ///
  /// In en, this message translates to:
  /// **'about {glasses} glasses'**
  String onbGoalGlasses(int glasses);

  /// No description provided for @onbGoalReference.
  ///
  /// In en, this message translates to:
  /// **'This goal is adapted to your weight and activity level, based on the adequate water intake reference from the European Food Safety Authority (EFSA, 2010). Water you get from food is not included in this number.'**
  String get onbGoalReference;

  /// No description provided for @proAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Sipling Pro'**
  String get proAppBarTitle;

  /// No description provided for @proHeaderTitle.
  ///
  /// In en, this message translates to:
  /// **'Ad-free Sipling'**
  String get proHeaderTitle;

  /// No description provided for @proHeaderSub.
  ///
  /// In en, this message translates to:
  /// **'Keep your forest growing'**
  String get proHeaderSub;

  /// No description provided for @proPerkNoAdsTitle.
  ///
  /// In en, this message translates to:
  /// **'Zero ads'**
  String get proPerkNoAdsTitle;

  /// No description provided for @proPerkNoAdsSub.
  ///
  /// In en, this message translates to:
  /// **'Even the daily summary ad disappears'**
  String get proPerkNoAdsSub;

  /// No description provided for @proPerkTreesTitle.
  ///
  /// In en, this message translates to:
  /// **'Every tree species'**
  String get proPerkTreesTitle;

  /// No description provided for @proPerkTreesSub.
  ///
  /// In en, this message translates to:
  /// **'Including Golden Leaf and Jacaranda'**
  String get proPerkTreesSub;

  /// No description provided for @proPerkHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Unlimited history'**
  String get proPerkHistoryTitle;

  /// No description provided for @proPerkHistorySub.
  ///
  /// In en, this message translates to:
  /// **'Detailed stats for every month'**
  String get proPerkHistorySub;

  /// No description provided for @proPerkThemesTitle.
  ///
  /// In en, this message translates to:
  /// **'Theme options'**
  String get proPerkThemesTitle;

  /// No description provided for @proPerkThemesSub.
  ///
  /// In en, this message translates to:
  /// **'Seasonal forest looks'**
  String get proPerkThemesSub;

  /// No description provided for @proPerkSupportTitle.
  ///
  /// In en, this message translates to:
  /// **'Support development'**
  String get proPerkSupportTitle;

  /// No description provided for @proPerkSupportSub.
  ///
  /// In en, this message translates to:
  /// **'Sipling is a one-person project'**
  String get proPerkSupportSub;

  /// No description provided for @proNotConnectedNote.
  ///
  /// In en, this message translates to:
  /// **'Purchases aren\'t connected yet. For now you can toggle Pro on and off to try it out.'**
  String get proNotConnectedNote;

  /// No description provided for @proButtonOn.
  ///
  /// In en, this message translates to:
  /// **'Pro is on — turn off'**
  String get proButtonOn;

  /// No description provided for @proButtonTry.
  ///
  /// In en, this message translates to:
  /// **'Try Pro'**
  String get proButtonTry;

  /// No description provided for @batAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'If notifications aren\'t arriving'**
  String get batAppBarTitle;

  /// No description provided for @batIntro.
  ///
  /// In en, this message translates to:
  /// **'Some phone brands shut down background apps to save battery, so reminders can be delayed or may not arrive at all. Making the setting below once is enough.'**
  String get batIntro;

  /// No description provided for @batXiaomi1.
  ///
  /// In en, this message translates to:
  /// **'Settings → Apps → Sipling → Battery saver → \"No restrictions\"'**
  String get batXiaomi1;

  /// No description provided for @batXiaomi2.
  ///
  /// In en, this message translates to:
  /// **'Settings → Apps → Sipling → Autostart → On'**
  String get batXiaomi2;

  /// No description provided for @batXiaomi3.
  ///
  /// In en, this message translates to:
  /// **'On the recent apps screen, pull Sipling down and tap the lock icon'**
  String get batXiaomi3;

  /// No description provided for @batSamsung1.
  ///
  /// In en, this message translates to:
  /// **'Settings → Apps → Sipling → Battery → \"Unrestricted\"'**
  String get batSamsung1;

  /// No description provided for @batSamsung2.
  ///
  /// In en, this message translates to:
  /// **'Settings → Battery → Background usage limits → remove Sipling from the \"Sleeping apps\" list'**
  String get batSamsung2;

  /// No description provided for @batHuawei1.
  ///
  /// In en, this message translates to:
  /// **'Settings → Battery → App launch → Sipling → turn off Manage automatically'**
  String get batHuawei1;

  /// No description provided for @batHuawei2.
  ///
  /// In en, this message translates to:
  /// **'Turn on Auto-launch, Secondary launch and Run in background'**
  String get batHuawei2;

  /// No description provided for @batOppo1.
  ///
  /// In en, this message translates to:
  /// **'Settings → Battery → High background power consumption → allow Sipling'**
  String get batOppo1;

  /// No description provided for @batOppo2.
  ///
  /// In en, this message translates to:
  /// **'Settings → Apps → Sipling → Battery usage → Allow background activity'**
  String get batOppo2;

  /// No description provided for @batFooter.
  ///
  /// In en, this message translates to:
  /// **'Menu names may vary a little depending on your phone model. What you\'re looking for is a setting like \"battery optimization\", \"background activity\" or \"autostart\".'**
  String get batFooter;

  /// No description provided for @setTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get setTitle;

  /// No description provided for @setSectionGoal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get setSectionGoal;

  /// No description provided for @setSectionReminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get setSectionReminders;

  /// No description provided for @setSectionCups.
  ///
  /// In en, this message translates to:
  /// **'My Cups'**
  String get setSectionCups;

  /// No description provided for @setSectionHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get setSectionHealth;

  /// No description provided for @setSectionAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get setSectionAppearance;

  /// No description provided for @setSectionApp.
  ///
  /// In en, this message translates to:
  /// **'App'**
  String get setSectionApp;

  /// No description provided for @setProTagline.
  ///
  /// In en, this message translates to:
  /// **'Ad-free, every tree unlocked'**
  String get setProTagline;

  /// No description provided for @setDailyGoal.
  ///
  /// In en, this message translates to:
  /// **'Daily goal'**
  String get setDailyGoal;

  /// No description provided for @setMl.
  ///
  /// In en, this message translates to:
  /// **'{ml} ml'**
  String setMl(int ml);

  /// No description provided for @setProfileInfo.
  ///
  /// In en, this message translates to:
  /// **'My profile'**
  String get setProfileInfo;

  /// No description provided for @setWeightKg.
  ///
  /// In en, this message translates to:
  /// **'{kg} kg'**
  String setWeightKg(int kg);

  /// No description provided for @setRemindersOn.
  ///
  /// In en, this message translates to:
  /// **'Reminders on'**
  String get setRemindersOn;

  /// No description provided for @setFrequency.
  ///
  /// In en, this message translates to:
  /// **'Frequency'**
  String get setFrequency;

  /// No description provided for @setAwakeHours.
  ///
  /// In en, this message translates to:
  /// **'My waking hours'**
  String get setAwakeHours;

  /// No description provided for @setStopWhenDone.
  ///
  /// In en, this message translates to:
  /// **'Stop when goal is met'**
  String get setStopWhenDone;

  /// No description provided for @setStopWhenDoneSub.
  ///
  /// In en, this message translates to:
  /// **'Once you hit your daily goal, the remaining reminders are cancelled'**
  String get setStopWhenDoneSub;

  /// No description provided for @setSilent.
  ///
  /// In en, this message translates to:
  /// **'Silent notification'**
  String get setSilent;

  /// No description provided for @setSilentSub.
  ///
  /// In en, this message translates to:
  /// **'No sound or vibration'**
  String get setSilentSub;

  /// No description provided for @setNotifNotArriving.
  ///
  /// In en, this message translates to:
  /// **'Notifications not coming through?'**
  String get setNotifNotArriving;

  /// No description provided for @setNotifNotArrivingSub.
  ///
  /// In en, this message translates to:
  /// **'Your phone\'s battery settings may be blocking them'**
  String get setNotifNotArrivingSub;

  /// No description provided for @setHealthWrite.
  ///
  /// In en, this message translates to:
  /// **'Write to Health Connect'**
  String get setHealthWrite;

  /// No description provided for @setHealthWriteSub.
  ///
  /// In en, this message translates to:
  /// **'Your water intake is also saved to Android\'s health record. Sipling never reads anything from there.'**
  String get setHealthWriteSub;

  /// No description provided for @setDarkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark theme'**
  String get setDarkTheme;

  /// No description provided for @setForestTheme.
  ///
  /// In en, this message translates to:
  /// **'Forest theme'**
  String get setForestTheme;

  /// No description provided for @setTreeSpecies.
  ///
  /// In en, this message translates to:
  /// **'Tree species'**
  String get setTreeSpecies;

  /// No description provided for @setMyData.
  ///
  /// In en, this message translates to:
  /// **'My data'**
  String get setMyData;

  /// No description provided for @setMyDataSub.
  ///
  /// In en, this message translates to:
  /// **'Everything stays on your phone and is never sent anywhere'**
  String get setMyDataSub;

  /// No description provided for @setResetAll.
  ///
  /// In en, this message translates to:
  /// **'Reset all data'**
  String get setResetAll;

  /// No description provided for @setEveryHours.
  ///
  /// In en, this message translates to:
  /// **'{h, plural, one{Every hour} other{Every {h} hours}}'**
  String setEveryHours(int h);

  /// No description provided for @setEveryMinutes.
  ///
  /// In en, this message translates to:
  /// **'{m, plural, one{Every minute} other{Every {m} minutes}}'**
  String setEveryMinutes(int m);

  /// No description provided for @setHealthNoConnect.
  ///
  /// In en, this message translates to:
  /// **'This device doesn\'t have Health Connect.'**
  String get setHealthNoConnect;

  /// No description provided for @setHealthNotInstalledTitle.
  ///
  /// In en, this message translates to:
  /// **'Health Connect isn\'t installed'**
  String get setHealthNotInstalledTitle;

  /// No description provided for @setHealthNeedsUpdateTitle.
  ///
  /// In en, this message translates to:
  /// **'Health Connect needs updating'**
  String get setHealthNeedsUpdateTitle;

  /// No description provided for @setHealthInstallBody.
  ///
  /// In en, this message translates to:
  /// **'The Health Connect app is needed to write your water intake to Android\'s health record.'**
  String get setHealthInstallBody;

  /// No description provided for @setOpenPlayStore.
  ///
  /// In en, this message translates to:
  /// **'Open in Play Store'**
  String get setOpenPlayStore;

  /// No description provided for @setHealthPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Permission denied, nothing will be written to the health record.'**
  String get setHealthPermissionDenied;

  /// No description provided for @setHealthEnabled.
  ///
  /// In en, this message translates to:
  /// **'From now on your water intake will also be written to Health Connect.'**
  String get setHealthEnabled;

  /// No description provided for @setCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get setCancel;

  /// No description provided for @setSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get setSave;

  /// No description provided for @setSuggested.
  ///
  /// In en, this message translates to:
  /// **'Suggested: {ml} ml'**
  String setSuggested(int ml);

  /// No description provided for @setBackToSuggested.
  ///
  /// In en, this message translates to:
  /// **'Back to suggested'**
  String get setBackToSuggested;

  /// No description provided for @setIntervalDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'How often should we remind you?'**
  String get setIntervalDialogTitle;

  /// No description provided for @setWakeHelp.
  ///
  /// In en, this message translates to:
  /// **'What time do you wake up?'**
  String get setWakeHelp;

  /// No description provided for @setSleepHelp.
  ///
  /// In en, this message translates to:
  /// **'What time do you go to sleep?'**
  String get setSleepHelp;

  /// No description provided for @setAwakeMin4h.
  ///
  /// In en, this message translates to:
  /// **'Your waking hours must be at least 4 hours'**
  String get setAwakeMin4h;

  /// No description provided for @setResetConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get setResetConfirmTitle;

  /// No description provided for @setResetConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'Your forest, streaks and all records will be deleted. This can\'t be undone.'**
  String get setResetConfirmBody;

  /// No description provided for @setResetConfirmButton.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get setResetConfirmButton;

  /// No description provided for @statsTitle.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statsTitle;

  /// No description provided for @statsDailyAverage.
  ///
  /// In en, this message translates to:
  /// **'Daily average'**
  String get statsDailyAverage;

  /// No description provided for @statsGoalDays.
  ///
  /// In en, this message translates to:
  /// **'Days goal met'**
  String get statsGoalDays;

  /// No description provided for @statsCurrentStreak.
  ///
  /// In en, this message translates to:
  /// **'Current streak'**
  String get statsCurrentStreak;

  /// No description provided for @statsUnitDays.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get statsUnitDays;

  /// No description provided for @statsTotalTrees.
  ///
  /// In en, this message translates to:
  /// **'Total trees'**
  String get statsTotalTrees;

  /// No description provided for @statsLastDays.
  ///
  /// In en, this message translates to:
  /// **'Last {days} days'**
  String statsLastDays(int days);

  /// No description provided for @statsYourDrinks.
  ///
  /// In en, this message translates to:
  /// **'Your drinks'**
  String get statsYourDrinks;

  /// No description provided for @statsRangeDays.
  ///
  /// In en, this message translates to:
  /// **'{days} days'**
  String statsRangeDays(int days);

  /// No description provided for @statsWeekdayMon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get statsWeekdayMon;

  /// No description provided for @statsWeekdayTue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get statsWeekdayTue;

  /// No description provided for @statsWeekdayWed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get statsWeekdayWed;

  /// No description provided for @statsWeekdayThu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get statsWeekdayThu;

  /// No description provided for @statsWeekdayFri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get statsWeekdayFri;

  /// No description provided for @statsWeekdaySat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get statsWeekdaySat;

  /// No description provided for @statsWeekdaySun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get statsWeekdaySun;

  /// No description provided for @statsNoRecords.
  ///
  /// In en, this message translates to:
  /// **'No records yet.'**
  String get statsNoRecords;

  /// No description provided for @statsBmiTitle.
  ///
  /// In en, this message translates to:
  /// **'Body mass index'**
  String get statsBmiTitle;

  /// No description provided for @statsBmiDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'For information only,\nnot medical advice'**
  String get statsBmiDisclaimer;

  /// No description provided for @statsAchievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get statsAchievements;

  /// No description provided for @statsAchievementsEarned.
  ///
  /// In en, this message translates to:
  /// **'{count} earned'**
  String statsAchievementsEarned(int count);

  /// No description provided for @achScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achScreenTitle;

  /// No description provided for @forestTitle.
  ///
  /// In en, this message translates to:
  /// **'Your forest'**
  String get forestTitle;

  /// No description provided for @forestSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{trees} trees • best streak {days} days'**
  String forestSubtitle(int trees, int days);

  /// No description provided for @forestSpeciesTooltip.
  ///
  /// In en, this message translates to:
  /// **'Tree species'**
  String get forestSpeciesTooltip;

  /// No description provided for @forestEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your forest is still empty'**
  String get forestEmptyTitle;

  /// No description provided for @forestEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'When you drink your first glass, a sapling will appear here.'**
  String get forestEmptyBody;

  /// No description provided for @speciesScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Tree species'**
  String get speciesScreenTitle;

  /// No description provided for @speciesScreenIntro.
  ///
  /// In en, this message translates to:
  /// **'You can choose the species of tomorrow\'s sapling. The old trees in your forest keep the species they were planted as.'**
  String get speciesScreenIntro;

  /// No description provided for @speciesScreenSelected.
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get speciesScreenSelected;

  /// No description provided for @speciesScreenUnlocked.
  ///
  /// In en, this message translates to:
  /// **'Unlocked'**
  String get speciesScreenUnlocked;

  /// No description provided for @speciesScreenUnlockTitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock the {name} tree'**
  String speciesScreenUnlockTitle(String name);

  /// No description provided for @speciesScreenRewardBody.
  ///
  /// In en, this message translates to:
  /// **'Watch a short ad to unlock this species for good. The ad is entirely optional — there are no forced ads anywhere in the app.'**
  String get speciesScreenRewardBody;

  /// No description provided for @speciesScreenCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get speciesScreenCancel;

  /// No description provided for @speciesScreenWatchAd.
  ///
  /// In en, this message translates to:
  /// **'Watch ad'**
  String get speciesScreenWatchAd;

  /// No description provided for @seasonScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Forest theme'**
  String get seasonScreenTitle;

  /// No description provided for @seasonScreenIntro.
  ///
  /// In en, this message translates to:
  /// **'Your forest\'s colors change, not its trees. No theme affects your tracking, goal, or streak.'**
  String get seasonScreenIntro;

  /// No description provided for @seasonScreenProOnly.
  ///
  /// In en, this message translates to:
  /// **'Pro members only'**
  String get seasonScreenProOnly;

  /// No description provided for @seasonScreenSelected.
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get seasonScreenSelected;

  /// No description provided for @setSectionHome.
  ///
  /// In en, this message translates to:
  /// **'Home screen'**
  String get setSectionHome;

  /// No description provided for @setAddWidget.
  ///
  /// In en, this message translates to:
  /// **'Add widget to home screen'**
  String get setAddWidget;

  /// No description provided for @setAddWidgetSub.
  ///
  /// In en, this message translates to:
  /// **'Add water with one tap, without opening the app'**
  String get setAddWidgetSub;

  /// No description provided for @setAddWidgetManual.
  ///
  /// In en, this message translates to:
  /// **'Long-press your home screen → Widgets → pick Sipling'**
  String get setAddWidgetManual;

  /// No description provided for @wrappedTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Forest Wrapped'**
  String get wrappedTitle;

  /// No description provided for @wrappedHeadline.
  ///
  /// In en, this message translates to:
  /// **'Your journey so far'**
  String get wrappedHeadline;

  /// No description provided for @wrappedLiters.
  ///
  /// In en, this message translates to:
  /// **'{liters} L'**
  String wrappedLiters(int liters);

  /// No description provided for @wrappedLitersLabel.
  ///
  /// In en, this message translates to:
  /// **'total water'**
  String get wrappedLitersLabel;

  /// No description provided for @wrappedTreesLabel.
  ///
  /// In en, this message translates to:
  /// **'trees'**
  String get wrappedTreesLabel;

  /// No description provided for @wrappedStreakLabel.
  ///
  /// In en, this message translates to:
  /// **'best streak'**
  String get wrappedStreakLabel;

  /// No description provided for @wrappedDaysLabel.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get wrappedDaysLabel;

  /// No description provided for @wrappedShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get wrappedShare;

  /// No description provided for @wrappedShareText.
  ///
  /// In en, this message translates to:
  /// **'I\'m growing my forest with Sipling, one sip at a time 🌱 sipling-app.web.app'**
  String get wrappedShareText;

  /// No description provided for @homeMoreDrinks.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get homeMoreDrinks;

  /// No description provided for @addFactorWaterEq.
  ///
  /// In en, this message translates to:
  /// **'≈ {ml} ml water ({percent}%)'**
  String addFactorWaterEq(int ml, int percent);

  /// No description provided for @proPerMonth.
  ///
  /// In en, this message translates to:
  /// **'{price} / month'**
  String proPerMonth(String price);

  /// No description provided for @proRestore.
  ///
  /// In en, this message translates to:
  /// **'Restore purchases'**
  String get proRestore;

  /// No description provided for @proTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get proTerms;

  /// No description provided for @proPrivacyLink.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get proPrivacyLink;

  /// No description provided for @proStoreUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Store isn\'t available right now'**
  String get proStoreUnavailable;

  /// No description provided for @proAutoRenew.
  ///
  /// In en, this message translates to:
  /// **'Monthly subscription, renews automatically. Cancel at least 24 hours before renewal in your store account settings; otherwise it renews.'**
  String get proAutoRenew;

  /// No description provided for @homeCalcNeed.
  ///
  /// In en, this message translates to:
  /// **'My water need'**
  String get homeCalcNeed;

  /// No description provided for @needTitle.
  ///
  /// In en, this message translates to:
  /// **'Your daily water need'**
  String get needTitle;

  /// No description provided for @needIntro.
  ///
  /// In en, this message translates to:
  /// **'Enter your height, weight and activity level and Sipling works out how much you need in a day.'**
  String get needIntro;

  /// No description provided for @needResultLabel.
  ///
  /// In en, this message translates to:
  /// **'Recommended for you'**
  String get needResultLabel;

  /// No description provided for @needCurrentGoal.
  ///
  /// In en, this message translates to:
  /// **'Your current goal: {ml} ml'**
  String needCurrentGoal(int ml);

  /// No description provided for @needApply.
  ///
  /// In en, this message translates to:
  /// **'Make this my goal'**
  String get needApply;

  /// No description provided for @needApplied.
  ///
  /// In en, this message translates to:
  /// **'Your goal has been updated'**
  String get needApplied;

  /// No description provided for @needMeasuresTitle.
  ///
  /// In en, this message translates to:
  /// **'Your measurements'**
  String get needMeasuresTitle;

  /// No description provided for @needLearnTitle.
  ///
  /// In en, this message translates to:
  /// **'Water and your body'**
  String get needLearnTitle;

  /// No description provided for @factNotifTitle1.
  ///
  /// In en, this message translates to:
  /// **'Three quarters water'**
  String get factNotifTitle1;

  /// No description provided for @factNotifBody1.
  ///
  /// In en, this message translates to:
  /// **'Roughly three quarters of your brain is water. Keep it topped up.'**
  String get factNotifBody1;

  /// No description provided for @factNotifTitle2.
  ///
  /// In en, this message translates to:
  /// **'Focus needs water'**
  String get factNotifTitle2;

  /// No description provided for @factNotifBody2.
  ///
  /// In en, this message translates to:
  /// **'Losing just 1-2% of your body water can make it harder to concentrate.'**
  String get factNotifBody2;

  /// No description provided for @factNotifTitle3.
  ///
  /// In en, this message translates to:
  /// **'Thirst arrives late'**
  String get factNotifTitle3;

  /// No description provided for @factNotifBody3.
  ///
  /// In en, this message translates to:
  /// **'By the time you feel thirsty, your body has already started running low.'**
  String get factNotifBody3;

  /// No description provided for @factNotifTitle4.
  ///
  /// In en, this message translates to:
  /// **'Your built-in cooling'**
  String get factNotifTitle4;

  /// No description provided for @factNotifBody4.
  ///
  /// In en, this message translates to:
  /// **'Sweating is how your body cools itself, and it spends water doing it.'**
  String get factNotifBody4;

  /// No description provided for @factNotifTitle5.
  ///
  /// In en, this message translates to:
  /// **'Check the colour'**
  String get factNotifTitle5;

  /// No description provided for @factNotifBody5.
  ///
  /// In en, this message translates to:
  /// **'Pale yellow usually means you are well hydrated. Darker means drink up.'**
  String get factNotifBody5;

  /// No description provided for @factLearn1Title.
  ///
  /// In en, this message translates to:
  /// **'More than half of you is water'**
  String get factLearn1Title;

  /// No description provided for @factLearn1Body.
  ///
  /// In en, this message translates to:
  /// **'Water makes up roughly 50-60% of an adult body and about 73% of the brain. It carries nutrients, cushions your joints and keeps your temperature steady.'**
  String get factLearn1Body;

  /// No description provided for @factLearn2Title.
  ///
  /// In en, this message translates to:
  /// **'What happens when you drink too little'**
  String get factLearn2Title;

  /// No description provided for @factLearn2Body.
  ///
  /// In en, this message translates to:
  /// **'Even mild dehydration, losing about 1-2% of your body water, is linked to tiredness, headaches, weaker concentration and a lower mood. Over the longer term, drinking too little makes constipation and kidney stones more likely.'**
  String get factLearn2Body;

  /// No description provided for @factLearn3Title.
  ///
  /// In en, this message translates to:
  /// **'Thirst is a late signal'**
  String get factLearn3Title;

  /// No description provided for @factLearn3Body.
  ///
  /// In en, this message translates to:
  /// **'Thirst usually kicks in after your body has already lost water, and the feeling gets weaker with age. Drinking at regular intervals works better than waiting until you feel thirsty.'**
  String get factLearn3Body;

  /// No description provided for @factLearn4Title.
  ///
  /// In en, this message translates to:
  /// **'Urine colour is the simplest check'**
  String get factLearn4Title;

  /// No description provided for @factLearn4Body.
  ///
  /// In en, this message translates to:
  /// **'A pale straw colour usually means you are well hydrated, while dark yellow suggests you need more. Some vitamins and medicines change the colour, so treat it as a hint rather than a verdict.'**
  String get factLearn4Body;

  /// No description provided for @factLearn5Title.
  ///
  /// In en, this message translates to:
  /// **'How much is enough?'**
  String get factLearn5Title;

  /// No description provided for @factLearn5Body.
  ///
  /// In en, this message translates to:
  /// **'EFSA\'s reference for adequate intake from drinks is about 2 litres a day for women and 2.5 litres for men, in a temperate climate with moderate activity. Hot weather, exercise, pregnancy and breastfeeding all raise the need. Sipling adjusts this to your weight and activity level.'**
  String get factLearn5Body;

  /// No description provided for @homeBoost.
  ///
  /// In en, this message translates to:
  /// **'Hot day / sport'**
  String get homeBoost;

  /// No description provided for @boostTitle.
  ///
  /// In en, this message translates to:
  /// **'Boost today\'s goal'**
  String get boostTitle;

  /// No description provided for @boostBody.
  ///
  /// In en, this message translates to:
  /// **'On a hot day or after exercise, add extra to today\'s goal. It resets by itself tomorrow.'**
  String get boostBody;

  /// No description provided for @boostReset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get boostReset;

  /// No description provided for @boostActive.
  ///
  /// In en, this message translates to:
  /// **'+{ml} ml added today'**
  String boostActive(int ml);

  /// No description provided for @logTitle.
  ///
  /// In en, this message translates to:
  /// **'Today\'s entries'**
  String get logTitle;

  /// No description provided for @logEmpty.
  ///
  /// In en, this message translates to:
  /// **'No entries yet today'**
  String get logEmpty;

  /// No description provided for @logOpen.
  ///
  /// In en, this message translates to:
  /// **'Today\'s entries'**
  String get logOpen;

  /// No description provided for @logDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get logDelete;

  /// No description provided for @setReminderStyle.
  ///
  /// In en, this message translates to:
  /// **'Reminder style'**
  String get setReminderStyle;

  /// No description provided for @styleNormal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get styleNormal;

  /// No description provided for @styleNormalSub.
  ///
  /// In en, this message translates to:
  /// **'Sound and vibration'**
  String get styleNormalSub;

  /// No description provided for @styleGentle.
  ///
  /// In en, this message translates to:
  /// **'Gentle'**
  String get styleGentle;

  /// No description provided for @styleGentleSub.
  ///
  /// In en, this message translates to:
  /// **'Vibration only, no sound'**
  String get styleGentleSub;

  /// No description provided for @styleSilent.
  ///
  /// In en, this message translates to:
  /// **'Silent'**
  String get styleSilent;

  /// No description provided for @styleSilentSub.
  ///
  /// In en, this message translates to:
  /// **'No sound or vibration'**
  String get styleSilentSub;

  /// No description provided for @speciesScreenAdUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Ad isn\'t ready right now. Try again in a moment.'**
  String get speciesScreenAdUnavailable;

  /// No description provided for @setHotDayTitle.
  ///
  /// In en, this message translates to:
  /// **'Hot day alert'**
  String get setHotDayTitle;

  /// No description provided for @setHotDaySub.
  ///
  /// In en, this message translates to:
  /// **'Extra water reminder when it\'s hot in your city (iPhone only)'**
  String get setHotDaySub;

  /// No description provided for @setHotDayCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get setHotDayCity;

  /// No description provided for @setHotDayCitySet.
  ///
  /// In en, this message translates to:
  /// **'Set'**
  String get setHotDayCitySet;

  /// No description provided for @setHotDayCityHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Istanbul'**
  String get setHotDayCityHint;

  /// No description provided for @notifHotDayTitle.
  ///
  /// In en, this message translates to:
  /// **'It\'s hot today 🌡️'**
  String get notifHotDayTitle;

  /// No description provided for @notifHotDayBody.
  ///
  /// In en, this message translates to:
  /// **'It\'s {temp}°C today — aim to sip a bit more often.'**
  String notifHotDayBody(int temp);

  /// No description provided for @setThemeTitle.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get setThemeTitle;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'Follow system'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @setHowTo.
  ///
  /// In en, this message translates to:
  /// **'How Sipling works'**
  String get setHowTo;

  /// No description provided for @tourNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get tourNext;

  /// No description provided for @tourBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get tourBack;

  /// No description provided for @tourSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get tourSkip;

  /// No description provided for @tourDone.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get tourDone;

  /// No description provided for @tourT1.
  ///
  /// In en, this message translates to:
  /// **'Drink, water your sapling'**
  String get tourT1;

  /// No description provided for @tourB1.
  ///
  /// In en, this message translates to:
  /// **'Tap a cup on the home screen to log a sip. Every glass waters your sapling — tapped one by mistake? Use the undo arrow.'**
  String get tourB1;

  /// No description provided for @tourT2.
  ///
  /// In en, this message translates to:
  /// **'Your daily goal'**
  String get tourT2;

  /// No description provided for @tourB2.
  ///
  /// In en, this message translates to:
  /// **'Sipling works out a goal from your height, weight, age and activity. Change it any time in Settings, or recalculate it on the “Water and your body” screen.'**
  String get tourB2;

  /// No description provided for @tourT3.
  ///
  /// In en, this message translates to:
  /// **'Reminders that fit your day'**
  String get tourT3;

  /// No description provided for @tourB3.
  ///
  /// In en, this message translates to:
  /// **'Turn reminders on in Settings, then set your waking hours and how often you want a nudge. Once you reach your goal, the rest of the day stays quiet.'**
  String get tourB3;

  /// No description provided for @tourT4.
  ///
  /// In en, this message translates to:
  /// **'Grow your forest'**
  String get tourT4;

  /// No description provided for @tourB4.
  ///
  /// In en, this message translates to:
  /// **'Reach your goal and your sapling becomes a tree in your forest. Trees never wither — a missed day costs you nothing.'**
  String get tourB4;
}

class _LDelegate extends LocalizationsDelegate<L> {
  const _LDelegate();

  @override
  Future<L> load(Locale locale) {
    return SynchronousFuture<L>(lookupL(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'id',
    'it',
    'ja',
    'ko',
    'nl',
    'pl',
    'pt',
    'ru',
    'th',
    'tr',
    'uk',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_LDelegate old) => false;
}

L lookupL(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hant':
            return LZhHant();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return LAr();
    case 'de':
      return LDe();
    case 'en':
      return LEn();
    case 'es':
      return LEs();
    case 'fr':
      return LFr();
    case 'hi':
      return LHi();
    case 'id':
      return LId();
    case 'it':
      return LIt();
    case 'ja':
      return LJa();
    case 'ko':
      return LKo();
    case 'nl':
      return LNl();
    case 'pl':
      return LPl();
    case 'pt':
      return LPt();
    case 'ru':
      return LRu();
    case 'th':
      return LTh();
    case 'tr':
      return LTr();
    case 'uk':
      return LUk();
    case 'vi':
      return LVi();
    case 'zh':
      return LZh();
  }

  throw FlutterError(
    'L.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
