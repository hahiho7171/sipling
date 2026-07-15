// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class LFr extends L {
  LFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Sipling';

  @override
  String get drinkWater => 'Eau';

  @override
  String get drinkTea => 'Thé';

  @override
  String get drinkCoffee => 'Café';

  @override
  String get drinkMilk => 'Lait';

  @override
  String get drinkJuice => 'Jus';

  @override
  String get drinkSoda => 'Soda';

  @override
  String get drinkAlcohol => 'Alcool';

  @override
  String get speciesOak => 'Chêne';

  @override
  String get speciesPine => 'Pin';

  @override
  String get speciesCherry => 'Sakura';

  @override
  String get speciesAcacia => 'Acacia';

  @override
  String get speciesMaple => 'Érable';

  @override
  String get speciesOlive => 'Olivier';

  @override
  String get speciesGolden => 'Feuille d\'or';

  @override
  String get speciesJacaranda => 'Jacaranda';

  @override
  String get unlockFree => 'Débloqué';

  @override
  String unlockStreak(int days) {
    return 'Atteins ton objectif $days jours d\'affilée';
  }

  @override
  String unlockTotalTrees(int count) {
    return 'Fais pousser $count arbres au total';
  }

  @override
  String get unlockRewardedAd => 'Regarde une courte pub';

  @override
  String get unlockPro => 'Réservé aux membres Pro';

  @override
  String get achFirstSproutTitle => 'Première pousse';

  @override
  String get achFirstSproutDesc => 'Tu as bu ton premier verre';

  @override
  String get achFirstTreeTitle => 'Premier arbre';

  @override
  String get achFirstTreeDesc => 'Tu as atteint un objectif quotidien';

  @override
  String get achStreak3Title => 'Une habitude naît';

  @override
  String get achStreak3Desc => 'Tu as atteint ton objectif 3 jours d\'affilée';

  @override
  String get achStreak7Title => 'Une semaine entière';

  @override
  String get achStreak7Desc => 'Tu as atteint ton objectif 7 jours d\'affilée';

  @override
  String get achStreak30Title => 'Un mois sans interruption';

  @override
  String get achStreak30Desc =>
      'Tu as atteint ton objectif 30 jours d\'affilée';

  @override
  String get achTrees10Title => 'Petit bosquet';

  @override
  String get achTrees10Desc => 'Tu as fait pousser 10 arbres';

  @override
  String get achTrees50Title => 'Gardien de la forêt';

  @override
  String get achTrees50Desc => 'Tu as fait pousser 50 arbres';

  @override
  String get achEarlyBirdTitle => 'Lève-tôt';

  @override
  String get achEarlyBirdDesc => 'Tu as bu de l\'eau avant 9 h';

  @override
  String get achVarietyTitle => 'Palais varié';

  @override
  String get achVarietyDesc =>
      'Tu as enregistré au moins 4 boissons différentes';

  @override
  String get achPerfectWeekTitle => 'Semaine parfaite';

  @override
  String get achPerfectWeekDesc =>
      'Tu as atteint ton objectif chaque jour pendant 7 jours';

  @override
  String get seasonClassicName => 'Classique';

  @override
  String get seasonClassicDesc => 'Toujours vert, toute l\'année';

  @override
  String get seasonAutoName => 'Automatique';

  @override
  String get seasonAutoDesc => 'Ta forêt suit le calendrier';

  @override
  String get seasonSpringName => 'Printemps';

  @override
  String get seasonSpringDesc => 'Feuilles fraîches, ciel clair';

  @override
  String get seasonSummerName => 'Été';

  @override
  String get seasonSummerDesc => 'Verts profonds et saturés';

  @override
  String get seasonAutumnName => 'Automne';

  @override
  String get seasonAutumnDesc => 'Feuilles orange, lumière chaude';

  @override
  String get seasonWinterName => 'Hiver';

  @override
  String get seasonWinterDesc => 'Collines enneigées, lumière froide';

  @override
  String get bmiUnderweight => 'Maigreur';

  @override
  String get bmiNormal => 'Normal';

  @override
  String get bmiOverweight => 'Surpoids';

  @override
  String get bmiObese => 'Obésité';

  @override
  String get notifTitle1 => 'C\'est l\'heure de boire 💧';

  @override
  String get notifBody1 => 'Ta pousse t\'attend — on boit un verre ?';

  @override
  String get notifTitle2 => 'Encore une gorgée';

  @override
  String get notifBody2 => 'Les petites gorgées font les grands arbres.';

  @override
  String get notifTitle3 => 'Ta pousse a soif 🌱';

  @override
  String get notifBody3 => 'Un verre d\'eau l\'aide à grandir un peu plus.';

  @override
  String get notifTitle4 => 'Rappel';

  @override
  String get notifBody4 => 'Un pas de plus vers l\'arbre du jour.';

  @override
  String get notifTitle5 => 'Pause eau';

  @override
  String get notifBody5 =>
      'Le verre que tu bois maintenant, c\'est l\'arbre de ce soir.';

  @override
  String get activityLow => 'Sédentaire';

  @override
  String get activityLowHint => 'Travail de bureau, peu de marche';

  @override
  String get activityMedium => 'Modéré';

  @override
  String get activityMediumHint => 'Sport 1 à 3 jours par semaine';

  @override
  String get activityHigh => 'Actif';

  @override
  String get activityHighHint => 'Sport 4 jours ou plus par semaine';

  @override
  String get cupGlass => 'Verre';

  @override
  String get cupBottle => 'Bouteille';

  @override
  String get cupLarge => 'Grand';

  @override
  String get homeNewAchievement => 'Nouveau succès';

  @override
  String get homeUndoLast => 'Annuler la dernière entrée';

  @override
  String get homeStageSeed =>
      'Ta graine est dans la terre, elle attend sa première gorgée';

  @override
  String get homeStageSprout => 'Elle a germé 🌱';

  @override
  String get homeStageSapling => 'Ta pousse grandit';

  @override
  String get homeStageAlmost => 'Presque un arbre !';

  @override
  String get homeStageReady => 'L\'arbre du jour est prêt 🌳';

  @override
  String get homePaceDone => 'Une nouvelle pousse t\'attend demain';

  @override
  String get homePaceStart => 'Commence la journée par un verre';

  @override
  String homePaceBehind(int ml) {
    return 'Tu as $ml ml de retard pour cette heure — tu peux encore rattraper';
  }

  @override
  String get homePaceOnTrack => 'Tu tiens le rythme 👌';

  @override
  String get homeGoalDone => 'Tu as atteint ton objectif du jour';

  @override
  String homeRemaining(int ml) {
    return 'Encore $ml ml';
  }

  @override
  String homeStreakDays(int days) {
    return '$days jours';
  }

  @override
  String get homeCelebrateTitle => 'Ton arbre a grandi !';

  @override
  String get homeCelebrateBody =>
      'Tu as atteint l\'objectif du jour. Cet arbre fait maintenant partie de ta forêt.';

  @override
  String homeStreakLabel(int days) {
    return 'Série de $days jours';
  }

  @override
  String get homeCelebrateOk => 'Super';

  @override
  String get addWhatTitle => 'Qu\'as-tu bu ?';

  @override
  String get addAmount => 'Quantité';

  @override
  String get addConfirm => 'Ajouter';

  @override
  String get addFactorWater => 'Compte entièrement pour ton objectif.';

  @override
  String get addFactorAlcohol =>
      'L\'alcool te déshydrate, il est donc soustrait de ton objectif.';

  @override
  String addFactorPercent(int percent) {
    return 'Compte pour $percent% de ton objectif.';
  }

  @override
  String get sumTitle => 'Résumé d\'hier';

  @override
  String get sumTreeGrown => 'Ton arbre a grandi 🌳';

  @override
  String get sumSaplingOnWay => 'Ta pousse arrive 🌱';

  @override
  String get sumBodyDone =>
      'Tu as atteint ton objectif. Cet arbre fait partie de ta forêt.';

  @override
  String sumPercent(int percent) {
    return 'Hier, tu as atteint $percent% de ton objectif. Ta pousse t\'attend là où tu t\'es arrêté — aucun arbre ne se dessèche jamais.';
  }

  @override
  String get sumStatCounted => 'Compté';

  @override
  String get sumStatGoal => 'Objectif';

  @override
  String get sumStatStreak => 'Série';

  @override
  String sumStreakDays(int days) {
    return '$days jours';
  }

  @override
  String get sumStartToday => 'Commencer aujourd\'hui';

  @override
  String get sumWhatDrank => 'Ce que tu as bu';

  @override
  String sumDrinkAmount(String name, int ml) {
    return '$name $ml ml';
  }

  @override
  String get navToday => 'Aujourd\'hui';

  @override
  String get navForest => 'Forêt';

  @override
  String get navStats => 'Stats';

  @override
  String get navSettings => 'Réglages';

  @override
  String get onbContinue => 'Continuer';

  @override
  String get onbFinish => 'Planter ma pousse';

  @override
  String get onbWelcomeTagline =>
      'Chaque gorgée, une pousse.\nBois de l\'eau et ton arbre grandit ; au fil des jours, ta forêt aussi.';

  @override
  String get onbWelcomeNoPenalty =>
      'Ton arbre ne se dessèche jamais. Ici, pas de pénalités.';

  @override
  String get onbGenderTitle => 'Faisons connaissance';

  @override
  String get onbGenderSubtitle =>
      'Ton objectif d\'eau quotidien est calculé à partir de ça. Tout reste sur ton téléphone et n\'est jamais envoyé nulle part.';

  @override
  String get onbGenderFemale => 'Femme';

  @override
  String get onbGenderMale => 'Homme';

  @override
  String get onbGenderOther => 'Je préfère ne pas dire';

  @override
  String get onbBodyTitle => 'Taille, poids, âge';

  @override
  String get onbBodySubtitle => 'Fais glisser pour ajuster.';

  @override
  String get onbBodyAge => 'Âge';

  @override
  String get onbBodyHeight => 'Taille';

  @override
  String get onbBodyWeight => 'Poids';

  @override
  String get onbBodyBmiLabel => 'Ton indice de masse corporelle';

  @override
  String get onbBodyDisclaimer => 'À titre informatif, pas un avis médical.';

  @override
  String get onbActivityTitle => 'À quel point es-tu actif ?';

  @override
  String get onbActivitySubtitle =>
      'Plus tu transpires, plus tu as besoin d\'eau.';

  @override
  String get onbGoalTitle => 'Ton objectif du jour';

  @override
  String get onbGoalSubtitle =>
      'Tu peux le changer à tout moment dans les Réglages.';

  @override
  String get onbGoalUnit => 'millilitres / jour';

  @override
  String onbGoalGlasses(int glasses) {
    return 'environ $glasses verres';
  }

  @override
  String get onbGoalReference =>
      'Cet objectif est adapté à ton poids et à ton niveau d\'activité, d\'après la référence d\'apport hydrique adéquat de l\'Autorité européenne de sécurité des aliments (EFSA, 2010). L\'eau apportée par les aliments n\'est pas comprise dans ce chiffre.';

  @override
  String get proAppBarTitle => 'Sipling Pro';

  @override
  String get proHeaderTitle => 'Sipling sans pub';

  @override
  String get proHeaderSub => 'Garde ta forêt en croissance';

  @override
  String get proPerkNoAdsTitle => 'Zéro pub';

  @override
  String get proPerkNoAdsSub => 'Même la pub du résumé quotidien disparaît';

  @override
  String get proPerkTreesTitle => 'Toutes les espèces d\'arbres';

  @override
  String get proPerkTreesSub => 'Feuille d\'or et Jacaranda comprises';

  @override
  String get proPerkHistoryTitle => 'Historique illimité';

  @override
  String get proPerkHistorySub => 'Statistiques détaillées pour chaque mois';

  @override
  String get proPerkThemesTitle => 'Options de thème';

  @override
  String get proPerkThemesSub => 'Ambiances de forêt saisonnières';

  @override
  String get proPerkSupportTitle => 'Soutenir le développement';

  @override
  String get proPerkSupportSub => 'Sipling est un projet d\'une seule personne';

  @override
  String get proNotConnectedNote =>
      'Les achats ne sont pas encore connectés. Pour l\'instant, tu peux activer et désactiver Pro pour l\'essayer.';

  @override
  String get proButtonOn => 'Pro activé — désactiver';

  @override
  String get proButtonTry => 'Essayer Pro';

  @override
  String get batAppBarTitle => 'Si les notifications n\'arrivent pas';

  @override
  String get batIntro =>
      'Certaines marques de téléphone ferment les applications en arrière-plan pour économiser la batterie, si bien que les rappels peuvent être retardés ou ne pas arriver du tout. Il suffit de faire le réglage ci-dessous une seule fois.';

  @override
  String get batXiaomi1 =>
      'Réglages → Applications → Sipling → Économiseur de batterie → \"Aucune restriction\"';

  @override
  String get batXiaomi2 =>
      'Réglages → Applications → Sipling → Démarrage auto → Activé';

  @override
  String get batXiaomi3 =>
      'Sur l\'écran des applications récentes, tire Sipling vers le bas et touche l\'icône de cadenas';

  @override
  String get batSamsung1 =>
      'Réglages → Applications → Sipling → Batterie → \"Sans restriction\"';

  @override
  String get batSamsung2 =>
      'Réglages → Batterie → Limites d\'utilisation en arrière-plan → retire Sipling de la liste \"Applications en veille\"';

  @override
  String get batHuawei1 =>
      'Réglages → Batterie → Lancement des applis → Sipling → désactive Gérer automatiquement';

  @override
  String get batHuawei2 =>
      'Active Lancement auto, Lancement secondaire et Exécution en arrière-plan';

  @override
  String get batOppo1 =>
      'Réglages → Batterie → Forte consommation en arrière-plan → autorise Sipling';

  @override
  String get batOppo2 =>
      'Réglages → Applications → Sipling → Utilisation de la batterie → Autoriser l\'activité en arrière-plan';

  @override
  String get batFooter =>
      'Les noms des menus peuvent varier un peu selon le modèle de téléphone. Ce que tu cherches, c\'est un réglage du type \"optimisation de la batterie\", \"activité en arrière-plan\" ou \"démarrage auto\".';

  @override
  String get setTitle => 'Réglages';

  @override
  String get setSectionGoal => 'Objectif';

  @override
  String get setSectionReminders => 'Rappels';

  @override
  String get setSectionCups => 'Mes verres';

  @override
  String get setSectionHealth => 'Santé';

  @override
  String get setSectionAppearance => 'Apparence';

  @override
  String get setSectionApp => 'Application';

  @override
  String get setProTagline => 'Sans pub, tous les arbres débloqués';

  @override
  String get setDailyGoal => 'Objectif quotidien';

  @override
  String setMl(int ml) {
    return '$ml ml';
  }

  @override
  String get setProfileInfo => 'Mon profil';

  @override
  String setWeightKg(int kg) {
    return '$kg kg';
  }

  @override
  String get setRemindersOn => 'Rappels activés';

  @override
  String get setFrequency => 'Fréquence';

  @override
  String get setAwakeHours => 'Mes heures d\'éveil';

  @override
  String get setStopWhenDone => 'Arrêter une fois l\'objectif atteint';

  @override
  String get setStopWhenDoneSub =>
      'Une fois ton objectif quotidien atteint, les rappels restants sont annulés';

  @override
  String get setSilent => 'Notification silencieuse';

  @override
  String get setSilentSub => 'Sans son ni vibration';

  @override
  String get setNotifNotArriving => 'Les notifications n\'arrivent pas ?';

  @override
  String get setNotifNotArrivingSub =>
      'Les réglages de batterie de ton téléphone les bloquent peut-être';

  @override
  String get setHealthWrite => 'Écrire dans Health Connect';

  @override
  String get setHealthWriteSub =>
      'Ton apport en eau est aussi enregistré dans le carnet de santé d\'Android. Sipling n\'y lit jamais rien.';

  @override
  String get setDarkTheme => 'Thème sombre';

  @override
  String get setForestTheme => 'Thème de forêt';

  @override
  String get setTreeSpecies => 'Espèces d\'arbres';

  @override
  String get setMyData => 'Mes données';

  @override
  String get setMyDataSub =>
      'Tout reste sur ton téléphone et n\'est jamais envoyé nulle part';

  @override
  String get setResetAll => 'Réinitialiser toutes les données';

  @override
  String setEveryHours(int h) {
    return 'Toutes les $h h';
  }

  @override
  String setEveryMinutes(int m) {
    return 'Toutes les $m min';
  }

  @override
  String get setHealthNoConnect => 'Cet appareil n\'a pas Health Connect.';

  @override
  String get setHealthNotInstalledTitle => 'Health Connect n\'est pas installé';

  @override
  String get setHealthNeedsUpdateTitle => 'Health Connect doit être mis à jour';

  @override
  String get setHealthInstallBody =>
      'L\'application Health Connect est nécessaire pour écrire ton apport en eau dans le carnet de santé d\'Android.';

  @override
  String get setOpenPlayStore => 'Ouvrir dans le Play Store';

  @override
  String get setHealthPermissionDenied =>
      'Autorisation refusée, rien ne sera écrit dans le carnet de santé.';

  @override
  String get setHealthEnabled =>
      'Désormais, ton apport en eau sera aussi écrit dans Health Connect.';

  @override
  String get setCancel => 'Annuler';

  @override
  String get setSave => 'Enregistrer';

  @override
  String setSuggested(int ml) {
    return 'Suggéré : $ml ml';
  }

  @override
  String get setBackToSuggested => 'Revenir au suggéré';

  @override
  String get setIntervalDialogTitle => 'À quelle fréquence te rappeler ?';

  @override
  String get setWakeHelp => 'À quelle heure te réveilles-tu ?';

  @override
  String get setSleepHelp => 'À quelle heure te couches-tu ?';

  @override
  String get setAwakeMin4h =>
      'Tes heures d\'éveil doivent durer au moins 4 heures';

  @override
  String get setResetConfirmTitle => 'Tu es sûr ?';

  @override
  String get setResetConfirmBody =>
      'Ta forêt, tes séries et tous tes enregistrements seront supprimés. C\'est irréversible.';

  @override
  String get setResetConfirmButton => 'Réinitialiser';

  @override
  String get statsTitle => 'Statistiques';

  @override
  String get statsDailyAverage => 'Moyenne quotidienne';

  @override
  String get statsGoalDays => 'Jours d\'objectif atteint';

  @override
  String get statsCurrentStreak => 'Série actuelle';

  @override
  String get statsUnitDays => 'jours';

  @override
  String get statsTotalTrees => 'Total d\'arbres';

  @override
  String statsLastDays(int days) {
    return 'Derniers $days jours';
  }

  @override
  String get statsYourDrinks => 'Tes boissons';

  @override
  String statsRangeDays(int days) {
    return '$days jours';
  }

  @override
  String get statsWeekdayMon => 'Lun';

  @override
  String get statsWeekdayTue => 'Mar';

  @override
  String get statsWeekdayWed => 'Mer';

  @override
  String get statsWeekdayThu => 'Jeu';

  @override
  String get statsWeekdayFri => 'Ven';

  @override
  String get statsWeekdaySat => 'Sam';

  @override
  String get statsWeekdaySun => 'Dim';

  @override
  String get statsNoRecords => 'Aucun enregistrement pour l\'instant.';

  @override
  String get statsBmiTitle => 'Indice de masse corporelle';

  @override
  String get statsBmiDisclaimer => 'À titre informatif,\npas un avis médical';

  @override
  String get statsAchievements => 'Succès';

  @override
  String statsAchievementsEarned(int count) {
    return '$count obtenus';
  }

  @override
  String get achScreenTitle => 'Succès';

  @override
  String get forestTitle => 'Ta forêt';

  @override
  String forestSubtitle(int trees, int days) {
    return '$trees arbres • meilleure série $days jours';
  }

  @override
  String get forestSpeciesTooltip => 'Espèces d\'arbres';

  @override
  String get forestEmptyTitle => 'Ta forêt est encore vide';

  @override
  String get forestEmptyBody =>
      'Quand tu boiras ton premier verre, une pousse apparaîtra ici.';

  @override
  String get speciesScreenTitle => 'Espèces d\'arbres';

  @override
  String get speciesScreenIntro =>
      'Tu peux choisir l\'espèce de la pousse de demain. Les anciens arbres de ta forêt gardent l\'espèce avec laquelle ils ont été plantés.';

  @override
  String get speciesScreenSelected => 'Sélectionné';

  @override
  String get speciesScreenUnlocked => 'Débloqué';

  @override
  String speciesScreenUnlockTitle(String name) {
    return 'Débloquer l\'arbre $name';
  }

  @override
  String get speciesScreenRewardBody =>
      'Regarde une courte pub pour débloquer cette espèce définitivement. La pub est entièrement facultative — il n\'y a aucune pub forcée dans l\'application.';

  @override
  String get speciesScreenCancel => 'Annuler';

  @override
  String get speciesScreenWatchAd => 'Regarder la pub';

  @override
  String get seasonScreenTitle => 'Thème de forêt';

  @override
  String get seasonScreenIntro =>
      'Les couleurs de ta forêt changent, pas ses arbres. Aucun thème n\'affecte ton suivi, ton objectif ou ta série.';

  @override
  String get seasonScreenProOnly => 'Réservé aux membres Pro';

  @override
  String get seasonScreenSelected => 'Sélectionné';

  @override
  String get setSectionHome => 'Écran d\'accueil';

  @override
  String get setAddWidget => 'Ajouter le widget à l\'écran d\'accueil';

  @override
  String get setAddWidgetSub =>
      'Ajoutez de l\'eau d\'un seul geste, sans ouvrir l\'appli';

  @override
  String get setAddWidgetManual =>
      'Appui long sur l\'écran d\'accueil → Widgets → choisissez Sipling';

  @override
  String get wrappedTitle => 'Ta rétrospective forêt';

  @override
  String get wrappedHeadline => 'Ton parcours jusqu\'ici';

  @override
  String wrappedLiters(int liters) {
    return '$liters L';
  }

  @override
  String get wrappedLitersLabel => 'eau totale';

  @override
  String get wrappedTreesLabel => 'arbres';

  @override
  String get wrappedStreakLabel => 'meilleure série';

  @override
  String get wrappedDaysLabel => 'jours';

  @override
  String get wrappedShare => 'Partager';

  @override
  String get wrappedShareText =>
      'Je fais grandir ma forêt avec Sipling, gorgée après gorgée 🌱 sipling-app.web.app';

  @override
  String get homeMoreDrinks => 'Autre';

  @override
  String addFactorWaterEq(int ml, int percent) {
    return '≈ $ml ml d\'\'eau ($percent %)';
  }

  @override
  String proPerMonth(String price) {
    return '$price / mois';
  }

  @override
  String get proRestore => 'Restaurer les achats';

  @override
  String get proTerms => 'Conditions d\'utilisation';

  @override
  String get proPrivacyLink => 'Confidentialité';

  @override
  String get proStoreUnavailable => 'Boutique indisponible pour le moment';

  @override
  String get proAutoRenew =>
      'Abonnement mensuel, renouvelé automatiquement. Annulez au moins 24 heures avant le renouvellement dans les réglages de votre compte de boutique ; sinon il se renouvelle.';
}
