// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class LEn extends L {
  LEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Sipling';

  @override
  String get drinkWater => 'Water';

  @override
  String get drinkTea => 'Tea';

  @override
  String get drinkCoffee => 'Coffee';

  @override
  String get drinkMilk => 'Milk';

  @override
  String get drinkJuice => 'Juice';

  @override
  String get drinkSoda => 'Soda';

  @override
  String get drinkAlcohol => 'Alcohol';

  @override
  String get speciesOak => 'Oak';

  @override
  String get speciesPine => 'Pine';

  @override
  String get speciesCherry => 'Sakura';

  @override
  String get speciesAcacia => 'Acacia';

  @override
  String get speciesMaple => 'Maple';

  @override
  String get speciesOlive => 'Olive';

  @override
  String get speciesGolden => 'Golden Leaf';

  @override
  String get speciesJacaranda => 'Jacaranda';

  @override
  String get unlockFree => 'Unlocked';

  @override
  String unlockStreak(int days) {
    return 'Hit your goal $days days in a row';
  }

  @override
  String unlockTotalTrees(int count) {
    return 'Grow $count trees in total';
  }

  @override
  String get unlockRewardedAd => 'Watch a short ad';

  @override
  String get unlockPro => 'Pro members only';

  @override
  String get achFirstSproutTitle => 'First Sprout';

  @override
  String get achFirstSproutDesc => 'You drank your first glass';

  @override
  String get achFirstTreeTitle => 'First Tree';

  @override
  String get achFirstTreeDesc => 'You completed a daily goal';

  @override
  String get achStreak3Title => 'A Habit Begins';

  @override
  String get achStreak3Desc => 'You hit your goal 3 days in a row';

  @override
  String get achStreak7Title => 'A Full Week';

  @override
  String get achStreak7Desc => 'You hit your goal 7 days in a row';

  @override
  String get achStreak30Title => 'A Month Unbroken';

  @override
  String get achStreak30Desc => 'You hit your goal 30 days in a row';

  @override
  String get achTrees10Title => 'Little Grove';

  @override
  String get achTrees10Desc => 'You grew 10 trees';

  @override
  String get achTrees50Title => 'Forest Keeper';

  @override
  String get achTrees50Desc => 'You grew 50 trees';

  @override
  String get achEarlyBirdTitle => 'Early Riser';

  @override
  String get achEarlyBirdDesc => 'You drank water before 9 a.m.';

  @override
  String get achVarietyTitle => 'Varied Palate';

  @override
  String get achVarietyDesc => 'You logged at least 4 different drinks';

  @override
  String get achPerfectWeekTitle => 'Perfect Week';

  @override
  String get achPerfectWeekDesc => 'You hit your goal every day for 7 days';

  @override
  String get seasonClassicName => 'Classic';

  @override
  String get seasonClassicDesc => 'Evergreen, all year round';

  @override
  String get seasonAutoName => 'Automatic';

  @override
  String get seasonAutoDesc => 'Let your forest follow the calendar';

  @override
  String get seasonSpringName => 'Spring';

  @override
  String get seasonSpringDesc => 'Fresh leaves, bright sky';

  @override
  String get seasonSummerName => 'Summer';

  @override
  String get seasonSummerDesc => 'Deep, saturated greens';

  @override
  String get seasonAutumnName => 'Autumn';

  @override
  String get seasonAutumnDesc => 'Orange leaves, warm light';

  @override
  String get seasonWinterName => 'Winter';

  @override
  String get seasonWinterDesc => 'Snowy hills, cold light';

  @override
  String get bmiUnderweight => 'Underweight';

  @override
  String get bmiNormal => 'Normal';

  @override
  String get bmiOverweight => 'Overweight';

  @override
  String get bmiObese => 'Obese';

  @override
  String get notifTitle1 => 'Time for water 💧';

  @override
  String get notifBody1 => 'Your sapling is waiting — shall we have a glass?';

  @override
  String get notifTitle2 => 'One more sip';

  @override
  String get notifBody2 => 'Small sips make big trees.';

  @override
  String get notifTitle3 => 'Your sapling is thirsty 🌱';

  @override
  String get notifBody3 => 'A glass of water helps it grow a little more.';

  @override
  String get notifTitle4 => 'Reminder';

  @override
  String get notifBody4 => 'One step closer to today\'s tree.';

  @override
  String get notifTitle5 => 'Water break';

  @override
  String get notifBody5 => 'The glass you drink now is tonight\'s tree.';

  @override
  String get activityLow => 'Sedentary';

  @override
  String get activityLowHint => 'Desk job, little walking';

  @override
  String get activityMedium => 'Moderate';

  @override
  String get activityMediumHint => 'Exercise 1-3 days a week';

  @override
  String get activityHigh => 'Active';

  @override
  String get activityHighHint => 'Exercise 4+ days a week';

  @override
  String get cupGlass => 'Glass';

  @override
  String get cupBottle => 'Bottle';

  @override
  String get cupLarge => 'Large';

  @override
  String get homeNewAchievement => 'New achievement';

  @override
  String get homeUndoLast => 'Undo last entry';

  @override
  String get homeStageSeed =>
      'Your seed is in the soil, waiting for its first sip';

  @override
  String get homeStageSprout => 'It sprouted 🌱';

  @override
  String get homeStageSapling => 'Your sapling is growing';

  @override
  String get homeStageAlmost => 'Almost a tree!';

  @override
  String get homeStageReady => 'Today\'s tree is ready 🌳';

  @override
  String get homePaceDone => 'A new sapling is waiting for you tomorrow';

  @override
  String get homePaceStart => 'Start your day with a glass';

  @override
  String homePaceBehind(int ml) {
    return 'You\'re $ml ml behind for this hour — you can still catch up';
  }

  @override
  String get homePaceOnTrack => 'You\'re right on pace 👌';

  @override
  String get homeGoalDone => 'You\'ve hit your daily goal';

  @override
  String homeRemaining(int ml) {
    return '$ml ml left';
  }

  @override
  String homeStreakDays(int days) {
    return '$days days';
  }

  @override
  String get homeCelebrateTitle => 'Your tree has grown!';

  @override
  String get homeCelebrateBody =>
      'You\'ve hit today\'s goal. This tree is now part of your forest.';

  @override
  String homeStreakLabel(int days) {
    return '$days-day streak';
  }

  @override
  String get homeCelebrateOk => 'Great';

  @override
  String get addWhatTitle => 'What did you drink?';

  @override
  String get addAmount => 'Amount';

  @override
  String get addConfirm => 'Add';

  @override
  String get addFactorWater => 'Counts fully toward your goal.';

  @override
  String get addFactorAlcohol =>
      'Alcohol dehydrates you, so it\'s subtracted from your goal.';

  @override
  String addFactorPercent(int percent) {
    return 'Counts $percent% toward your goal.';
  }

  @override
  String get sumTitle => 'Yesterday\'s summary';

  @override
  String get sumTreeGrown => 'Your tree has grown 🌳';

  @override
  String get sumSaplingOnWay => 'Your sapling is on its way 🌱';

  @override
  String get sumBodyDone =>
      'You hit your goal. This tree is part of your forest.';

  @override
  String sumPercent(int percent) {
    return 'You reached $percent% of your goal yesterday. Your sapling is waiting right where you left it — no tree ever withers.';
  }

  @override
  String get sumStatCounted => 'Counted';

  @override
  String get sumStatGoal => 'Goal';

  @override
  String get sumStatStreak => 'Streak';

  @override
  String sumStreakDays(int days) {
    return '$days days';
  }

  @override
  String get sumStartToday => 'Start today';

  @override
  String get sumWhatDrank => 'What you drank';

  @override
  String sumDrinkAmount(String name, int ml) {
    return '$name $ml ml';
  }

  @override
  String get navToday => 'Today';

  @override
  String get navForest => 'Forest';

  @override
  String get navStats => 'Stats';

  @override
  String get navSettings => 'Settings';

  @override
  String get onbContinue => 'Continue';

  @override
  String get onbFinish => 'Plant my sapling';

  @override
  String get onbWelcomeTagline =>
      'Every sip, a sapling.\nDrink water and your tree grows; as the days pass, so does your forest.';

  @override
  String get onbWelcomeNoPenalty =>
      'Your tree never withers. No penalties here.';

  @override
  String get onbGenderTitle => 'Let\'s get to know you';

  @override
  String get onbGenderSubtitle =>
      'Your daily water goal is calculated from this. It all stays on your phone and is never sent anywhere.';

  @override
  String get onbGenderFemale => 'Female';

  @override
  String get onbGenderMale => 'Male';

  @override
  String get onbGenderOther => 'Prefer not to say';

  @override
  String get onbBodyTitle => 'Height, weight, age';

  @override
  String get onbBodySubtitle => 'Slide to adjust.';

  @override
  String get onbBodyAge => 'Age';

  @override
  String get onbBodyHeight => 'Height';

  @override
  String get onbBodyWeight => 'Weight';

  @override
  String get onbBodyBmiLabel => 'Your body mass index';

  @override
  String get onbBodyDisclaimer => 'For information only, not medical advice.';

  @override
  String get onbActivityTitle => 'How active are you?';

  @override
  String get onbActivitySubtitle =>
      'The more you sweat, the more water you need.';

  @override
  String get onbGoalTitle => 'Your daily goal';

  @override
  String get onbGoalSubtitle => 'You can change it anytime in Settings.';

  @override
  String get onbGoalUnit => 'milliliters / day';

  @override
  String onbGoalGlasses(int glasses) {
    return 'about $glasses glasses';
  }

  @override
  String get onbGoalReference =>
      'This goal is adapted to your weight and activity level, based on the adequate water intake reference from the European Food Safety Authority (EFSA, 2010). Water you get from food is not included in this number.';

  @override
  String get proAppBarTitle => 'Sipling Pro';

  @override
  String get proHeaderTitle => 'Ad-free Sipling';

  @override
  String get proHeaderSub => 'Keep your forest growing';

  @override
  String get proPerkNoAdsTitle => 'Zero ads';

  @override
  String get proPerkNoAdsSub => 'Even the daily summary ad disappears';

  @override
  String get proPerkTreesTitle => 'Every tree species';

  @override
  String get proPerkTreesSub => 'Including Golden Leaf and Jacaranda';

  @override
  String get proPerkHistoryTitle => 'Unlimited history';

  @override
  String get proPerkHistorySub => 'Detailed stats for every month';

  @override
  String get proPerkThemesTitle => 'Theme options';

  @override
  String get proPerkThemesSub => 'Seasonal forest looks';

  @override
  String get proPerkSupportTitle => 'Support development';

  @override
  String get proPerkSupportSub => 'Sipling is a one-person project';

  @override
  String get proNotConnectedNote =>
      'Purchases aren\'t connected yet. For now you can toggle Pro on and off to try it out.';

  @override
  String get proButtonOn => 'Pro is on — turn off';

  @override
  String get proButtonTry => 'Try Pro';

  @override
  String get batAppBarTitle => 'If notifications aren\'t arriving';

  @override
  String get batIntro =>
      'Some phone brands shut down background apps to save battery, so reminders can be delayed or may not arrive at all. Making the setting below once is enough.';

  @override
  String get batXiaomi1 =>
      'Settings → Apps → Sipling → Battery saver → \"No restrictions\"';

  @override
  String get batXiaomi2 => 'Settings → Apps → Sipling → Autostart → On';

  @override
  String get batXiaomi3 =>
      'On the recent apps screen, pull Sipling down and tap the lock icon';

  @override
  String get batSamsung1 =>
      'Settings → Apps → Sipling → Battery → \"Unrestricted\"';

  @override
  String get batSamsung2 =>
      'Settings → Battery → Background usage limits → remove Sipling from the \"Sleeping apps\" list';

  @override
  String get batHuawei1 =>
      'Settings → Battery → App launch → Sipling → turn off Manage automatically';

  @override
  String get batHuawei2 =>
      'Turn on Auto-launch, Secondary launch and Run in background';

  @override
  String get batOppo1 =>
      'Settings → Battery → High background power consumption → allow Sipling';

  @override
  String get batOppo2 =>
      'Settings → Apps → Sipling → Battery usage → Allow background activity';

  @override
  String get batFooter =>
      'Menu names may vary a little depending on your phone model. What you\'re looking for is a setting like \"battery optimization\", \"background activity\" or \"autostart\".';

  @override
  String get setTitle => 'Settings';

  @override
  String get setSectionGoal => 'Goal';

  @override
  String get setSectionReminders => 'Reminders';

  @override
  String get setSectionCups => 'My Cups';

  @override
  String get setSectionHealth => 'Health';

  @override
  String get setSectionAppearance => 'Appearance';

  @override
  String get setSectionApp => 'App';

  @override
  String get setProTagline => 'Ad-free, every tree unlocked';

  @override
  String get setDailyGoal => 'Daily goal';

  @override
  String setMl(int ml) {
    return '$ml ml';
  }

  @override
  String get setProfileInfo => 'My profile';

  @override
  String setWeightKg(int kg) {
    return '$kg kg';
  }

  @override
  String get setRemindersOn => 'Reminders on';

  @override
  String get setFrequency => 'Frequency';

  @override
  String get setAwakeHours => 'My waking hours';

  @override
  String get setStopWhenDone => 'Stop when goal is met';

  @override
  String get setStopWhenDoneSub =>
      'Once you hit your daily goal, the remaining reminders are cancelled';

  @override
  String get setSilent => 'Silent notification';

  @override
  String get setSilentSub => 'No sound or vibration';

  @override
  String get setNotifNotArriving => 'Notifications not coming through?';

  @override
  String get setNotifNotArrivingSub =>
      'Your phone\'s battery settings may be blocking them';

  @override
  String get setHealthWrite => 'Write to Health Connect';

  @override
  String get setHealthWriteSub =>
      'Your water intake is also saved to Android\'s health record. Sipling never reads anything from there.';

  @override
  String get setDarkTheme => 'Dark theme';

  @override
  String get setForestTheme => 'Forest theme';

  @override
  String get setTreeSpecies => 'Tree species';

  @override
  String get setMyData => 'My data';

  @override
  String get setMyDataSub =>
      'Everything stays on your phone and is never sent anywhere';

  @override
  String get setResetAll => 'Reset all data';

  @override
  String setEveryHours(int h) {
    String _temp0 = intl.Intl.pluralLogic(
      h,
      locale: localeName,
      other: 'Every $h hours',
      one: 'Every hour',
    );
    return '$_temp0';
  }

  @override
  String setEveryMinutes(int m) {
    String _temp0 = intl.Intl.pluralLogic(
      m,
      locale: localeName,
      other: 'Every $m minutes',
      one: 'Every minute',
    );
    return '$_temp0';
  }

  @override
  String get setHealthNoConnect => 'This device doesn\'t have Health Connect.';

  @override
  String get setHealthNotInstalledTitle => 'Health Connect isn\'t installed';

  @override
  String get setHealthNeedsUpdateTitle => 'Health Connect needs updating';

  @override
  String get setHealthInstallBody =>
      'The Health Connect app is needed to write your water intake to Android\'s health record.';

  @override
  String get setOpenPlayStore => 'Open in Play Store';

  @override
  String get setHealthPermissionDenied =>
      'Permission denied, nothing will be written to the health record.';

  @override
  String get setHealthEnabled =>
      'From now on your water intake will also be written to Health Connect.';

  @override
  String get setCancel => 'Cancel';

  @override
  String get setSave => 'Save';

  @override
  String setSuggested(int ml) {
    return 'Suggested: $ml ml';
  }

  @override
  String get setBackToSuggested => 'Back to suggested';

  @override
  String get setIntervalDialogTitle => 'How often should we remind you?';

  @override
  String get setWakeHelp => 'What time do you wake up?';

  @override
  String get setSleepHelp => 'What time do you go to sleep?';

  @override
  String get setAwakeMin4h => 'Your waking hours must be at least 4 hours';

  @override
  String get setResetConfirmTitle => 'Are you sure?';

  @override
  String get setResetConfirmBody =>
      'Your forest, streaks and all records will be deleted. This can\'t be undone.';

  @override
  String get setResetConfirmButton => 'Reset';

  @override
  String get statsTitle => 'Statistics';

  @override
  String get statsDailyAverage => 'Daily average';

  @override
  String get statsGoalDays => 'Days goal met';

  @override
  String get statsCurrentStreak => 'Current streak';

  @override
  String get statsUnitDays => 'days';

  @override
  String get statsTotalTrees => 'Total trees';

  @override
  String statsLastDays(int days) {
    return 'Last $days days';
  }

  @override
  String get statsYourDrinks => 'Your drinks';

  @override
  String statsRangeDays(int days) {
    return '$days days';
  }

  @override
  String get statsWeekdayMon => 'Mon';

  @override
  String get statsWeekdayTue => 'Tue';

  @override
  String get statsWeekdayWed => 'Wed';

  @override
  String get statsWeekdayThu => 'Thu';

  @override
  String get statsWeekdayFri => 'Fri';

  @override
  String get statsWeekdaySat => 'Sat';

  @override
  String get statsWeekdaySun => 'Sun';

  @override
  String get statsNoRecords => 'No records yet.';

  @override
  String get statsBmiTitle => 'Body mass index';

  @override
  String get statsBmiDisclaimer => 'For information only,\nnot medical advice';

  @override
  String get statsAchievements => 'Achievements';

  @override
  String statsAchievementsEarned(int count) {
    return '$count earned';
  }

  @override
  String get achScreenTitle => 'Achievements';

  @override
  String get forestTitle => 'Your forest';

  @override
  String forestSubtitle(int trees, int days) {
    return '$trees trees • best streak $days days';
  }

  @override
  String get forestSpeciesTooltip => 'Tree species';

  @override
  String get forestEmptyTitle => 'Your forest is still empty';

  @override
  String get forestEmptyBody =>
      'When you drink your first glass, a sapling will appear here.';

  @override
  String get speciesScreenTitle => 'Tree species';

  @override
  String get speciesScreenIntro =>
      'You can choose the species of tomorrow\'s sapling. The old trees in your forest keep the species they were planted as.';

  @override
  String get speciesScreenSelected => 'Selected';

  @override
  String get speciesScreenUnlocked => 'Unlocked';

  @override
  String speciesScreenUnlockTitle(String name) {
    return 'Unlock the $name tree';
  }

  @override
  String get speciesScreenRewardBody =>
      'Watch a short ad to unlock this species for good. The ad is entirely optional — there are no forced ads anywhere in the app.';

  @override
  String get speciesScreenCancel => 'Cancel';

  @override
  String get speciesScreenWatchAd => 'Watch ad';

  @override
  String get seasonScreenTitle => 'Forest theme';

  @override
  String get seasonScreenIntro =>
      'Your forest\'s colors change, not its trees. No theme affects your tracking, goal, or streak.';

  @override
  String get seasonScreenProOnly => 'Pro members only';

  @override
  String get seasonScreenSelected => 'Selected';

  @override
  String get setSectionHome => 'Home screen';

  @override
  String get setAddWidget => 'Add widget to home screen';

  @override
  String get setAddWidgetSub =>
      'Add water with one tap, without opening the app';

  @override
  String get setAddWidgetManual =>
      'Long-press your home screen → Widgets → pick Sipling';

  @override
  String get wrappedTitle => 'Your Forest Wrapped';

  @override
  String get wrappedHeadline => 'Your journey so far';

  @override
  String wrappedLiters(int liters) {
    return '$liters L';
  }

  @override
  String get wrappedLitersLabel => 'total water';

  @override
  String get wrappedTreesLabel => 'trees';

  @override
  String get wrappedStreakLabel => 'best streak';

  @override
  String get wrappedDaysLabel => 'days';

  @override
  String get wrappedShare => 'Share';

  @override
  String get wrappedShareText =>
      'I\'m growing my forest with Sipling, one sip at a time 🌱 sipling-app.web.app';

  @override
  String get homeMoreDrinks => 'Other';

  @override
  String addFactorWaterEq(int ml, int percent) {
    return '≈ $ml ml water ($percent%)';
  }

  @override
  String proPerMonth(String price) {
    return '$price / month';
  }

  @override
  String get proRestore => 'Restore purchases';

  @override
  String get proTerms => 'Terms of Use';

  @override
  String get proPrivacyLink => 'Privacy Policy';

  @override
  String get proStoreUnavailable => 'Store isn\'t available right now';

  @override
  String get proAutoRenew =>
      'Monthly subscription, renews automatically. Cancel at least 24 hours before renewal in your store account settings; otherwise it renews.';

  @override
  String get homeCalcNeed => 'My water need';

  @override
  String get needTitle => 'Your daily water need';

  @override
  String get needIntro =>
      'Enter your height, weight and activity level and Sipling works out how much you need in a day.';

  @override
  String get needResultLabel => 'Recommended for you';

  @override
  String needCurrentGoal(int ml) {
    return 'Your current goal: $ml ml';
  }

  @override
  String get needApply => 'Make this my goal';

  @override
  String get needApplied => 'Your goal has been updated';

  @override
  String get needMeasuresTitle => 'Your measurements';

  @override
  String get needLearnTitle => 'Water and your body';

  @override
  String get factNotifTitle1 => 'Three quarters water';

  @override
  String get factNotifBody1 =>
      'Roughly three quarters of your brain is water. Keep it topped up.';

  @override
  String get factNotifTitle2 => 'Focus needs water';

  @override
  String get factNotifBody2 =>
      'Losing just 1-2% of your body water can make it harder to concentrate.';

  @override
  String get factNotifTitle3 => 'Thirst arrives late';

  @override
  String get factNotifBody3 =>
      'By the time you feel thirsty, your body has already started running low.';

  @override
  String get factNotifTitle4 => 'Your built-in cooling';

  @override
  String get factNotifBody4 =>
      'Sweating is how your body cools itself, and it spends water doing it.';

  @override
  String get factNotifTitle5 => 'Check the colour';

  @override
  String get factNotifBody5 =>
      'Pale yellow usually means you are well hydrated. Darker means drink up.';

  @override
  String get factLearn1Title => 'More than half of you is water';

  @override
  String get factLearn1Body =>
      'Water makes up roughly 50-60% of an adult body and about 73% of the brain. It carries nutrients, cushions your joints and keeps your temperature steady.';

  @override
  String get factLearn2Title => 'What happens when you drink too little';

  @override
  String get factLearn2Body =>
      'Even mild dehydration, losing about 1-2% of your body water, is linked to tiredness, headaches, weaker concentration and a lower mood. Over the longer term, drinking too little makes constipation and kidney stones more likely.';

  @override
  String get factLearn3Title => 'Thirst is a late signal';

  @override
  String get factLearn3Body =>
      'Thirst usually kicks in after your body has already lost water, and the feeling gets weaker with age. Drinking at regular intervals works better than waiting until you feel thirsty.';

  @override
  String get factLearn4Title => 'Urine colour is the simplest check';

  @override
  String get factLearn4Body =>
      'A pale straw colour usually means you are well hydrated, while dark yellow suggests you need more. Some vitamins and medicines change the colour, so treat it as a hint rather than a verdict.';

  @override
  String get factLearn5Title => 'How much is enough?';

  @override
  String get factLearn5Body =>
      'EFSA\'s reference for adequate intake from drinks is about 2 litres a day for women and 2.5 litres for men, in a temperate climate with moderate activity. Hot weather, exercise, pregnancy and breastfeeding all raise the need. Sipling adjusts this to your weight and activity level.';
}
