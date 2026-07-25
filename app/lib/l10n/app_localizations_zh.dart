// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class LZh extends L {
  LZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'Sipling';

  @override
  String get drinkWater => '水';

  @override
  String get drinkTea => '茶';

  @override
  String get drinkCoffee => '咖啡';

  @override
  String get drinkMilk => '牛奶';

  @override
  String get drinkJuice => '果汁';

  @override
  String get drinkSoda => '汽水';

  @override
  String get drinkAlcohol => '酒';

  @override
  String get speciesOak => '橡树';

  @override
  String get speciesPine => '松树';

  @override
  String get speciesCherry => '樱花';

  @override
  String get speciesAcacia => '金合欢';

  @override
  String get speciesMaple => '枫树';

  @override
  String get speciesOlive => '橄榄树';

  @override
  String get speciesGolden => '金叶';

  @override
  String get speciesJacaranda => '蓝花楹';

  @override
  String get unlockFree => '已解锁';

  @override
  String unlockStreak(int days) {
    return '连续 $days 天达成目标';
  }

  @override
  String unlockTotalTrees(int count) {
    return '累计种出 $count 棵树';
  }

  @override
  String get unlockRewardedAd => '观看一段短广告';

  @override
  String get unlockPro => '仅限 Pro 会员';

  @override
  String get achFirstSproutTitle => '第一株嫩芽';

  @override
  String get achFirstSproutDesc => '你喝下了第一杯';

  @override
  String get achFirstTreeTitle => '第一棵树';

  @override
  String get achFirstTreeDesc => '你完成了一天的目标';

  @override
  String get achStreak3Title => '习惯开始了';

  @override
  String get achStreak3Desc => '你连续 3 天达成目标';

  @override
  String get achStreak7Title => '整整一周';

  @override
  String get achStreak7Desc => '你连续 7 天达成目标';

  @override
  String get achStreak30Title => '整月不断';

  @override
  String get achStreak30Desc => '你连续 30 天达成目标';

  @override
  String get achTrees10Title => '小树林';

  @override
  String get achTrees10Desc => '你种出了 10 棵树';

  @override
  String get achTrees50Title => '森林守护者';

  @override
  String get achTrees50Desc => '你种出了 50 棵树';

  @override
  String get achEarlyBirdTitle => '早起的人';

  @override
  String get achEarlyBirdDesc => '你在早上 9 点前喝了水';

  @override
  String get achVarietyTitle => '多样口味';

  @override
  String get achVarietyDesc => '你记录了至少 4 种不同的饮品';

  @override
  String get achPerfectWeekTitle => '完美一周';

  @override
  String get achPerfectWeekDesc => '你连续 7 天每天都达成目标';

  @override
  String get seasonClassicName => '经典';

  @override
  String get seasonClassicDesc => '四季常青';

  @override
  String get seasonAutoName => '自动';

  @override
  String get seasonAutoDesc => '让你的森林随日历变化';

  @override
  String get seasonSpringName => '春天';

  @override
  String get seasonSpringDesc => '新叶与晴空';

  @override
  String get seasonSummerName => '夏天';

  @override
  String get seasonSummerDesc => '浓郁饱满的绿';

  @override
  String get seasonAutumnName => '秋天';

  @override
  String get seasonAutumnDesc => '橙色的叶子，温暖的光';

  @override
  String get seasonWinterName => '冬天';

  @override
  String get seasonWinterDesc => '雪山与冷冽的光';

  @override
  String get bmiUnderweight => '偏瘦';

  @override
  String get bmiNormal => '正常';

  @override
  String get bmiOverweight => '超重';

  @override
  String get bmiObese => '肥胖';

  @override
  String get notifTitle1 => '喝水时间到了 💧';

  @override
  String get notifBody1 => '小树苗在等你，一起喝一杯吧？';

  @override
  String get notifTitle2 => '再来一口';

  @override
  String get notifBody2 => '小小的一口，长成大大的树。';

  @override
  String get notifTitle3 => '小树苗渴了 🌱';

  @override
  String get notifBody3 => '一杯水，让它再长大一点。';

  @override
  String get notifTitle4 => '提醒';

  @override
  String get notifBody4 => '离今天的树又近了一步。';

  @override
  String get notifTitle5 => '喝水小憩';

  @override
  String get notifBody5 => '此刻喝下的一杯，就是今晚的树。';

  @override
  String get activityLow => '久坐';

  @override
  String get activityLowHint => '伏案工作，很少走动';

  @override
  String get activityMedium => '适中';

  @override
  String get activityMediumHint => '每周运动 1-3 天';

  @override
  String get activityHigh => '活跃';

  @override
  String get activityHighHint => '每周运动 4 天以上';

  @override
  String get cupGlass => '杯';

  @override
  String get cupBottle => '瓶';

  @override
  String get cupLarge => '大杯';

  @override
  String get homeNewAchievement => '新成就';

  @override
  String get homeUndoLast => '撤销上一条记录';

  @override
  String get homeStageSeed => '种子在土里，等着第一口水';

  @override
  String get homeStageSprout => '发芽了 🌱';

  @override
  String get homeStageSapling => '小树苗在长大';

  @override
  String get homeStageAlmost => '快长成一棵树了！';

  @override
  String get homeStageReady => '今天的树准备好了 🌳';

  @override
  String get homePaceDone => '明天有新的树苗等着你';

  @override
  String get homePaceStart => '用一杯水开始新的一天';

  @override
  String homePaceBehind(int ml) {
    return '这个时段你落后 $ml ml，还来得及补上';
  }

  @override
  String get homePaceOnTrack => '节奏刚刚好 👌';

  @override
  String get homeGoalDone => '你完成了今天的目标';

  @override
  String homeRemaining(int ml) {
    return '还差 $ml ml';
  }

  @override
  String homeStreakDays(int days) {
    return '$days 天';
  }

  @override
  String get homeCelebrateTitle => '你的树长大了！';

  @override
  String get homeCelebrateBody => '你完成了今天的目标。这棵树现在是你森林的一部分。';

  @override
  String homeStreakLabel(int days) {
    return '连续 $days 天';
  }

  @override
  String get homeCelebrateOk => '太棒了';

  @override
  String get addWhatTitle => '你喝了什么？';

  @override
  String get addAmount => '分量';

  @override
  String get addConfirm => '添加';

  @override
  String get addFactorWater => '全额计入目标。';

  @override
  String get addFactorAlcohol => '酒会带走身体的水分，所以会从目标里扣除。';

  @override
  String addFactorPercent(int percent) {
    return '按 $percent% 计入目标。';
  }

  @override
  String get sumTitle => '昨天的小结';

  @override
  String get sumTreeGrown => '你的树长大了 🌳';

  @override
  String get sumSaplingOnWay => '你的树苗在路上 🌱';

  @override
  String get sumBodyDone => '你达成了目标。这棵树是你森林的一部分。';

  @override
  String sumPercent(int percent) {
    return '昨天你达成了目标的 $percent%。树苗就在原地等你，没有一棵树会枯萎。';
  }

  @override
  String get sumStatCounted => '已计入';

  @override
  String get sumStatGoal => '目标';

  @override
  String get sumStatStreak => '连续';

  @override
  String sumStreakDays(int days) {
    return '$days 天';
  }

  @override
  String get sumStartToday => '今天开始';

  @override
  String get sumWhatDrank => '你喝了什么';

  @override
  String sumDrinkAmount(String name, int ml) {
    return '$name $ml ml';
  }

  @override
  String get navToday => '今天';

  @override
  String get navForest => '森林';

  @override
  String get navStats => '统计';

  @override
  String get navSettings => '设置';

  @override
  String get onbContinue => '继续';

  @override
  String get onbFinish => '种下我的树苗';

  @override
  String get onbWelcomeTagline => '每一口，一株树苗。\n喝水时树会长大，日子久了森林也会成形。';

  @override
  String get onbWelcomeNoPenalty => '你的树永远不会枯萎。这里没有惩罚。';

  @override
  String get onbGenderTitle => '让我们认识你';

  @override
  String get onbGenderSubtitle => '每天的喝水目标会用这些信息来计算。所有信息都留在你的手机里，不会发送到任何地方。';

  @override
  String get onbGenderFemale => '女';

  @override
  String get onbGenderMale => '男';

  @override
  String get onbGenderOther => '不想透露';

  @override
  String get onbBodyTitle => '身高、体重、年龄';

  @override
  String get onbBodySubtitle => '滑动来调整。';

  @override
  String get onbBodyAge => '年龄';

  @override
  String get onbBodyHeight => '身高';

  @override
  String get onbBodyWeight => '体重';

  @override
  String get onbBodyBmiLabel => '你的身体质量指数';

  @override
  String get onbBodyDisclaimer => '仅供参考，不构成医疗建议。';

  @override
  String get onbActivityTitle => '你有多爱运动？';

  @override
  String get onbActivitySubtitle => '出汗越多，需要的水就越多。';

  @override
  String get onbGoalTitle => '你的每日目标';

  @override
  String get onbGoalSubtitle => '随时可以在设置里更改。';

  @override
  String get onbGoalUnit => 'ml / 天';

  @override
  String onbGoalGlasses(int glasses) {
    return '大约 $glasses 杯';
  }

  @override
  String get onbGoalReference =>
      '这个目标依据欧洲食品安全局（EFSA，2010）的适宜饮水量参考，按你的体重和运动量进行了调整。从食物中获得的水分不计入这个数字。';

  @override
  String get proAppBarTitle => 'Sipling Pro';

  @override
  String get proHeaderTitle => '无广告的 Sipling';

  @override
  String get proHeaderSub => '让你的森林继续生长';

  @override
  String get proPerkNoAdsTitle => '零广告';

  @override
  String get proPerkNoAdsSub => '连每日小结里的广告也会消失';

  @override
  String get proPerkTreesTitle => '全部树种';

  @override
  String get proPerkTreesSub => '包含金叶和蓝花楹';

  @override
  String get proPerkHistoryTitle => '无限历史记录';

  @override
  String get proPerkHistorySub => '每个月的详细统计';

  @override
  String get proPerkThemesTitle => '主题选项';

  @override
  String get proPerkThemesSub => '四季森林外观';

  @override
  String get proPerkSupportTitle => '支持开发';

  @override
  String get proPerkSupportSub => 'Sipling 是一个人做的项目';

  @override
  String get proNotConnectedNote => '购买功能还没接入。目前你可以打开或关闭 Pro 来试用。';

  @override
  String get proButtonOn => 'Pro 已开启 — 关闭';

  @override
  String get proButtonTry => '试用 Pro';

  @override
  String get batAppBarTitle => '如果收不到通知';

  @override
  String get batIntro => '有些手机品牌为了省电会关闭后台运行的应用，所以提醒可能会延迟或收不到。下面的设置只需做一次就够了。';

  @override
  String get batXiaomi1 => '设置 → 应用 → Sipling → 省电 → \"无限制\"';

  @override
  String get batXiaomi2 => '设置 → 应用 → Sipling → 自启动 → 开启';

  @override
  String get batXiaomi3 => '在最近任务界面把 Sipling 向下拉，点一下锁定图标';

  @override
  String get batSamsung1 => '设置 → 应用 → Sipling → 电池 → \"无限制\"';

  @override
  String get batSamsung2 => '设置 → 电池 → 后台使用限制 → 从\"休眠应用\"列表中移除 Sipling';

  @override
  String get batHuawei1 => '设置 → 电池 → 应用启动 → Sipling → 关闭自动管理';

  @override
  String get batHuawei2 => '打开自动启动、关联启动和后台运行';

  @override
  String get batOppo1 => '设置 → 电池 → 后台高耗电 → 允许 Sipling';

  @override
  String get batOppo2 => '设置 → 应用 → Sipling → 耗电情况 → 允许后台活动';

  @override
  String get batFooter => '菜单名称可能因手机型号略有不同。你要找的是类似\"电池优化\"\"后台活动\"或\"自启动\"的设置。';

  @override
  String get setTitle => '设置';

  @override
  String get setSectionGoal => '目标';

  @override
  String get setSectionReminders => '提醒';

  @override
  String get setSectionCups => '我的杯子';

  @override
  String get setSectionHealth => '健康';

  @override
  String get setSectionAppearance => '外观';

  @override
  String get setSectionApp => '应用';

  @override
  String get setProTagline => '无广告，解锁全部树种';

  @override
  String get setDailyGoal => '每日目标';

  @override
  String setMl(int ml) {
    return '$ml ml';
  }

  @override
  String get setProfileInfo => '我的资料';

  @override
  String setWeightKg(int kg) {
    return '$kg kg';
  }

  @override
  String get setRemindersOn => '提醒已开启';

  @override
  String get setFrequency => '频率';

  @override
  String get setAwakeHours => '我的清醒时段';

  @override
  String get setStopWhenDone => '达成目标就停止';

  @override
  String get setStopWhenDoneSub => '达成每日目标后，剩下的提醒会取消';

  @override
  String get setSilent => '静音通知';

  @override
  String get setSilentSub => '没有声音和振动';

  @override
  String get setNotifNotArriving => '收不到通知？';

  @override
  String get setNotifNotArrivingSub => '可能是手机的电池设置挡住了';

  @override
  String get setHealthWrite => '写入 Health Connect';

  @override
  String get setHealthWriteSub =>
      '你喝的水也会保存到 Android 的健康记录里。Sipling 不会从那里读取任何东西。';

  @override
  String get setDarkTheme => '深色主题';

  @override
  String get setForestTheme => '森林主题';

  @override
  String get setTreeSpecies => '树种';

  @override
  String get setMyData => '我的数据';

  @override
  String get setMyDataSub => '所有内容都留在你的手机里，不会发送到任何地方';

  @override
  String get setResetAll => '重置所有数据';

  @override
  String setEveryHours(int h) {
    return '每 $h 小时';
  }

  @override
  String setEveryMinutes(int m) {
    return '每 $m 分钟';
  }

  @override
  String get setHealthNoConnect => '这台设备没有 Health Connect。';

  @override
  String get setHealthNotInstalledTitle => '没有安装 Health Connect';

  @override
  String get setHealthNeedsUpdateTitle => 'Health Connect 需要更新';

  @override
  String get setHealthInstallBody =>
      '要把你喝的水写入 Android 的健康记录，需要 Health Connect 应用。';

  @override
  String get setOpenPlayStore => '在 Play Store 打开';

  @override
  String get setHealthPermissionDenied => '未授予权限，不会写入健康记录。';

  @override
  String get setHealthEnabled => '从现在起，你喝的水也会写入 Health Connect。';

  @override
  String get setCancel => '取消';

  @override
  String get setSave => '保存';

  @override
  String setSuggested(int ml) {
    return '推荐：$ml ml';
  }

  @override
  String get setBackToSuggested => '恢复推荐值';

  @override
  String get setIntervalDialogTitle => '多久提醒你一次？';

  @override
  String get setWakeHelp => '你几点起床？';

  @override
  String get setSleepHelp => '你几点睡觉？';

  @override
  String get setAwakeMin4h => '清醒时段至少要有 4 小时';

  @override
  String get setResetConfirmTitle => '确定吗？';

  @override
  String get setResetConfirmBody => '你的森林、连续记录和所有数据都会被删除。此操作无法撤销。';

  @override
  String get setResetConfirmButton => '重置';

  @override
  String get statsTitle => '统计';

  @override
  String get statsDailyAverage => '每日平均';

  @override
  String get statsGoalDays => '达标天数';

  @override
  String get statsCurrentStreak => '当前连续';

  @override
  String get statsUnitDays => '天';

  @override
  String get statsTotalTrees => '树木总数';

  @override
  String statsLastDays(int days) {
    return '最近 $days 天';
  }

  @override
  String get statsYourDrinks => '你的饮品';

  @override
  String statsRangeDays(int days) {
    return '$days 天';
  }

  @override
  String get statsWeekdayMon => '周一';

  @override
  String get statsWeekdayTue => '周二';

  @override
  String get statsWeekdayWed => '周三';

  @override
  String get statsWeekdayThu => '周四';

  @override
  String get statsWeekdayFri => '周五';

  @override
  String get statsWeekdaySat => '周六';

  @override
  String get statsWeekdaySun => '周日';

  @override
  String get statsNoRecords => '还没有记录。';

  @override
  String get statsBmiTitle => '身体质量指数';

  @override
  String get statsBmiDisclaimer => '仅供参考，\n不构成医疗建议';

  @override
  String get statsAchievements => '成就';

  @override
  String statsAchievementsEarned(int count) {
    return '已获得 $count 个';
  }

  @override
  String get achScreenTitle => '成就';

  @override
  String get forestTitle => '你的森林';

  @override
  String forestSubtitle(int trees, int days) {
    return '$trees 棵树 • 最佳连续 $days 天';
  }

  @override
  String get forestSpeciesTooltip => '树种';

  @override
  String get forestEmptyTitle => '你的森林还是空的';

  @override
  String get forestEmptyBody => '喝下第一杯水时，这里会冒出一株树苗。';

  @override
  String get speciesScreenTitle => '树种';

  @override
  String get speciesScreenIntro => '你可以选择明天树苗的种类。森林里的老树会保持种下时的种类。';

  @override
  String get speciesScreenSelected => '已选择';

  @override
  String get speciesScreenUnlocked => '已解锁';

  @override
  String speciesScreenUnlockTitle(String name) {
    return '解锁 $name 树';
  }

  @override
  String get speciesScreenRewardBody =>
      '看一段短广告，就能永久解锁这个树种。广告完全是自愿的，应用里任何地方都没有强制广告。';

  @override
  String get speciesScreenCancel => '取消';

  @override
  String get speciesScreenWatchAd => '观看广告';

  @override
  String get seasonScreenTitle => '森林主题';

  @override
  String get seasonScreenIntro => '变的是森林的颜色，不是树。任何主题都不会影响你的记录、目标或连续天数。';

  @override
  String get seasonScreenProOnly => '仅限 Pro 会员';

  @override
  String get seasonScreenSelected => '已选择';

  @override
  String get setSectionHome => '主屏幕';

  @override
  String get setAddWidget => '将小组件添加到主屏幕';

  @override
  String get setAddWidgetSub => '无需打开应用，一键添加饮水';

  @override
  String get setAddWidgetManual => '长按主屏幕 → 小组件 → 选择 Sipling';

  @override
  String get wrappedTitle => '你的森林总结';

  @override
  String get wrappedHeadline => '你至今的旅程';

  @override
  String wrappedLiters(int liters) {
    return '$liters L';
  }

  @override
  String get wrappedLitersLabel => '总饮水量';

  @override
  String get wrappedTreesLabel => '树';

  @override
  String get wrappedStreakLabel => '最长连续';

  @override
  String get wrappedDaysLabel => '天数';

  @override
  String get wrappedShare => '分享';

  @override
  String get wrappedShareText =>
      '我正在用 Sipling 一口一口地培育我的森林 🌱 sipling-app.web.app';

  @override
  String get homeMoreDrinks => '其他';

  @override
  String addFactorWaterEq(int ml, int percent) {
    return '≈ $ml ml 水 ($percent%)';
  }

  @override
  String proPerMonth(String price) {
    return '$price / 月';
  }

  @override
  String get proRestore => '恢复购买';

  @override
  String get proTerms => '使用条款';

  @override
  String get proPrivacyLink => '隐私政策';

  @override
  String get proStoreUnavailable => '商店当前不可用';

  @override
  String get proAutoRenew => '每月订阅，自动续期。请在续期前至少24小时在商店账户设置中取消；否则将自动续期。';

  @override
  String get homeCalcNeed => '我的饮水需求';

  @override
  String get needTitle => '你的每日饮水需求';

  @override
  String get needIntro => '输入你的身高、体重和运动量，Sipling 会算出你一天需要喝多少水。';

  @override
  String get needResultLabel => '为你推荐';

  @override
  String needCurrentGoal(int ml) {
    return '你目前的目标：$ml ml';
  }

  @override
  String get needApply => '设为我的目标';

  @override
  String get needApplied => '你的目标已更新';

  @override
  String get needMeasuresTitle => '你的身体数据';

  @override
  String get needLearnTitle => '水与你的身体';

  @override
  String get factNotifTitle1 => '四分之三是水';

  @override
  String get factNotifBody1 => '你的大脑大约四分之三是水，记得及时补充。';

  @override
  String get factNotifTitle2 => '专注力需要水';

  @override
  String get factNotifBody2 => '体内水分只要流失 1-2%，就可能更难集中注意力。';

  @override
  String get factNotifTitle3 => '口渴来得比较晚';

  @override
  String get factNotifBody3 => '等你感到口渴时，身体其实已经开始缺水了。';

  @override
  String get factNotifTitle4 => '身体自带的降温系统';

  @override
  String get factNotifBody4 => '出汗是身体给自己降温的方式，这个过程会消耗水分。';

  @override
  String get factNotifTitle5 => '看看颜色';

  @override
  String get factNotifBody5 => '淡黄色通常说明你水分充足，颜色深了就该喝水了。';

  @override
  String get factLearn1Title => '你身体的一半以上是水';

  @override
  String get factLearn1Body =>
      '水约占成年人体重的 50%-60%，占大脑的约 73%。它负责运送营养、缓冲关节，还能让体温保持稳定。';

  @override
  String get factLearn2Title => '喝水太少会怎样';

  @override
  String get factLearn2Body =>
      '即使是轻度脱水，也就是体内水分流失约 1-2%，也和疲劳、头痛、注意力下降、情绪低落有关。长期喝水不足还会增加便秘和肾结石的风险。';

  @override
  String get factLearn3Title => '口渴是一个滞后的信号';

  @override
  String get factLearn3Body =>
      '口渴的感觉通常在身体已经流失水分之后才出现，而且这种感觉会随年龄增长而变弱。与其等到口渴才喝水，不如按固定的时间间隔喝水，效果更好。';

  @override
  String get factLearn4Title => '尿液颜色是最简单的检查方式';

  @override
  String get factLearn4Body =>
      '浅麦秆色通常说明水分充足，深黄色则说明你需要多喝点水。有些维生素和药物会改变颜色，所以这只能作为参考，而不是绝对的判断标准。';

  @override
  String get factLearn5Title => '喝多少才够？';

  @override
  String get factLearn5Body =>
      '在温带气候、中等运动量的条件下，EFSA 给出的饮水适宜摄入量参考值为：女性每天约 2 升，男性 2.5 升。炎热天气、运动、怀孕和哺乳都会提高这个需求。Sipling 会根据你的体重和运动量对此进行调整。';

  @override
  String get homeBoost => '炎热天 / 运动';

  @override
  String get boostTitle => '提高今天的目标';

  @override
  String get boostBody => '炎热的日子或运动后，为今天的目标额外增加一些。明天会自动重置。';

  @override
  String get boostReset => '重置';

  @override
  String boostActive(int ml) {
    return '今天已增加 +$ml ml';
  }

  @override
  String get logTitle => '今日记录';

  @override
  String get logEmpty => '今天还没有记录';

  @override
  String get logOpen => '今日记录';

  @override
  String get logDelete => '删除';

  @override
  String get setReminderStyle => '提醒方式';

  @override
  String get styleNormal => '正常';

  @override
  String get styleNormalSub => '声音和振动';

  @override
  String get styleGentle => '轻柔';

  @override
  String get styleGentleSub => '仅振动，无声音';

  @override
  String get styleSilent => '静音';

  @override
  String get styleSilentSub => '无声音无振动';

  @override
  String get speciesScreenAdUnavailable => '广告尚未准备好，请稍后再试。';

  @override
  String get setHotDayTitle => '高温日提醒';

  @override
  String get setHotDaySub => '所在城市天气炎热时的额外喝水提醒（仅限 iPhone）';

  @override
  String get setHotDayCity => '城市';

  @override
  String get setHotDayCitySet => '选择';

  @override
  String get setHotDayCityHint => '如：伊斯坦布尔';

  @override
  String get notifHotDayTitle => '今天很热 🌡️';

  @override
  String notifHotDayBody(int temp) {
    return '今天 $temp°C——记得多喝几次水。';
  }
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class LZhHant extends LZh {
  LZhHant() : super('zh_Hant');

  @override
  String get appName => 'Sipling';

  @override
  String get drinkWater => '水';

  @override
  String get drinkTea => '茶';

  @override
  String get drinkCoffee => '咖啡';

  @override
  String get drinkMilk => '牛奶';

  @override
  String get drinkJuice => '果汁';

  @override
  String get drinkSoda => '汽水';

  @override
  String get drinkAlcohol => '酒';

  @override
  String get speciesOak => '橡樹';

  @override
  String get speciesPine => '松樹';

  @override
  String get speciesCherry => '櫻花';

  @override
  String get speciesAcacia => '金合歡';

  @override
  String get speciesMaple => '楓樹';

  @override
  String get speciesOlive => '橄欖樹';

  @override
  String get speciesGolden => '金葉';

  @override
  String get speciesJacaranda => '藍花楹';

  @override
  String get unlockFree => '已解鎖';

  @override
  String unlockStreak(int days) {
    return '連續 $days 天達成目標';
  }

  @override
  String unlockTotalTrees(int count) {
    return '累計種出 $count 棵樹';
  }

  @override
  String get unlockRewardedAd => '觀看一段短廣告';

  @override
  String get unlockPro => '僅限 Pro 會員';

  @override
  String get achFirstSproutTitle => '第一株嫩芽';

  @override
  String get achFirstSproutDesc => '你喝下了第一杯';

  @override
  String get achFirstTreeTitle => '第一棵樹';

  @override
  String get achFirstTreeDesc => '你完成了一天的目標';

  @override
  String get achStreak3Title => '習慣開始了';

  @override
  String get achStreak3Desc => '你連續 3 天達成目標';

  @override
  String get achStreak7Title => '整整一週';

  @override
  String get achStreak7Desc => '你連續 7 天達成目標';

  @override
  String get achStreak30Title => '整月不間斷';

  @override
  String get achStreak30Desc => '你連續 30 天達成目標';

  @override
  String get achTrees10Title => '小樹林';

  @override
  String get achTrees10Desc => '你種出了 10 棵樹';

  @override
  String get achTrees50Title => '森林守護者';

  @override
  String get achTrees50Desc => '你種出了 50 棵樹';

  @override
  String get achEarlyBirdTitle => '早起的人';

  @override
  String get achEarlyBirdDesc => '你在早上 9 點前喝了水';

  @override
  String get achVarietyTitle => '多樣口味';

  @override
  String get achVarietyDesc => '你記錄了至少 4 種不同的飲品';

  @override
  String get achPerfectWeekTitle => '完美一週';

  @override
  String get achPerfectWeekDesc => '你連續 7 天每天都達成目標';

  @override
  String get seasonClassicName => '經典';

  @override
  String get seasonClassicDesc => '四季常青';

  @override
  String get seasonAutoName => '自動';

  @override
  String get seasonAutoDesc => '讓你的森林隨著日曆變化';

  @override
  String get seasonSpringName => '春天';

  @override
  String get seasonSpringDesc => '新葉與晴空';

  @override
  String get seasonSummerName => '夏天';

  @override
  String get seasonSummerDesc => '濃郁飽滿的綠';

  @override
  String get seasonAutumnName => '秋天';

  @override
  String get seasonAutumnDesc => '橙色的葉子，溫暖的光';

  @override
  String get seasonWinterName => '冬天';

  @override
  String get seasonWinterDesc => '雪山與冷冽的光';

  @override
  String get bmiUnderweight => '過瘦';

  @override
  String get bmiNormal => '正常';

  @override
  String get bmiOverweight => '過重';

  @override
  String get bmiObese => '肥胖';

  @override
  String get notifTitle1 => '喝水時間到了 💧';

  @override
  String get notifBody1 => '小樹苗在等你，一起喝一杯吧？';

  @override
  String get notifTitle2 => '再來一口';

  @override
  String get notifBody2 => '小小的一口，長成大大的樹。';

  @override
  String get notifTitle3 => '小樹苗渴了 🌱';

  @override
  String get notifBody3 => '一杯水，讓它再長大一點。';

  @override
  String get notifTitle4 => '提醒';

  @override
  String get notifBody4 => '離今天的樹又近了一步。';

  @override
  String get notifTitle5 => '喝水小憩';

  @override
  String get notifBody5 => '此刻喝下的一杯，就是今晚的樹。';

  @override
  String get activityLow => '久坐';

  @override
  String get activityLowHint => '伏案工作，很少走動';

  @override
  String get activityMedium => '適中';

  @override
  String get activityMediumHint => '每週運動 1-3 天';

  @override
  String get activityHigh => '活躍';

  @override
  String get activityHighHint => '每週運動 4 天以上';

  @override
  String get cupGlass => '杯';

  @override
  String get cupBottle => '瓶';

  @override
  String get cupLarge => '大杯';

  @override
  String get homeNewAchievement => '新成就';

  @override
  String get homeUndoLast => '還原上一筆紀錄';

  @override
  String get homeStageSeed => '種子在土裡，等著第一口水';

  @override
  String get homeStageSprout => '發芽了 🌱';

  @override
  String get homeStageSapling => '小樹苗在長大';

  @override
  String get homeStageAlmost => '快長成一棵樹了！';

  @override
  String get homeStageReady => '今天的樹準備好了 🌳';

  @override
  String get homePaceDone => '明天有新的樹苗等著你';

  @override
  String get homePaceStart => '用一杯水開始新的一天';

  @override
  String homePaceBehind(int ml) {
    return '這個時段你落後 $ml ml，還來得及補上';
  }

  @override
  String get homePaceOnTrack => '節奏剛剛好 👌';

  @override
  String get homeGoalDone => '你完成了今天的目標';

  @override
  String homeRemaining(int ml) {
    return '還差 $ml ml';
  }

  @override
  String homeStreakDays(int days) {
    return '$days 天';
  }

  @override
  String get homeCelebrateTitle => '你的樹長大了！';

  @override
  String get homeCelebrateBody => '你完成了今天的目標。這棵樹現在是你森林的一部分。';

  @override
  String homeStreakLabel(int days) {
    return '連續 $days 天';
  }

  @override
  String get homeCelebrateOk => '太棒了';

  @override
  String get addWhatTitle => '你喝了什麼？';

  @override
  String get addAmount => '份量';

  @override
  String get addConfirm => '新增';

  @override
  String get addFactorWater => '全額計入目標。';

  @override
  String get addFactorAlcohol => '酒會帶走身體的水分，所以會從目標裡扣除。';

  @override
  String addFactorPercent(int percent) {
    return '以 $percent% 計入目標。';
  }

  @override
  String get sumTitle => '昨天的摘要';

  @override
  String get sumTreeGrown => '你的樹長大了 🌳';

  @override
  String get sumSaplingOnWay => '你的樹苗在路上 🌱';

  @override
  String get sumBodyDone => '你達成了目標。這棵樹是你森林的一部分。';

  @override
  String sumPercent(int percent) {
    return '昨天你達成了目標的 $percent%。樹苗就在原地等你，沒有一棵樹會枯萎。';
  }

  @override
  String get sumStatCounted => '已計入';

  @override
  String get sumStatGoal => '目標';

  @override
  String get sumStatStreak => '連續';

  @override
  String sumStreakDays(int days) {
    return '$days 天';
  }

  @override
  String get sumStartToday => '今天開始';

  @override
  String get sumWhatDrank => '你喝了什麼';

  @override
  String sumDrinkAmount(String name, int ml) {
    return '$name $ml ml';
  }

  @override
  String get navToday => '今天';

  @override
  String get navForest => '森林';

  @override
  String get navStats => '統計';

  @override
  String get navSettings => '設定';

  @override
  String get onbContinue => '繼續';

  @override
  String get onbFinish => '種下我的樹苗';

  @override
  String get onbWelcomeTagline => '每一口，一株樹苗。\n喝水時樹會長大，日子久了森林也會成形。';

  @override
  String get onbWelcomeNoPenalty => '你的樹永遠不會枯萎。這裡沒有懲罰。';

  @override
  String get onbGenderTitle => '讓我們認識你';

  @override
  String get onbGenderSubtitle => '每天的喝水目標會用這些資訊來計算。所有資訊都留在你的手機裡，不會傳送到任何地方。';

  @override
  String get onbGenderFemale => '女';

  @override
  String get onbGenderMale => '男';

  @override
  String get onbGenderOther => '不想透露';

  @override
  String get onbBodyTitle => '身高、體重、年齡';

  @override
  String get onbBodySubtitle => '滑動來調整。';

  @override
  String get onbBodyAge => '年齡';

  @override
  String get onbBodyHeight => '身高';

  @override
  String get onbBodyWeight => '體重';

  @override
  String get onbBodyBmiLabel => '你的身體質量指數';

  @override
  String get onbBodyDisclaimer => '僅供參考，不構成醫療建議。';

  @override
  String get onbActivityTitle => '你有多愛運動？';

  @override
  String get onbActivitySubtitle => '流汗越多，需要的水就越多。';

  @override
  String get onbGoalTitle => '你的每日目標';

  @override
  String get onbGoalSubtitle => '隨時可以在設定裡更改。';

  @override
  String get onbGoalUnit => 'ml / 天';

  @override
  String onbGoalGlasses(int glasses) {
    return '大約 $glasses 杯';
  }

  @override
  String get onbGoalReference =>
      '這個目標依據歐洲食品安全局（EFSA，2010）的適宜飲水量參考，按你的體重和運動量做了調整。從食物中攝取的水分不計入這個數字。';

  @override
  String get proAppBarTitle => 'Sipling Pro';

  @override
  String get proHeaderTitle => '無廣告的 Sipling';

  @override
  String get proHeaderSub => '讓你的森林繼續生長';

  @override
  String get proPerkNoAdsTitle => '零廣告';

  @override
  String get proPerkNoAdsSub => '連每日摘要裡的廣告也會消失';

  @override
  String get proPerkTreesTitle => '全部樹種';

  @override
  String get proPerkTreesSub => '包含金葉和藍花楹';

  @override
  String get proPerkHistoryTitle => '無限歷史紀錄';

  @override
  String get proPerkHistorySub => '每個月的詳細統計';

  @override
  String get proPerkThemesTitle => '主題選項';

  @override
  String get proPerkThemesSub => '四季森林外觀';

  @override
  String get proPerkSupportTitle => '支持開發';

  @override
  String get proPerkSupportSub => 'Sipling 是一個人做的專案';

  @override
  String get proNotConnectedNote => '購買功能還沒接上。目前你可以開啟或關閉 Pro 來試用。';

  @override
  String get proButtonOn => 'Pro 已開啟 — 關閉';

  @override
  String get proButtonTry => '試用 Pro';

  @override
  String get batAppBarTitle => '如果收不到通知';

  @override
  String get batIntro => '有些手機品牌為了省電會關閉在背景執行的應用程式，所以提醒可能會延遲或收不到。下面的設定只要做一次就夠了。';

  @override
  String get batXiaomi1 => '設定 → 應用程式 → Sipling → 省電 → \"無限制\"';

  @override
  String get batXiaomi2 => '設定 → 應用程式 → Sipling → 自動啟動 → 開啟';

  @override
  String get batXiaomi3 => '在最近使用的畫面中把 Sipling 往下拉，點一下鎖定圖示';

  @override
  String get batSamsung1 => '設定 → 應用程式 → Sipling → 電池 → \"無限制\"';

  @override
  String get batSamsung2 => '設定 → 電池 → 背景使用限制 → 從\"休眠應用程式\"清單中移除 Sipling';

  @override
  String get batHuawei1 => '設定 → 電池 → 應用程式啟動 → Sipling → 關閉自動管理';

  @override
  String get batHuawei2 => '開啟自動啟動、關聯啟動和背景執行';

  @override
  String get batOppo1 => '設定 → 電池 → 背景高耗電 → 允許 Sipling';

  @override
  String get batOppo2 => '設定 → 應用程式 → Sipling → 耗電情況 → 允許背景活動';

  @override
  String get batFooter =>
      '選單名稱可能因手機型號略有不同。你要找的是類似\"電池最佳化\"\"背景活動\"或\"自動啟動\"的設定。';

  @override
  String get setTitle => '設定';

  @override
  String get setSectionGoal => '目標';

  @override
  String get setSectionReminders => '提醒';

  @override
  String get setSectionCups => '我的杯子';

  @override
  String get setSectionHealth => '健康';

  @override
  String get setSectionAppearance => '外觀';

  @override
  String get setSectionApp => '應用程式';

  @override
  String get setProTagline => '無廣告，解鎖全部樹種';

  @override
  String get setDailyGoal => '每日目標';

  @override
  String setMl(int ml) {
    return '$ml ml';
  }

  @override
  String get setProfileInfo => '我的資料';

  @override
  String setWeightKg(int kg) {
    return '$kg kg';
  }

  @override
  String get setRemindersOn => '提醒已開啟';

  @override
  String get setFrequency => '頻率';

  @override
  String get setAwakeHours => '我的清醒時段';

  @override
  String get setStopWhenDone => '達成目標就停止';

  @override
  String get setStopWhenDoneSub => '達成每日目標後，剩下的提醒會取消';

  @override
  String get setSilent => '靜音通知';

  @override
  String get setSilentSub => '沒有聲音和震動';

  @override
  String get setNotifNotArriving => '收不到通知？';

  @override
  String get setNotifNotArrivingSub => '可能是手機的電池設定擋住了';

  @override
  String get setHealthWrite => '寫入 Health Connect';

  @override
  String get setHealthWriteSub =>
      '你喝的水也會儲存到 Android 的健康紀錄裡。Sipling 不會從那裡讀取任何東西。';

  @override
  String get setDarkTheme => '深色主題';

  @override
  String get setForestTheme => '森林主題';

  @override
  String get setTreeSpecies => '樹種';

  @override
  String get setMyData => '我的資料';

  @override
  String get setMyDataSub => '所有內容都留在你的手機裡，不會傳送到任何地方';

  @override
  String get setResetAll => '重設所有資料';

  @override
  String setEveryHours(int h) {
    return '每 $h 小時';
  }

  @override
  String setEveryMinutes(int m) {
    return '每 $m 分鐘';
  }

  @override
  String get setHealthNoConnect => '這台裝置沒有 Health Connect。';

  @override
  String get setHealthNotInstalledTitle => '沒有安裝 Health Connect';

  @override
  String get setHealthNeedsUpdateTitle => 'Health Connect 需要更新';

  @override
  String get setHealthInstallBody =>
      '要把你喝的水寫入 Android 的健康紀錄，需要 Health Connect 應用程式。';

  @override
  String get setOpenPlayStore => '在 Play Store 開啟';

  @override
  String get setHealthPermissionDenied => '未授予權限，不會寫入健康紀錄。';

  @override
  String get setHealthEnabled => '從現在起，你喝的水也會寫入 Health Connect。';

  @override
  String get setCancel => '取消';

  @override
  String get setSave => '儲存';

  @override
  String setSuggested(int ml) {
    return '建議：$ml ml';
  }

  @override
  String get setBackToSuggested => '恢復建議值';

  @override
  String get setIntervalDialogTitle => '多久提醒你一次？';

  @override
  String get setWakeHelp => '你幾點起床？';

  @override
  String get setSleepHelp => '你幾點睡覺？';

  @override
  String get setAwakeMin4h => '清醒時段至少要有 4 小時';

  @override
  String get setResetConfirmTitle => '確定嗎？';

  @override
  String get setResetConfirmBody => '你的森林、連續紀錄和所有資料都會被刪除。此操作無法復原。';

  @override
  String get setResetConfirmButton => '重設';

  @override
  String get statsTitle => '統計';

  @override
  String get statsDailyAverage => '每日平均';

  @override
  String get statsGoalDays => '達標天數';

  @override
  String get statsCurrentStreak => '目前連續';

  @override
  String get statsUnitDays => '天';

  @override
  String get statsTotalTrees => '樹木總數';

  @override
  String statsLastDays(int days) {
    return '最近 $days 天';
  }

  @override
  String get statsYourDrinks => '你的飲品';

  @override
  String statsRangeDays(int days) {
    return '$days 天';
  }

  @override
  String get statsWeekdayMon => '週一';

  @override
  String get statsWeekdayTue => '週二';

  @override
  String get statsWeekdayWed => '週三';

  @override
  String get statsWeekdayThu => '週四';

  @override
  String get statsWeekdayFri => '週五';

  @override
  String get statsWeekdaySat => '週六';

  @override
  String get statsWeekdaySun => '週日';

  @override
  String get statsNoRecords => '還沒有紀錄。';

  @override
  String get statsBmiTitle => '身體質量指數';

  @override
  String get statsBmiDisclaimer => '僅供參考，\n不構成醫療建議';

  @override
  String get statsAchievements => '成就';

  @override
  String statsAchievementsEarned(int count) {
    return '已獲得 $count 個';
  }

  @override
  String get achScreenTitle => '成就';

  @override
  String get forestTitle => '你的森林';

  @override
  String forestSubtitle(int trees, int days) {
    return '$trees 棵樹 • 最佳連續 $days 天';
  }

  @override
  String get forestSpeciesTooltip => '樹種';

  @override
  String get forestEmptyTitle => '你的森林還是空的';

  @override
  String get forestEmptyBody => '喝下第一杯水時，這裡會冒出一株樹苗。';

  @override
  String get speciesScreenTitle => '樹種';

  @override
  String get speciesScreenIntro => '你可以選擇明天樹苗的種類。森林裡的老樹會保持種下時的種類。';

  @override
  String get speciesScreenSelected => '已選擇';

  @override
  String get speciesScreenUnlocked => '已解鎖';

  @override
  String speciesScreenUnlockTitle(String name) {
    return '解鎖 $name 樹';
  }

  @override
  String get speciesScreenRewardBody =>
      '看一段短廣告，就能永久解鎖這個樹種。廣告完全是自願的，應用程式裡任何地方都沒有強制廣告。';

  @override
  String get speciesScreenCancel => '取消';

  @override
  String get speciesScreenWatchAd => '觀看廣告';

  @override
  String get seasonScreenTitle => '森林主題';

  @override
  String get seasonScreenIntro => '變的是森林的顏色，不是樹。任何主題都不會影響你的紀錄、目標或連續天數。';

  @override
  String get seasonScreenProOnly => '僅限 Pro 會員';

  @override
  String get seasonScreenSelected => '已選擇';

  @override
  String get setSectionHome => '主畫面';

  @override
  String get setAddWidget => '將小工具加入主畫面';

  @override
  String get setAddWidgetSub => '無需開啟應用程式，一鍵新增飲水';

  @override
  String get setAddWidgetManual => '長按主畫面 → 小工具 → 選擇 Sipling';

  @override
  String get wrappedTitle => '你的森林總結';

  @override
  String get wrappedHeadline => '你至今的旅程';

  @override
  String wrappedLiters(int liters) {
    return '$liters L';
  }

  @override
  String get wrappedLitersLabel => '總飲水量';

  @override
  String get wrappedTreesLabel => '樹';

  @override
  String get wrappedStreakLabel => '最長連續';

  @override
  String get wrappedDaysLabel => '天數';

  @override
  String get wrappedShare => '分享';

  @override
  String get wrappedShareText =>
      '我正在用 Sipling 一口一口地培育我的森林 🌱 sipling-app.web.app';

  @override
  String get homeMoreDrinks => '其他';

  @override
  String addFactorWaterEq(int ml, int percent) {
    return '≈ $ml ml 水 ($percent%)';
  }

  @override
  String proPerMonth(String price) {
    return '$price / 月';
  }

  @override
  String get proRestore => '還原購買';

  @override
  String get proTerms => '使用條款';

  @override
  String get proPrivacyLink => '隱私政策';

  @override
  String get proStoreUnavailable => '商店目前無法使用';

  @override
  String get proAutoRenew => '每月訂閱，自動續訂。請在續訂前至少24小時於商店帳戶設定中取消；否則將自動續訂。';

  @override
  String get homeCalcNeed => '我的飲水需求';

  @override
  String get needTitle => '你的每日飲水需求';

  @override
  String get needIntro => '輸入你的身高、體重和活動量，Sipling 會算出你一天需要喝多少水。';

  @override
  String get needResultLabel => '為你推薦';

  @override
  String needCurrentGoal(int ml) {
    return '你目前的目標：$ml ml';
  }

  @override
  String get needApply => '設為我的目標';

  @override
  String get needApplied => '你的目標已更新';

  @override
  String get needMeasuresTitle => '你的身體數據';

  @override
  String get needLearnTitle => '水與你的身體';

  @override
  String get factNotifTitle1 => '四分之三是水';

  @override
  String get factNotifBody1 => '你的大腦大約四分之三是水，記得及時補充。';

  @override
  String get factNotifTitle2 => '專注力需要水';

  @override
  String get factNotifBody2 => '體內水分只要流失 1-2%，就可能更難集中注意力。';

  @override
  String get factNotifTitle3 => '口渴來得比較晚';

  @override
  String get factNotifBody3 => '等你感到口渴時，身體其實已經開始缺水了。';

  @override
  String get factNotifTitle4 => '身體自帶的降溫系統';

  @override
  String get factNotifBody4 => '流汗是身體為自己降溫的方式，這個過程會消耗水分。';

  @override
  String get factNotifTitle5 => '看看顏色';

  @override
  String get factNotifBody5 => '淡黃色通常代表你水分充足，顏色變深就該喝水了。';

  @override
  String get factLearn1Title => '你身體的一半以上是水';

  @override
  String get factLearn1Body =>
      '水約占成年人體重的 50%-60%，占大腦的約 73%。它負責運送養分、緩衝關節，還能讓體溫保持穩定。';

  @override
  String get factLearn2Title => '水喝太少會怎樣';

  @override
  String get factLearn2Body =>
      '即使是輕度脫水，也就是體內水分流失約 1-2%，也和疲勞、頭痛、注意力下降、情緒低落有關。長期水喝不夠，還會增加便秘和腎結石的風險。';

  @override
  String get factLearn3Title => '口渴是遲來的訊號';

  @override
  String get factLearn3Body =>
      '口渴的感覺通常在身體已經流失水分之後才出現，而且這種感覺會隨年齡增長而變弱。與其等到口渴才喝水，不如按固定的時間間隔喝水，效果更好。';

  @override
  String get factLearn4Title => '尿液顏色是最簡單的檢查方式';

  @override
  String get factLearn4Body =>
      '淺麥稈色通常代表水分充足，深黃色則代表你需要多喝點水。有些維生素和藥物會改變顏色，所以這只能當作參考，而不是絕對的判斷標準。';

  @override
  String get factLearn5Title => '喝多少才夠？';

  @override
  String get factLearn5Body =>
      '在溫帶氣候、中等活動量的情況下，EFSA 提出的飲水適宜攝取量參考值為：女性每天約 2 公升，男性 2.5 公升。炎熱天氣、運動、懷孕和哺乳都會提高這個需求。Sipling 會依你的體重和活動量調整這個數字。';

  @override
  String get homeBoost => '炎熱天 / 運動';

  @override
  String get boostTitle => '提高今天的目標';

  @override
  String get boostBody => '炎熱的日子或運動後，為今天的目標額外增加一些。明天會自動重設。';

  @override
  String get boostReset => '重設';

  @override
  String boostActive(int ml) {
    return '今天已增加 +$ml ml';
  }

  @override
  String get logTitle => '今日紀錄';

  @override
  String get logEmpty => '今天還沒有紀錄';

  @override
  String get logOpen => '今日紀錄';

  @override
  String get logDelete => '刪除';

  @override
  String get setReminderStyle => '提醒方式';

  @override
  String get styleNormal => '一般';

  @override
  String get styleNormalSub => '聲音和震動';

  @override
  String get styleGentle => '輕柔';

  @override
  String get styleGentleSub => '僅震動，無聲音';

  @override
  String get styleSilent => '靜音';

  @override
  String get styleSilentSub => '無聲音無震動';

  @override
  String get speciesScreenAdUnavailable => '廣告尚未準備好，請稍後再試。';

  @override
  String get setHotDayTitle => '高溫日提醒';

  @override
  String get setHotDaySub => '所在城市天氣炎熱時的額外喝水提醒（僅限 iPhone）';

  @override
  String get setHotDayCity => '城市';

  @override
  String get setHotDayCitySet => '選擇';

  @override
  String get setHotDayCityHint => '如：伊斯坦堡';

  @override
  String get notifHotDayTitle => '今天很熱 🌡️';

  @override
  String notifHotDayBody(int temp) {
    return '今天 $temp°C——記得多喝幾次水。';
  }
}
