// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class LKo extends L {
  LKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => 'Sipling';

  @override
  String get drinkWater => '물';

  @override
  String get drinkTea => '차';

  @override
  String get drinkCoffee => '커피';

  @override
  String get drinkMilk => '우유';

  @override
  String get drinkJuice => '주스';

  @override
  String get drinkSoda => '탄산음료';

  @override
  String get drinkAlcohol => '술';

  @override
  String get speciesOak => '참나무';

  @override
  String get speciesPine => '소나무';

  @override
  String get speciesCherry => '벚나무';

  @override
  String get speciesAcacia => '아카시아';

  @override
  String get speciesMaple => '단풍나무';

  @override
  String get speciesOlive => '올리브나무';

  @override
  String get speciesGolden => '황금 잎';

  @override
  String get speciesJacaranda => '자카란다';

  @override
  String get unlockFree => '열림';

  @override
  String unlockStreak(int days) {
    return '$days일 연속으로 목표 달성하기';
  }

  @override
  String unlockTotalTrees(int count) {
    return '나무 $count그루 키우기';
  }

  @override
  String get unlockRewardedAd => '짧은 광고 보기';

  @override
  String get unlockPro => 'Pro 회원 전용';

  @override
  String get achFirstSproutTitle => '첫 새싹';

  @override
  String get achFirstSproutDesc => '첫 잔을 마셨어요';

  @override
  String get achFirstTreeTitle => '첫 나무';

  @override
  String get achFirstTreeDesc => '하루 목표를 달성했어요';

  @override
  String get achStreak3Title => '습관의 시작';

  @override
  String get achStreak3Desc => '3일 연속으로 목표를 달성했어요';

  @override
  String get achStreak7Title => '꼬박 일주일';

  @override
  String get achStreak7Desc => '7일 연속으로 목표를 달성했어요';

  @override
  String get achStreak30Title => '한 달 내내';

  @override
  String get achStreak30Desc => '30일 연속으로 목표를 달성했어요';

  @override
  String get achTrees10Title => '작은 숲';

  @override
  String get achTrees10Desc => '나무 10그루를 키웠어요';

  @override
  String get achTrees50Title => '숲지기';

  @override
  String get achTrees50Desc => '나무 50그루를 키웠어요';

  @override
  String get achEarlyBirdTitle => '일찍 일어난 사람';

  @override
  String get achEarlyBirdDesc => '아침 9시 전에 물을 마셨어요';

  @override
  String get achVarietyTitle => '다양한 입맛';

  @override
  String get achVarietyDesc => '서로 다른 음료를 4가지 이상 기록했어요';

  @override
  String get achPerfectWeekTitle => '완벽한 한 주';

  @override
  String get achPerfectWeekDesc => '7일 동안 매일 목표를 달성했어요';

  @override
  String get seasonClassicName => '클래식';

  @override
  String get seasonClassicDesc => '일 년 내내 푸른 잎';

  @override
  String get seasonAutoName => '자동';

  @override
  String get seasonAutoDesc => '숲이 달력에 맞춰 바뀌어요';

  @override
  String get seasonSpringName => '봄';

  @override
  String get seasonSpringDesc => '새잎과 맑은 하늘';

  @override
  String get seasonSummerName => '여름';

  @override
  String get seasonSummerDesc => '짙고 선명한 초록';

  @override
  String get seasonAutumnName => '가을';

  @override
  String get seasonAutumnDesc => '주황빛 잎과 따뜻한 빛';

  @override
  String get seasonWinterName => '겨울';

  @override
  String get seasonWinterDesc => '눈 덮인 언덕과 차가운 빛';

  @override
  String get bmiUnderweight => '저체중';

  @override
  String get bmiNormal => '정상';

  @override
  String get bmiOverweight => '과체중';

  @override
  String get bmiObese => '비만';

  @override
  String get notifTitle1 => '물 마실 시간 💧';

  @override
  String get notifBody1 => '묘목이 기다려요. 한 잔 마실까요?';

  @override
  String get notifTitle2 => '한 모금 더';

  @override
  String get notifBody2 => '작은 모금이 큰 나무를 만들어요.';

  @override
  String get notifTitle3 => '묘목이 목말라요 🌱';

  @override
  String get notifBody3 => '물 한 잔이면 조금 더 자라요.';

  @override
  String get notifTitle4 => '알림';

  @override
  String get notifBody4 => '오늘의 나무에 한 걸음 더 가까이.';

  @override
  String get notifTitle5 => '물 마시는 시간';

  @override
  String get notifBody5 => '지금 마시는 한 잔이 오늘 밤의 나무예요.';

  @override
  String get activityLow => '활동 적음';

  @override
  String get activityLowHint => '책상 앞에서 일하고 걷기 적음';

  @override
  String get activityMedium => '보통';

  @override
  String get activityMediumHint => '주 1~3일 운동';

  @override
  String get activityHigh => '활발함';

  @override
  String get activityHighHint => '주 4일 이상 운동';

  @override
  String get cupGlass => '컵';

  @override
  String get cupBottle => '물병';

  @override
  String get cupLarge => '큰 컵';

  @override
  String get homeNewAchievement => '새 업적';

  @override
  String get homeUndoLast => '마지막 기록 취소';

  @override
  String get homeStageSeed => '씨앗이 흙 속에서 첫 모금을 기다려요';

  @override
  String get homeStageSprout => '싹이 났어요 🌱';

  @override
  String get homeStageSapling => '묘목이 자라고 있어요';

  @override
  String get homeStageAlmost => '거의 나무가 됐어요!';

  @override
  String get homeStageReady => '오늘의 나무가 완성됐어요 🌳';

  @override
  String get homePaceDone => '내일 새 묘목이 기다리고 있어요';

  @override
  String get homePaceStart => '물 한 잔으로 하루를 시작해요';

  @override
  String homePaceBehind(int ml) {
    return '이 시간 기준 ${ml}ml 뒤처졌어요. 아직 따라잡을 수 있어요';
  }

  @override
  String get homePaceOnTrack => '딱 좋은 속도예요 👌';

  @override
  String get homeGoalDone => '오늘 목표를 달성했어요';

  @override
  String homeRemaining(int ml) {
    return '${ml}ml 남았어요';
  }

  @override
  String homeStreakDays(int days) {
    return '$days일';
  }

  @override
  String get homeCelebrateTitle => '나무가 자랐어요!';

  @override
  String get homeCelebrateBody => '오늘 목표를 달성했어요. 이 나무는 이제 당신의 숲의 일부예요.';

  @override
  String homeStreakLabel(int days) {
    return '$days일 연속';
  }

  @override
  String get homeCelebrateOk => '좋아요';

  @override
  String get addWhatTitle => '무엇을 마셨나요?';

  @override
  String get addAmount => '양';

  @override
  String get addConfirm => '추가';

  @override
  String get addFactorWater => '목표에 그대로 반영돼요.';

  @override
  String get addFactorAlcohol => '술은 몸의 수분을 빼앗아서 목표에서 빼요.';

  @override
  String addFactorPercent(int percent) {
    return '목표에 $percent%만큼 반영돼요.';
  }

  @override
  String get sumTitle => '어제 요약';

  @override
  String get sumTreeGrown => '나무가 자랐어요 🌳';

  @override
  String get sumSaplingOnWay => '묘목이 자라는 중이에요 🌱';

  @override
  String get sumBodyDone => '목표를 달성했어요. 이 나무는 당신의 숲의 일부예요.';

  @override
  String sumPercent(int percent) {
    return '어제 목표의 $percent%에 도달했어요. 묘목은 그 자리에서 기다리고 있어요. 어떤 나무도 시들지 않아요.';
  }

  @override
  String get sumStatCounted => '반영됨';

  @override
  String get sumStatGoal => '목표';

  @override
  String get sumStatStreak => '연속';

  @override
  String sumStreakDays(int days) {
    return '$days일';
  }

  @override
  String get sumStartToday => '오늘부터 시작';

  @override
  String get sumWhatDrank => '마신 것';

  @override
  String sumDrinkAmount(String name, int ml) {
    return '$name ${ml}ml';
  }

  @override
  String get navToday => '오늘';

  @override
  String get navForest => '숲';

  @override
  String get navStats => '통계';

  @override
  String get navSettings => '설정';

  @override
  String get onbContinue => '계속';

  @override
  String get onbFinish => '묘목 심기';

  @override
  String get onbWelcomeTagline =>
      '한 모금마다 묘목 하나.\n물을 마시면 나무가 자라고, 날이 갈수록 숲이 넓어져요.';

  @override
  String get onbWelcomeNoPenalty => '나무는 절대 시들지 않아요. 여기엔 벌점이 없어요.';

  @override
  String get onbGenderTitle => '당신을 알아갈게요';

  @override
  String get onbGenderSubtitle =>
      '하루 물 목표는 이 정보로 계산돼요. 모두 휴대폰에만 저장되고 어디에도 전송되지 않아요.';

  @override
  String get onbGenderFemale => '여성';

  @override
  String get onbGenderMale => '남성';

  @override
  String get onbGenderOther => '밝히고 싶지 않아요';

  @override
  String get onbBodyTitle => '키, 몸무게, 나이';

  @override
  String get onbBodySubtitle => '밀어서 조절하세요.';

  @override
  String get onbBodyAge => '나이';

  @override
  String get onbBodyHeight => '키';

  @override
  String get onbBodyWeight => '몸무게';

  @override
  String get onbBodyBmiLabel => '당신의 체질량지수';

  @override
  String get onbBodyDisclaimer => '정보 제공용이며 의학적 조언이 아니에요.';

  @override
  String get onbActivityTitle => '얼마나 활동적인가요?';

  @override
  String get onbActivitySubtitle => '땀을 많이 흘릴수록 더 많은 물이 필요해요.';

  @override
  String get onbGoalTitle => '하루 목표';

  @override
  String get onbGoalSubtitle => '설정에서 언제든 바꿀 수 있어요.';

  @override
  String get onbGoalUnit => 'ml / 일';

  @override
  String onbGoalGlasses(int glasses) {
    return '약 $glasses잔';
  }

  @override
  String get onbGoalReference =>
      '이 목표는 유럽식품안전청(EFSA, 2010)의 적정 수분 섭취 기준을 바탕으로 당신의 몸무게와 활동량에 맞춰 조정됐어요. 음식에서 얻는 수분은 이 수치에 포함되지 않아요.';

  @override
  String get proAppBarTitle => 'Sipling Pro';

  @override
  String get proHeaderTitle => '광고 없는 Sipling';

  @override
  String get proHeaderSub => '숲을 계속 키워요';

  @override
  String get proPerkNoAdsTitle => '광고 제로';

  @override
  String get proPerkNoAdsSub => '하루 요약에 나오는 광고도 사라져요';

  @override
  String get proPerkTreesTitle => '모든 나무 종류';

  @override
  String get proPerkTreesSub => '황금 잎과 자카란다 포함';

  @override
  String get proPerkHistoryTitle => '무제한 기록';

  @override
  String get proPerkHistorySub => '모든 달의 자세한 통계';

  @override
  String get proPerkThemesTitle => '테마 선택';

  @override
  String get proPerkThemesSub => '계절별 숲 모습';

  @override
  String get proPerkSupportTitle => '개발 응원';

  @override
  String get proPerkSupportSub => 'Sipling은 1인 프로젝트예요';

  @override
  String get proNotConnectedNote =>
      '결제는 아직 연결되지 않았어요. 지금은 체험용으로 Pro를 켜고 끌 수 있어요.';

  @override
  String get proButtonOn => 'Pro 켜짐 — 끄기';

  @override
  String get proButtonTry => 'Pro 체험하기';

  @override
  String get batAppBarTitle => '알림이 오지 않으면';

  @override
  String get batIntro =>
      '일부 휴대폰 브랜드는 배터리 절약을 위해 배경에서 도는 앱을 종료해요. 그래서 알림이 늦거나 아예 오지 않을 수 있어요. 아래 설정을 한 번만 해두면 충분해요.';

  @override
  String get batXiaomi1 => '설정 → 앱 → Sipling → 배터리 절약 → \"제한 없음\"';

  @override
  String get batXiaomi2 => '설정 → 앱 → Sipling → 자동 시작 → 켜기';

  @override
  String get batXiaomi3 => '최근 앱 화면에서 Sipling을 아래로 당겨 잠금 아이콘을 누르세요';

  @override
  String get batSamsung1 => '설정 → 앱 → Sipling → 배터리 → \"제한 없음\"';

  @override
  String get batSamsung2 =>
      '설정 → 배터리 → 백그라운드 사용 제한 → \"절전 중인 앱\" 목록에서 Sipling 제거';

  @override
  String get batHuawei1 => '설정 → 배터리 → 앱 실행 → Sipling → 자동 관리 끄기';

  @override
  String get batHuawei2 => '자동 실행, 연계 실행, 백그라운드 실행을 켜기';

  @override
  String get batOppo1 => '설정 → 배터리 → 높은 백그라운드 전력 소모 → Sipling 허용';

  @override
  String get batOppo2 => '설정 → 앱 → Sipling → 배터리 사용량 → 백그라운드 활동 허용';

  @override
  String get batFooter =>
      '메뉴 이름은 휴대폰 모델에 따라 조금 다를 수 있어요. 찾는 건 \"배터리 최적화\", \"백그라운드 활동\", \"자동 시작\" 같은 설정이에요.';

  @override
  String get setTitle => '설정';

  @override
  String get setSectionGoal => '목표';

  @override
  String get setSectionReminders => '알림';

  @override
  String get setSectionCups => '내 컵';

  @override
  String get setSectionHealth => '건강';

  @override
  String get setSectionAppearance => '화면';

  @override
  String get setSectionApp => '앱';

  @override
  String get setProTagline => '광고 없이 모든 나무 열림';

  @override
  String get setDailyGoal => '하루 목표';

  @override
  String setMl(int ml) {
    return '$ml ml';
  }

  @override
  String get setProfileInfo => '내 프로필';

  @override
  String setWeightKg(int kg) {
    return '$kg kg';
  }

  @override
  String get setRemindersOn => '알림 켜짐';

  @override
  String get setFrequency => '빈도';

  @override
  String get setAwakeHours => '깨어 있는 시간';

  @override
  String get setStopWhenDone => '목표 달성 시 멈춤';

  @override
  String get setStopWhenDoneSub => '하루 목표를 채우면 남은 알림이 취소돼요';

  @override
  String get setSilent => '무음 알림';

  @override
  String get setSilentSub => '소리와 진동 없음';

  @override
  String get setNotifNotArriving => '알림이 안 오나요?';

  @override
  String get setNotifNotArrivingSub => '휴대폰 배터리 설정이 막고 있을 수 있어요';

  @override
  String get setHealthWrite => 'Health Connect에 쓰기';

  @override
  String get setHealthWriteSub =>
      '마신 물이 Android 건강 기록에도 저장돼요. Sipling은 거기서 아무것도 읽지 않아요.';

  @override
  String get setDarkTheme => '다크 테마';

  @override
  String get setForestTheme => '숲 테마';

  @override
  String get setTreeSpecies => '나무 종류';

  @override
  String get setMyData => '내 데이터';

  @override
  String get setMyDataSub => '모든 것이 휴대폰에만 저장되고 어디에도 전송되지 않아요';

  @override
  String get setResetAll => '모든 데이터 초기화';

  @override
  String setEveryHours(int h) {
    return '$h시간마다';
  }

  @override
  String setEveryMinutes(int m) {
    return '$m분마다';
  }

  @override
  String get setHealthNoConnect => '이 기기에는 Health Connect가 없어요.';

  @override
  String get setHealthNotInstalledTitle => 'Health Connect가 설치되지 않았어요';

  @override
  String get setHealthNeedsUpdateTitle => 'Health Connect를 업데이트해야 해요';

  @override
  String get setHealthInstallBody =>
      '마신 물을 Android 건강 기록에 쓰려면 Health Connect 앱이 필요해요.';

  @override
  String get setOpenPlayStore => 'Play Store에서 열기';

  @override
  String get setHealthPermissionDenied => '권한이 거부되어 건강 기록에 쓰지 않아요.';

  @override
  String get setHealthEnabled => '이제부터 마신 물이 Health Connect에도 기록돼요.';

  @override
  String get setCancel => '취소';

  @override
  String get setSave => '저장';

  @override
  String setSuggested(int ml) {
    return '추천: $ml ml';
  }

  @override
  String get setBackToSuggested => '추천값으로 되돌리기';

  @override
  String get setIntervalDialogTitle => '얼마나 자주 알려드릴까요?';

  @override
  String get setWakeHelp => '몇 시에 일어나나요?';

  @override
  String get setSleepHelp => '몇 시에 잠드나요?';

  @override
  String get setAwakeMin4h => '깨어 있는 시간은 최소 4시간이어야 해요';

  @override
  String get setResetConfirmTitle => '정말인가요?';

  @override
  String get setResetConfirmBody => '숲, 연속 기록, 모든 기록이 삭제돼요. 이 작업은 되돌릴 수 없어요.';

  @override
  String get setResetConfirmButton => '초기화';

  @override
  String get statsTitle => '통계';

  @override
  String get statsDailyAverage => '하루 평균';

  @override
  String get statsGoalDays => '목표 달성 일수';

  @override
  String get statsCurrentStreak => '현재 연속';

  @override
  String get statsUnitDays => '일';

  @override
  String get statsTotalTrees => '전체 나무';

  @override
  String statsLastDays(int days) {
    return '최근 $days일';
  }

  @override
  String get statsYourDrinks => '내 음료';

  @override
  String statsRangeDays(int days) {
    return '$days일';
  }

  @override
  String get statsWeekdayMon => '월';

  @override
  String get statsWeekdayTue => '화';

  @override
  String get statsWeekdayWed => '수';

  @override
  String get statsWeekdayThu => '목';

  @override
  String get statsWeekdayFri => '금';

  @override
  String get statsWeekdaySat => '토';

  @override
  String get statsWeekdaySun => '일';

  @override
  String get statsNoRecords => '아직 기록이 없어요.';

  @override
  String get statsBmiTitle => '체질량지수';

  @override
  String get statsBmiDisclaimer => '정보 제공용,\n의학적 조언 아님';

  @override
  String get statsAchievements => '업적';

  @override
  String statsAchievementsEarned(int count) {
    return '$count개 획득';
  }

  @override
  String get achScreenTitle => '업적';

  @override
  String get forestTitle => '당신의 숲';

  @override
  String forestSubtitle(int trees, int days) {
    return '나무 $trees그루 • 최고 연속 $days일';
  }

  @override
  String get forestSpeciesTooltip => '나무 종류';

  @override
  String get forestEmptyTitle => '숲이 아직 비어 있어요';

  @override
  String get forestEmptyBody => '첫 잔을 마시면 여기에 묘목이 나타나요.';

  @override
  String get speciesScreenTitle => '나무 종류';

  @override
  String get speciesScreenIntro =>
      '내일 묘목의 종류를 고를 수 있어요. 숲에 있는 오래된 나무는 심었을 때의 종류 그대로예요.';

  @override
  String get speciesScreenSelected => '선택됨';

  @override
  String get speciesScreenUnlocked => '열림';

  @override
  String speciesScreenUnlockTitle(String name) {
    return '$name 나무 열기';
  }

  @override
  String get speciesScreenRewardBody =>
      '짧은 광고를 보면 이 종류를 계속 쓸 수 있어요. 광고는 완전히 선택이에요. 앱 어디에도 강제 광고는 없어요.';

  @override
  String get speciesScreenCancel => '취소';

  @override
  String get speciesScreenWatchAd => '광고 보기';

  @override
  String get seasonScreenTitle => '숲 테마';

  @override
  String get seasonScreenIntro =>
      '바뀌는 건 숲의 색이지 나무가 아니에요. 어떤 테마도 기록, 목표, 연속에 영향을 주지 않아요.';

  @override
  String get seasonScreenProOnly => 'Pro 회원 전용';

  @override
  String get seasonScreenSelected => '선택됨';

  @override
  String get setSectionHome => '홈 화면';

  @override
  String get setAddWidget => '홈 화면에 위젯 추가';

  @override
  String get setAddWidgetSub => '앱을 열지 않고 한 번의 탭으로 물 추가';

  @override
  String get setAddWidgetManual => '홈 화면을 길게 누르기 → 위젯 → Sipling 선택';

  @override
  String get wrappedTitle => '나의 숲 결산';

  @override
  String get wrappedHeadline => '지금까지의 여정';

  @override
  String wrappedLiters(int liters) {
    return '$liters L';
  }

  @override
  String get wrappedLitersLabel => '총 물량';

  @override
  String get wrappedTreesLabel => '나무';

  @override
  String get wrappedStreakLabel => '최장 연속';

  @override
  String get wrappedDaysLabel => '일수';

  @override
  String get wrappedShare => '공유';

  @override
  String get wrappedShareText =>
      'Sipling과 함께 한 모금씩 나의 숲을 키우고 있어요 🌱 sipling-app.web.app';

  @override
  String get homeMoreDrinks => '기타';

  @override
  String addFactorWaterEq(int ml, int percent) {
    return '≈ 물 $ml ml ($percent%)';
  }

  @override
  String proPerMonth(String price) {
    return '$price / 월';
  }

  @override
  String get proRestore => '구매 복원';

  @override
  String get proTerms => '이용약관';

  @override
  String get proPrivacyLink => '개인정보 처리방침';

  @override
  String get proStoreUnavailable => '스토어를 사용할 수 없습니다';

  @override
  String get proAutoRenew =>
      '월간 구독, 자동으로 갱신됩니다. 갱신 최소 24시간 전에 스토어 계정 설정에서 취소하세요. 취소하지 않으면 갱신됩니다.';

  @override
  String get homeCalcNeed => '내 수분 필요량';

  @override
  String get needTitle => '하루 수분 필요량';

  @override
  String get needIntro => '키, 몸무게, 활동량을 입력하면 Sipling이 하루에 필요한 수분량을 계산해 드려요.';

  @override
  String get needResultLabel => '맞춤 추천량';

  @override
  String needCurrentGoal(int ml) {
    return '현재 목표: $ml ml';
  }

  @override
  String get needApply => '내 목표로 설정하기';

  @override
  String get needApplied => '목표가 업데이트됐어요';

  @override
  String get needMeasuresTitle => '내 신체 정보';

  @override
  String get needLearnTitle => '물과 내 몸';

  @override
  String get factNotifTitle1 => '몸의 4분의 3은 수분';

  @override
  String get factNotifBody1 => '뇌의 약 4분의 3은 수분이에요. 충분히 채워 주세요.';

  @override
  String get factNotifTitle2 => '집중엔 수분이 필요해요';

  @override
  String get factNotifBody2 => '몸의 수분이 1~2%만 줄어도 집중하기 어려워질 수 있어요.';

  @override
  String get factNotifTitle3 => '갈증은 늦게 와요';

  @override
  String get factNotifBody3 => '갈증을 느낄 때쯤엔 이미 몸속 수분이 부족해지기 시작한 거예요.';

  @override
  String get factNotifTitle4 => '내 몸의 냉각 장치';

  @override
  String get factNotifBody4 => '땀은 몸이 스스로를 식히는 방법이고, 그 과정에서 수분을 써요.';

  @override
  String get factNotifTitle5 => '색을 확인하세요';

  @override
  String get factNotifBody5 => '옅은 노란색이면 수분이 충분한 거예요. 색이 진하면 물을 마셔야 해요.';

  @override
  String get factLearn1Title => '몸의 절반 이상은 수분이에요';

  @override
  String get factLearn1Body =>
      '수분은 성인 몸의 약 50~60%, 뇌의 약 73%를 차지해요. 영양분을 운반하고, 관절을 보호하며, 체온을 일정하게 유지해 줘요.';

  @override
  String get factLearn2Title => '물을 너무 적게 마시면 생기는 일';

  @override
  String get factLearn2Body =>
      '몸의 수분이 약 1~2% 줄어드는 가벼운 탈수만으로도 피로감, 두통, 집중력 저하, 기분 저하와 관련이 있어요. 장기적으로 물을 너무 적게 마시면 변비와 신장 결석의 위험도 커져요.';

  @override
  String get factLearn3Title => '갈증은 늦게 오는 신호예요';

  @override
  String get factLearn3Body =>
      '갈증은 보통 몸이 이미 수분을 잃은 뒤에 느껴지고, 나이가 들수록 그 느낌은 약해져요. 갈증을 느낄 때까지 기다리기보다 일정한 간격으로 물을 마시는 게 더 효과적이에요.';

  @override
  String get factLearn4Title => '소변 색이 가장 간단한 확인법이에요';

  @override
  String get factLearn4Body =>
      '옅은 볏짚 색이면 수분이 충분하다는 뜻이고, 진한 노란색이면 물이 더 필요하다는 신호예요. 일부 비타민이나 약은 색을 바꿀 수 있으니, 확정적인 판단이 아니라 참고용 힌트로 보세요.';

  @override
  String get factLearn5Title => '얼마나 마셔야 충분할까요?';

  @override
  String get factLearn5Body =>
      '온화한 기후에서 적당한 활동량을 기준으로, EFSA가 제시하는 음료를 통한 적정 수분 섭취량은 여성 하루 약 2리터, 남성 2.5리터예요. 더운 날씨, 운동, 임신, 수유는 모두 필요량을 늘려요. Sipling은 이를 몸무게와 활동량에 맞게 조정해요.';

  @override
  String get homeBoost => '더운 날 / 운동';

  @override
  String get boostTitle => '오늘 목표 늘리기';

  @override
  String get boostBody => '더운 날이나 운동 후 오늘 목표에 추가하세요. 내일 자동으로 초기화됩니다.';

  @override
  String get boostReset => '초기화';

  @override
  String boostActive(int ml) {
    return '오늘 +$ml ml 추가됨';
  }

  @override
  String get logTitle => '오늘 기록';

  @override
  String get logEmpty => '오늘 아직 기록이 없어요';

  @override
  String get logOpen => '오늘 기록';

  @override
  String get logDelete => '삭제';

  @override
  String get setReminderStyle => '알림 스타일';

  @override
  String get styleNormal => '일반';

  @override
  String get styleNormalSub => '소리와 진동';

  @override
  String get styleGentle => '부드럽게';

  @override
  String get styleGentleSub => '진동만, 소리 없음';

  @override
  String get styleSilent => '무음';

  @override
  String get styleSilentSub => '소리와 진동 없음';
}
