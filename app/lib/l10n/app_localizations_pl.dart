// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class LPl extends L {
  LPl([String locale = 'pl']) : super(locale);

  @override
  String get appName => 'Sipling';

  @override
  String get drinkWater => 'Woda';

  @override
  String get drinkTea => 'Herbata';

  @override
  String get drinkCoffee => 'Kawa';

  @override
  String get drinkMilk => 'Mleko';

  @override
  String get drinkJuice => 'Sok';

  @override
  String get drinkSoda => 'Napój gazowany';

  @override
  String get drinkAlcohol => 'Alkohol';

  @override
  String get speciesOak => 'Dąb';

  @override
  String get speciesPine => 'Sosna';

  @override
  String get speciesCherry => 'Sakura';

  @override
  String get speciesAcacia => 'Akacja';

  @override
  String get speciesMaple => 'Klon';

  @override
  String get speciesOlive => 'Oliwka';

  @override
  String get speciesGolden => 'Złoty liść';

  @override
  String get speciesJacaranda => 'Jakaranda';

  @override
  String get unlockFree => 'Odblokowane';

  @override
  String unlockStreak(int days) {
    return 'Osiągnij cel przez $days dni z rzędu';
  }

  @override
  String unlockTotalTrees(int count) {
    return 'Wyhoduj łącznie $count drzew';
  }

  @override
  String get unlockRewardedAd => 'Obejrzyj krótką reklamę';

  @override
  String get unlockPro => 'Tylko dla członków Pro';

  @override
  String get achFirstSproutTitle => 'Pierwszy kiełek';

  @override
  String get achFirstSproutDesc => 'Wypiłeś swoją pierwszą szklankę';

  @override
  String get achFirstTreeTitle => 'Pierwsze drzewo';

  @override
  String get achFirstTreeDesc => 'Osiągnąłeś dzienny cel';

  @override
  String get achStreak3Title => 'Nawyk się zaczyna';

  @override
  String get achStreak3Desc => 'Osiągnąłeś cel 3 dni z rzędu';

  @override
  String get achStreak7Title => 'Cały tydzień';

  @override
  String get achStreak7Desc => 'Osiągnąłeś cel 7 dni z rzędu';

  @override
  String get achStreak30Title => 'Miesiąc bez przerwy';

  @override
  String get achStreak30Desc => 'Osiągnąłeś cel 30 dni z rzędu';

  @override
  String get achTrees10Title => 'Mały gaj';

  @override
  String get achTrees10Desc => 'Wyhodowałeś 10 drzew';

  @override
  String get achTrees50Title => 'Strażnik lasu';

  @override
  String get achTrees50Desc => 'Wyhodowałeś 50 drzew';

  @override
  String get achEarlyBirdTitle => 'Ranny ptaszek';

  @override
  String get achEarlyBirdDesc => 'Wypiłeś wodę przed 9 rano';

  @override
  String get achVarietyTitle => 'Różne smaki';

  @override
  String get achVarietyDesc => 'Zapisałeś co najmniej 4 różne napoje';

  @override
  String get achPerfectWeekTitle => 'Idealny tydzień';

  @override
  String get achPerfectWeekDesc => 'Osiągałeś cel każdego dnia przez 7 dni';

  @override
  String get seasonClassicName => 'Klasyczny';

  @override
  String get seasonClassicDesc => 'Zawsze zielony, przez cały rok';

  @override
  String get seasonAutoName => 'Automatyczny';

  @override
  String get seasonAutoDesc => 'Twój las podąża za kalendarzem';

  @override
  String get seasonSpringName => 'Wiosna';

  @override
  String get seasonSpringDesc => 'Świeże liście, jasne niebo';

  @override
  String get seasonSummerName => 'Lato';

  @override
  String get seasonSummerDesc => 'Głębokie, nasycone zielenie';

  @override
  String get seasonAutumnName => 'Jesień';

  @override
  String get seasonAutumnDesc => 'Pomarańczowe liście, ciepłe światło';

  @override
  String get seasonWinterName => 'Zima';

  @override
  String get seasonWinterDesc => 'Ośnieżone wzgórza, zimne światło';

  @override
  String get bmiUnderweight => 'Niedowaga';

  @override
  String get bmiNormal => 'Norma';

  @override
  String get bmiOverweight => 'Nadwaga';

  @override
  String get bmiObese => 'Otyłość';

  @override
  String get notifTitle1 => 'Czas na wodę 💧';

  @override
  String get notifBody1 => 'Twoja sadzonka czeka — napijemy się szklanki?';

  @override
  String get notifTitle2 => 'Jeszcze łyk';

  @override
  String get notifBody2 => 'Małe łyki tworzą wielkie drzewa.';

  @override
  String get notifTitle3 => 'Twoja sadzonka jest spragniona 🌱';

  @override
  String get notifBody3 => 'Szklanka wody pomoże jej trochę urosnąć.';

  @override
  String get notifTitle4 => 'Przypomnienie';

  @override
  String get notifBody4 => 'O krok bliżej dzisiejszego drzewa.';

  @override
  String get notifTitle5 => 'Przerwa na wodę';

  @override
  String get notifBody5 =>
      'Szklanka, którą teraz wypijesz, to wieczorne drzewo.';

  @override
  String get activityLow => 'Siedzący';

  @override
  String get activityLowHint => 'Praca biurowa, mało chodzenia';

  @override
  String get activityMedium => 'Umiarkowany';

  @override
  String get activityMediumHint => 'Sport 1-3 dni w tygodniu';

  @override
  String get activityHigh => 'Aktywny';

  @override
  String get activityHighHint => 'Sport 4+ dni w tygodniu';

  @override
  String get cupGlass => 'Szklanka';

  @override
  String get cupBottle => 'Butelka';

  @override
  String get cupLarge => 'Duży';

  @override
  String get homeNewAchievement => 'Nowe osiągnięcie';

  @override
  String get homeUndoLast => 'Cofnij ostatni wpis';

  @override
  String get homeStageSeed =>
      'Twoje nasiono jest w ziemi i czeka na pierwszy łyk';

  @override
  String get homeStageSprout => 'Wykiełkowało 🌱';

  @override
  String get homeStageSapling => 'Twoja sadzonka rośnie';

  @override
  String get homeStageAlmost => 'Prawie drzewo!';

  @override
  String get homeStageReady => 'Dzisiejsze drzewo jest gotowe 🌳';

  @override
  String get homePaceDone => 'Jutro czeka na ciebie nowa sadzonka';

  @override
  String get homePaceStart => 'Zacznij dzień od szklanki';

  @override
  String homePaceBehind(int ml) {
    return 'O tej porze masz $ml ml zaległości — wciąż możesz nadrobić';
  }

  @override
  String get homePaceOnTrack => 'Trzymasz tempo 👌';

  @override
  String get homeGoalDone => 'Osiągnąłeś dzienny cel';

  @override
  String homeRemaining(int ml) {
    return 'Zostało $ml ml';
  }

  @override
  String homeStreakDays(int days) {
    return '$days dni';
  }

  @override
  String get homeCelebrateTitle => 'Twoje drzewo urosło!';

  @override
  String get homeCelebrateBody =>
      'Osiągnąłeś dzisiejszy cel. To drzewo jest teraz częścią twojego lasu.';

  @override
  String homeStreakLabel(int days) {
    return 'Seria $days dni';
  }

  @override
  String get homeCelebrateOk => 'Świetnie';

  @override
  String get addWhatTitle => 'Co wypiłeś?';

  @override
  String get addAmount => 'Ilość';

  @override
  String get addConfirm => 'Dodaj';

  @override
  String get addFactorWater => 'Liczy się w pełni do twojego celu.';

  @override
  String get addFactorAlcohol =>
      'Alkohol odwadnia, więc jest odejmowany od celu.';

  @override
  String addFactorPercent(int percent) {
    return 'Liczy się w $percent% do twojego celu.';
  }

  @override
  String get sumTitle => 'Wczorajsze podsumowanie';

  @override
  String get sumTreeGrown => 'Twoje drzewo urosło 🌳';

  @override
  String get sumSaplingOnWay => 'Twoja sadzonka jest w drodze 🌱';

  @override
  String get sumBodyDone =>
      'Osiągnąłeś swój cel. To drzewo jest częścią twojego lasu.';

  @override
  String sumPercent(int percent) {
    return 'Wczoraj osiągnąłeś $percent% swojego celu. Twoja sadzonka czeka dokładnie tam, gdzie ją zostawiłeś — żadne drzewo nigdy nie usycha.';
  }

  @override
  String get sumStatCounted => 'Zaliczone';

  @override
  String get sumStatGoal => 'Cel';

  @override
  String get sumStatStreak => 'Seria';

  @override
  String sumStreakDays(int days) {
    return '$days dni';
  }

  @override
  String get sumStartToday => 'Zacznij dziś';

  @override
  String get sumWhatDrank => 'Co wypiłeś';

  @override
  String sumDrinkAmount(String name, int ml) {
    return '$name $ml ml';
  }

  @override
  String get navToday => 'Dziś';

  @override
  String get navForest => 'Las';

  @override
  String get navStats => 'Statystyki';

  @override
  String get navSettings => 'Ustawienia';

  @override
  String get onbContinue => 'Dalej';

  @override
  String get onbFinish => 'Posadź moją sadzonkę';

  @override
  String get onbWelcomeTagline =>
      'Każdy łyk to sadzonka.\nPij wodę, a twoje drzewo rośnie; z dniami rośnie też twój las.';

  @override
  String get onbWelcomeNoPenalty =>
      'Twoje drzewo nigdy nie usycha. Tu nie ma kar.';

  @override
  String get onbGenderTitle => 'Poznajmy się';

  @override
  String get onbGenderSubtitle =>
      'Twój dzienny cel wody jest z tego wyliczany. Wszystko zostaje na twoim telefonie i nigdy nigdzie nie jest wysyłane.';

  @override
  String get onbGenderFemale => 'Kobieta';

  @override
  String get onbGenderMale => 'Mężczyzna';

  @override
  String get onbGenderOther => 'Wolę nie podawać';

  @override
  String get onbBodyTitle => 'Wzrost, waga, wiek';

  @override
  String get onbBodySubtitle => 'Przesuń, aby ustawić.';

  @override
  String get onbBodyAge => 'Wiek';

  @override
  String get onbBodyHeight => 'Wzrost';

  @override
  String get onbBodyWeight => 'Waga';

  @override
  String get onbBodyBmiLabel => 'Twój wskaźnik masy ciała';

  @override
  String get onbBodyDisclaimer =>
      'Tylko informacyjnie, to nie porada medyczna.';

  @override
  String get onbActivityTitle => 'Jak bardzo jesteś aktywny?';

  @override
  String get onbActivitySubtitle =>
      'Im więcej się pocisz, tym więcej wody potrzebujesz.';

  @override
  String get onbGoalTitle => 'Twój dzienny cel';

  @override
  String get onbGoalSubtitle =>
      'Możesz go zmienić w każdej chwili w Ustawieniach.';

  @override
  String get onbGoalUnit => 'mililitry / dzień';

  @override
  String onbGoalGlasses(int glasses) {
    return 'około $glasses szklanek';
  }

  @override
  String get onbGoalReference =>
      'Ten cel jest dopasowany do twojej wagi i poziomu aktywności na podstawie referencyjnego odpowiedniego spożycia wody Europejskiego Urzędu ds. Bezpieczeństwa Żywności (EFSA, 2010). Woda z pożywienia nie jest wliczona w tę liczbę.';

  @override
  String get proAppBarTitle => 'Sipling Pro';

  @override
  String get proHeaderTitle => 'Sipling bez reklam';

  @override
  String get proHeaderSub => 'Niech twój las rośnie dalej';

  @override
  String get proPerkNoAdsTitle => 'Zero reklam';

  @override
  String get proPerkNoAdsSub => 'Znika też reklama w dziennym podsumowaniu';

  @override
  String get proPerkTreesTitle => 'Wszystkie gatunki drzew';

  @override
  String get proPerkTreesSub => 'W tym Złoty liść i Jakaranda';

  @override
  String get proPerkHistoryTitle => 'Nieograniczona historia';

  @override
  String get proPerkHistorySub => 'Szczegółowe statystyki z każdego miesiąca';

  @override
  String get proPerkThemesTitle => 'Opcje motywu';

  @override
  String get proPerkThemesSub => 'Sezonowe wyglądy lasu';

  @override
  String get proPerkSupportTitle => 'Wsparcie rozwoju';

  @override
  String get proPerkSupportSub => 'Sipling to projekt jednej osoby';

  @override
  String get proNotConnectedNote =>
      'Zakupy nie są jeszcze podłączone. Na razie możesz włączać i wyłączać Pro, żeby przetestować.';

  @override
  String get proButtonOn => 'Pro włączone — wyłącz';

  @override
  String get proButtonTry => 'Wypróbuj Pro';

  @override
  String get batAppBarTitle => 'Jeśli powiadomienia nie przychodzą';

  @override
  String get batIntro =>
      'Niektóre marki telefonów zamykają aplikacje w tle, by oszczędzać baterię, więc przypomnienia mogą się spóźniać lub wcale nie przychodzić. Wystarczy raz wykonać poniższe ustawienie.';

  @override
  String get batXiaomi1 =>
      'Ustawienia → Aplikacje → Sipling → Oszczędzanie baterii → \"Bez ograniczeń\"';

  @override
  String get batXiaomi2 =>
      'Ustawienia → Aplikacje → Sipling → Autostart → Włącz';

  @override
  String get batXiaomi3 =>
      'Na ekranie ostatnich aplikacji przeciągnij Sipling w dół i dotknij ikony kłódki';

  @override
  String get batSamsung1 =>
      'Ustawienia → Aplikacje → Sipling → Bateria → \"Bez ograniczeń\"';

  @override
  String get batSamsung2 =>
      'Ustawienia → Bateria → Limity użycia w tle → usuń Sipling z listy \"Uśpione aplikacje\"';

  @override
  String get batHuawei1 =>
      'Ustawienia → Bateria → Uruchamianie aplikacji → Sipling → wyłącz Zarządzaj automatycznie';

  @override
  String get batHuawei2 =>
      'Włącz Autouruchamianie, Uruchamianie pośrednie i Działanie w tle';

  @override
  String get batOppo1 =>
      'Ustawienia → Bateria → Wysokie zużycie w tle → zezwól Sipling';

  @override
  String get batOppo2 =>
      'Ustawienia → Aplikacje → Sipling → Zużycie baterii → Zezwól na działanie w tle';

  @override
  String get batFooter =>
      'Nazwy menu mogą się nieco różnić w zależności od modelu telefonu. Szukasz ustawienia typu \"optymalizacja baterii\", \"działanie w tle\" lub \"autostart\".';

  @override
  String get setTitle => 'Ustawienia';

  @override
  String get setSectionGoal => 'Cel';

  @override
  String get setSectionReminders => 'Przypomnienia';

  @override
  String get setSectionCups => 'Moje kubki';

  @override
  String get setSectionHealth => 'Zdrowie';

  @override
  String get setSectionAppearance => 'Wygląd';

  @override
  String get setSectionApp => 'Aplikacja';

  @override
  String get setProTagline => 'Bez reklam, wszystkie drzewa odblokowane';

  @override
  String get setDailyGoal => 'Dzienny cel';

  @override
  String setMl(int ml) {
    return '$ml ml';
  }

  @override
  String get setProfileInfo => 'Mój profil';

  @override
  String setWeightKg(int kg) {
    return '$kg kg';
  }

  @override
  String get setRemindersOn => 'Przypomnienia włączone';

  @override
  String get setFrequency => 'Częstotliwość';

  @override
  String get setAwakeHours => 'Moje godziny czuwania';

  @override
  String get setStopWhenDone => 'Zatrzymaj po osiągnięciu celu';

  @override
  String get setStopWhenDoneSub =>
      'Gdy osiągniesz dzienny cel, pozostałe przypomnienia zostaną anulowane';

  @override
  String get setSilent => 'Ciche powiadomienie';

  @override
  String get setSilentSub => 'Bez dźwięku i wibracji';

  @override
  String get setNotifNotArriving => 'Powiadomienia nie docierają?';

  @override
  String get setNotifNotArrivingSub =>
      'Mogą je blokować ustawienia baterii telefonu';

  @override
  String get setHealthWrite => 'Zapisuj w Health Connect';

  @override
  String get setHealthWriteSub =>
      'Twoje spożycie wody jest też zapisywane w rejestrze zdrowia Androida. Sipling nigdy nic stamtąd nie odczytuje.';

  @override
  String get setDarkTheme => 'Ciemny motyw';

  @override
  String get setForestTheme => 'Motyw lasu';

  @override
  String get setTreeSpecies => 'Gatunki drzew';

  @override
  String get setMyData => 'Moje dane';

  @override
  String get setMyDataSub =>
      'Wszystko zostaje na twoim telefonie i nigdy nigdzie nie jest wysyłane';

  @override
  String get setResetAll => 'Zresetuj wszystkie dane';

  @override
  String setEveryHours(int h) {
    return 'Co $h godz.';
  }

  @override
  String setEveryMinutes(int m) {
    return 'Co $m min';
  }

  @override
  String get setHealthNoConnect => 'To urządzenie nie ma Health Connect.';

  @override
  String get setHealthNotInstalledTitle =>
      'Health Connect nie jest zainstalowane';

  @override
  String get setHealthNeedsUpdateTitle => 'Health Connect wymaga aktualizacji';

  @override
  String get setHealthInstallBody =>
      'Aplikacja Health Connect jest potrzebna, by zapisywać twoje spożycie wody w rejestrze zdrowia Androida.';

  @override
  String get setOpenPlayStore => 'Otwórz w Play Store';

  @override
  String get setHealthPermissionDenied =>
      'Odmówiono uprawnień, nic nie zostanie zapisane w rejestrze zdrowia.';

  @override
  String get setHealthEnabled =>
      'Od teraz twoje spożycie wody będzie też zapisywane w Health Connect.';

  @override
  String get setCancel => 'Anuluj';

  @override
  String get setSave => 'Zapisz';

  @override
  String setSuggested(int ml) {
    return 'Sugerowane: $ml ml';
  }

  @override
  String get setBackToSuggested => 'Wróć do sugerowanego';

  @override
  String get setIntervalDialogTitle => 'Jak często ci przypominać?';

  @override
  String get setWakeHelp => 'O której wstajesz?';

  @override
  String get setSleepHelp => 'O której idziesz spać?';

  @override
  String get setAwakeMin4h =>
      'Twoje godziny czuwania muszą trwać co najmniej 4 godziny';

  @override
  String get setResetConfirmTitle => 'Na pewno?';

  @override
  String get setResetConfirmBody =>
      'Twój las, serie i wszystkie wpisy zostaną usunięte. Tego nie można cofnąć.';

  @override
  String get setResetConfirmButton => 'Zresetuj';

  @override
  String get statsTitle => 'Statystyki';

  @override
  String get statsDailyAverage => 'Średnia dzienna';

  @override
  String get statsGoalDays => 'Dni z osiągniętym celem';

  @override
  String get statsCurrentStreak => 'Obecna seria';

  @override
  String get statsUnitDays => 'dni';

  @override
  String get statsTotalTrees => 'Łącznie drzew';

  @override
  String statsLastDays(int days) {
    return 'Ostatnie $days dni';
  }

  @override
  String get statsYourDrinks => 'Twoje napoje';

  @override
  String statsRangeDays(int days) {
    return '$days dni';
  }

  @override
  String get statsWeekdayMon => 'Pon';

  @override
  String get statsWeekdayTue => 'Wt';

  @override
  String get statsWeekdayWed => 'Śr';

  @override
  String get statsWeekdayThu => 'Czw';

  @override
  String get statsWeekdayFri => 'Pt';

  @override
  String get statsWeekdaySat => 'Sob';

  @override
  String get statsWeekdaySun => 'Nd';

  @override
  String get statsNoRecords => 'Brak wpisów.';

  @override
  String get statsBmiTitle => 'Wskaźnik masy ciała';

  @override
  String get statsBmiDisclaimer =>
      'Tylko informacyjnie,\nto nie porada medyczna';

  @override
  String get statsAchievements => 'Osiągnięcia';

  @override
  String statsAchievementsEarned(int count) {
    return 'Zdobyto $count';
  }

  @override
  String get achScreenTitle => 'Osiągnięcia';

  @override
  String get forestTitle => 'Twój las';

  @override
  String forestSubtitle(int trees, int days) {
    return '$trees drzew • najlepsza seria $days dni';
  }

  @override
  String get forestSpeciesTooltip => 'Gatunki drzew';

  @override
  String get forestEmptyTitle => 'Twój las jest jeszcze pusty';

  @override
  String get forestEmptyBody =>
      'Gdy wypijesz pierwszą szklankę, pojawi się tu sadzonka.';

  @override
  String get speciesScreenTitle => 'Gatunki drzew';

  @override
  String get speciesScreenIntro =>
      'Możesz wybrać gatunek jutrzejszej sadzonki. Stare drzewa w twoim lesie zachowują gatunek, z którym zostały posadzone.';

  @override
  String get speciesScreenSelected => 'Wybrane';

  @override
  String get speciesScreenUnlocked => 'Odblokowane';

  @override
  String speciesScreenUnlockTitle(String name) {
    return 'Odblokuj drzewo $name';
  }

  @override
  String get speciesScreenRewardBody =>
      'Obejrzyj krótką reklamę, aby odblokować ten gatunek na stałe. Reklama jest całkowicie dobrowolna — nigdzie w aplikacji nie ma wymuszonych reklam.';

  @override
  String get speciesScreenCancel => 'Anuluj';

  @override
  String get speciesScreenWatchAd => 'Obejrzyj reklamę';

  @override
  String get seasonScreenTitle => 'Motyw lasu';

  @override
  String get seasonScreenIntro =>
      'Zmieniają się kolory twojego lasu, nie jego drzewa. Żaden motyw nie wpływa na twoje śledzenie, cel ani serię.';

  @override
  String get seasonScreenProOnly => 'Tylko dla członków Pro';

  @override
  String get seasonScreenSelected => 'Wybrane';

  @override
  String get setSectionHome => 'Ekran główny';

  @override
  String get setAddWidget => 'Dodaj widżet do ekranu głównego';

  @override
  String get setAddWidgetSub =>
      'Dodawaj wodę jednym dotknięciem, bez otwierania aplikacji';

  @override
  String get setAddWidgetManual =>
      'Przytrzymaj ekran główny → Widżety → wybierz Sipling';

  @override
  String get wrappedTitle => 'Podsumowanie Twojego lasu';

  @override
  String get wrappedHeadline => 'Twoja dotychczasowa podróż';

  @override
  String wrappedLiters(int liters) {
    return '$liters L';
  }

  @override
  String get wrappedLitersLabel => 'łącznie wody';

  @override
  String get wrappedTreesLabel => 'drzewa';

  @override
  String get wrappedStreakLabel => 'najlepsza seria';

  @override
  String get wrappedDaysLabel => 'dni';

  @override
  String get wrappedShare => 'Udostępnij';

  @override
  String get wrappedShareText =>
      'Zapuszczam swój las z Sipling, łyk po łyku 🌱 sipling-app.web.app';

  @override
  String get homeMoreDrinks => 'Inne';

  @override
  String addFactorWaterEq(int ml, int percent) {
    return '≈ $ml ml wody ($percent%)';
  }

  @override
  String proPerMonth(String price) {
    return '$price / mies.';
  }

  @override
  String get proRestore => 'Przywróć zakupy';

  @override
  String get proTerms => 'Warunki użytkowania';

  @override
  String get proPrivacyLink => 'Prywatność';

  @override
  String get proStoreUnavailable => 'Sklep jest niedostępny';

  @override
  String get proAutoRenew =>
      'Subskrypcja miesięczna, odnawia się automatycznie. Anuluj co najmniej 24 godziny przed odnowieniem w ustawieniach konta sklepu; w przeciwnym razie się odnowi.';
}
