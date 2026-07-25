// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class LJa extends L {
  LJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'Sipling';

  @override
  String get drinkWater => '水';

  @override
  String get drinkTea => 'お茶';

  @override
  String get drinkCoffee => 'コーヒー';

  @override
  String get drinkMilk => '牛乳';

  @override
  String get drinkJuice => 'ジュース';

  @override
  String get drinkSoda => '炭酸飲料';

  @override
  String get drinkAlcohol => 'お酒';

  @override
  String get speciesOak => 'オーク';

  @override
  String get speciesPine => '松';

  @override
  String get speciesCherry => '桜';

  @override
  String get speciesAcacia => 'アカシア';

  @override
  String get speciesMaple => 'カエデ';

  @override
  String get speciesOlive => 'オリーブ';

  @override
  String get speciesGolden => '黄金の葉';

  @override
  String get speciesJacaranda => 'ジャカランダ';

  @override
  String get unlockFree => '解放済み';

  @override
  String unlockStreak(int days) {
    return '$days日連続で目標を達成する';
  }

  @override
  String unlockTotalTrees(int count) {
    return '合計$count本の木を育てる';
  }

  @override
  String get unlockRewardedAd => '短い広告を見る';

  @override
  String get unlockPro => 'Pro会員限定';

  @override
  String get achFirstSproutTitle => 'はじめての芽';

  @override
  String get achFirstSproutDesc => '最初の一杯を飲みました';

  @override
  String get achFirstTreeTitle => 'はじめての木';

  @override
  String get achFirstTreeDesc => '1日の目標を達成しました';

  @override
  String get achStreak3Title => '習慣のはじまり';

  @override
  String get achStreak3Desc => '3日連続で目標を達成しました';

  @override
  String get achStreak7Title => 'まる1週間';

  @override
  String get achStreak7Desc => '7日連続で目標を達成しました';

  @override
  String get achStreak30Title => '1か月連続';

  @override
  String get achStreak30Desc => '30日連続で目標を達成しました';

  @override
  String get achTrees10Title => '小さな木立';

  @override
  String get achTrees10Desc => '木を10本育てました';

  @override
  String get achTrees50Title => '森の番人';

  @override
  String get achTrees50Desc => '木を50本育てました';

  @override
  String get achEarlyBirdTitle => '早起きさん';

  @override
  String get achEarlyBirdDesc => '朝9時前に水を飲みました';

  @override
  String get achVarietyTitle => 'いろいろな味';

  @override
  String get achVarietyDesc => '4種類以上の飲み物を記録しました';

  @override
  String get achPerfectWeekTitle => '完璧な1週間';

  @override
  String get achPerfectWeekDesc => '7日間毎日目標を達成しました';

  @override
  String get seasonClassicName => 'クラシック';

  @override
  String get seasonClassicDesc => '一年中ずっと緑';

  @override
  String get seasonAutoName => '自動';

  @override
  String get seasonAutoDesc => '森をカレンダーに合わせて変えます';

  @override
  String get seasonSpringName => '春';

  @override
  String get seasonSpringDesc => '新緑と澄んだ空';

  @override
  String get seasonSummerName => '夏';

  @override
  String get seasonSummerDesc => '深く濃い緑';

  @override
  String get seasonAutumnName => '秋';

  @override
  String get seasonAutumnDesc => 'オレンジの葉とやわらかな光';

  @override
  String get seasonWinterName => '冬';

  @override
  String get seasonWinterDesc => '雪の丘と冷たい光';

  @override
  String get bmiUnderweight => '低体重';

  @override
  String get bmiNormal => '普通';

  @override
  String get bmiOverweight => '過体重';

  @override
  String get bmiObese => '肥満';

  @override
  String get notifTitle1 => '水分補給の時間 💧';

  @override
  String get notifBody1 => '苗が待っています。一杯どうですか？';

  @override
  String get notifTitle2 => 'もう一口';

  @override
  String get notifBody2 => '小さな一口が大きな木を育てます。';

  @override
  String get notifTitle3 => '苗がのどが渇いています 🌱';

  @override
  String get notifBody3 => '一杯の水で、もう少し育ちます。';

  @override
  String get notifTitle4 => 'リマインダー';

  @override
  String get notifBody4 => '今日の木にもう一歩近づきましょう。';

  @override
  String get notifTitle5 => '水分休憩';

  @override
  String get notifBody5 => '今飲む一杯が、夜の木になります。';

  @override
  String get activityLow => '座りがち';

  @override
  String get activityLowHint => 'デスクワーク、歩くことは少なめ';

  @override
  String get activityMedium => 'ふつう';

  @override
  String get activityMediumHint => '週1〜3日の運動';

  @override
  String get activityHigh => '活発';

  @override
  String get activityHighHint => '週4日以上の運動';

  @override
  String get cupGlass => 'コップ';

  @override
  String get cupBottle => 'ボトル';

  @override
  String get cupLarge => '大きめ';

  @override
  String get homeNewAchievement => '新しい実績';

  @override
  String get homeUndoLast => '最後の記録を取り消す';

  @override
  String get homeStageSeed => '種は土の中、最初の一杯を待っています';

  @override
  String get homeStageSprout => '芽が出ました 🌱';

  @override
  String get homeStageSapling => '苗が育っています';

  @override
  String get homeStageAlmost => 'もう少しで木になります！';

  @override
  String get homeStageReady => '今日の木ができました 🌳';

  @override
  String get homePaceDone => '明日は新しい苗が待っています';

  @override
  String get homePaceStart => '一杯の水で一日を始めましょう';

  @override
  String homePaceBehind(int ml) {
    return 'この時間で${ml}ml 遅れています。まだ取り戻せます';
  }

  @override
  String get homePaceOnTrack => 'いいペースです 👌';

  @override
  String get homeGoalDone => '今日の目標を達成しました';

  @override
  String homeRemaining(int ml) {
    return 'あと${ml}ml';
  }

  @override
  String homeStreakDays(int days) {
    return '$days日';
  }

  @override
  String get homeCelebrateTitle => '木が育ちました！';

  @override
  String get homeCelebrateBody => '今日の目標を達成しました。この木はあなたの森の一部になりました。';

  @override
  String homeStreakLabel(int days) {
    return '$days日連続';
  }

  @override
  String get homeCelebrateOk => 'いいね';

  @override
  String get addWhatTitle => '何を飲みましたか？';

  @override
  String get addAmount => '量';

  @override
  String get addConfirm => '追加';

  @override
  String get addFactorWater => '目標にそのままカウントされます。';

  @override
  String get addFactorAlcohol => 'アルコールは体の水分を奪うので、目標から差し引かれます。';

  @override
  String addFactorPercent(int percent) {
    return '目標に$percent%分カウントされます。';
  }

  @override
  String get sumTitle => '昨日のまとめ';

  @override
  String get sumTreeGrown => '木が育ちました 🌳';

  @override
  String get sumSaplingOnWay => '苗はもうすぐです 🌱';

  @override
  String get sumBodyDone => '目標を達成しました。この木はあなたの森の一部です。';

  @override
  String sumPercent(int percent) {
    return '昨日は目標の$percent%まで届きました。苗はそのままの場所で待っています。木が枯れることはありません。';
  }

  @override
  String get sumStatCounted => 'カウント';

  @override
  String get sumStatGoal => '目標';

  @override
  String get sumStatStreak => '連続';

  @override
  String sumStreakDays(int days) {
    return '$days日';
  }

  @override
  String get sumStartToday => '今日から始める';

  @override
  String get sumWhatDrank => '飲んだもの';

  @override
  String sumDrinkAmount(String name, int ml) {
    return '$name ${ml}ml';
  }

  @override
  String get navToday => '今日';

  @override
  String get navForest => '森';

  @override
  String get navStats => '統計';

  @override
  String get navSettings => '設定';

  @override
  String get onbContinue => '続ける';

  @override
  String get onbFinish => '苗を植える';

  @override
  String get onbWelcomeTagline => '一口ごとに、一本の苗。\n水を飲むと木が育ち、日がたつと森が広がります。';

  @override
  String get onbWelcomeNoPenalty => '木が枯れることはありません。ここにペナルティはありません。';

  @override
  String get onbGenderTitle => 'あなたのことを教えてください';

  @override
  String get onbGenderSubtitle =>
      '1日の水分目標はこの情報から計算されます。すべて端末内に保存され、どこにも送信されません。';

  @override
  String get onbGenderFemale => '女性';

  @override
  String get onbGenderMale => '男性';

  @override
  String get onbGenderOther => '答えたくない';

  @override
  String get onbBodyTitle => '身長・体重・年齢';

  @override
  String get onbBodySubtitle => 'スライドして調整してください。';

  @override
  String get onbBodyAge => '年齢';

  @override
  String get onbBodyHeight => '身長';

  @override
  String get onbBodyWeight => '体重';

  @override
  String get onbBodyBmiLabel => 'あなたのBMI';

  @override
  String get onbBodyDisclaimer => '情報提供のみを目的としており、医療上の助言ではありません。';

  @override
  String get onbActivityTitle => 'どのくらい体を動かしますか？';

  @override
  String get onbActivitySubtitle => '汗をかくほど、必要な水分も増えます。';

  @override
  String get onbGoalTitle => '1日の目標';

  @override
  String get onbGoalSubtitle => '設定からいつでも変更できます。';

  @override
  String get onbGoalUnit => 'ml / 日';

  @override
  String onbGoalGlasses(int glasses) {
    return 'コップ約$glasses杯';
  }

  @override
  String get onbGoalReference =>
      'この目標は、欧州食品安全機関（EFSA, 2010）の適切な水分摂取の基準をもとに、あなたの体重と活動量に合わせて調整されています。食べ物から得られる水分はこの数値に含まれていません。';

  @override
  String get proAppBarTitle => 'Sipling Pro';

  @override
  String get proHeaderTitle => '広告なしのSipling';

  @override
  String get proHeaderSub => '森を育て続けましょう';

  @override
  String get proPerkNoAdsTitle => '広告ゼロ';

  @override
  String get proPerkNoAdsSub => '1日のまとめに出る広告もなくなります';

  @override
  String get proPerkTreesTitle => 'すべての木の種類';

  @override
  String get proPerkTreesSub => '黄金の葉とジャカランダも含みます';

  @override
  String get proPerkHistoryTitle => '無制限の履歴';

  @override
  String get proPerkHistorySub => 'すべての月の詳しい統計';

  @override
  String get proPerkThemesTitle => 'テーマの選択肢';

  @override
  String get proPerkThemesSub => '季節ごとの森の見た目';

  @override
  String get proPerkSupportTitle => '開発を応援';

  @override
  String get proPerkSupportSub => 'Siplingは一人で作っているプロジェクトです';

  @override
  String get proNotConnectedNote => '購入はまだ接続されていません。今はお試しとしてProをオン・オフできます。';

  @override
  String get proButtonOn => 'Proはオン — オフにする';

  @override
  String get proButtonTry => 'Proを試す';

  @override
  String get batAppBarTitle => '通知が届かないとき';

  @override
  String get batIntro =>
      '一部のスマートフォンは、バッテリー節約のため背後で動くアプリを止めます。そのためリマインダーが遅れたり届かなかったりすることがあります。下の設定を一度行うだけで十分です。';

  @override
  String get batXiaomi1 => '設定 → アプリ → Sipling → バッテリーセーバー →「制限なし」';

  @override
  String get batXiaomi2 => '設定 → アプリ → Sipling → 自動起動 → オン';

  @override
  String get batXiaomi3 => '最近使ったアプリの画面でSiplingを下に引き、鍵アイコンをタップ';

  @override
  String get batSamsung1 => '設定 → アプリ → Sipling → バッテリー →「制限なし」';

  @override
  String get batSamsung2 =>
      '設定 → バッテリー → バックグラウンド使用の制限 →「スリープ中のアプリ」の一覧からSiplingを外す';

  @override
  String get batHuawei1 => '設定 → バッテリー → アプリ起動 → Sipling → 自動管理をオフ';

  @override
  String get batHuawei2 => '自動起動・関連起動・バックグラウンドで実行をオンにする';

  @override
  String get batOppo1 => '設定 → バッテリー → バックグラウンドの高消費電力 → Siplingを許可';

  @override
  String get batOppo2 => '設定 → アプリ → Sipling → バッテリー使用量 → バックグラウンド動作を許可';

  @override
  String get batFooter =>
      'メニュー名は機種によって少し異なることがあります。探しているのは「バッテリー最適化」「バックグラウンド動作」「自動起動」のような設定です。';

  @override
  String get setTitle => '設定';

  @override
  String get setSectionGoal => '目標';

  @override
  String get setSectionReminders => 'リマインダー';

  @override
  String get setSectionCups => 'マイカップ';

  @override
  String get setSectionHealth => 'ヘルス';

  @override
  String get setSectionAppearance => '表示';

  @override
  String get setSectionApp => 'アプリ';

  @override
  String get setProTagline => '広告なし、すべての木が解放';

  @override
  String get setDailyGoal => '1日の目標';

  @override
  String setMl(int ml) {
    return '$ml ml';
  }

  @override
  String get setProfileInfo => 'プロフィール';

  @override
  String setWeightKg(int kg) {
    return '$kg kg';
  }

  @override
  String get setRemindersOn => 'リマインダーオン';

  @override
  String get setFrequency => '頻度';

  @override
  String get setAwakeHours => '起きている時間';

  @override
  String get setStopWhenDone => '目標達成で止める';

  @override
  String get setStopWhenDoneSub => '1日の目標を達成すると、残りのリマインダーはキャンセルされます';

  @override
  String get setSilent => 'サイレント通知';

  @override
  String get setSilentSub => '音もバイブもなし';

  @override
  String get setNotifNotArriving => '通知が届きませんか？';

  @override
  String get setNotifNotArrivingSub => 'スマホのバッテリー設定が妨げているかもしれません';

  @override
  String get setHealthWrite => 'Health Connectに書き込む';

  @override
  String get setHealthWriteSub =>
      '飲んだ水はAndroidの健康記録にも保存されます。Siplingはそこから何も読み取りません。';

  @override
  String get setDarkTheme => 'ダークテーマ';

  @override
  String get setForestTheme => '森のテーマ';

  @override
  String get setTreeSpecies => '木の種類';

  @override
  String get setMyData => 'マイデータ';

  @override
  String get setMyDataSub => 'すべて端末内に保存され、どこにも送信されません';

  @override
  String get setResetAll => 'すべてのデータをリセット';

  @override
  String setEveryHours(int h) {
    return '$h時間ごと';
  }

  @override
  String setEveryMinutes(int m) {
    return '$m分ごと';
  }

  @override
  String get setHealthNoConnect => 'この端末にはHealth Connectがありません。';

  @override
  String get setHealthNotInstalledTitle => 'Health Connectがインストールされていません';

  @override
  String get setHealthNeedsUpdateTitle => 'Health Connectの更新が必要です';

  @override
  String get setHealthInstallBody =>
      '飲んだ水をAndroidの健康記録に書き込むには、Health Connectアプリが必要です。';

  @override
  String get setOpenPlayStore => 'Play Storeで開く';

  @override
  String get setHealthPermissionDenied => '許可されませんでした。健康記録には書き込まれません。';

  @override
  String get setHealthEnabled => 'これから飲んだ水はHealth Connectにも書き込まれます。';

  @override
  String get setCancel => 'キャンセル';

  @override
  String get setSave => '保存';

  @override
  String setSuggested(int ml) {
    return 'おすすめ: $ml ml';
  }

  @override
  String get setBackToSuggested => 'おすすめに戻す';

  @override
  String get setIntervalDialogTitle => 'どのくらいの間隔でお知らせしますか？';

  @override
  String get setWakeHelp => '何時に起きますか？';

  @override
  String get setSleepHelp => '何時に寝ますか？';

  @override
  String get setAwakeMin4h => '起きている時間は最低4時間必要です';

  @override
  String get setResetConfirmTitle => 'よろしいですか？';

  @override
  String get setResetConfirmBody => '森・連続記録・すべての記録が削除されます。この操作は取り消せません。';

  @override
  String get setResetConfirmButton => 'リセット';

  @override
  String get statsTitle => '統計';

  @override
  String get statsDailyAverage => '1日の平均';

  @override
  String get statsGoalDays => '目標達成日数';

  @override
  String get statsCurrentStreak => '現在の連続記録';

  @override
  String get statsUnitDays => '日';

  @override
  String get statsTotalTrees => '木の合計';

  @override
  String statsLastDays(int days) {
    return '直近$days日';
  }

  @override
  String get statsYourDrinks => '飲み物';

  @override
  String statsRangeDays(int days) {
    return '$days日';
  }

  @override
  String get statsWeekdayMon => '月';

  @override
  String get statsWeekdayTue => '火';

  @override
  String get statsWeekdayWed => '水';

  @override
  String get statsWeekdayThu => '木';

  @override
  String get statsWeekdayFri => '金';

  @override
  String get statsWeekdaySat => '土';

  @override
  String get statsWeekdaySun => '日';

  @override
  String get statsNoRecords => 'まだ記録がありません。';

  @override
  String get statsBmiTitle => 'BMI';

  @override
  String get statsBmiDisclaimer => '情報提供のみ、\n医療上の助言ではありません';

  @override
  String get statsAchievements => '実績';

  @override
  String statsAchievementsEarned(int count) {
    return '$count個獲得';
  }

  @override
  String get achScreenTitle => '実績';

  @override
  String get forestTitle => 'あなたの森';

  @override
  String forestSubtitle(int trees, int days) {
    return '$trees本の木 • 最高連続記録 $days日';
  }

  @override
  String get forestSpeciesTooltip => '木の種類';

  @override
  String get forestEmptyTitle => '森はまだ空っぽです';

  @override
  String get forestEmptyBody => '最初の一杯を飲むと、ここに苗が現れます。';

  @override
  String get speciesScreenTitle => '木の種類';

  @override
  String get speciesScreenIntro => '明日の苗の種類を選べます。森にある古い木は、植えたときの種類のままです。';

  @override
  String get speciesScreenSelected => '選択中';

  @override
  String get speciesScreenUnlocked => '解放済み';

  @override
  String speciesScreenUnlockTitle(String name) {
    return '$nameの木を解放する';
  }

  @override
  String get speciesScreenRewardBody =>
      '短い広告を見ると、この種類をずっと使えるようになります。広告は完全に任意です。アプリのどこにも強制的な広告はありません。';

  @override
  String get speciesScreenCancel => 'キャンセル';

  @override
  String get speciesScreenWatchAd => '広告を見る';

  @override
  String get seasonScreenTitle => '森のテーマ';

  @override
  String get seasonScreenIntro =>
      '変わるのは森の色で、木ではありません。どのテーマも記録・目標・連続記録には影響しません。';

  @override
  String get seasonScreenProOnly => 'Pro会員限定';

  @override
  String get seasonScreenSelected => '選択中';

  @override
  String get setSectionHome => 'ホーム画面';

  @override
  String get setAddWidget => 'ホーム画面にウィジェットを追加';

  @override
  String get setAddWidgetSub => 'アプリを開かずに、ワンタップで水を追加';

  @override
  String get setAddWidgetManual => 'ホーム画面を長押し → ウィジェット → Sipling を選択';

  @override
  String get wrappedTitle => 'あなたの森のまとめ';

  @override
  String get wrappedHeadline => 'これまでの歩み';

  @override
  String wrappedLiters(int liters) {
    return '$liters L';
  }

  @override
  String get wrappedLitersLabel => '合計水量';

  @override
  String get wrappedTreesLabel => '木';

  @override
  String get wrappedStreakLabel => '最長連続';

  @override
  String get wrappedDaysLabel => '日数';

  @override
  String get wrappedShare => '共有';

  @override
  String get wrappedShareText =>
      'Sipling で一口ずつ、自分の森を育てています 🌱 sipling-app.web.app';

  @override
  String get homeMoreDrinks => 'その他';

  @override
  String addFactorWaterEq(int ml, int percent) {
    return '≈ 水 $ml ml ($percent%)';
  }

  @override
  String proPerMonth(String price) {
    return '$price / 月';
  }

  @override
  String get proRestore => '購入を復元';

  @override
  String get proTerms => '利用規約';

  @override
  String get proPrivacyLink => 'プライバシーポリシー';

  @override
  String get proStoreUnavailable => 'ストアを利用できません';

  @override
  String get proAutoRenew =>
      '月額サブスクリプション、自動更新されます。更新の24時間前までにストアのアカウント設定で解約してください。解約しない場合は更新されます。';

  @override
  String get homeCalcNeed => '水分必要量';

  @override
  String get needTitle => 'あなたの1日の水分必要量';

  @override
  String get needIntro => '身長、体重、活動量を入力すると、Siplingが1日に必要な水分量を計算します。';

  @override
  String get needResultLabel => 'あなたへのおすすめ';

  @override
  String needCurrentGoal(int ml) {
    return '現在の目標: $ml ml';
  }

  @override
  String get needApply => 'これを目標にする';

  @override
  String get needApplied => '目標を更新しました';

  @override
  String get needMeasuresTitle => 'あなたの測定値';

  @override
  String get needLearnTitle => '水とあなたの体';

  @override
  String get factNotifTitle1 => '体の4分の3は水';

  @override
  String get factNotifBody1 => '脳の約4分の3は水分です。しっかり補給しましょう。';

  @override
  String get factNotifTitle2 => '集中力には水が必要';

  @override
  String get factNotifBody2 => '体の水分が1〜2%減るだけで、集中しにくくなることがあります。';

  @override
  String get factNotifTitle3 => 'のどの渇きは遅れてくる';

  @override
  String get factNotifBody3 => 'のどの渇きを感じたときには、すでに体は水分不足になり始めています。';

  @override
  String get factNotifTitle4 => '体に備わった冷却装置';

  @override
  String get factNotifBody4 => '汗をかくのは体が自分を冷やす仕組みで、そのために水分を使います。';

  @override
  String get factNotifTitle5 => '色をチェック';

  @override
  String get factNotifBody5 => '薄い黄色なら水分は足りています。濃い色なら水を飲みましょう。';

  @override
  String get factLearn1Title => 'あなたの半分以上は水でできている';

  @override
  String get factLearn1Body =>
      '水は成人の体の約50〜60%、脳の約73%を占めています。栄養を運び、関節を保護し、体温を安定させる役割があります。';

  @override
  String get factLearn2Title => '水分が足りないとどうなるか';

  @override
  String get factLearn2Body =>
      '体の水分が約1〜2%減るだけの軽い脱水でも、疲労感、頭痛、集中力の低下、気分の落ち込みと関係があります。長期的に水分不足が続くと、便秘や腎結石のリスクも高まります。';

  @override
  String get factLearn3Title => 'のどの渇きは遅れて現れるサイン';

  @override
  String get factLearn3Body =>
      'のどの渇きは、体がすでに水分を失ったあとに感じ始めることが多く、年齢とともにその感覚は弱くなります。渇きを感じるまで待つより、こまめに水を飲むほうが効果的です。';

  @override
  String get factLearn4Title => '尿の色が一番簡単なチェック方法';

  @override
  String get factLearn4Body =>
      '薄い麦わら色なら水分は足りています。濃い黄色はもっと水分が必要というサインです。ビタミン剤や薬で色が変わることもあるので、絶対的な判断材料ではなく目安として捉えてください。';

  @override
  String get factLearn5Title => 'どのくらいが十分？';

  @override
  String get factLearn5Body =>
      '欧州食品安全機関（EFSA）の基準では、温暖な気候で適度な活動量の場合、飲み物からの適切な水分摂取量は女性で1日約2リットル、男性で2.5リットルとされています。暑い気候、運動、妊娠、授乳はいずれも必要量を増やします。Siplingはこれをあなたの体重と活動量に合わせて調整します。';

  @override
  String get homeBoost => '暑い日／運動';

  @override
  String get boostTitle => '今日の目標を増やす';

  @override
  String get boostBody => '暑い日や運動のあとに、今日の目標へ少し追加します。明日には自動でリセットされます。';

  @override
  String get boostReset => 'リセット';

  @override
  String boostActive(int ml) {
    return '今日 +$ml ml 追加';
  }

  @override
  String get logTitle => '今日の記録';

  @override
  String get logEmpty => '今日の記録はまだありません';

  @override
  String get logOpen => '今日の記録';

  @override
  String get logDelete => '削除';

  @override
  String get setReminderStyle => '通知スタイル';

  @override
  String get styleNormal => '標準';

  @override
  String get styleNormalSub => '音とバイブ';

  @override
  String get styleGentle => 'やさしい';

  @override
  String get styleGentleSub => 'バイブのみ、音なし';

  @override
  String get styleSilent => 'サイレント';

  @override
  String get styleSilentSub => '音もバイブもなし';

  @override
  String get speciesScreenAdUnavailable => '広告の準備がまだできていません。少し後にもう一度お試しください。';

  @override
  String get setHotDayTitle => '暑い日のお知らせ';

  @override
  String get setHotDaySub => '住んでいる街が暑いとき、追加の水分リマインダー（iPhoneのみ）';

  @override
  String get setHotDayCity => '都市';

  @override
  String get setHotDayCitySet => '設定';

  @override
  String get setHotDayCityHint => '例：イスタンブール';

  @override
  String get notifHotDayTitle => '今日は暑いです 🌡️';

  @override
  String notifHotDayBody(int temp) {
    return '今日は$temp°C — いつもより少しこまめに水分をとりましょう。';
  }
}
