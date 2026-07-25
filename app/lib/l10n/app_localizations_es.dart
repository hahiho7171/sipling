// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class LEs extends L {
  LEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Sipling';

  @override
  String get drinkWater => 'Agua';

  @override
  String get drinkTea => 'Té';

  @override
  String get drinkCoffee => 'Café';

  @override
  String get drinkMilk => 'Leche';

  @override
  String get drinkJuice => 'Zumo';

  @override
  String get drinkSoda => 'Refresco';

  @override
  String get drinkAlcohol => 'Alcohol';

  @override
  String get speciesOak => 'Roble';

  @override
  String get speciesPine => 'Pino';

  @override
  String get speciesCherry => 'Cerezo';

  @override
  String get speciesAcacia => 'Acacia';

  @override
  String get speciesMaple => 'Arce';

  @override
  String get speciesOlive => 'Olivo';

  @override
  String get speciesGolden => 'Hoja Dorada';

  @override
  String get speciesJacaranda => 'Jacarandá';

  @override
  String get unlockFree => 'Desbloqueado';

  @override
  String unlockStreak(int days) {
    return 'Alcanza tu meta $days días seguidos';
  }

  @override
  String unlockTotalTrees(int count) {
    return 'Haz crecer $count árboles en total';
  }

  @override
  String get unlockRewardedAd => 'Mira un anuncio corto';

  @override
  String get unlockPro => 'Solo para miembros Pro';

  @override
  String get achFirstSproutTitle => 'Primer Brote';

  @override
  String get achFirstSproutDesc => 'Bebiste tu primer vaso';

  @override
  String get achFirstTreeTitle => 'Primer Árbol';

  @override
  String get achFirstTreeDesc => 'Completaste una meta diaria';

  @override
  String get achStreak3Title => 'Empieza un Hábito';

  @override
  String get achStreak3Desc => 'Alcanzaste tu meta 3 días seguidos';

  @override
  String get achStreak7Title => 'Una Semana Entera';

  @override
  String get achStreak7Desc => 'Alcanzaste tu meta 7 días seguidos';

  @override
  String get achStreak30Title => 'Un Mes Sin Fallar';

  @override
  String get achStreak30Desc => 'Alcanzaste tu meta 30 días seguidos';

  @override
  String get achTrees10Title => 'Pequeña Arboleda';

  @override
  String get achTrees10Desc => 'Hiciste crecer 10 árboles';

  @override
  String get achTrees50Title => 'Guardián del Bosque';

  @override
  String get achTrees50Desc => 'Hiciste crecer 50 árboles';

  @override
  String get achEarlyBirdTitle => 'Madrugador';

  @override
  String get achEarlyBirdDesc => 'Bebiste agua antes de las 9 a. m.';

  @override
  String get achVarietyTitle => 'Paladar Variado';

  @override
  String get achVarietyDesc => 'Registraste al menos 4 bebidas diferentes';

  @override
  String get achPerfectWeekTitle => 'Semana Perfecta';

  @override
  String get achPerfectWeekDesc =>
      'Alcanzaste tu meta todos los días durante 7 días';

  @override
  String get seasonClassicName => 'Clásico';

  @override
  String get seasonClassicDesc => 'Verde todo el año';

  @override
  String get seasonAutoName => 'Automático';

  @override
  String get seasonAutoDesc => 'Deja que tu bosque siga el calendario';

  @override
  String get seasonSpringName => 'Primavera';

  @override
  String get seasonSpringDesc => 'Hojas frescas, cielo despejado';

  @override
  String get seasonSummerName => 'Verano';

  @override
  String get seasonSummerDesc => 'Verdes intensos y profundos';

  @override
  String get seasonAutumnName => 'Otoño';

  @override
  String get seasonAutumnDesc => 'Hojas naranjas, luz cálida';

  @override
  String get seasonWinterName => 'Invierno';

  @override
  String get seasonWinterDesc => 'Colinas nevadas, luz fría';

  @override
  String get bmiUnderweight => 'Bajo peso';

  @override
  String get bmiNormal => 'Normal';

  @override
  String get bmiOverweight => 'Sobrepeso';

  @override
  String get bmiObese => 'Obesidad';

  @override
  String get notifTitle1 => 'Hora del agua 💧';

  @override
  String get notifBody1 => 'Tu brote te espera, ¿bebemos un vaso?';

  @override
  String get notifTitle2 => 'Un sorbo más';

  @override
  String get notifBody2 => 'Los pequeños sorbos hacen grandes árboles.';

  @override
  String get notifTitle3 => 'Tu brote tiene sed 🌱';

  @override
  String get notifBody3 => 'Un vaso de agua lo ayuda a crecer un poco más.';

  @override
  String get notifTitle4 => 'Recordatorio';

  @override
  String get notifBody4 => 'Un paso más cerca del árbol de hoy.';

  @override
  String get notifTitle5 => 'Pausa para el agua';

  @override
  String get notifBody5 => 'El vaso que bebas ahora es el árbol de esta noche.';

  @override
  String get activityLow => 'Sedentario';

  @override
  String get activityLowHint => 'Trabajo de oficina, poco caminar';

  @override
  String get activityMedium => 'Moderado';

  @override
  String get activityMediumHint => 'Ejercicio 1-3 días por semana';

  @override
  String get activityHigh => 'Activo';

  @override
  String get activityHighHint => 'Ejercicio 4+ días por semana';

  @override
  String get cupGlass => 'Vaso';

  @override
  String get cupBottle => 'Botella';

  @override
  String get cupLarge => 'Grande';

  @override
  String get homeNewAchievement => 'Nuevo logro';

  @override
  String get homeUndoLast => 'Deshacer última entrada';

  @override
  String get homeStageSeed =>
      'Tu semilla está en la tierra, esperando su primer sorbo';

  @override
  String get homeStageSprout => 'Brotó 🌱';

  @override
  String get homeStageSapling => 'Tu brote está creciendo';

  @override
  String get homeStageAlmost => '¡Casi un árbol!';

  @override
  String get homeStageReady => 'El árbol de hoy está listo 🌳';

  @override
  String get homePaceDone => 'Un nuevo brote te espera mañana';

  @override
  String get homePaceStart => 'Empieza el día con un vaso';

  @override
  String homePaceBehind(int ml) {
    return 'Vas $ml ml por detrás para esta hora — aún puedes ponerte al día';
  }

  @override
  String get homePaceOnTrack => 'Vas a buen ritmo 👌';

  @override
  String get homeGoalDone => 'Alcanzaste tu meta diaria';

  @override
  String homeRemaining(int ml) {
    return 'Faltan $ml ml';
  }

  @override
  String homeStreakDays(int days) {
    return '$days días';
  }

  @override
  String get homeCelebrateTitle => '¡Tu árbol ha crecido!';

  @override
  String get homeCelebrateBody =>
      'Alcanzaste la meta de hoy. Este árbol ya es parte de tu bosque.';

  @override
  String homeStreakLabel(int days) {
    return 'Racha de $days días';
  }

  @override
  String get homeCelebrateOk => 'Genial';

  @override
  String get addWhatTitle => '¿Qué bebiste?';

  @override
  String get addAmount => 'Cantidad';

  @override
  String get addConfirm => 'Añadir';

  @override
  String get addFactorWater => 'Cuenta por completo para tu meta.';

  @override
  String get addFactorAlcohol =>
      'El alcohol te deshidrata, así que se resta de tu meta.';

  @override
  String addFactorPercent(int percent) {
    return 'Cuenta un $percent% para tu meta.';
  }

  @override
  String get sumTitle => 'Resumen de ayer';

  @override
  String get sumTreeGrown => 'Tu árbol ha crecido 🌳';

  @override
  String get sumSaplingOnWay => 'Tu brote está en camino 🌱';

  @override
  String get sumBodyDone =>
      'Alcanzaste tu meta. Este árbol es parte de tu bosque.';

  @override
  String sumPercent(int percent) {
    return 'Ayer llegaste al $percent% de tu meta. Tu brote te espera justo donde lo dejaste — ningún árbol se marchita nunca.';
  }

  @override
  String get sumStatCounted => 'Contado';

  @override
  String get sumStatGoal => 'Meta';

  @override
  String get sumStatStreak => 'Racha';

  @override
  String sumStreakDays(int days) {
    return '$days días';
  }

  @override
  String get sumStartToday => 'Empieza hoy';

  @override
  String get sumWhatDrank => 'Lo que bebiste';

  @override
  String sumDrinkAmount(String name, int ml) {
    return '$name $ml ml';
  }

  @override
  String get navToday => 'Hoy';

  @override
  String get navForest => 'Bosque';

  @override
  String get navStats => 'Estadísticas';

  @override
  String get navSettings => 'Ajustes';

  @override
  String get onbContinue => 'Continuar';

  @override
  String get onbFinish => 'Plantar mi brote';

  @override
  String get onbWelcomeTagline =>
      'Cada sorbo, un brote.\nBebe agua y tu árbol crece; con los días, también tu bosque.';

  @override
  String get onbWelcomeNoPenalty =>
      'Tu árbol nunca se marchita. Aquí no hay castigos.';

  @override
  String get onbGenderTitle => 'Vamos a conocerte';

  @override
  String get onbGenderSubtitle =>
      'Tu meta diaria de agua se calcula con esto. Todo queda en tu teléfono y nunca se envía a ningún sitio.';

  @override
  String get onbGenderFemale => 'Mujer';

  @override
  String get onbGenderMale => 'Hombre';

  @override
  String get onbGenderOther => 'Prefiero no decirlo';

  @override
  String get onbBodyTitle => 'Altura, peso, edad';

  @override
  String get onbBodySubtitle => 'Desliza para ajustar.';

  @override
  String get onbBodyAge => 'Edad';

  @override
  String get onbBodyHeight => 'Altura';

  @override
  String get onbBodyWeight => 'Peso';

  @override
  String get onbBodyBmiLabel => 'Tu índice de masa corporal';

  @override
  String get onbBodyDisclaimer => 'Solo informativo, no es consejo médico.';

  @override
  String get onbActivityTitle => '¿Cuánto te mueves?';

  @override
  String get onbActivitySubtitle => 'Cuanto más sudas, más agua necesitas.';

  @override
  String get onbGoalTitle => 'Tu meta diaria';

  @override
  String get onbGoalSubtitle => 'Puedes cambiarla cuando quieras en Ajustes.';

  @override
  String get onbGoalUnit => 'mililitros / día';

  @override
  String onbGoalGlasses(int glasses) {
    return 'unos $glasses vasos';
  }

  @override
  String get onbGoalReference =>
      'Esta meta se adapta a tu peso y nivel de actividad, según la referencia de ingesta adecuada de agua de la Autoridad Europea de Seguridad Alimentaria (EFSA, 2010). El agua que obtienes de los alimentos no está incluida en esta cifra.';

  @override
  String get proAppBarTitle => 'Sipling Pro';

  @override
  String get proHeaderTitle => 'Sipling sin anuncios';

  @override
  String get proHeaderSub => 'Mantén tu bosque creciendo';

  @override
  String get proPerkNoAdsTitle => 'Cero anuncios';

  @override
  String get proPerkNoAdsSub =>
      'Hasta el anuncio del resumen diario desaparece';

  @override
  String get proPerkTreesTitle => 'Todas las especies de árboles';

  @override
  String get proPerkTreesSub => 'Incluidos Hoja Dorada y Jacarandá';

  @override
  String get proPerkHistoryTitle => 'Historial ilimitado';

  @override
  String get proPerkHistorySub => 'Estadísticas detalladas de cada mes';

  @override
  String get proPerkThemesTitle => 'Opciones de tema';

  @override
  String get proPerkThemesSub => 'Apariencias de bosque por estación';

  @override
  String get proPerkSupportTitle => 'Apoya el desarrollo';

  @override
  String get proPerkSupportSub => 'Sipling es un proyecto de una sola persona';

  @override
  String get proNotConnectedNote =>
      'Las compras aún no están conectadas. Por ahora puedes activar y desactivar Pro para probarlo.';

  @override
  String get proButtonOn => 'Pro activado — desactivar';

  @override
  String get proButtonTry => 'Probar Pro';

  @override
  String get batAppBarTitle => 'Si las notificaciones no llegan';

  @override
  String get batIntro =>
      'Algunas marcas de teléfono cierran las apps en segundo plano para ahorrar batería, así que los recordatorios pueden retrasarse o no llegar. Basta con hacer el ajuste de abajo una vez.';

  @override
  String get batXiaomi1 =>
      'Ajustes → Aplicaciones → Sipling → Ahorro de batería → \"Sin restricciones\"';

  @override
  String get batXiaomi2 =>
      'Ajustes → Aplicaciones → Sipling → Inicio automático → Activado';

  @override
  String get batXiaomi3 =>
      'En la pantalla de apps recientes, desliza Sipling hacia abajo y toca el icono del candado';

  @override
  String get batSamsung1 =>
      'Ajustes → Aplicaciones → Sipling → Batería → \"Sin restricciones\"';

  @override
  String get batSamsung2 =>
      'Ajustes → Batería → Límites de uso en segundo plano → quita Sipling de la lista de \"Aplicaciones inactivas\"';

  @override
  String get batHuawei1 =>
      'Ajustes → Batería → Inicio de aplicaciones → Sipling → desactiva Gestionar automáticamente';

  @override
  String get batHuawei2 =>
      'Activa Inicio automático, Inicio secundario y Ejecutar en segundo plano';

  @override
  String get batOppo1 =>
      'Ajustes → Batería → Alto consumo de energía en segundo plano → permite Sipling';

  @override
  String get batOppo2 =>
      'Ajustes → Aplicaciones → Sipling → Uso de batería → Permitir actividad en segundo plano';

  @override
  String get batFooter =>
      'Los nombres de los menús pueden variar un poco según el modelo de tu teléfono. Lo que buscas es un ajuste como \"optimización de batería\", \"actividad en segundo plano\" o \"inicio automático\".';

  @override
  String get setTitle => 'Ajustes';

  @override
  String get setSectionGoal => 'Meta';

  @override
  String get setSectionReminders => 'Recordatorios';

  @override
  String get setSectionCups => 'Mis vasos';

  @override
  String get setSectionHealth => 'Salud';

  @override
  String get setSectionAppearance => 'Apariencia';

  @override
  String get setSectionApp => 'Aplicación';

  @override
  String get setProTagline => 'Sin anuncios, todos los árboles desbloqueados';

  @override
  String get setDailyGoal => 'Meta diaria';

  @override
  String setMl(int ml) {
    return '$ml ml';
  }

  @override
  String get setProfileInfo => 'Mi perfil';

  @override
  String setWeightKg(int kg) {
    return '$kg kg';
  }

  @override
  String get setRemindersOn => 'Recordatorios activados';

  @override
  String get setFrequency => 'Frecuencia';

  @override
  String get setAwakeHours => 'Mis horas despierto';

  @override
  String get setStopWhenDone => 'Parar al alcanzar la meta';

  @override
  String get setStopWhenDoneSub =>
      'Cuando alcances tu meta diaria, se cancelan los recordatorios restantes';

  @override
  String get setSilent => 'Notificación silenciosa';

  @override
  String get setSilentSub => 'Sin sonido ni vibración';

  @override
  String get setNotifNotArriving => '¿No llegan las notificaciones?';

  @override
  String get setNotifNotArrivingSub =>
      'Puede que los ajustes de batería de tu teléfono las estén bloqueando';

  @override
  String get setHealthWrite => 'Escribir en Health Connect';

  @override
  String get setHealthWriteSub =>
      'Tu consumo de agua también se guarda en el registro de salud de Android. Sipling nunca lee nada de ahí.';

  @override
  String get setDarkTheme => 'Tema oscuro';

  @override
  String get setForestTheme => 'Tema del bosque';

  @override
  String get setTreeSpecies => 'Especies de árboles';

  @override
  String get setMyData => 'Mis datos';

  @override
  String get setMyDataSub =>
      'Todo queda en tu teléfono y nunca se envía a ningún sitio';

  @override
  String get setResetAll => 'Restablecer todos los datos';

  @override
  String setEveryHours(int h) {
    String _temp0 = intl.Intl.pluralLogic(
      h,
      locale: localeName,
      other: 'Cada $h horas',
      one: 'Cada hora',
    );
    return '$_temp0';
  }

  @override
  String setEveryMinutes(int m) {
    String _temp0 = intl.Intl.pluralLogic(
      m,
      locale: localeName,
      other: 'Cada $m minutos',
      one: 'Cada minuto',
    );
    return '$_temp0';
  }

  @override
  String get setHealthNoConnect => 'Este dispositivo no tiene Health Connect.';

  @override
  String get setHealthNotInstalledTitle => 'Health Connect no está instalado';

  @override
  String get setHealthNeedsUpdateTitle =>
      'Health Connect necesita actualizarse';

  @override
  String get setHealthInstallBody =>
      'Se necesita la app Health Connect para escribir tu consumo de agua en el registro de salud de Android.';

  @override
  String get setOpenPlayStore => 'Abrir en Play Store';

  @override
  String get setHealthPermissionDenied =>
      'Permiso denegado, no se escribirá nada en el registro de salud.';

  @override
  String get setHealthEnabled =>
      'A partir de ahora tu consumo de agua también se escribirá en Health Connect.';

  @override
  String get setCancel => 'Cancelar';

  @override
  String get setSave => 'Guardar';

  @override
  String setSuggested(int ml) {
    return 'Sugerido: $ml ml';
  }

  @override
  String get setBackToSuggested => 'Volver al sugerido';

  @override
  String get setIntervalDialogTitle => '¿Cada cuánto te recordamos?';

  @override
  String get setWakeHelp => '¿A qué hora te despiertas?';

  @override
  String get setSleepHelp => '¿A qué hora te acuestas?';

  @override
  String get setAwakeMin4h => 'Tus horas despierto deben ser al menos 4 horas';

  @override
  String get setResetConfirmTitle => '¿Estás seguro?';

  @override
  String get setResetConfirmBody =>
      'Tu bosque, tus rachas y todos tus registros se borrarán. Esto no se puede deshacer.';

  @override
  String get setResetConfirmButton => 'Restablecer';

  @override
  String get statsTitle => 'Estadísticas';

  @override
  String get statsDailyAverage => 'Promedio diario';

  @override
  String get statsGoalDays => 'Días con meta cumplida';

  @override
  String get statsCurrentStreak => 'Racha actual';

  @override
  String get statsUnitDays => 'días';

  @override
  String get statsTotalTrees => 'Árboles totales';

  @override
  String statsLastDays(int days) {
    return 'Últimos $days días';
  }

  @override
  String get statsYourDrinks => 'Tus bebidas';

  @override
  String statsRangeDays(int days) {
    return '$days días';
  }

  @override
  String get statsWeekdayMon => 'Lun';

  @override
  String get statsWeekdayTue => 'Mar';

  @override
  String get statsWeekdayWed => 'Mié';

  @override
  String get statsWeekdayThu => 'Jue';

  @override
  String get statsWeekdayFri => 'Vie';

  @override
  String get statsWeekdaySat => 'Sáb';

  @override
  String get statsWeekdaySun => 'Dom';

  @override
  String get statsNoRecords => 'Aún no hay registros.';

  @override
  String get statsBmiTitle => 'Índice de masa corporal';

  @override
  String get statsBmiDisclaimer => 'Solo informativo,\nno es consejo médico';

  @override
  String get statsAchievements => 'Logros';

  @override
  String statsAchievementsEarned(int count) {
    return '$count conseguidos';
  }

  @override
  String get achScreenTitle => 'Logros';

  @override
  String get forestTitle => 'Tu bosque';

  @override
  String forestSubtitle(int trees, int days) {
    return '$trees árboles • mejor racha $days días';
  }

  @override
  String get forestSpeciesTooltip => 'Especies de árboles';

  @override
  String get forestEmptyTitle => 'Tu bosque aún está vacío';

  @override
  String get forestEmptyBody =>
      'Cuando bebas tu primer vaso, aparecerá aquí un brote.';

  @override
  String get speciesScreenTitle => 'Especies de árboles';

  @override
  String get speciesScreenIntro =>
      'Puedes elegir la especie del brote de mañana. Los árboles antiguos de tu bosque conservan la especie con la que fueron plantados.';

  @override
  String get speciesScreenSelected => 'Seleccionado';

  @override
  String get speciesScreenUnlocked => 'Desbloqueado';

  @override
  String speciesScreenUnlockTitle(String name) {
    return 'Desbloquea el árbol $name';
  }

  @override
  String get speciesScreenRewardBody =>
      'Mira un anuncio corto para desbloquear esta especie para siempre. El anuncio es totalmente opcional — no hay anuncios forzados en ninguna parte de la app.';

  @override
  String get speciesScreenCancel => 'Cancelar';

  @override
  String get speciesScreenWatchAd => 'Ver anuncio';

  @override
  String get seasonScreenTitle => 'Tema del bosque';

  @override
  String get seasonScreenIntro =>
      'Cambian los colores de tu bosque, no sus árboles. Ningún tema afecta a tu seguimiento, tu meta ni tu racha.';

  @override
  String get seasonScreenProOnly => 'Solo para miembros Pro';

  @override
  String get seasonScreenSelected => 'Seleccionado';

  @override
  String get setSectionHome => 'Pantalla de inicio';

  @override
  String get setAddWidget => 'Añadir widget a la pantalla de inicio';

  @override
  String get setAddWidgetSub => 'Añade agua con un toque, sin abrir la app';

  @override
  String get setAddWidgetManual =>
      'Mantén pulsada la pantalla de inicio → Widgets → elige Sipling';

  @override
  String get wrappedTitle => 'Tu resumen del bosque';

  @override
  String get wrappedHeadline => 'Tu recorrido hasta ahora';

  @override
  String wrappedLiters(int liters) {
    return '$liters L';
  }

  @override
  String get wrappedLitersLabel => 'agua total';

  @override
  String get wrappedTreesLabel => 'árboles';

  @override
  String get wrappedStreakLabel => 'mejor racha';

  @override
  String get wrappedDaysLabel => 'días';

  @override
  String get wrappedShare => 'Compartir';

  @override
  String get wrappedShareText =>
      'Estoy cultivando mi bosque con Sipling, sorbo a sorbo 🌱 sipling-app.web.app';

  @override
  String get homeMoreDrinks => 'Otro';

  @override
  String addFactorWaterEq(int ml, int percent) {
    return '≈ $ml ml de agua ($percent%)';
  }

  @override
  String proPerMonth(String price) {
    return '$price / mes';
  }

  @override
  String get proRestore => 'Restaurar compras';

  @override
  String get proTerms => 'Términos de uso';

  @override
  String get proPrivacyLink => 'Política de privacidad';

  @override
  String get proStoreUnavailable => 'La tienda no está disponible ahora';

  @override
  String get proAutoRenew =>
      'Suscripción mensual, se renueva automáticamente. Cancela al menos 24 horas antes de la renovación en los ajustes de tu cuenta de la tienda; de lo contrario, se renueva.';

  @override
  String get homeCalcNeed => 'Mi necesidad de agua';

  @override
  String get needTitle => 'Tu necesidad diaria de agua';

  @override
  String get needIntro =>
      'Introduce tu altura, tu peso y tu nivel de actividad y Sipling calculará cuánta agua necesitas al día.';

  @override
  String get needResultLabel => 'Recomendado para ti';

  @override
  String needCurrentGoal(int ml) {
    return 'Tu meta actual: $ml ml';
  }

  @override
  String get needApply => 'Usar como mi meta';

  @override
  String get needApplied => 'Tu meta se ha actualizado';

  @override
  String get needMeasuresTitle => 'Tus medidas';

  @override
  String get needLearnTitle => 'El agua y tu cuerpo';

  @override
  String get factNotifTitle1 => 'Tres cuartos de agua';

  @override
  String get factNotifBody1 =>
      'Alrededor de tres cuartas partes de tu cerebro son agua. Mantente bien hidratado.';

  @override
  String get factNotifTitle2 => 'El enfoque necesita agua';

  @override
  String get factNotifBody2 =>
      'Perder solo un 1-2% del agua de tu cuerpo puede dificultar la concentración.';

  @override
  String get factNotifTitle3 => 'La sed llega tarde';

  @override
  String get factNotifBody3 =>
      'Cuando sientes sed, tu cuerpo ya ha empezado a quedarse corto de agua.';

  @override
  String get factNotifTitle4 => 'Tu sistema de refrigeración';

  @override
  String get factNotifBody4 =>
      'Sudar es la forma en que tu cuerpo se refresca, y para eso gasta agua.';

  @override
  String get factNotifTitle5 => 'Fíjate en el color';

  @override
  String get factNotifBody5 =>
      'Amarillo pálido suele indicar buena hidratación. Más oscuro, bebe más.';

  @override
  String get factLearn1Title => 'Más de la mitad de ti es agua';

  @override
  String get factLearn1Body =>
      'El agua supone aproximadamente el 50-60% de un cuerpo adulto y cerca del 73% del cerebro. Transporta nutrientes, amortigua tus articulaciones y mantiene estable tu temperatura.';

  @override
  String get factLearn2Title => 'Qué pasa cuando bebes muy poco';

  @override
  String get factLearn2Body =>
      'Incluso una deshidratación leve, con una pérdida de apenas un 1-2% del agua de tu cuerpo, se asocia con cansancio, dolores de cabeza, menor concentración y peor estado de ánimo. A largo plazo, beber muy poco aumenta la probabilidad de estreñimiento y cálculos renales.';

  @override
  String get factLearn3Title => 'La sed es una señal tardía';

  @override
  String get factLearn3Body =>
      'La sed suele aparecer cuando tu cuerpo ya ha perdido agua, y esta sensación se debilita con la edad. Beber a intervalos regulares funciona mejor que esperar a tener sed.';

  @override
  String get factLearn4Title =>
      'El color de la orina es la forma más sencilla de comprobarlo';

  @override
  String get factLearn4Body =>
      'Un color paja pálido suele indicar buena hidratación, mientras que el amarillo oscuro sugiere que necesitas beber más. Algunas vitaminas y medicamentos cambian el color, así que tómalo como una pista, no como un diagnóstico.';

  @override
  String get factLearn5Title => '¿Cuánto es suficiente?';

  @override
  String get factLearn5Body =>
      'La referencia de la EFSA para una ingesta adecuada a través de bebidas es de unos 2 litros al día para mujeres y 2,5 litros para hombres, en un clima templado y con actividad moderada. El calor, el ejercicio, el embarazo y la lactancia aumentan esta necesidad. Sipling la ajusta según tu peso y tu nivel de actividad.';

  @override
  String get homeBoost => 'Día caluroso / deporte';

  @override
  String get boostTitle => 'Aumenta la meta de hoy';

  @override
  String get boostBody =>
      'En un día caluroso o después de hacer ejercicio, añade un extra a la meta de hoy. Se restablece solo mañana.';

  @override
  String get boostReset => 'Restablecer';

  @override
  String boostActive(int ml) {
    return '+$ml ml añadidos hoy';
  }

  @override
  String get logTitle => 'Registros de hoy';

  @override
  String get logEmpty => 'Aún no hay registros hoy';

  @override
  String get logOpen => 'Registros de hoy';

  @override
  String get logDelete => 'Eliminar';

  @override
  String get setReminderStyle => 'Estilo de recordatorio';

  @override
  String get styleNormal => 'Normal';

  @override
  String get styleNormalSub => 'Sonido y vibración';

  @override
  String get styleGentle => 'Suave';

  @override
  String get styleGentleSub => 'Solo vibración, sin sonido';

  @override
  String get styleSilent => 'Silencioso';

  @override
  String get styleSilentSub => 'Sin sonido ni vibración';

  @override
  String get speciesScreenAdUnavailable =>
      'El anuncio no está listo. Inténtalo de nuevo en un momento.';

  @override
  String get setHotDayTitle => 'Aviso de día caluroso';

  @override
  String get setHotDaySub =>
      'Recordatorio extra de agua cuando hace calor en tu ciudad (solo iPhone)';

  @override
  String get setHotDayCity => 'Ciudad';

  @override
  String get setHotDayCitySet => 'Elegir';

  @override
  String get setHotDayCityHint => 'Ej. Estambul';

  @override
  String get notifHotDayTitle => 'Hoy hace calor 🌡️';

  @override
  String notifHotDayBody(int temp) {
    return 'Hoy hace $temp°C — intenta beber un poco más a menudo.';
  }
}
