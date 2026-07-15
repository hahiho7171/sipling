// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class LDe extends L {
  LDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'Sipling';

  @override
  String get drinkWater => 'Wasser';

  @override
  String get drinkTea => 'Tee';

  @override
  String get drinkCoffee => 'Kaffee';

  @override
  String get drinkMilk => 'Milch';

  @override
  String get drinkJuice => 'Saft';

  @override
  String get drinkSoda => 'Limonade';

  @override
  String get drinkAlcohol => 'Alkohol';

  @override
  String get speciesOak => 'Eiche';

  @override
  String get speciesPine => 'Kiefer';

  @override
  String get speciesCherry => 'Sakura';

  @override
  String get speciesAcacia => 'Akazie';

  @override
  String get speciesMaple => 'Ahorn';

  @override
  String get speciesOlive => 'Olive';

  @override
  String get speciesGolden => 'Goldblatt';

  @override
  String get speciesJacaranda => 'Jacaranda';

  @override
  String get unlockFree => 'Freigeschaltet';

  @override
  String unlockStreak(int days) {
    return 'Erreiche dein Ziel $days Tage in Folge';
  }

  @override
  String unlockTotalTrees(int count) {
    return 'Lass insgesamt $count Bäume wachsen';
  }

  @override
  String get unlockRewardedAd => 'Kurze Werbung ansehen';

  @override
  String get unlockPro => 'Nur für Pro-Mitglieder';

  @override
  String get achFirstSproutTitle => 'Erster Spross';

  @override
  String get achFirstSproutDesc => 'Du hast dein erstes Glas getrunken';

  @override
  String get achFirstTreeTitle => 'Erster Baum';

  @override
  String get achFirstTreeDesc => 'Du hast ein Tagesziel erreicht';

  @override
  String get achStreak3Title => 'Eine Gewohnheit beginnt';

  @override
  String get achStreak3Desc => 'Du hast 3 Tage in Folge dein Ziel erreicht';

  @override
  String get achStreak7Title => 'Eine ganze Woche';

  @override
  String get achStreak7Desc => 'Du hast 7 Tage in Folge dein Ziel erreicht';

  @override
  String get achStreak30Title => 'Ein Monat ohne Unterbrechung';

  @override
  String get achStreak30Desc => 'Du hast 30 Tage in Folge dein Ziel erreicht';

  @override
  String get achTrees10Title => 'Kleiner Hain';

  @override
  String get achTrees10Desc => 'Du hast 10 Bäume wachsen lassen';

  @override
  String get achTrees50Title => 'Waldhüter';

  @override
  String get achTrees50Desc => 'Du hast 50 Bäume wachsen lassen';

  @override
  String get achEarlyBirdTitle => 'Frühaufsteher';

  @override
  String get achEarlyBirdDesc => 'Du hast vor 9 Uhr Wasser getrunken';

  @override
  String get achVarietyTitle => 'Vielfalt';

  @override
  String get achVarietyDesc =>
      'Du hast mindestens 4 verschiedene Getränke erfasst';

  @override
  String get achPerfectWeekTitle => 'Perfekte Woche';

  @override
  String get achPerfectWeekDesc =>
      'Du hast 7 Tage lang jeden Tag dein Ziel erreicht';

  @override
  String get seasonClassicName => 'Klassisch';

  @override
  String get seasonClassicDesc => 'Immergrün, das ganze Jahr';

  @override
  String get seasonAutoName => 'Automatisch';

  @override
  String get seasonAutoDesc => 'Dein Wald folgt dem Kalender';

  @override
  String get seasonSpringName => 'Frühling';

  @override
  String get seasonSpringDesc => 'Frische Blätter, heller Himmel';

  @override
  String get seasonSummerName => 'Sommer';

  @override
  String get seasonSummerDesc => 'Tiefe, satte Grüntöne';

  @override
  String get seasonAutumnName => 'Herbst';

  @override
  String get seasonAutumnDesc => 'Orange Blätter, warmes Licht';

  @override
  String get seasonWinterName => 'Winter';

  @override
  String get seasonWinterDesc => 'Verschneite Hügel, kaltes Licht';

  @override
  String get bmiUnderweight => 'Untergewicht';

  @override
  String get bmiNormal => 'Normal';

  @override
  String get bmiOverweight => 'Übergewicht';

  @override
  String get bmiObese => 'Adipös';

  @override
  String get notifTitle1 => 'Zeit für Wasser 💧';

  @override
  String get notifBody1 => 'Dein Setzling wartet — trinken wir ein Glas?';

  @override
  String get notifTitle2 => 'Noch ein Schluck';

  @override
  String get notifBody2 => 'Kleine Schlucke machen große Bäume.';

  @override
  String get notifTitle3 => 'Dein Setzling hat Durst 🌱';

  @override
  String get notifBody3 => 'Ein Glas Wasser lässt ihn ein wenig mehr wachsen.';

  @override
  String get notifTitle4 => 'Erinnerung';

  @override
  String get notifBody4 => 'Ein Schritt näher zum heutigen Baum.';

  @override
  String get notifTitle5 => 'Wasserpause';

  @override
  String get notifBody5 =>
      'Das Glas, das du jetzt trinkst, ist der Baum von heute Abend.';

  @override
  String get activityLow => 'Wenig aktiv';

  @override
  String get activityLowHint => 'Bürojob, wenig Bewegung';

  @override
  String get activityMedium => 'Mäßig';

  @override
  String get activityMediumHint => '1-3 Tage pro Woche Sport';

  @override
  String get activityHigh => 'Aktiv';

  @override
  String get activityHighHint => '4+ Tage pro Woche Sport';

  @override
  String get cupGlass => 'Glas';

  @override
  String get cupBottle => 'Flasche';

  @override
  String get cupLarge => 'Groß';

  @override
  String get homeNewAchievement => 'Neuer Erfolg';

  @override
  String get homeUndoLast => 'Letzten Eintrag rückgängig';

  @override
  String get homeStageSeed =>
      'Dein Samen liegt in der Erde und wartet auf den ersten Schluck';

  @override
  String get homeStageSprout => 'Er ist gekeimt 🌱';

  @override
  String get homeStageSapling => 'Dein Setzling wächst';

  @override
  String get homeStageAlmost => 'Fast ein Baum!';

  @override
  String get homeStageReady => 'Der heutige Baum ist bereit 🌳';

  @override
  String get homePaceDone => 'Morgen wartet ein neuer Setzling auf dich';

  @override
  String get homePaceStart => 'Beginne den Tag mit einem Glas';

  @override
  String homePaceBehind(int ml) {
    return 'Du bist diese Stunde $ml ml im Rückstand — du kannst noch aufholen';
  }

  @override
  String get homePaceOnTrack => 'Du liegst genau im Plan 👌';

  @override
  String get homeGoalDone => 'Du hast dein Tagesziel erreicht';

  @override
  String homeRemaining(int ml) {
    return 'Noch $ml ml';
  }

  @override
  String homeStreakDays(int days) {
    return '$days Tage';
  }

  @override
  String get homeCelebrateTitle => 'Dein Baum ist gewachsen!';

  @override
  String get homeCelebrateBody =>
      'Du hast das heutige Ziel erreicht. Dieser Baum gehört jetzt zu deinem Wald.';

  @override
  String homeStreakLabel(int days) {
    return '$days Tage Serie';
  }

  @override
  String get homeCelebrateOk => 'Super';

  @override
  String get addWhatTitle => 'Was hast du getrunken?';

  @override
  String get addAmount => 'Menge';

  @override
  String get addConfirm => 'Hinzufügen';

  @override
  String get addFactorWater => 'Zählt vollständig zu deinem Ziel.';

  @override
  String get addFactorAlcohol =>
      'Alkohol entzieht dir Wasser, daher wird er vom Ziel abgezogen.';

  @override
  String addFactorPercent(int percent) {
    return 'Zählt zu $percent% zu deinem Ziel.';
  }

  @override
  String get sumTitle => 'Zusammenfassung von gestern';

  @override
  String get sumTreeGrown => 'Dein Baum ist gewachsen 🌳';

  @override
  String get sumSaplingOnWay => 'Dein Setzling ist unterwegs 🌱';

  @override
  String get sumBodyDone =>
      'Du hast dein Ziel erreicht. Dieser Baum gehört zu deinem Wald.';

  @override
  String sumPercent(int percent) {
    return 'Du hast gestern $percent% deines Ziels erreicht. Dein Setzling wartet genau dort, wo du aufgehört hast — kein Baum verdorrt je.';
  }

  @override
  String get sumStatCounted => 'Gezählt';

  @override
  String get sumStatGoal => 'Ziel';

  @override
  String get sumStatStreak => 'Serie';

  @override
  String sumStreakDays(int days) {
    return '$days Tage';
  }

  @override
  String get sumStartToday => 'Heute starten';

  @override
  String get sumWhatDrank => 'Was du getrunken hast';

  @override
  String sumDrinkAmount(String name, int ml) {
    return '$name $ml ml';
  }

  @override
  String get navToday => 'Heute';

  @override
  String get navForest => 'Wald';

  @override
  String get navStats => 'Statistik';

  @override
  String get navSettings => 'Einstellungen';

  @override
  String get onbContinue => 'Weiter';

  @override
  String get onbFinish => 'Setzling pflanzen';

  @override
  String get onbWelcomeTagline =>
      'Jeder Schluck ein Setzling.\nTrink Wasser und dein Baum wächst; mit den Tagen auch dein Wald.';

  @override
  String get onbWelcomeNoPenalty =>
      'Dein Baum verdorrt nie. Hier gibt es keine Strafen.';

  @override
  String get onbGenderTitle => 'Lernen wir dich kennen';

  @override
  String get onbGenderSubtitle =>
      'Dein tägliches Wasserziel wird daraus berechnet. Alles bleibt auf deinem Handy und wird nie irgendwohin gesendet.';

  @override
  String get onbGenderFemale => 'Weiblich';

  @override
  String get onbGenderMale => 'Männlich';

  @override
  String get onbGenderOther => 'Keine Angabe';

  @override
  String get onbBodyTitle => 'Größe, Gewicht, Alter';

  @override
  String get onbBodySubtitle => 'Zum Anpassen schieben.';

  @override
  String get onbBodyAge => 'Alter';

  @override
  String get onbBodyHeight => 'Größe';

  @override
  String get onbBodyWeight => 'Gewicht';

  @override
  String get onbBodyBmiLabel => 'Dein Body-Mass-Index';

  @override
  String get onbBodyDisclaimer =>
      'Nur zur Information, keine medizinische Beratung.';

  @override
  String get onbActivityTitle => 'Wie aktiv bist du?';

  @override
  String get onbActivitySubtitle =>
      'Je mehr du schwitzt, desto mehr Wasser brauchst du.';

  @override
  String get onbGoalTitle => 'Dein Tagesziel';

  @override
  String get onbGoalSubtitle =>
      'Du kannst es jederzeit in den Einstellungen ändern.';

  @override
  String get onbGoalUnit => 'Milliliter / Tag';

  @override
  String onbGoalGlasses(int glasses) {
    return 'etwa $glasses Gläser';
  }

  @override
  String get onbGoalReference =>
      'Dieses Ziel ist an dein Gewicht und dein Aktivitätsniveau angepasst und beruht auf dem Referenzwert für angemessene Wasseraufnahme der Europäischen Behörde für Lebensmittelsicherheit (EFSA, 2010). Wasser aus der Nahrung ist in dieser Zahl nicht enthalten.';

  @override
  String get proAppBarTitle => 'Sipling Pro';

  @override
  String get proHeaderTitle => 'Sipling ohne Werbung';

  @override
  String get proHeaderSub => 'Halte deinen Wald am Wachsen';

  @override
  String get proPerkNoAdsTitle => 'Null Werbung';

  @override
  String get proPerkNoAdsSub =>
      'Auch die Werbung in der Tageszusammenfassung verschwindet';

  @override
  String get proPerkTreesTitle => 'Alle Baumarten';

  @override
  String get proPerkTreesSub => 'Inklusive Goldblatt und Jacaranda';

  @override
  String get proPerkHistoryTitle => 'Unbegrenzter Verlauf';

  @override
  String get proPerkHistorySub => 'Detaillierte Statistiken für jeden Monat';

  @override
  String get proPerkThemesTitle => 'Design-Optionen';

  @override
  String get proPerkThemesSub => 'Saisonale Wald-Looks';

  @override
  String get proPerkSupportTitle => 'Entwicklung unterstützen';

  @override
  String get proPerkSupportSub => 'Sipling ist ein Ein-Personen-Projekt';

  @override
  String get proNotConnectedNote =>
      'Käufe sind noch nicht angebunden. Vorerst kannst du Pro zum Ausprobieren ein- und ausschalten.';

  @override
  String get proButtonOn => 'Pro ist an — ausschalten';

  @override
  String get proButtonTry => 'Pro ausprobieren';

  @override
  String get batAppBarTitle => 'Wenn keine Benachrichtigungen ankommen';

  @override
  String get batIntro =>
      'Manche Handymarken beenden Hintergrund-Apps, um Akku zu sparen, sodass Erinnerungen verspätet oder gar nicht ankommen. Die folgende Einstellung einmal vorzunehmen genügt.';

  @override
  String get batXiaomi1 =>
      'Einstellungen → Apps → Sipling → Akkusparmodus → \"Keine Einschränkungen\"';

  @override
  String get batXiaomi2 => 'Einstellungen → Apps → Sipling → Autostart → An';

  @override
  String get batXiaomi3 =>
      'Zieh Sipling im Bildschirm der letzten Apps nach unten und tippe auf das Schloss-Symbol';

  @override
  String get batSamsung1 =>
      'Einstellungen → Apps → Sipling → Akku → \"Unbeschränkt\"';

  @override
  String get batSamsung2 =>
      'Einstellungen → Akku → Nutzungsgrenzen im Hintergrund → Sipling aus der Liste \"Ruhende Apps\" entfernen';

  @override
  String get batHuawei1 =>
      'Einstellungen → Akku → App-Start → Sipling → Automatisch verwalten ausschalten';

  @override
  String get batHuawei2 =>
      'Automatischen Start, sekundären Start und Im Hintergrund ausführen einschalten';

  @override
  String get batOppo1 =>
      'Einstellungen → Akku → Hoher Hintergrund-Stromverbrauch → Sipling erlauben';

  @override
  String get batOppo2 =>
      'Einstellungen → Apps → Sipling → Akkuverbrauch → Hintergrundaktivität erlauben';

  @override
  String get batFooter =>
      'Die Menünamen können je nach Handymodell etwas abweichen. Gesucht ist eine Einstellung wie \"Akku-Optimierung\", \"Hintergrundaktivität\" oder \"Autostart\".';

  @override
  String get setTitle => 'Einstellungen';

  @override
  String get setSectionGoal => 'Ziel';

  @override
  String get setSectionReminders => 'Erinnerungen';

  @override
  String get setSectionCups => 'Meine Becher';

  @override
  String get setSectionHealth => 'Gesundheit';

  @override
  String get setSectionAppearance => 'Darstellung';

  @override
  String get setSectionApp => 'App';

  @override
  String get setProTagline => 'Werbefrei, alle Bäume freigeschaltet';

  @override
  String get setDailyGoal => 'Tagesziel';

  @override
  String setMl(int ml) {
    return '$ml ml';
  }

  @override
  String get setProfileInfo => 'Mein Profil';

  @override
  String setWeightKg(int kg) {
    return '$kg kg';
  }

  @override
  String get setRemindersOn => 'Erinnerungen an';

  @override
  String get setFrequency => 'Häufigkeit';

  @override
  String get setAwakeHours => 'Meine Wachzeiten';

  @override
  String get setStopWhenDone => 'Bei Zielerreichung stoppen';

  @override
  String get setStopWhenDoneSub =>
      'Sobald du dein Tagesziel erreichst, werden die übrigen Erinnerungen abgebrochen';

  @override
  String get setSilent => 'Stille Benachrichtigung';

  @override
  String get setSilentSub => 'Ohne Ton oder Vibration';

  @override
  String get setNotifNotArriving => 'Benachrichtigungen kommen nicht an?';

  @override
  String get setNotifNotArrivingSub =>
      'Die Akku-Einstellungen deines Handys blockieren sie vielleicht';

  @override
  String get setHealthWrite => 'In Health Connect schreiben';

  @override
  String get setHealthWriteSub =>
      'Deine Wasseraufnahme wird auch in Androids Gesundheitsakte gespeichert. Sipling liest dort nie etwas aus.';

  @override
  String get setDarkTheme => 'Dunkles Design';

  @override
  String get setForestTheme => 'Wald-Design';

  @override
  String get setTreeSpecies => 'Baumarten';

  @override
  String get setMyData => 'Meine Daten';

  @override
  String get setMyDataSub =>
      'Alles bleibt auf deinem Handy und wird nie irgendwohin gesendet';

  @override
  String get setResetAll => 'Alle Daten zurücksetzen';

  @override
  String setEveryHours(int h) {
    return 'Alle $h Std.';
  }

  @override
  String setEveryMinutes(int m) {
    return 'Alle $m Min.';
  }

  @override
  String get setHealthNoConnect => 'Dieses Gerät hat kein Health Connect.';

  @override
  String get setHealthNotInstalledTitle =>
      'Health Connect ist nicht installiert';

  @override
  String get setHealthNeedsUpdateTitle =>
      'Health Connect muss aktualisiert werden';

  @override
  String get setHealthInstallBody =>
      'Die Health-Connect-App wird benötigt, um deine Wasseraufnahme in Androids Gesundheitsakte zu schreiben.';

  @override
  String get setOpenPlayStore => 'Im Play Store öffnen';

  @override
  String get setHealthPermissionDenied =>
      'Berechtigung verweigert, es wird nichts in die Gesundheitsakte geschrieben.';

  @override
  String get setHealthEnabled =>
      'Ab jetzt wird deine Wasseraufnahme auch in Health Connect geschrieben.';

  @override
  String get setCancel => 'Abbrechen';

  @override
  String get setSave => 'Speichern';

  @override
  String setSuggested(int ml) {
    return 'Empfohlen: $ml ml';
  }

  @override
  String get setBackToSuggested => 'Zurück zum Vorschlag';

  @override
  String get setIntervalDialogTitle => 'Wie oft sollen wir dich erinnern?';

  @override
  String get setWakeHelp => 'Wann wachst du auf?';

  @override
  String get setSleepHelp => 'Wann gehst du schlafen?';

  @override
  String get setAwakeMin4h =>
      'Deine Wachzeit muss mindestens 4 Stunden betragen';

  @override
  String get setResetConfirmTitle => 'Bist du sicher?';

  @override
  String get setResetConfirmBody =>
      'Dein Wald, deine Serien und alle Aufzeichnungen werden gelöscht. Das kann nicht rückgängig gemacht werden.';

  @override
  String get setResetConfirmButton => 'Zurücksetzen';

  @override
  String get statsTitle => 'Statistik';

  @override
  String get statsDailyAverage => 'Tagesdurchschnitt';

  @override
  String get statsGoalDays => 'Tage mit erreichtem Ziel';

  @override
  String get statsCurrentStreak => 'Aktuelle Serie';

  @override
  String get statsUnitDays => 'Tage';

  @override
  String get statsTotalTrees => 'Bäume insgesamt';

  @override
  String statsLastDays(int days) {
    return 'Letzte $days Tage';
  }

  @override
  String get statsYourDrinks => 'Deine Getränke';

  @override
  String statsRangeDays(int days) {
    return '$days Tage';
  }

  @override
  String get statsWeekdayMon => 'Mo';

  @override
  String get statsWeekdayTue => 'Di';

  @override
  String get statsWeekdayWed => 'Mi';

  @override
  String get statsWeekdayThu => 'Do';

  @override
  String get statsWeekdayFri => 'Fr';

  @override
  String get statsWeekdaySat => 'Sa';

  @override
  String get statsWeekdaySun => 'So';

  @override
  String get statsNoRecords => 'Noch keine Aufzeichnungen.';

  @override
  String get statsBmiTitle => 'Body-Mass-Index';

  @override
  String get statsBmiDisclaimer =>
      'Nur zur Information,\nkeine medizinische Beratung';

  @override
  String get statsAchievements => 'Erfolge';

  @override
  String statsAchievementsEarned(int count) {
    return '$count erreicht';
  }

  @override
  String get achScreenTitle => 'Erfolge';

  @override
  String get forestTitle => 'Dein Wald';

  @override
  String forestSubtitle(int trees, int days) {
    return '$trees Bäume • beste Serie $days Tage';
  }

  @override
  String get forestSpeciesTooltip => 'Baumarten';

  @override
  String get forestEmptyTitle => 'Dein Wald ist noch leer';

  @override
  String get forestEmptyBody =>
      'Wenn du dein erstes Glas trinkst, erscheint hier ein Setzling.';

  @override
  String get speciesScreenTitle => 'Baumarten';

  @override
  String get speciesScreenIntro =>
      'Du kannst die Art des morgigen Setzlings wählen. Die alten Bäume in deinem Wald behalten die Art, mit der sie gepflanzt wurden.';

  @override
  String get speciesScreenSelected => 'Ausgewählt';

  @override
  String get speciesScreenUnlocked => 'Freigeschaltet';

  @override
  String speciesScreenUnlockTitle(String name) {
    return 'Baum $name freischalten';
  }

  @override
  String get speciesScreenRewardBody =>
      'Sieh dir eine kurze Werbung an, um diese Art dauerhaft freizuschalten. Die Werbung ist völlig freiwillig — es gibt nirgends in der App erzwungene Werbung.';

  @override
  String get speciesScreenCancel => 'Abbrechen';

  @override
  String get speciesScreenWatchAd => 'Werbung ansehen';

  @override
  String get seasonScreenTitle => 'Wald-Design';

  @override
  String get seasonScreenIntro =>
      'Die Farben deines Waldes ändern sich, nicht seine Bäume. Kein Design beeinflusst deine Aufzeichnungen, dein Ziel oder deine Serie.';

  @override
  String get seasonScreenProOnly => 'Nur für Pro-Mitglieder';

  @override
  String get seasonScreenSelected => 'Ausgewählt';

  @override
  String get setSectionHome => 'Startbildschirm';

  @override
  String get setAddWidget => 'Widget zum Startbildschirm hinzufügen';

  @override
  String get setAddWidgetSub =>
      'Mit einem Tippen Wasser hinzufügen, ohne die App zu öffnen';

  @override
  String get setAddWidgetManual =>
      'Startbildschirm lang drücken → Widgets → Sipling wählen';

  @override
  String get wrappedTitle => 'Dein Wald-Rückblick';

  @override
  String get wrappedHeadline => 'Deine bisherige Reise';

  @override
  String wrappedLiters(int liters) {
    return '$liters L';
  }

  @override
  String get wrappedLitersLabel => 'Wasser gesamt';

  @override
  String get wrappedTreesLabel => 'Bäume';

  @override
  String get wrappedStreakLabel => 'beste Serie';

  @override
  String get wrappedDaysLabel => 'Tage';

  @override
  String get wrappedShare => 'Teilen';

  @override
  String get wrappedShareText =>
      'Ich lasse mit Sipling meinen Wald wachsen, Schluck für Schluck 🌱 sipling-app.web.app';

  @override
  String get homeMoreDrinks => 'Andere';

  @override
  String addFactorWaterEq(int ml, int percent) {
    return '≈ $ml ml Wasser ($percent%)';
  }

  @override
  String proPerMonth(String price) {
    return '$price / Monat';
  }

  @override
  String get proRestore => 'Käufe wiederherstellen';

  @override
  String get proTerms => 'Nutzungsbedingungen';

  @override
  String get proPrivacyLink => 'Datenschutz';

  @override
  String get proStoreUnavailable => 'Store derzeit nicht verfügbar';

  @override
  String get proAutoRenew =>
      'Monatliches Abo, verlängert sich automatisch. Kündige mindestens 24 Stunden vor der Verlängerung in den Kontoeinstellungen deines Stores; sonst verlängert es sich.';
}
