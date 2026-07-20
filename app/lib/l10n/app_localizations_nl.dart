// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class LNl extends L {
  LNl([String locale = 'nl']) : super(locale);

  @override
  String get appName => 'Sipling';

  @override
  String get drinkWater => 'Water';

  @override
  String get drinkTea => 'Thee';

  @override
  String get drinkCoffee => 'Koffie';

  @override
  String get drinkMilk => 'Melk';

  @override
  String get drinkJuice => 'Sap';

  @override
  String get drinkSoda => 'Frisdrank';

  @override
  String get drinkAlcohol => 'Alcohol';

  @override
  String get speciesOak => 'Eik';

  @override
  String get speciesPine => 'Den';

  @override
  String get speciesCherry => 'Kersenboom';

  @override
  String get speciesAcacia => 'Acacia';

  @override
  String get speciesMaple => 'Esdoorn';

  @override
  String get speciesOlive => 'Olijfboom';

  @override
  String get speciesGolden => 'Gouden Blad';

  @override
  String get speciesJacaranda => 'Jacaranda';

  @override
  String get unlockFree => 'Ontgrendeld';

  @override
  String unlockStreak(int days) {
    return 'Haal je doel $days dagen op rij';
  }

  @override
  String unlockTotalTrees(int count) {
    return 'Laat in totaal $count bomen groeien';
  }

  @override
  String get unlockRewardedAd => 'Bekijk een korte advertentie';

  @override
  String get unlockPro => 'Alleen voor Pro-leden';

  @override
  String get achFirstSproutTitle => 'Eerste Spruit';

  @override
  String get achFirstSproutDesc => 'Je dronk je eerste glas';

  @override
  String get achFirstTreeTitle => 'Eerste Boom';

  @override
  String get achFirstTreeDesc => 'Je hebt een dagdoel gehaald';

  @override
  String get achStreak3Title => 'Een Gewoonte Begint';

  @override
  String get achStreak3Desc => 'Je haalde je doel 3 dagen op rij';

  @override
  String get achStreak7Title => 'Een Hele Week';

  @override
  String get achStreak7Desc => 'Je haalde je doel 7 dagen op rij';

  @override
  String get achStreak30Title => 'Een Maand Ononderbroken';

  @override
  String get achStreak30Desc => 'Je haalde je doel 30 dagen op rij';

  @override
  String get achTrees10Title => 'Klein Bosje';

  @override
  String get achTrees10Desc => 'Je liet 10 bomen groeien';

  @override
  String get achTrees50Title => 'Boswachter';

  @override
  String get achTrees50Desc => 'Je liet 50 bomen groeien';

  @override
  String get achEarlyBirdTitle => 'Vroege Vogel';

  @override
  String get achEarlyBirdDesc => 'Je dronk water vóór 9 uur \'s ochtends';

  @override
  String get achVarietyTitle => 'Gevarieerd Palet';

  @override
  String get achVarietyDesc =>
      'Je registreerde minstens 4 verschillende dranken';

  @override
  String get achPerfectWeekTitle => 'Perfecte Week';

  @override
  String get achPerfectWeekDesc => 'Je haalde je doel elke dag, 7 dagen lang';

  @override
  String get seasonClassicName => 'Klassiek';

  @override
  String get seasonClassicDesc => 'Het hele jaar groen';

  @override
  String get seasonAutoName => 'Automatisch';

  @override
  String get seasonAutoDesc => 'Laat je bos de kalender volgen';

  @override
  String get seasonSpringName => 'Lente';

  @override
  String get seasonSpringDesc => 'Frisse blaadjes, heldere lucht';

  @override
  String get seasonSummerName => 'Zomer';

  @override
  String get seasonSummerDesc => 'Diepe, verzadigde groentinten';

  @override
  String get seasonAutumnName => 'Herfst';

  @override
  String get seasonAutumnDesc => 'Oranje bladeren, warm licht';

  @override
  String get seasonWinterName => 'Winter';

  @override
  String get seasonWinterDesc => 'Besneeuwde heuvels, koud licht';

  @override
  String get bmiUnderweight => 'Ondergewicht';

  @override
  String get bmiNormal => 'Normaal';

  @override
  String get bmiOverweight => 'Overgewicht';

  @override
  String get bmiObese => 'Obesitas';

  @override
  String get notifTitle1 => 'Tijd voor water 💧';

  @override
  String get notifBody1 =>
      'Je spruitje wacht op je, zullen we een glas drinken?';

  @override
  String get notifTitle2 => 'Nog een slokje';

  @override
  String get notifBody2 => 'Kleine slokjes maken grote bomen.';

  @override
  String get notifTitle3 => 'Je spruitje heeft dorst 🌱';

  @override
  String get notifBody3 =>
      'Een glas water helpt het een beetje verder groeien.';

  @override
  String get notifTitle4 => 'Herinnering';

  @override
  String get notifBody4 => 'Een stap dichter bij de boom van vandaag.';

  @override
  String get notifTitle5 => 'Waterpauze';

  @override
  String get notifBody5 =>
      'Het glas dat je nu drinkt, is de boom van vanavond.';

  @override
  String get activityLow => 'Weinig actief';

  @override
  String get activityLowHint => 'Zittend werk, weinig lopen';

  @override
  String get activityMedium => 'Gemiddeld';

  @override
  String get activityMediumHint => '1-3 dagen per week sporten';

  @override
  String get activityHigh => 'Actief';

  @override
  String get activityHighHint => '4+ dagen per week sporten';

  @override
  String get cupGlass => 'Glas';

  @override
  String get cupBottle => 'Fles';

  @override
  String get cupLarge => 'Groot';

  @override
  String get homeNewAchievement => 'Nieuwe prestatie';

  @override
  String get homeUndoLast => 'Laatste invoer ongedaan maken';

  @override
  String get homeStageSeed =>
      'Je zaadje zit in de grond en wacht op zijn eerste slok';

  @override
  String get homeStageSprout => 'Het is ontkiemd 🌱';

  @override
  String get homeStageSapling => 'Je spruitje groeit';

  @override
  String get homeStageAlmost => 'Bijna een boom!';

  @override
  String get homeStageReady => 'De boom van vandaag is klaar 🌳';

  @override
  String get homePaceDone => 'Morgen wacht er een nieuw spruitje op je';

  @override
  String get homePaceStart => 'Begin je dag met een glas';

  @override
  String homePaceBehind(int ml) {
    return 'Je loopt $ml ml achter voor dit uur — je kunt het nog inhalen';
  }

  @override
  String get homePaceOnTrack => 'Je ligt precies op schema 👌';

  @override
  String get homeGoalDone => 'Je hebt je dagdoel gehaald';

  @override
  String homeRemaining(int ml) {
    return 'Nog $ml ml te gaan';
  }

  @override
  String homeStreakDays(int days) {
    return '$days dagen';
  }

  @override
  String get homeCelebrateTitle => 'Je boom is gegroeid!';

  @override
  String get homeCelebrateBody =>
      'Je hebt het doel van vandaag gehaald. Deze boom hoort nu bij je bos.';

  @override
  String homeStreakLabel(int days) {
    return 'Reeks van $days dagen';
  }

  @override
  String get homeCelebrateOk => 'Mooi';

  @override
  String get addWhatTitle => 'Wat heb je gedronken?';

  @override
  String get addAmount => 'Hoeveelheid';

  @override
  String get addConfirm => 'Toevoegen';

  @override
  String get addFactorWater => 'Telt volledig mee voor je doel.';

  @override
  String get addFactorAlcohol =>
      'Alcohol droogt je uit, dus het wordt van je doel afgetrokken.';

  @override
  String addFactorPercent(int percent) {
    return 'Telt voor $percent% mee voor je doel.';
  }

  @override
  String get sumTitle => 'Samenvatting van gisteren';

  @override
  String get sumTreeGrown => 'Je boom is gegroeid 🌳';

  @override
  String get sumSaplingOnWay => 'Je spruitje is onderweg 🌱';

  @override
  String get sumBodyDone =>
      'Je hebt je doel gehaald. Deze boom hoort bij je bos.';

  @override
  String sumPercent(int percent) {
    return 'Gisteren haalde je $percent% van je doel. Je spruitje wacht op je precies waar je gebleven was — geen enkele boom verdort ooit.';
  }

  @override
  String get sumStatCounted => 'Geteld';

  @override
  String get sumStatGoal => 'Doel';

  @override
  String get sumStatStreak => 'Reeks';

  @override
  String sumStreakDays(int days) {
    return '$days dagen';
  }

  @override
  String get sumStartToday => 'Begin vandaag';

  @override
  String get sumWhatDrank => 'Wat je dronk';

  @override
  String sumDrinkAmount(String name, int ml) {
    return '$name $ml ml';
  }

  @override
  String get navToday => 'Vandaag';

  @override
  String get navForest => 'Bos';

  @override
  String get navStats => 'Statistieken';

  @override
  String get navSettings => 'Instellingen';

  @override
  String get onbContinue => 'Doorgaan';

  @override
  String get onbFinish => 'Mijn spruitje planten';

  @override
  String get onbWelcomeTagline =>
      'Elke slok, een spruitje.\nDrink water en je boom groeit; naarmate de dagen verstrijken, groeit je bos.';

  @override
  String get onbWelcomeNoPenalty =>
      'Je boom verdort nooit. Hier zijn geen straffen.';

  @override
  String get onbGenderTitle => 'Laten we je leren kennen';

  @override
  String get onbGenderSubtitle =>
      'Je dagelijkse waterdoel wordt hiermee berekend. Alles blijft op je telefoon en wordt nooit ergens naartoe gestuurd.';

  @override
  String get onbGenderFemale => 'Vrouw';

  @override
  String get onbGenderMale => 'Man';

  @override
  String get onbGenderOther => 'Zeg ik liever niet';

  @override
  String get onbBodyTitle => 'Lengte, gewicht, leeftijd';

  @override
  String get onbBodySubtitle => 'Schuif om aan te passen.';

  @override
  String get onbBodyAge => 'Leeftijd';

  @override
  String get onbBodyHeight => 'Lengte';

  @override
  String get onbBodyWeight => 'Gewicht';

  @override
  String get onbBodyBmiLabel => 'Je body mass index';

  @override
  String get onbBodyDisclaimer => 'Alleen ter informatie, geen medisch advies.';

  @override
  String get onbActivityTitle => 'Hoe actief ben je?';

  @override
  String get onbActivitySubtitle =>
      'Hoe meer je zweet, hoe meer water je nodig hebt.';

  @override
  String get onbGoalTitle => 'Je dagelijkse doel';

  @override
  String get onbGoalSubtitle => 'Je kunt het altijd aanpassen in Instellingen.';

  @override
  String get onbGoalUnit => 'milliliter / dag';

  @override
  String onbGoalGlasses(int glasses) {
    return 'ongeveer $glasses glazen';
  }

  @override
  String get onbGoalReference =>
      'Dit doel is afgestemd op je gewicht en activiteitsniveau, op basis van de referentie voor voldoende waterinname van de Europese Autoriteit voor Voedselveiligheid (EFSA, 2010). Het water dat je uit voeding haalt, zit niet in dit getal.';

  @override
  String get proAppBarTitle => 'Sipling Pro';

  @override
  String get proHeaderTitle => 'Sipling zonder advertenties';

  @override
  String get proHeaderSub => 'Houd je bos aan het groeien';

  @override
  String get proPerkNoAdsTitle => 'Nul advertenties';

  @override
  String get proPerkNoAdsSub =>
      'Zelfs de advertentie bij de dagsamenvatting verdwijnt';

  @override
  String get proPerkTreesTitle => 'Alle boomsoorten';

  @override
  String get proPerkTreesSub => 'Inclusief Gouden Blad en Jacaranda';

  @override
  String get proPerkHistoryTitle => 'Onbeperkte geschiedenis';

  @override
  String get proPerkHistorySub => 'Gedetailleerde statistieken voor elke maand';

  @override
  String get proPerkThemesTitle => 'Thema-opties';

  @override
  String get proPerkThemesSub => 'Seizoensgebonden bosweergaven';

  @override
  String get proPerkSupportTitle => 'Steun de ontwikkeling';

  @override
  String get proPerkSupportSub => 'Sipling is een eenmansproject';

  @override
  String get proNotConnectedNote =>
      'Aankopen zijn nog niet gekoppeld. Voorlopig kun je Pro aan- en uitzetten om het te proberen.';

  @override
  String get proButtonOn => 'Pro staat aan — uitzetten';

  @override
  String get proButtonTry => 'Pro proberen';

  @override
  String get batAppBarTitle => 'Als er geen meldingen binnenkomen';

  @override
  String get batIntro =>
      'Sommige telefoonmerken sluiten apps op de achtergrond af om de batterij te sparen, waardoor herinneringen vertraagd kunnen zijn of helemaal niet aankomen. De onderstaande instelling één keer doen is genoeg.';

  @override
  String get batXiaomi1 =>
      'Instellingen → Apps → Sipling → Batterijbesparing → \"Geen beperkingen\"';

  @override
  String get batXiaomi2 =>
      'Instellingen → Apps → Sipling → Automatisch starten → Aan';

  @override
  String get batXiaomi3 =>
      'Trek Sipling in het scherm met recente apps omlaag en tik op het slotje';

  @override
  String get batSamsung1 =>
      'Instellingen → Apps → Sipling → Batterij → \"Onbeperkt\"';

  @override
  String get batSamsung2 =>
      'Instellingen → Batterij → Limieten voor achtergrondgebruik → haal Sipling uit de lijst met \"Slapende apps\"';

  @override
  String get batHuawei1 =>
      'Instellingen → Batterij → Apps starten → Sipling → zet Automatisch beheren uit';

  @override
  String get batHuawei2 =>
      'Zet Automatisch starten, Secundair starten en Op de achtergrond uitvoeren aan';

  @override
  String get batOppo1 =>
      'Instellingen → Batterij → Hoog energieverbruik op de achtergrond → sta Sipling toe';

  @override
  String get batOppo2 =>
      'Instellingen → Apps → Sipling → Batterijgebruik → Achtergrondactiviteit toestaan';

  @override
  String get batFooter =>
      'De menunamen kunnen per telefoonmodel een beetje verschillen. Waar je naar zoekt is een instelling als \"batterijoptimalisatie\", \"achtergrondactiviteit\" of \"automatisch starten\".';

  @override
  String get setTitle => 'Instellingen';

  @override
  String get setSectionGoal => 'Doel';

  @override
  String get setSectionReminders => 'Herinneringen';

  @override
  String get setSectionCups => 'Mijn glazen';

  @override
  String get setSectionHealth => 'Gezondheid';

  @override
  String get setSectionAppearance => 'Weergave';

  @override
  String get setSectionApp => 'App';

  @override
  String get setProTagline => 'Zonder advertenties, alle bomen ontgrendeld';

  @override
  String get setDailyGoal => 'Dagelijks doel';

  @override
  String setMl(int ml) {
    return '$ml ml';
  }

  @override
  String get setProfileInfo => 'Mijn profiel';

  @override
  String setWeightKg(int kg) {
    return '$kg kg';
  }

  @override
  String get setRemindersOn => 'Herinneringen aan';

  @override
  String get setFrequency => 'Frequentie';

  @override
  String get setAwakeHours => 'Mijn wakkere uren';

  @override
  String get setStopWhenDone => 'Stoppen als het doel is gehaald';

  @override
  String get setStopWhenDoneSub =>
      'Zodra je je dagdoel haalt, worden de resterende herinneringen geannuleerd';

  @override
  String get setSilent => 'Stille melding';

  @override
  String get setSilentSub => 'Zonder geluid of trilling';

  @override
  String get setNotifNotArriving => 'Komen de meldingen niet aan?';

  @override
  String get setNotifNotArrivingSub =>
      'Mogelijk blokkeren de batterij-instellingen van je telefoon ze';

  @override
  String get setHealthWrite => 'Schrijven naar Health Connect';

  @override
  String get setHealthWriteSub =>
      'Je waterinname wordt ook opgeslagen in het gezondheidsdossier van Android. Sipling leest daar nooit iets uit.';

  @override
  String get setDarkTheme => 'Donker thema';

  @override
  String get setForestTheme => 'Bosthema';

  @override
  String get setTreeSpecies => 'Boomsoorten';

  @override
  String get setMyData => 'Mijn gegevens';

  @override
  String get setMyDataSub =>
      'Alles blijft op je telefoon en wordt nooit ergens naartoe gestuurd';

  @override
  String get setResetAll => 'Alle gegevens wissen';

  @override
  String setEveryHours(int h) {
    String _temp0 = intl.Intl.pluralLogic(
      h,
      locale: localeName,
      other: 'Elke $h uur',
      one: 'Elk uur',
    );
    return '$_temp0';
  }

  @override
  String setEveryMinutes(int m) {
    String _temp0 = intl.Intl.pluralLogic(
      m,
      locale: localeName,
      other: 'Elke $m minuten',
      one: 'Elke minuut',
    );
    return '$_temp0';
  }

  @override
  String get setHealthNoConnect => 'Dit apparaat heeft geen Health Connect.';

  @override
  String get setHealthNotInstalledTitle =>
      'Health Connect is niet geïnstalleerd';

  @override
  String get setHealthNeedsUpdateTitle =>
      'Health Connect moet worden bijgewerkt';

  @override
  String get setHealthInstallBody =>
      'De Health Connect-app is nodig om je waterinname naar het gezondheidsdossier van Android te schrijven.';

  @override
  String get setOpenPlayStore => 'Openen in Play Store';

  @override
  String get setHealthPermissionDenied =>
      'Toestemming geweigerd, er wordt niets naar het gezondheidsdossier geschreven.';

  @override
  String get setHealthEnabled =>
      'Vanaf nu wordt je waterinname ook naar Health Connect geschreven.';

  @override
  String get setCancel => 'Annuleren';

  @override
  String get setSave => 'Opslaan';

  @override
  String setSuggested(int ml) {
    return 'Aanbevolen: $ml ml';
  }

  @override
  String get setBackToSuggested => 'Terug naar aanbevolen';

  @override
  String get setIntervalDialogTitle => 'Hoe vaak zullen we je herinneren?';

  @override
  String get setWakeHelp => 'Hoe laat word je wakker?';

  @override
  String get setSleepHelp => 'Hoe laat ga je slapen?';

  @override
  String get setAwakeMin4h => 'Je wakkere uren moeten minstens 4 uur zijn';

  @override
  String get setResetConfirmTitle => 'Weet je het zeker?';

  @override
  String get setResetConfirmBody =>
      'Je bos, je reeksen en al je gegevens worden verwijderd. Dit kan niet ongedaan worden gemaakt.';

  @override
  String get setResetConfirmButton => 'Wissen';

  @override
  String get statsTitle => 'Statistieken';

  @override
  String get statsDailyAverage => 'Daggemiddelde';

  @override
  String get statsGoalDays => 'Dagen doel gehaald';

  @override
  String get statsCurrentStreak => 'Huidige reeks';

  @override
  String get statsUnitDays => 'dagen';

  @override
  String get statsTotalTrees => 'Totaal aantal bomen';

  @override
  String statsLastDays(int days) {
    return 'Afgelopen $days dagen';
  }

  @override
  String get statsYourDrinks => 'Je dranken';

  @override
  String statsRangeDays(int days) {
    return '$days dagen';
  }

  @override
  String get statsWeekdayMon => 'Ma';

  @override
  String get statsWeekdayTue => 'Di';

  @override
  String get statsWeekdayWed => 'Wo';

  @override
  String get statsWeekdayThu => 'Do';

  @override
  String get statsWeekdayFri => 'Vr';

  @override
  String get statsWeekdaySat => 'Za';

  @override
  String get statsWeekdaySun => 'Zo';

  @override
  String get statsNoRecords => 'Nog geen gegevens.';

  @override
  String get statsBmiTitle => 'Body mass index';

  @override
  String get statsBmiDisclaimer =>
      'Alleen ter informatie,\ngeen medisch advies';

  @override
  String get statsAchievements => 'Prestaties';

  @override
  String statsAchievementsEarned(int count) {
    return '$count behaald';
  }

  @override
  String get achScreenTitle => 'Prestaties';

  @override
  String get forestTitle => 'Je bos';

  @override
  String forestSubtitle(int trees, int days) {
    return '$trees bomen • beste reeks $days dagen';
  }

  @override
  String get forestSpeciesTooltip => 'Boomsoorten';

  @override
  String get forestEmptyTitle => 'Je bos is nog leeg';

  @override
  String get forestEmptyBody =>
      'Als je je eerste glas drinkt, verschijnt hier een spruitje.';

  @override
  String get speciesScreenTitle => 'Boomsoorten';

  @override
  String get speciesScreenIntro =>
      'Je kunt de soort van het spruitje van morgen kiezen. De oude bomen in je bos houden de soort waarmee ze geplant zijn.';

  @override
  String get speciesScreenSelected => 'Geselecteerd';

  @override
  String get speciesScreenUnlocked => 'Ontgrendeld';

  @override
  String speciesScreenUnlockTitle(String name) {
    return 'Ontgrendel de $name-boom';
  }

  @override
  String get speciesScreenRewardBody =>
      'Bekijk een korte advertentie om deze soort voorgoed te ontgrendelen. De advertentie is volledig optioneel — er zijn nergens in de app verplichte advertenties.';

  @override
  String get speciesScreenCancel => 'Annuleren';

  @override
  String get speciesScreenWatchAd => 'Advertentie bekijken';

  @override
  String get seasonScreenTitle => 'Bosthema';

  @override
  String get seasonScreenIntro =>
      'De kleuren van je bos veranderen, niet de bomen. Geen enkel thema beïnvloedt je bijhouden, je doel of je reeks.';

  @override
  String get seasonScreenProOnly => 'Alleen voor Pro-leden';

  @override
  String get seasonScreenSelected => 'Geselecteerd';

  @override
  String get setSectionHome => 'Startscherm';

  @override
  String get setAddWidget => 'Widget toevoegen aan startscherm';

  @override
  String get setAddWidgetSub =>
      'Voeg water toe met één tik, zonder de app te openen';

  @override
  String get setAddWidgetManual =>
      'Houd het startscherm ingedrukt → Widgets → kies Sipling';

  @override
  String get wrappedTitle => 'Jouw bos-overzicht';

  @override
  String get wrappedHeadline => 'Jouw reis tot nu toe';

  @override
  String wrappedLiters(int liters) {
    return '$liters L';
  }

  @override
  String get wrappedLitersLabel => 'totaal water';

  @override
  String get wrappedTreesLabel => 'bomen';

  @override
  String get wrappedStreakLabel => 'beste reeks';

  @override
  String get wrappedDaysLabel => 'dagen';

  @override
  String get wrappedShare => 'Delen';

  @override
  String get wrappedShareText =>
      'Ik laat mijn bos groeien met Sipling, slokje voor slokje 🌱 sipling-app.web.app';

  @override
  String get homeMoreDrinks => 'Overig';

  @override
  String addFactorWaterEq(int ml, int percent) {
    return '≈ $ml ml water ($percent%)';
  }

  @override
  String proPerMonth(String price) {
    return '$price / maand';
  }

  @override
  String get proRestore => 'Aankopen herstellen';

  @override
  String get proTerms => 'Gebruiksvoorwaarden';

  @override
  String get proPrivacyLink => 'Privacybeleid';

  @override
  String get proStoreUnavailable => 'Store momenteel niet beschikbaar';

  @override
  String get proAutoRenew =>
      'Maandabonnement, wordt automatisch verlengd. Zeg minstens 24 uur voor verlenging op in je store-accountinstellingen; anders wordt het verlengd.';

  @override
  String get homeCalcNeed => 'Mijn waterbehoefte';

  @override
  String get needTitle => 'Je dagelijkse waterbehoefte';

  @override
  String get needIntro =>
      'Vul je lengte, gewicht en activiteitsniveau in en Sipling berekent hoeveel water je per dag nodig hebt.';

  @override
  String get needResultLabel => 'Aanbevolen voor jou';

  @override
  String needCurrentGoal(int ml) {
    return 'Je huidige doel: $ml ml';
  }

  @override
  String get needApply => 'Maak dit mijn doel';

  @override
  String get needApplied => 'Je doel is bijgewerkt';

  @override
  String get needMeasuresTitle => 'Jouw lichaamsgegevens';

  @override
  String get needLearnTitle => 'Water en je lichaam';

  @override
  String get factNotifTitle1 => 'Driekwart water';

  @override
  String get factNotifBody1 =>
      'Ongeveer driekwart van je hersenen bestaat uit water. Houd het op peil.';

  @override
  String get factNotifTitle2 => 'Focus heeft water nodig';

  @override
  String get factNotifBody2 =>
      'Het verliezen van slechts 1-2% van je lichaamswater kan concentreren lastiger maken.';

  @override
  String get factNotifTitle3 => 'Dorst komt laat';

  @override
  String get factNotifBody3 =>
      'Tegen de tijd dat je dorst voelt, heeft je lichaam al een tekort.';

  @override
  String get factNotifTitle4 => 'Je ingebouwde koeling';

  @override
  String get factNotifBody4 =>
      'Zweten is hoe je lichaam zichzelf koelt, en dat kost water.';

  @override
  String get factNotifTitle5 => 'Bekijk de kleur';

  @override
  String get factNotifBody5 =>
      'Lichtgeel betekent meestal dat je goed gehydrateerd bent. Donkerder betekent: tijd om te drinken.';

  @override
  String get factLearn1Title => 'Meer dan de helft van jou is water';

  @override
  String get factLearn1Body =>
      'Water vormt ongeveer 50-60% van een volwassen lichaam en zo\'n 73% van de hersenen. Het vervoert voedingsstoffen, dempt je gewrichten en houdt je temperatuur stabiel.';

  @override
  String get factLearn2Title => 'Wat er gebeurt als je te weinig drinkt';

  @override
  String get factLearn2Body =>
      'Zelfs milde uitdroging, het verlies van ongeveer 1-2% van je lichaamswater, wordt in verband gebracht met vermoeidheid, hoofdpijn, minder concentratie en een somberdere stemming. Op de langere termijn maakt te weinig drinken constipatie en nierstenen waarschijnlijker.';

  @override
  String get factLearn3Title => 'Dorst is een laat signaal';

  @override
  String get factLearn3Body =>
      'Dorst treedt meestal pas op nadat je lichaam al water heeft verloren, en dat gevoel wordt zwakker naarmate je ouder wordt. Op regelmatige tijdstippen drinken werkt beter dan wachten tot je dorst voelt.';

  @override
  String get factLearn4Title => 'Urinekleur is de eenvoudigste check';

  @override
  String get factLearn4Body =>
      'Een lichte strogele kleur betekent meestal dat je goed gehydrateerd bent, terwijl donkergeel erop wijst dat je meer nodig hebt. Sommige vitamines en medicijnen veranderen de kleur, dus zie het als een aanwijzing, niet als een oordeel.';

  @override
  String get factLearn5Title => 'Hoeveel is genoeg?';

  @override
  String get factLearn5Body =>
      'De EFSA-referentie voor voldoende inname uit dranken is ongeveer 2 liter per dag voor vrouwen en 2,5 liter voor mannen, in een gematigd klimaat met matige activiteit. Warm weer, sporten, zwangerschap en borstvoeding verhogen allemaal de behoefte. Sipling past dit aan op basis van je gewicht en activiteitsniveau.';
}
