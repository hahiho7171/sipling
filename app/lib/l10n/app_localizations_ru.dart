// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class LRu extends L {
  LRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Sipling';

  @override
  String get drinkWater => 'Вода';

  @override
  String get drinkTea => 'Чай';

  @override
  String get drinkCoffee => 'Кофе';

  @override
  String get drinkMilk => 'Молоко';

  @override
  String get drinkJuice => 'Сок';

  @override
  String get drinkSoda => 'Газировка';

  @override
  String get drinkAlcohol => 'Алкоголь';

  @override
  String get speciesOak => 'Дуб';

  @override
  String get speciesPine => 'Сосна';

  @override
  String get speciesCherry => 'Сакура';

  @override
  String get speciesAcacia => 'Акация';

  @override
  String get speciesMaple => 'Клён';

  @override
  String get speciesOlive => 'Олива';

  @override
  String get speciesGolden => 'Золотой лист';

  @override
  String get speciesJacaranda => 'Жакаранда';

  @override
  String get unlockFree => 'Открыто';

  @override
  String unlockStreak(int days) {
    return 'Достигни цели $days дней подряд';
  }

  @override
  String unlockTotalTrees(int count) {
    return 'Вырасти всего $count деревьев';
  }

  @override
  String get unlockRewardedAd => 'Посмотри короткую рекламу';

  @override
  String get unlockPro => 'Только для Pro';

  @override
  String get achFirstSproutTitle => 'Первый росток';

  @override
  String get achFirstSproutDesc => 'Первый стакан выпит';

  @override
  String get achFirstTreeTitle => 'Первое дерево';

  @override
  String get achFirstTreeDesc => 'Дневная цель выполнена';

  @override
  String get achStreak3Title => 'Привычка начинается';

  @override
  String get achStreak3Desc => 'Цель достигнута 3 дня подряд';

  @override
  String get achStreak7Title => 'Целая неделя';

  @override
  String get achStreak7Desc => 'Цель достигнута 7 дней подряд';

  @override
  String get achStreak30Title => 'Месяц без перерыва';

  @override
  String get achStreak30Desc => 'Цель достигнута 30 дней подряд';

  @override
  String get achTrees10Title => 'Маленькая роща';

  @override
  String get achTrees10Desc => 'Выращено 10 деревьев';

  @override
  String get achTrees50Title => 'Хранитель леса';

  @override
  String get achTrees50Desc => 'Выращено 50 деревьев';

  @override
  String get achEarlyBirdTitle => 'Ранняя пташка';

  @override
  String get achEarlyBirdDesc => 'Вода выпита до 9 утра';

  @override
  String get achVarietyTitle => 'Разнообразный вкус';

  @override
  String get achVarietyDesc => 'Записано не менее 4 разных напитков';

  @override
  String get achPerfectWeekTitle => 'Идеальная неделя';

  @override
  String get achPerfectWeekDesc => 'Цель достигалась каждый день целую неделю';

  @override
  String get seasonClassicName => 'Классический';

  @override
  String get seasonClassicDesc => 'Вечнозелёный круглый год';

  @override
  String get seasonAutoName => 'Автоматически';

  @override
  String get seasonAutoDesc => 'Пусть лес следует за календарём';

  @override
  String get seasonSpringName => 'Весна';

  @override
  String get seasonSpringDesc => 'Свежие листья, ясное небо';

  @override
  String get seasonSummerName => 'Лето';

  @override
  String get seasonSummerDesc => 'Глубокие, насыщенные зелёные тона';

  @override
  String get seasonAutumnName => 'Осень';

  @override
  String get seasonAutumnDesc => 'Оранжевые листья, тёплый свет';

  @override
  String get seasonWinterName => 'Зима';

  @override
  String get seasonWinterDesc => 'Снежные холмы, холодный свет';

  @override
  String get bmiUnderweight => 'Недостаточный вес';

  @override
  String get bmiNormal => 'Норма';

  @override
  String get bmiOverweight => 'Избыточный вес';

  @override
  String get bmiObese => 'Ожирение';

  @override
  String get notifTitle1 => 'Время попить воды 💧';

  @override
  String get notifBody1 => 'Твой саженец ждёт — выпьем стаканчик?';

  @override
  String get notifTitle2 => 'Ещё глоток';

  @override
  String get notifBody2 => 'Маленькие глотки растят большие деревья.';

  @override
  String get notifTitle3 => 'Твой саженец хочет пить 🌱';

  @override
  String get notifBody3 => 'Стакан воды поможет ему подрасти.';

  @override
  String get notifTitle4 => 'Напоминание';

  @override
  String get notifBody4 => 'Ещё один шаг к сегодняшнему дереву.';

  @override
  String get notifTitle5 => 'Перерыв на воду';

  @override
  String get notifBody5 => 'Стакан, что выпьешь сейчас, — вечернее дерево.';

  @override
  String get activityLow => 'Малоподвижный';

  @override
  String get activityLowHint => 'Сидячая работа, мало ходьбы';

  @override
  String get activityMedium => 'Умеренный';

  @override
  String get activityMediumHint => 'Спорт 1-3 дня в неделю';

  @override
  String get activityHigh => 'Активный';

  @override
  String get activityHighHint => 'Спорт 4+ дня в неделю';

  @override
  String get cupGlass => 'Стакан';

  @override
  String get cupBottle => 'Бутылка';

  @override
  String get cupLarge => 'Большой';

  @override
  String get homeNewAchievement => 'Новое достижение';

  @override
  String get homeUndoLast => 'Отменить последнюю запись';

  @override
  String get homeStageSeed => 'Твоё семечко в земле и ждёт первого глотка';

  @override
  String get homeStageSprout => 'Проклюнулось 🌱';

  @override
  String get homeStageSapling => 'Твой саженец растёт';

  @override
  String get homeStageAlmost => 'Почти дерево!';

  @override
  String get homeStageReady => 'Сегодняшнее дерево готово 🌳';

  @override
  String get homePaceDone => 'Завтра тебя ждёт новый саженец';

  @override
  String get homePaceStart => 'Начни день со стакана воды';

  @override
  String homePaceBehind(int ml) {
    return 'К этому часу ты отстаёшь на $ml ml — ещё можно наверстать';
  }

  @override
  String get homePaceOnTrack => 'Ты точно в графике 👌';

  @override
  String get homeGoalDone => 'Дневная цель достигнута';

  @override
  String homeRemaining(int ml) {
    return 'Осталось $ml ml';
  }

  @override
  String homeStreakDays(int days) {
    return '$days дн.';
  }

  @override
  String get homeCelebrateTitle => 'Твоё дерево выросло!';

  @override
  String get homeCelebrateBody =>
      'Сегодняшняя цель достигнута. Теперь это дерево — часть твоего леса.';

  @override
  String homeStreakLabel(int days) {
    return 'Серия $days дн.';
  }

  @override
  String get homeCelebrateOk => 'Отлично';

  @override
  String get addWhatTitle => 'Что пьём?';

  @override
  String get addAmount => 'Количество';

  @override
  String get addConfirm => 'Добавить';

  @override
  String get addFactorWater => 'Засчитывается в цель полностью.';

  @override
  String get addFactorAlcohol =>
      'Алкоголь обезвоживает, поэтому вычитается из цели.';

  @override
  String addFactorPercent(int percent) {
    return 'Засчитывается в цель на $percent%.';
  }

  @override
  String get sumTitle => 'Итоги вчерашнего дня';

  @override
  String get sumTreeGrown => 'Твоё дерево выросло 🌳';

  @override
  String get sumSaplingOnWay => 'Твой саженец в пути 🌱';

  @override
  String get sumBodyDone => 'Цель достигнута. Это дерево — часть твоего леса.';

  @override
  String sumPercent(int percent) {
    return 'Вчера цель выполнена на $percent%. Твой саженец ждёт там же, где и был, — ни одно дерево не вянет.';
  }

  @override
  String get sumStatCounted => 'Засчитано';

  @override
  String get sumStatGoal => 'Цель';

  @override
  String get sumStatStreak => 'Серия';

  @override
  String sumStreakDays(int days) {
    return '$days дн.';
  }

  @override
  String get sumStartToday => 'Начать сегодня';

  @override
  String get sumWhatDrank => 'Что было выпито';

  @override
  String sumDrinkAmount(String name, int ml) {
    return '$name $ml ml';
  }

  @override
  String get navToday => 'Сегодня';

  @override
  String get navForest => 'Лес';

  @override
  String get navStats => 'Статистика';

  @override
  String get navSettings => 'Настройки';

  @override
  String get onbContinue => 'Далее';

  @override
  String get onbFinish => 'Посадить саженец';

  @override
  String get onbWelcomeTagline =>
      'Каждый глоток — саженец.\nПей воду, и твоё дерево растёт; проходят дни — растёт и твой лес.';

  @override
  String get onbWelcomeNoPenalty =>
      'Твоё дерево никогда не вянет. Здесь нет наказаний.';

  @override
  String get onbGenderTitle => 'Давай познакомимся';

  @override
  String get onbGenderSubtitle =>
      'По этим данным рассчитывается твоя дневная норма воды. Всё остаётся на телефоне и никуда не отправляется.';

  @override
  String get onbGenderFemale => 'Женский';

  @override
  String get onbGenderMale => 'Мужской';

  @override
  String get onbGenderOther => 'Не хочу указывать';

  @override
  String get onbBodyTitle => 'Рост, вес, возраст';

  @override
  String get onbBodySubtitle => 'Двигай ползунок, чтобы настроить.';

  @override
  String get onbBodyAge => 'Возраст';

  @override
  String get onbBodyHeight => 'Рост';

  @override
  String get onbBodyWeight => 'Вес';

  @override
  String get onbBodyBmiLabel => 'Твой индекс массы тела';

  @override
  String get onbBodyDisclaimer =>
      'Только для информации, не медицинский совет.';

  @override
  String get onbActivityTitle => 'Какой у тебя уровень активности?';

  @override
  String get onbActivitySubtitle =>
      'Чем больше ты потеешь, тем больше воды нужно.';

  @override
  String get onbGoalTitle => 'Твоя дневная норма';

  @override
  String get onbGoalSubtitle =>
      'Её можно изменить в любой момент в Настройках.';

  @override
  String get onbGoalUnit => 'миллилитров / день';

  @override
  String onbGoalGlasses(int glasses) {
    return 'примерно $glasses стаканов';
  }

  @override
  String get onbGoalReference =>
      'Эта норма подобрана под твой вес и уровень активности на основе референса достаточного потребления воды Европейского агентства по безопасности продуктов питания (EFSA, 2010). Вода, которую ты получаешь из еды, в это число не входит.';

  @override
  String get proAppBarTitle => 'Sipling Pro';

  @override
  String get proHeaderTitle => 'Sipling без рекламы';

  @override
  String get proHeaderSub => 'Пусть твой лес растёт дальше';

  @override
  String get proPerkNoAdsTitle => 'Ноль рекламы';

  @override
  String get proPerkNoAdsSub => 'Исчезает даже реклама в дневных итогах';

  @override
  String get proPerkTreesTitle => 'Все виды деревьев';

  @override
  String get proPerkTreesSub => 'Включая Золотой лист и Жакаранду';

  @override
  String get proPerkHistoryTitle => 'Безлимитная история';

  @override
  String get proPerkHistorySub => 'Подробная статистика за каждый месяц';

  @override
  String get proPerkThemesTitle => 'Варианты тем';

  @override
  String get proPerkThemesSub => 'Сезонные виды леса';

  @override
  String get proPerkSupportTitle => 'Поддержать разработку';

  @override
  String get proPerkSupportSub => 'Sipling — проект одного человека';

  @override
  String get proNotConnectedNote =>
      'Покупки пока не подключены. Сейчас можно включать и выключать Pro, чтобы попробовать.';

  @override
  String get proButtonOn => 'Pro включён — выключить';

  @override
  String get proButtonTry => 'Попробовать Pro';

  @override
  String get batAppBarTitle => 'Если уведомления не приходят';

  @override
  String get batIntro =>
      'Некоторые бренды телефонов закрывают фоновые приложения ради экономии заряда, поэтому напоминания могут задерживаться или не приходить вовсе. Достаточно один раз изменить настройку ниже.';

  @override
  String get batXiaomi1 =>
      'Настройки → Приложения → Sipling → Экономия батареи → «Без ограничений»';

  @override
  String get batXiaomi2 =>
      'Настройки → Приложения → Sipling → Автозапуск → Включить';

  @override
  String get batXiaomi3 =>
      'На экране недавних приложений потяни Sipling вниз и нажми на значок замка';

  @override
  String get batSamsung1 =>
      'Настройки → Приложения → Sipling → Батарея → «Без ограничений»';

  @override
  String get batSamsung2 =>
      'Настройки → Батарея → Ограничения фоновой работы → убери Sipling из списка «Спящие приложения»';

  @override
  String get batHuawei1 =>
      'Настройки → Батарея → Запуск приложений → Sipling → отключи «Управлять автоматически»';

  @override
  String get batHuawei2 =>
      'Включи автозапуск, вторичный запуск и работу в фоне';

  @override
  String get batOppo1 =>
      'Настройки → Батарея → Высокое фоновое энергопотребление → разреши Sipling';

  @override
  String get batOppo2 =>
      'Настройки → Приложения → Sipling → Расход батареи → Разрешить работу в фоне';

  @override
  String get batFooter =>
      'Названия пунктов меню могут немного отличаться в зависимости от модели телефона. Ищи настройку вроде «оптимизация батареи», «работа в фоне» или «автозапуск».';

  @override
  String get setTitle => 'Настройки';

  @override
  String get setSectionGoal => 'Цель';

  @override
  String get setSectionReminders => 'Напоминания';

  @override
  String get setSectionCups => 'Мои стаканы';

  @override
  String get setSectionHealth => 'Здоровье';

  @override
  String get setSectionAppearance => 'Внешний вид';

  @override
  String get setSectionApp => 'Приложение';

  @override
  String get setProTagline => 'Без рекламы, все деревья открыты';

  @override
  String get setDailyGoal => 'Дневная норма';

  @override
  String setMl(int ml) {
    return '$ml ml';
  }

  @override
  String get setProfileInfo => 'Мой профиль';

  @override
  String setWeightKg(int kg) {
    return '$kg kg';
  }

  @override
  String get setRemindersOn => 'Напоминания включены';

  @override
  String get setFrequency => 'Частота';

  @override
  String get setAwakeHours => 'Мои часы бодрствования';

  @override
  String get setStopWhenDone => 'Останавливать при достижении цели';

  @override
  String get setStopWhenDoneSub =>
      'Как только ты достигнешь дневной нормы, оставшиеся напоминания отменяются';

  @override
  String get setSilent => 'Тихое уведомление';

  @override
  String get setSilentSub => 'Без звука и вибрации';

  @override
  String get setNotifNotArriving => 'Уведомления не приходят?';

  @override
  String get setNotifNotArrivingSub =>
      'Возможно, их блокируют настройки батареи телефона';

  @override
  String get setHealthWrite => 'Записывать в Health Connect';

  @override
  String get setHealthWriteSub =>
      'Выпитая вода также сохраняется в медкарту Android. Sipling ничего оттуда не читает.';

  @override
  String get setDarkTheme => 'Тёмная тема';

  @override
  String get setForestTheme => 'Тема леса';

  @override
  String get setTreeSpecies => 'Виды деревьев';

  @override
  String get setMyData => 'Мои данные';

  @override
  String get setMyDataSub =>
      'Всё хранится на телефоне и никуда не отправляется';

  @override
  String get setResetAll => 'Сбросить все данные';

  @override
  String setEveryHours(int h) {
    return 'Каждые $h ч';
  }

  @override
  String setEveryMinutes(int m) {
    return 'Каждые $m мин';
  }

  @override
  String get setHealthNoConnect => 'На этом устройстве нет Health Connect.';

  @override
  String get setHealthNotInstalledTitle => 'Health Connect не установлен';

  @override
  String get setHealthNeedsUpdateTitle => 'Health Connect нужно обновить';

  @override
  String get setHealthInstallBody =>
      'Приложение Health Connect нужно, чтобы записывать выпитую воду в медкарту Android.';

  @override
  String get setOpenPlayStore => 'Открыть в Play Store';

  @override
  String get setHealthPermissionDenied =>
      'Доступ не предоставлен, в медкарту ничего не запишется.';

  @override
  String get setHealthEnabled =>
      'Теперь выпитая вода будет записываться и в Health Connect.';

  @override
  String get setCancel => 'Отмена';

  @override
  String get setSave => 'Сохранить';

  @override
  String setSuggested(int ml) {
    return 'Рекомендуется: $ml ml';
  }

  @override
  String get setBackToSuggested => 'Вернуть рекомендованное';

  @override
  String get setIntervalDialogTitle => 'Как часто напоминать?';

  @override
  String get setWakeHelp => 'Во сколько ты просыпаешься?';

  @override
  String get setSleepHelp => 'Во сколько ты ложишься спать?';

  @override
  String get setAwakeMin4h =>
      'Время бодрствования должно быть не меньше 4 часов';

  @override
  String get setResetConfirmTitle => 'Точно?';

  @override
  String get setResetConfirmBody =>
      'Твой лес, серии и все записи будут удалены. Это нельзя отменить.';

  @override
  String get setResetConfirmButton => 'Сбросить';

  @override
  String get statsTitle => 'Статистика';

  @override
  String get statsDailyAverage => 'Среднее за день';

  @override
  String get statsGoalDays => 'Дней с достигнутой целью';

  @override
  String get statsCurrentStreak => 'Текущая серия';

  @override
  String get statsUnitDays => 'дн.';

  @override
  String get statsTotalTrees => 'Всего деревьев';

  @override
  String statsLastDays(int days) {
    return 'Последние $days дн.';
  }

  @override
  String get statsYourDrinks => 'Твои напитки';

  @override
  String statsRangeDays(int days) {
    return '$days дн.';
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
  String get statsWeekdaySun => 'Вс';

  @override
  String get statsNoRecords => 'Пока нет записей.';

  @override
  String get statsBmiTitle => 'Индекс массы тела';

  @override
  String get statsBmiDisclaimer =>
      'Только для информации,\nне медицинский совет';

  @override
  String get statsAchievements => 'Достижения';

  @override
  String statsAchievementsEarned(int count) {
    return 'получено $count';
  }

  @override
  String get achScreenTitle => 'Достижения';

  @override
  String get forestTitle => 'Твой лес';

  @override
  String forestSubtitle(int trees, int days) {
    return '$trees деревьев • лучшая серия $days дн.';
  }

  @override
  String get forestSpeciesTooltip => 'Виды деревьев';

  @override
  String get forestEmptyTitle => 'Твой лес пока пуст';

  @override
  String get forestEmptyBody =>
      'Когда ты выпьешь первый стакан, здесь появится саженец.';

  @override
  String get speciesScreenTitle => 'Виды деревьев';

  @override
  String get speciesScreenIntro =>
      'Ты можешь выбрать вид завтрашнего саженца. Старые деревья в лесу остаются того вида, каким были посажены.';

  @override
  String get speciesScreenSelected => 'Выбрано';

  @override
  String get speciesScreenUnlocked => 'Открыто';

  @override
  String speciesScreenUnlockTitle(String name) {
    return 'Открой дерево «$name»';
  }

  @override
  String get speciesScreenRewardBody =>
      'Посмотри короткую рекламу, чтобы открыть этот вид навсегда. Реклама полностью по желанию — в приложении нигде нет принудительной рекламы.';

  @override
  String get speciesScreenCancel => 'Отмена';

  @override
  String get speciesScreenWatchAd => 'Смотреть рекламу';

  @override
  String get seasonScreenTitle => 'Тема леса';

  @override
  String get seasonScreenIntro =>
      'Меняется цвет твоего леса, а не деревья. Ни одна тема не влияет на учёт, цель или серию.';

  @override
  String get seasonScreenProOnly => 'Только для Pro';

  @override
  String get seasonScreenSelected => 'Выбрано';

  @override
  String get setSectionHome => 'Главный экран';

  @override
  String get setAddWidget => 'Добавить виджет на главный экран';

  @override
  String get setAddWidgetSub =>
      'Добавляйте воду одним касанием, не открывая приложение';

  @override
  String get setAddWidgetManual =>
      'Удерживайте главный экран → Виджеты → выберите Sipling';

  @override
  String get wrappedTitle => 'Итоги вашего леса';

  @override
  String get wrappedHeadline => 'Ваш путь до сих пор';

  @override
  String wrappedLiters(int liters) {
    return '$liters L';
  }

  @override
  String get wrappedLitersLabel => 'всего воды';

  @override
  String get wrappedTreesLabel => 'деревья';

  @override
  String get wrappedStreakLabel => 'лучшая серия';

  @override
  String get wrappedDaysLabel => 'дни';

  @override
  String get wrappedShare => 'Поделиться';

  @override
  String get wrappedShareText =>
      'Я выращиваю свой лес с Sipling, глоток за глотком 🌱 sipling-app.web.app';

  @override
  String get homeMoreDrinks => 'Другое';

  @override
  String addFactorWaterEq(int ml, int percent) {
    return '≈ $ml мл воды ($percent%)';
  }

  @override
  String proPerMonth(String price) {
    return '$price / мес.';
  }

  @override
  String get proRestore => 'Восстановить покупки';

  @override
  String get proTerms => 'Условия использования';

  @override
  String get proPrivacyLink => 'Конфиденциальность';

  @override
  String get proStoreUnavailable => 'Магазин сейчас недоступен';

  @override
  String get proAutoRenew =>
      'Ежемесячная подписка, продлевается автоматически. Отмените не позднее чем за 24 часа до продления в настройках аккаунта магазина; иначе она продлится.';

  @override
  String get homeCalcNeed => 'Моя потребность в воде';

  @override
  String get needTitle => 'Твоя дневная потребность в воде';

  @override
  String get needIntro =>
      'Укажи рост, вес и уровень активности — и Sipling подсчитает, сколько воды тебе нужно в день.';

  @override
  String get needResultLabel => 'Рекомендовано для тебя';

  @override
  String needCurrentGoal(int ml) {
    return 'Твоя текущая цель: $ml ml';
  }

  @override
  String get needApply => 'Сделать это моей целью';

  @override
  String get needApplied => 'Твоя цель обновлена';

  @override
  String get needMeasuresTitle => 'Твои параметры';

  @override
  String get needLearnTitle => 'Вода и твоё тело';

  @override
  String get factNotifTitle1 => 'Три четверти воды';

  @override
  String get factNotifBody1 =>
      'Примерно три четверти твоего мозга — вода. Не давай запасу иссякать.';

  @override
  String get factNotifTitle2 => 'Концентрации нужна вода';

  @override
  String get factNotifBody2 =>
      'Потеря всего 1-2% воды в организме может затруднить концентрацию.';

  @override
  String get factNotifTitle3 => 'Жажда приходит поздно';

  @override
  String get factNotifBody3 =>
      'Когда ты чувствуешь жажду, организму уже не хватает воды.';

  @override
  String get factNotifTitle4 => 'Твоё встроенное охлаждение';

  @override
  String get factNotifBody4 =>
      'Потоотделение — способ тела охлаждаться, и на это тратится вода.';

  @override
  String get factNotifTitle5 => 'Проверь цвет';

  @override
  String get factNotifBody5 =>
      'Светло-жёлтый обычно значит, что воды достаточно. Темнее — пора пить.';

  @override
  String get factLearn1Title => 'Больше половины тебя — вода';

  @override
  String get factLearn1Body =>
      'Вода составляет примерно 50-60% тела взрослого человека и около 73% мозга. Она переносит питательные вещества, смягчает суставы и поддерживает стабильную температуру тела.';

  @override
  String get factLearn2Title => 'Что происходит, если пить слишком мало';

  @override
  String get factLearn2Body =>
      'Даже лёгкое обезвоживание — потеря около 1-2% воды в организме — связано с усталостью, головными болями, ухудшением концентрации и снижением настроения. В долгосрочной перспективе недостаток воды повышает риск запоров и камней в почках.';

  @override
  String get factLearn3Title => 'Жажда — запоздалый сигнал';

  @override
  String get factLearn3Body =>
      'Жажда обычно возникает уже после того, как организм потерял воду, и с возрастом это ощущение слабеет. Пить через регулярные промежутки времени эффективнее, чем ждать, пока захочется пить.';

  @override
  String get factLearn4Title => 'Цвет мочи — самый простой способ проверки';

  @override
  String get factLearn4Body =>
      'Светло-соломенный цвет обычно означает хорошую гидратацию, а тёмно-жёлтый говорит о том, что нужно пить больше. Некоторые витамины и лекарства меняют цвет, так что воспринимай это как подсказку, а не как диагноз.';

  @override
  String get factLearn5Title => 'Сколько воды достаточно?';

  @override
  String get factLearn5Body =>
      'По референсу EFSA, достаточное потребление воды из напитков — около 2 литров в день для женщин и 2,5 литра для мужчин, в умеренном климате при средней активности. Жара, физические нагрузки, беременность и грудное вскармливание увеличивают эту потребность. Sipling подстраивает её под твой вес и уровень активности.';

  @override
  String get homeBoost => 'Жаркий день / спорт';

  @override
  String get boostTitle => 'Увеличить цель на сегодня';

  @override
  String get boostBody =>
      'В жаркий день или после тренировки добавьте немного к сегодняшней цели. Завтра всё сбросится само.';

  @override
  String get boostReset => 'Сбросить';

  @override
  String boostActive(int ml) {
    return 'Сегодня добавлено +$ml мл';
  }

  @override
  String get logTitle => 'Записи за сегодня';

  @override
  String get logEmpty => 'Сегодня пока нет записей';

  @override
  String get logOpen => 'Записи за сегодня';

  @override
  String get logDelete => 'Удалить';

  @override
  String get setReminderStyle => 'Стиль напоминаний';

  @override
  String get styleNormal => 'Обычный';

  @override
  String get styleNormalSub => 'Звук и вибрация';

  @override
  String get styleGentle => 'Мягкий';

  @override
  String get styleGentleSub => 'Только вибрация, без звука';

  @override
  String get styleSilent => 'Без звука';

  @override
  String get styleSilentSub => 'Без звука и вибрации';

  @override
  String get speciesScreenAdUnavailable =>
      'Реклама сейчас недоступна. Повторите попытку чуть позже.';

  @override
  String get setHotDayTitle => 'Оповещение о жаре';

  @override
  String get setHotDaySub =>
      'Дополнительное напоминание о воде, когда в вашем городе жарко (только iPhone)';

  @override
  String get setHotDayCity => 'Город';

  @override
  String get setHotDayCitySet => 'Выбрать';

  @override
  String get setHotDayCityHint => 'напр. Стамбул';

  @override
  String get notifHotDayTitle => 'Сегодня жарко 🌡️';

  @override
  String notifHotDayBody(int temp) {
    return 'Сегодня $temp°C — пейте немного чаще.';
  }

  @override
  String get setThemeTitle => 'Тема';

  @override
  String get themeSystem => 'Как в системе';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get setHowTo => 'Как работает Sipling';

  @override
  String get tourNext => 'Далее';

  @override
  String get tourBack => 'Назад';

  @override
  String get tourSkip => 'Пропустить';

  @override
  String get tourDone => 'Понятно';

  @override
  String get tourT1 => 'Пейте и поливайте саженец';

  @override
  String get tourB1 =>
      'Нажмите на стакан на главном экране, чтобы записать глоток. Каждый стакан поливает саженец — нажали случайно? Есть стрелка отмены.';

  @override
  String get tourT2 => 'Дневная норма';

  @override
  String get tourB2 =>
      'Sipling считает норму по росту, весу, возрасту и активности. Меняйте её в настройках или пересчитайте на экране «Вода и ваше тело».';

  @override
  String get tourT3 => 'Напоминания под ваш день';

  @override
  String get tourB3 =>
      'Включите напоминания в настройках, укажите часы бодрствования и частоту. Как только норма набрана, остаток дня проходит тихо.';

  @override
  String get tourT4 => 'Вырастите свой лес';

  @override
  String get tourB4 =>
      'Выполнили норму — саженец становится деревом в вашем лесу. Деревья не засыхают: пропущенный день ничего не стоит.';
}
