// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class LUk extends L {
  LUk([String locale = 'uk']) : super(locale);

  @override
  String get appName => 'Sipling';

  @override
  String get drinkWater => 'Вода';

  @override
  String get drinkTea => 'Чай';

  @override
  String get drinkCoffee => 'Кава';

  @override
  String get drinkMilk => 'Молоко';

  @override
  String get drinkJuice => 'Сік';

  @override
  String get drinkSoda => 'Газований напій';

  @override
  String get drinkAlcohol => 'Алкоголь';

  @override
  String get speciesOak => 'Дуб';

  @override
  String get speciesPine => 'Сосна';

  @override
  String get speciesCherry => 'Сакура';

  @override
  String get speciesAcacia => 'Акація';

  @override
  String get speciesMaple => 'Клен';

  @override
  String get speciesOlive => 'Олива';

  @override
  String get speciesGolden => 'Золотий лист';

  @override
  String get speciesJacaranda => 'Джакаранда';

  @override
  String get unlockFree => 'Відкрито';

  @override
  String unlockStreak(int days) {
    return 'Досягни цілі $days днів поспіль';
  }

  @override
  String unlockTotalTrees(int count) {
    return 'Вирости загалом $count дерев';
  }

  @override
  String get unlockRewardedAd => 'Переглянь коротку рекламу';

  @override
  String get unlockPro => 'Лише для Pro-учасників';

  @override
  String get achFirstSproutTitle => 'Перший паросток';

  @override
  String get achFirstSproutDesc => 'Ти випив свою першу склянку';

  @override
  String get achFirstTreeTitle => 'Перше дерево';

  @override
  String get achFirstTreeDesc => 'Ти досяг денної цілі';

  @override
  String get achStreak3Title => 'Звичка починається';

  @override
  String get achStreak3Desc => 'Ти досяг цілі 3 дні поспіль';

  @override
  String get achStreak7Title => 'Цілий тиждень';

  @override
  String get achStreak7Desc => 'Ти досяг цілі 7 днів поспіль';

  @override
  String get achStreak30Title => 'Місяць без перерви';

  @override
  String get achStreak30Desc => 'Ти досяг цілі 30 днів поспіль';

  @override
  String get achTrees10Title => 'Маленький гай';

  @override
  String get achTrees10Desc => 'Ти виростив 10 дерев';

  @override
  String get achTrees50Title => 'Охоронець лісу';

  @override
  String get achTrees50Desc => 'Ти виростив 50 дерев';

  @override
  String get achEarlyBirdTitle => 'Рання пташка';

  @override
  String get achEarlyBirdDesc => 'Ти випив воду до 9 ранку';

  @override
  String get achVarietyTitle => 'Різні смаки';

  @override
  String get achVarietyDesc => 'Ти записав щонайменше 4 різні напої';

  @override
  String get achPerfectWeekTitle => 'Ідеальний тиждень';

  @override
  String get achPerfectWeekDesc => 'Ти досягав цілі щодня протягом 7 днів';

  @override
  String get seasonClassicName => 'Класичний';

  @override
  String get seasonClassicDesc => 'Вічнозелений, цілий рік';

  @override
  String get seasonAutoName => 'Автоматичний';

  @override
  String get seasonAutoDesc => 'Твій ліс слідує за календарем';

  @override
  String get seasonSpringName => 'Весна';

  @override
  String get seasonSpringDesc => 'Свіже листя, ясне небо';

  @override
  String get seasonSummerName => 'Літо';

  @override
  String get seasonSummerDesc => 'Глибокі, насичені зелені';

  @override
  String get seasonAutumnName => 'Осінь';

  @override
  String get seasonAutumnDesc => 'Помаранчеве листя, тепле світло';

  @override
  String get seasonWinterName => 'Зима';

  @override
  String get seasonWinterDesc => 'Засніжені пагорби, холодне світло';

  @override
  String get bmiUnderweight => 'Недостатня вага';

  @override
  String get bmiNormal => 'Норма';

  @override
  String get bmiOverweight => 'Надмірна вага';

  @override
  String get bmiObese => 'Ожиріння';

  @override
  String get notifTitle1 => 'Час для води 💧';

  @override
  String get notifBody1 => 'Твій саджанець чекає — вип\'ємо склянку?';

  @override
  String get notifTitle2 => 'Ще один ковток';

  @override
  String get notifBody2 => 'Маленькі ковтки роблять великі дерева.';

  @override
  String get notifTitle3 => 'Твій саджанець хоче пити 🌱';

  @override
  String get notifBody3 => 'Склянка води допоможе йому трохи підрости.';

  @override
  String get notifTitle4 => 'Нагадування';

  @override
  String get notifBody4 => 'На крок ближче до сьогоднішнього дерева.';

  @override
  String get notifTitle5 => 'Перерва на воду';

  @override
  String get notifBody5 =>
      'Склянка, яку ти вип\'єш зараз, — це вечірнє дерево.';

  @override
  String get activityLow => 'Малорухливий';

  @override
  String get activityLowHint => 'Сидяча робота, мало ходьби';

  @override
  String get activityMedium => 'Помірний';

  @override
  String get activityMediumHint => 'Спорт 1-3 дні на тиждень';

  @override
  String get activityHigh => 'Активний';

  @override
  String get activityHighHint => 'Спорт 4+ дні на тиждень';

  @override
  String get cupGlass => 'Склянка';

  @override
  String get cupBottle => 'Пляшка';

  @override
  String get cupLarge => 'Велика';

  @override
  String get homeNewAchievement => 'Нове досягнення';

  @override
  String get homeUndoLast => 'Скасувати останній запис';

  @override
  String get homeStageSeed => 'Твоє насіння в землі й чекає на перший ковток';

  @override
  String get homeStageSprout => 'Проросло 🌱';

  @override
  String get homeStageSapling => 'Твій саджанець росте';

  @override
  String get homeStageAlmost => 'Майже дерево!';

  @override
  String get homeStageReady => 'Сьогоднішнє дерево готове 🌳';

  @override
  String get homePaceDone => 'Завтра на тебе чекає новий саджанець';

  @override
  String get homePaceStart => 'Почни день зі склянки';

  @override
  String homePaceBehind(int ml) {
    return 'Цієї години ти відстаєш на $ml ml — ще можна надолужити';
  }

  @override
  String get homePaceOnTrack => 'Ти тримаєш темп 👌';

  @override
  String get homeGoalDone => 'Ти досяг денної цілі';

  @override
  String homeRemaining(int ml) {
    return 'Залишилось $ml ml';
  }

  @override
  String homeStreakDays(int days) {
    return '$days днів';
  }

  @override
  String get homeCelebrateTitle => 'Твоє дерево виросло!';

  @override
  String get homeCelebrateBody =>
      'Ти досяг сьогоднішньої цілі. Це дерево тепер частина твого лісу.';

  @override
  String homeStreakLabel(int days) {
    return 'Серія $days днів';
  }

  @override
  String get homeCelebrateOk => 'Чудово';

  @override
  String get addWhatTitle => 'Що ти випив?';

  @override
  String get addAmount => 'Кількість';

  @override
  String get addConfirm => 'Додати';

  @override
  String get addFactorWater => 'Зараховується повністю до твоєї цілі.';

  @override
  String get addFactorAlcohol =>
      'Алкоголь зневоднює, тому віднімається від цілі.';

  @override
  String addFactorPercent(int percent) {
    return 'Зараховується на $percent% до твоєї цілі.';
  }

  @override
  String get sumTitle => 'Учорашній підсумок';

  @override
  String get sumTreeGrown => 'Твоє дерево виросло 🌳';

  @override
  String get sumSaplingOnWay => 'Твій саджанець у дорозі 🌱';

  @override
  String get sumBodyDone => 'Ти досяг цілі. Це дерево — частина твого лісу.';

  @override
  String sumPercent(int percent) {
    return 'Учора ти досяг $percent% своєї цілі. Твій саджанець чекає там, де ти зупинився, — жодне дерево ніколи не всихає.';
  }

  @override
  String get sumStatCounted => 'Зараховано';

  @override
  String get sumStatGoal => 'Ціль';

  @override
  String get sumStatStreak => 'Серія';

  @override
  String sumStreakDays(int days) {
    return '$days днів';
  }

  @override
  String get sumStartToday => 'Почати сьогодні';

  @override
  String get sumWhatDrank => 'Що ти випив';

  @override
  String sumDrinkAmount(String name, int ml) {
    return '$name $ml ml';
  }

  @override
  String get navToday => 'Сьогодні';

  @override
  String get navForest => 'Ліс';

  @override
  String get navStats => 'Статистика';

  @override
  String get navSettings => 'Налаштування';

  @override
  String get onbContinue => 'Далі';

  @override
  String get onbFinish => 'Посадити саджанець';

  @override
  String get onbWelcomeTagline =>
      'Кожен ковток — саджанець.\nПий воду, і твоє дерево росте; з днями росте й твій ліс.';

  @override
  String get onbWelcomeNoPenalty =>
      'Твоє дерево ніколи не всихає. Тут немає покарань.';

  @override
  String get onbGenderTitle => 'Познайомимося';

  @override
  String get onbGenderSubtitle =>
      'Твоя денна ціль води розраховується з цього. Усе лишається на твоєму телефоні й ніколи нікуди не надсилається.';

  @override
  String get onbGenderFemale => 'Жінка';

  @override
  String get onbGenderMale => 'Чоловік';

  @override
  String get onbGenderOther => 'Волію не вказувати';

  @override
  String get onbBodyTitle => 'Зріст, вага, вік';

  @override
  String get onbBodySubtitle => 'Проведи, щоб налаштувати.';

  @override
  String get onbBodyAge => 'Вік';

  @override
  String get onbBodyHeight => 'Зріст';

  @override
  String get onbBodyWeight => 'Вага';

  @override
  String get onbBodyBmiLabel => 'Твій індекс маси тіла';

  @override
  String get onbBodyDisclaimer => 'Лише для інформації, не медична порада.';

  @override
  String get onbActivityTitle => 'Наскільки ти активний?';

  @override
  String get onbActivitySubtitle =>
      'Що більше ти пітнієш, то більше води потрібно.';

  @override
  String get onbGoalTitle => 'Твоя денна ціль';

  @override
  String get onbGoalSubtitle => 'Можеш змінити її будь-коли в Налаштуваннях.';

  @override
  String get onbGoalUnit => 'мілілітри / день';

  @override
  String onbGoalGlasses(int glasses) {
    return 'приблизно $glasses склянок';
  }

  @override
  String get onbGoalReference =>
      'Ця ціль адаптована до твоєї ваги та рівня активності на основі референсного показника достатнього споживання води Європейського агентства з безпеки харчових продуктів (EFSA, 2010). Вода з їжі не входить у це число.';

  @override
  String get proAppBarTitle => 'Sipling Pro';

  @override
  String get proHeaderTitle => 'Sipling без реклами';

  @override
  String get proHeaderSub => 'Нехай твій ліс росте далі';

  @override
  String get proPerkNoAdsTitle => 'Нуль реклами';

  @override
  String get proPerkNoAdsSub => 'Зникає навіть реклама в денному підсумку';

  @override
  String get proPerkTreesTitle => 'Усі види дерев';

  @override
  String get proPerkTreesSub => 'Зокрема Золотий лист і Джакаранда';

  @override
  String get proPerkHistoryTitle => 'Необмежена історія';

  @override
  String get proPerkHistorySub => 'Докладна статистика за кожен місяць';

  @override
  String get proPerkThemesTitle => 'Варіанти теми';

  @override
  String get proPerkThemesSub => 'Сезонні образи лісу';

  @override
  String get proPerkSupportTitle => 'Підтримати розробку';

  @override
  String get proPerkSupportSub => 'Sipling — проєкт однієї людини';

  @override
  String get proNotConnectedNote =>
      'Покупки ще не підключені. Наразі ти можеш вмикати й вимикати Pro, щоб спробувати.';

  @override
  String get proButtonOn => 'Pro увімкнено — вимкнути';

  @override
  String get proButtonTry => 'Спробувати Pro';

  @override
  String get batAppBarTitle => 'Якщо сповіщення не приходять';

  @override
  String get batIntro =>
      'Деякі марки телефонів закривають фонові застосунки, щоб економити батарею, тож нагадування можуть запізнюватися або зовсім не приходити. Достатньо один раз зробити налаштування нижче.';

  @override
  String get batXiaomi1 =>
      'Налаштування → Застосунки → Sipling → Економія батареї → \"Без обмежень\"';

  @override
  String get batXiaomi2 =>
      'Налаштування → Застосунки → Sipling → Автозапуск → Увімкнути';

  @override
  String get batXiaomi3 =>
      'На екрані нещодавніх застосунків потягни Sipling вниз і торкнись значка замка';

  @override
  String get batSamsung1 =>
      'Налаштування → Застосунки → Sipling → Батарея → \"Без обмежень\"';

  @override
  String get batSamsung2 =>
      'Налаштування → Батарея → Обмеження фонового використання → прибери Sipling зі списку \"Сплячі застосунки\"';

  @override
  String get batHuawei1 =>
      'Налаштування → Батарея → Запуск застосунків → Sipling → вимкни Керувати автоматично';

  @override
  String get batHuawei2 =>
      'Увімкни Автозапуск, Вторинний запуск і Робота у фоні';

  @override
  String get batOppo1 =>
      'Налаштування → Батарея → Високе фонове споживання → дозволь Sipling';

  @override
  String get batOppo2 =>
      'Налаштування → Застосунки → Sipling → Використання батареї → Дозволити фонову активність';

  @override
  String get batFooter =>
      'Назви меню можуть трохи відрізнятися залежно від моделі телефона. Ти шукаєш налаштування на кшталт \"оптимізація батареї\", \"фонова активність\" або \"автозапуск\".';

  @override
  String get setTitle => 'Налаштування';

  @override
  String get setSectionGoal => 'Ціль';

  @override
  String get setSectionReminders => 'Нагадування';

  @override
  String get setSectionCups => 'Мої склянки';

  @override
  String get setSectionHealth => 'Здоров\'я';

  @override
  String get setSectionAppearance => 'Вигляд';

  @override
  String get setSectionApp => 'Застосунок';

  @override
  String get setProTagline => 'Без реклами, усі дерева відкриті';

  @override
  String get setDailyGoal => 'Денна ціль';

  @override
  String setMl(int ml) {
    return '$ml ml';
  }

  @override
  String get setProfileInfo => 'Мій профіль';

  @override
  String setWeightKg(int kg) {
    return '$kg kg';
  }

  @override
  String get setRemindersOn => 'Нагадування увімкнено';

  @override
  String get setFrequency => 'Частота';

  @override
  String get setAwakeHours => 'Мої години неспання';

  @override
  String get setStopWhenDone => 'Зупинити після досягнення цілі';

  @override
  String get setStopWhenDoneSub =>
      'Щойно ти досягнеш денної цілі, решта нагадувань скасовуються';

  @override
  String get setSilent => 'Тихе сповіщення';

  @override
  String get setSilentSub => 'Без звуку та вібрації';

  @override
  String get setNotifNotArriving => 'Сповіщення не приходять?';

  @override
  String get setNotifNotArrivingSub =>
      'Можливо, їх блокують налаштування батареї телефона';

  @override
  String get setHealthWrite => 'Записувати в Health Connect';

  @override
  String get setHealthWriteSub =>
      'Твоє споживання води також зберігається в журналі здоров\'я Android. Sipling ніколи нічого звідти не читає.';

  @override
  String get setDarkTheme => 'Темна тема';

  @override
  String get setForestTheme => 'Тема лісу';

  @override
  String get setTreeSpecies => 'Види дерев';

  @override
  String get setMyData => 'Мої дані';

  @override
  String get setMyDataSub =>
      'Усе лишається на твоєму телефоні й ніколи нікуди не надсилається';

  @override
  String get setResetAll => 'Скинути всі дані';

  @override
  String setEveryHours(int h) {
    return 'Кожні $h год';
  }

  @override
  String setEveryMinutes(int m) {
    return 'Кожні $m хв';
  }

  @override
  String get setHealthNoConnect => 'На цьому пристрої немає Health Connect.';

  @override
  String get setHealthNotInstalledTitle => 'Health Connect не встановлено';

  @override
  String get setHealthNeedsUpdateTitle => 'Health Connect потрібно оновити';

  @override
  String get setHealthInstallBody =>
      'Застосунок Health Connect потрібен, щоб записувати твоє споживання води в журнал здоров\'я Android.';

  @override
  String get setOpenPlayStore => 'Відкрити в Play Store';

  @override
  String get setHealthPermissionDenied =>
      'Дозвіл відхилено, у журнал здоров\'я нічого не записуватиметься.';

  @override
  String get setHealthEnabled =>
      'Відтепер твоє споживання води також записуватиметься в Health Connect.';

  @override
  String get setCancel => 'Скасувати';

  @override
  String get setSave => 'Зберегти';

  @override
  String setSuggested(int ml) {
    return 'Рекомендовано: $ml ml';
  }

  @override
  String get setBackToSuggested => 'Повернутися до рекомендованого';

  @override
  String get setIntervalDialogTitle => 'Як часто нагадувати?';

  @override
  String get setWakeHelp => 'О котрій ти прокидаєшся?';

  @override
  String get setSleepHelp => 'О котрій ти лягаєш спати?';

  @override
  String get setAwakeMin4h =>
      'Твої години неспання мають тривати щонайменше 4 години';

  @override
  String get setResetConfirmTitle => 'Ти впевнений?';

  @override
  String get setResetConfirmBody =>
      'Твій ліс, серії та всі записи буде видалено. Це не можна скасувати.';

  @override
  String get setResetConfirmButton => 'Скинути';

  @override
  String get statsTitle => 'Статистика';

  @override
  String get statsDailyAverage => 'Середнє за день';

  @override
  String get statsGoalDays => 'Дні з досягнутою ціллю';

  @override
  String get statsCurrentStreak => 'Поточна серія';

  @override
  String get statsUnitDays => 'днів';

  @override
  String get statsTotalTrees => 'Усього дерев';

  @override
  String statsLastDays(int days) {
    return 'Останні $days днів';
  }

  @override
  String get statsYourDrinks => 'Твої напої';

  @override
  String statsRangeDays(int days) {
    return '$days днів';
  }

  @override
  String get statsWeekdayMon => 'Пн';

  @override
  String get statsWeekdayTue => 'Вт';

  @override
  String get statsWeekdayWed => 'Ср';

  @override
  String get statsWeekdayThu => 'Чт';

  @override
  String get statsWeekdayFri => 'Пт';

  @override
  String get statsWeekdaySat => 'Сб';

  @override
  String get statsWeekdaySun => 'Нд';

  @override
  String get statsNoRecords => 'Ще немає записів.';

  @override
  String get statsBmiTitle => 'Індекс маси тіла';

  @override
  String get statsBmiDisclaimer => 'Лише для інформації,\nне медична порада';

  @override
  String get statsAchievements => 'Досягнення';

  @override
  String statsAchievementsEarned(int count) {
    return 'Здобуто $count';
  }

  @override
  String get achScreenTitle => 'Досягнення';

  @override
  String get forestTitle => 'Твій ліс';

  @override
  String forestSubtitle(int trees, int days) {
    return '$trees дерев • найкраща серія $days днів';
  }

  @override
  String get forestSpeciesTooltip => 'Види дерев';

  @override
  String get forestEmptyTitle => 'Твій ліс поки що порожній';

  @override
  String get forestEmptyBody =>
      'Коли ти вип\'єш першу склянку, тут з\'явиться саджанець.';

  @override
  String get speciesScreenTitle => 'Види дерев';

  @override
  String get speciesScreenIntro =>
      'Ти можеш обрати вид завтрашнього саджанця. Старі дерева у твоєму лісі зберігають вид, з яким їх посадили.';

  @override
  String get speciesScreenSelected => 'Обрано';

  @override
  String get speciesScreenUnlocked => 'Відкрито';

  @override
  String speciesScreenUnlockTitle(String name) {
    return 'Відкрити дерево $name';
  }

  @override
  String get speciesScreenRewardBody =>
      'Переглянь коротку рекламу, щоб відкрити цей вид назавжди. Реклама повністю необов\'язкова — ніде в застосунку немає примусової реклами.';

  @override
  String get speciesScreenCancel => 'Скасувати';

  @override
  String get speciesScreenWatchAd => 'Переглянути рекламу';

  @override
  String get seasonScreenTitle => 'Тема лісу';

  @override
  String get seasonScreenIntro =>
      'Змінюються кольори твого лісу, а не його дерева. Жодна тема не впливає на твій облік, ціль чи серію.';

  @override
  String get seasonScreenProOnly => 'Лише для Pro-учасників';

  @override
  String get seasonScreenSelected => 'Обрано';

  @override
  String get setSectionHome => 'Головний екран';

  @override
  String get setAddWidget => 'Додати віджет на головний екран';

  @override
  String get setAddWidgetSub =>
      'Додавайте воду одним дотиком, не відкриваючи застосунок';

  @override
  String get setAddWidgetManual =>
      'Утримуйте головний екран → Віджети → виберіть Sipling';

  @override
  String get wrappedTitle => 'Підсумок вашого лісу';

  @override
  String get wrappedHeadline => 'Ваш шлях досі';

  @override
  String wrappedLiters(int liters) {
    return '$liters L';
  }

  @override
  String get wrappedLitersLabel => 'усього води';

  @override
  String get wrappedTreesLabel => 'дерева';

  @override
  String get wrappedStreakLabel => 'найкраща серія';

  @override
  String get wrappedDaysLabel => 'дні';

  @override
  String get wrappedShare => 'Поділитися';

  @override
  String get wrappedShareText =>
      'Я вирощую свій ліс із Sipling, ковток за ковтком 🌱 sipling-app.web.app';

  @override
  String get homeMoreDrinks => 'Інше';

  @override
  String addFactorWaterEq(int ml, int percent) {
    return '≈ $ml мл води ($percent%)';
  }

  @override
  String proPerMonth(String price) {
    return '$price / міс.';
  }

  @override
  String get proRestore => 'Відновити покупки';

  @override
  String get proTerms => 'Умови використання';

  @override
  String get proPrivacyLink => 'Конфіденційність';

  @override
  String get proStoreUnavailable => 'Магазин зараз недоступний';

  @override
  String get proAutoRenew =>
      'Місячна підписка, поновлюється автоматично. Скасуйте щонайменше за 24 години до поновлення в налаштуваннях облікового запису магазину; інакше вона поновиться.';

  @override
  String get homeCalcNeed => 'Моя потреба у воді';

  @override
  String get needTitle => 'Твоя денна потреба у воді';

  @override
  String get needIntro =>
      'Введи свій зріст, вагу та рівень активності, і Sipling розрахує, скільки води тобі потрібно на день.';

  @override
  String get needResultLabel => 'Рекомендовано для тебе';

  @override
  String needCurrentGoal(int ml) {
    return 'Твоя поточна ціль: $ml ml';
  }

  @override
  String get needApply => 'Зробити це моєю ціллю';

  @override
  String get needApplied => 'Твою ціль оновлено';

  @override
  String get needMeasuresTitle => 'Твої показники';

  @override
  String get needLearnTitle => 'Вода і твоє тіло';

  @override
  String get factNotifTitle1 => 'Три чверті — вода';

  @override
  String get factNotifBody1 =>
      'Приблизно три чверті твого мозку — вода. Підтримуй її рівень.';

  @override
  String get factNotifTitle2 => 'Концентрації потрібна вода';

  @override
  String get factNotifBody2 =>
      'Втрата лише 1-2% води в організмі може ускладнити концентрацію.';

  @override
  String get factNotifTitle3 => 'Спрага приходить пізно';

  @override
  String get factNotifBody3 =>
      'Коли ти відчуваєш спрагу, твій організм уже почав відчувати нестачу води.';

  @override
  String get factNotifTitle4 => 'Твоя вбудована система охолодження';

  @override
  String get factNotifBody4 =>
      'Потовиділення — це спосіб, яким твоє тіло охолоджується, і на це витрачається вода.';

  @override
  String get factNotifTitle5 => 'Перевір колір';

  @override
  String get factNotifBody5 =>
      'Блідо-жовтий зазвичай означає, що тобі вистачає води. Темніший — час випити ще.';

  @override
  String get factLearn1Title => 'Більше половини тебе — вода';

  @override
  String get factLearn1Body =>
      'Вода становить приблизно 50-60% тіла дорослої людини і близько 73% мозку. Вона переносить поживні речовини, амортизує суглоби й підтримує стабільну температуру тіла.';

  @override
  String get factLearn2Title => 'Що відбувається, коли ти п\'єш занадто мало';

  @override
  String get factLearn2Body =>
      'Навіть легке зневоднення, тобто втрата приблизно 1-2% води в організмі, пов\'язане з втомою, головним болем, гіршою концентрацією та зниженим настроєм. У довгостроковій перспективі недостатнє споживання води підвищує ймовірність запорів і каменів у нирках.';

  @override
  String get factLearn3Title => 'Спрага — це запізнілий сигнал';

  @override
  String get factLearn3Body =>
      'Спрага зазвичай з\'являється вже після того, як організм втратив воду, і з віком це відчуття слабшає. Пити через регулярні проміжки часу ефективніше, ніж чекати, поки відчуєш спрагу.';

  @override
  String get factLearn4Title => 'Колір сечі — найпростіша перевірка';

  @override
  String get factLearn4Body =>
      'Блідо-солом\'яний колір зазвичай означає, що тобі вистачає води, тоді як темно-жовтий свідчить про потребу пити більше. Деякі вітаміни та ліки змінюють колір, тож сприймай це як підказку, а не остаточний висновок.';

  @override
  String get factLearn5Title => 'Скільки достатньо?';

  @override
  String get factLearn5Body =>
      'Референсне значення EFSA для достатнього споживання рідини становить близько 2 літрів на день для жінок і 2,5 літра для чоловіків у помірному кліматі за помірної активності. Спека, фізичні навантаження, вагітність і годування груддю підвищують цю потребу. Sipling адаптує це значення до твоєї ваги та рівня активності.';
}
