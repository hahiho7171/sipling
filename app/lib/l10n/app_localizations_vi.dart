// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class LVi extends L {
  LVi([String locale = 'vi']) : super(locale);

  @override
  String get appName => 'Sipling';

  @override
  String get drinkWater => 'Nước';

  @override
  String get drinkTea => 'Trà';

  @override
  String get drinkCoffee => 'Cà phê';

  @override
  String get drinkMilk => 'Sữa';

  @override
  String get drinkJuice => 'Nước ép';

  @override
  String get drinkSoda => 'Nước ngọt';

  @override
  String get drinkAlcohol => 'Rượu';

  @override
  String get speciesOak => 'Sồi';

  @override
  String get speciesPine => 'Thông';

  @override
  String get speciesCherry => 'Anh đào';

  @override
  String get speciesAcacia => 'Keo';

  @override
  String get speciesMaple => 'Phong';

  @override
  String get speciesOlive => 'Ô liu';

  @override
  String get speciesGolden => 'Lá Vàng';

  @override
  String get speciesJacaranda => 'Phượng tím';

  @override
  String get unlockFree => 'Đã mở';

  @override
  String unlockStreak(int days) {
    return 'Đạt mục tiêu $days ngày liên tiếp';
  }

  @override
  String unlockTotalTrees(int count) {
    return 'Trồng tổng cộng $count cây';
  }

  @override
  String get unlockRewardedAd => 'Xem một quảng cáo ngắn';

  @override
  String get unlockPro => 'Chỉ dành cho Pro';

  @override
  String get achFirstSproutTitle => 'Mầm Đầu Tiên';

  @override
  String get achFirstSproutDesc => 'Bạn đã uống ly nước đầu tiên';

  @override
  String get achFirstTreeTitle => 'Cây Đầu Tiên';

  @override
  String get achFirstTreeDesc => 'Bạn đã hoàn thành mục tiêu ngày';

  @override
  String get achStreak3Title => 'Thói Quen Bắt Đầu';

  @override
  String get achStreak3Desc => 'Bạn đạt mục tiêu 3 ngày liên tiếp';

  @override
  String get achStreak7Title => 'Trọn Một Tuần';

  @override
  String get achStreak7Desc => 'Bạn đạt mục tiêu 7 ngày liên tiếp';

  @override
  String get achStreak30Title => 'Một Tháng Không Ngắt';

  @override
  String get achStreak30Desc => 'Bạn đạt mục tiêu 30 ngày liên tiếp';

  @override
  String get achTrees10Title => 'Vườn Nhỏ';

  @override
  String get achTrees10Desc => 'Bạn đã trồng 10 cây';

  @override
  String get achTrees50Title => 'Người Giữ Rừng';

  @override
  String get achTrees50Desc => 'Bạn đã trồng 50 cây';

  @override
  String get achEarlyBirdTitle => 'Dậy Sớm';

  @override
  String get achEarlyBirdDesc => 'Bạn uống nước trước 9 giờ sáng';

  @override
  String get achVarietyTitle => 'Khẩu Vị Đa Dạng';

  @override
  String get achVarietyDesc =>
      'Bạn đã ghi lại ít nhất 4 loại đồ uống khác nhau';

  @override
  String get achPerfectWeekTitle => 'Tuần Hoàn Hảo';

  @override
  String get achPerfectWeekDesc => 'Bạn đạt mục tiêu mỗi ngày suốt 7 ngày';

  @override
  String get seasonClassicName => 'Cổ điển';

  @override
  String get seasonClassicDesc => 'Xanh tươi quanh năm';

  @override
  String get seasonAutoName => 'Tự động';

  @override
  String get seasonAutoDesc => 'Để khu rừng đi theo lịch mùa';

  @override
  String get seasonSpringName => 'Mùa xuân';

  @override
  String get seasonSpringDesc => 'Lá non, trời trong';

  @override
  String get seasonSummerName => 'Mùa hè';

  @override
  String get seasonSummerDesc => 'Sắc xanh đậm, đầy đặn';

  @override
  String get seasonAutumnName => 'Mùa thu';

  @override
  String get seasonAutumnDesc => 'Lá cam, ánh nắng ấm';

  @override
  String get seasonWinterName => 'Mùa đông';

  @override
  String get seasonWinterDesc => 'Đồi tuyết, ánh sáng lạnh';

  @override
  String get bmiUnderweight => 'Thiếu cân';

  @override
  String get bmiNormal => 'Bình thường';

  @override
  String get bmiOverweight => 'Thừa cân';

  @override
  String get bmiObese => 'Béo phì';

  @override
  String get notifTitle1 => 'Đến giờ uống nước 💧';

  @override
  String get notifBody1 => 'Cây non của bạn đang đợi — mình uống một ly nhé?';

  @override
  String get notifTitle2 => 'Thêm một ngụm';

  @override
  String get notifBody2 => 'Những ngụm nhỏ làm nên cây lớn.';

  @override
  String get notifTitle3 => 'Cây non của bạn đang khát 🌱';

  @override
  String get notifBody3 => 'Một ly nước giúp nó lớn thêm một chút.';

  @override
  String get notifTitle4 => 'Nhắc nhở';

  @override
  String get notifBody4 => 'Thêm một bước đến cây của hôm nay.';

  @override
  String get notifTitle5 => 'Nghỉ uống nước';

  @override
  String get notifBody5 => 'Ly bạn uống bây giờ chính là cây của tối nay.';

  @override
  String get activityLow => 'Ít vận động';

  @override
  String get activityLowHint => 'Ngồi bàn giấy, ít đi lại';

  @override
  String get activityMedium => 'Vừa phải';

  @override
  String get activityMediumHint => 'Tập thể dục 1-3 ngày mỗi tuần';

  @override
  String get activityHigh => 'Năng động';

  @override
  String get activityHighHint => 'Tập thể dục 4+ ngày mỗi tuần';

  @override
  String get cupGlass => 'Ly';

  @override
  String get cupBottle => 'Chai';

  @override
  String get cupLarge => 'Lớn';

  @override
  String get homeNewAchievement => 'Thành tựu mới';

  @override
  String get homeUndoLast => 'Hoàn tác lần thêm cuối';

  @override
  String get homeStageSeed =>
      'Hạt giống của bạn đang trong đất, chờ ngụm nước đầu tiên';

  @override
  String get homeStageSprout => 'Đã nảy mầm 🌱';

  @override
  String get homeStageSapling => 'Cây non của bạn đang lớn';

  @override
  String get homeStageAlmost => 'Sắp thành cây rồi!';

  @override
  String get homeStageReady => 'Cây của hôm nay đã sẵn sàng 🌳';

  @override
  String get homePaceDone => 'Ngày mai một cây non mới đang chờ bạn';

  @override
  String get homePaceStart => 'Bắt đầu ngày mới với một ly nước';

  @override
  String homePaceBehind(int ml) {
    return 'Giờ này bạn đang chậm $ml ml — vẫn có thể bắt kịp';
  }

  @override
  String get homePaceOnTrack => 'Bạn đang đúng nhịp 👌';

  @override
  String get homeGoalDone => 'Bạn đã đạt mục tiêu ngày';

  @override
  String homeRemaining(int ml) {
    return 'Còn $ml ml';
  }

  @override
  String homeStreakDays(int days) {
    return '$days ngày';
  }

  @override
  String get homeCelebrateTitle => 'Cây của bạn đã lớn!';

  @override
  String get homeCelebrateBody =>
      'Bạn đã đạt mục tiêu hôm nay. Cây này giờ là một phần khu rừng của bạn.';

  @override
  String homeStreakLabel(int days) {
    return 'chuỗi $days ngày';
  }

  @override
  String get homeCelebrateOk => 'Tuyệt';

  @override
  String get addWhatTitle => 'Bạn đã uống gì?';

  @override
  String get addAmount => 'Lượng';

  @override
  String get addConfirm => 'Thêm';

  @override
  String get addFactorWater => 'Được tính trọn vẹn vào mục tiêu.';

  @override
  String get addFactorAlcohol =>
      'Rượu làm cơ thể mất nước, nên bị trừ khỏi mục tiêu.';

  @override
  String addFactorPercent(int percent) {
    return 'Được tính $percent% vào mục tiêu.';
  }

  @override
  String get sumTitle => 'Tóm tắt hôm qua';

  @override
  String get sumTreeGrown => 'Cây của bạn đã lớn 🌳';

  @override
  String get sumSaplingOnWay => 'Cây non của bạn đang trên đường 🌱';

  @override
  String get sumBodyDone =>
      'Bạn đã đạt mục tiêu. Cây này là một phần khu rừng của bạn.';

  @override
  String sumPercent(int percent) {
    return 'Hôm qua bạn đạt $percent% mục tiêu. Cây non của bạn vẫn đợi ngay nơi bạn để lại — không cây nào héo úa cả.';
  }

  @override
  String get sumStatCounted => 'Đã tính';

  @override
  String get sumStatGoal => 'Mục tiêu';

  @override
  String get sumStatStreak => 'Chuỗi';

  @override
  String sumStreakDays(int days) {
    return '$days ngày';
  }

  @override
  String get sumStartToday => 'Bắt đầu hôm nay';

  @override
  String get sumWhatDrank => 'Những gì bạn đã uống';

  @override
  String sumDrinkAmount(String name, int ml) {
    return '$name $ml ml';
  }

  @override
  String get navToday => 'Hôm nay';

  @override
  String get navForest => 'Khu rừng';

  @override
  String get navStats => 'Thống kê';

  @override
  String get navSettings => 'Cài đặt';

  @override
  String get onbContinue => 'Tiếp tục';

  @override
  String get onbFinish => 'Trồng cây non của tôi';

  @override
  String get onbWelcomeTagline =>
      'Mỗi ngụm nước, một cây non.\nUống nước và cây của bạn lớn lên; ngày qua đi, khu rừng của bạn cũng vậy.';

  @override
  String get onbWelcomeNoPenalty =>
      'Cây của bạn không bao giờ héo. Ở đây không có hình phạt.';

  @override
  String get onbGenderTitle => 'Cùng làm quen nhé';

  @override
  String get onbGenderSubtitle =>
      'Mục tiêu nước hằng ngày được tính từ đây. Mọi thứ đều ở trên máy của bạn và không bao giờ gửi đi đâu.';

  @override
  String get onbGenderFemale => 'Nữ';

  @override
  String get onbGenderMale => 'Nam';

  @override
  String get onbGenderOther => 'Không muốn nói';

  @override
  String get onbBodyTitle => 'Chiều cao, cân nặng, tuổi';

  @override
  String get onbBodySubtitle => 'Trượt để điều chỉnh.';

  @override
  String get onbBodyAge => 'Tuổi';

  @override
  String get onbBodyHeight => 'Chiều cao';

  @override
  String get onbBodyWeight => 'Cân nặng';

  @override
  String get onbBodyBmiLabel => 'Chỉ số khối cơ thể của bạn';

  @override
  String get onbBodyDisclaimer =>
      'Chỉ để tham khảo, không phải lời khuyên y tế.';

  @override
  String get onbActivityTitle => 'Bạn vận động nhiều không?';

  @override
  String get onbActivitySubtitle =>
      'Càng đổ mồ hôi nhiều, bạn càng cần nhiều nước.';

  @override
  String get onbGoalTitle => 'Mục tiêu hằng ngày của bạn';

  @override
  String get onbGoalSubtitle => 'Bạn có thể đổi bất cứ lúc nào trong Cài đặt.';

  @override
  String get onbGoalUnit => 'mililít / ngày';

  @override
  String onbGoalGlasses(int glasses) {
    return 'khoảng $glasses ly';
  }

  @override
  String get onbGoalReference =>
      'Mục tiêu này được điều chỉnh theo cân nặng và mức vận động của bạn, dựa trên mức tham chiếu lượng nước đủ dùng của Cơ quan An toàn Thực phẩm châu Âu (EFSA, 2010). Nước bạn nhận từ thức ăn không tính vào con số này.';

  @override
  String get proAppBarTitle => 'Sipling Pro';

  @override
  String get proHeaderTitle => 'Sipling không quảng cáo';

  @override
  String get proHeaderSub => 'Giữ cho khu rừng của bạn tiếp tục lớn';

  @override
  String get proPerkNoAdsTitle => 'Không quảng cáo';

  @override
  String get proPerkNoAdsSub =>
      'Cả quảng cáo trong tóm tắt hằng ngày cũng biến mất';

  @override
  String get proPerkTreesTitle => 'Mọi loài cây';

  @override
  String get proPerkTreesSub => 'Bao gồm Lá Vàng và Phượng tím';

  @override
  String get proPerkHistoryTitle => 'Lịch sử không giới hạn';

  @override
  String get proPerkHistorySub => 'Thống kê chi tiết cho mỗi tháng';

  @override
  String get proPerkThemesTitle => 'Tùy chọn giao diện';

  @override
  String get proPerkThemesSub => 'Khu rừng theo từng mùa';

  @override
  String get proPerkSupportTitle => 'Ủng hộ phát triển';

  @override
  String get proPerkSupportSub => 'Sipling là dự án của một người';

  @override
  String get proNotConnectedNote =>
      'Mua hàng chưa được kết nối. Hiện tại bạn có thể bật và tắt Pro để dùng thử.';

  @override
  String get proButtonOn => 'Pro đang bật — tắt đi';

  @override
  String get proButtonTry => 'Dùng thử Pro';

  @override
  String get batAppBarTitle => 'Nếu thông báo không đến';

  @override
  String get batIntro =>
      'Một số hãng điện thoại tắt ứng dụng chạy nền để tiết kiệm pin, nên lời nhắc có thể bị trễ hoặc không đến. Chỉ cần chỉnh cài đặt bên dưới một lần là đủ.';

  @override
  String get batXiaomi1 =>
      'Cài đặt → Ứng dụng → Sipling → Tiết kiệm pin → \"Không giới hạn\"';

  @override
  String get batXiaomi2 => 'Cài đặt → Ứng dụng → Sipling → Tự khởi động → Bật';

  @override
  String get batXiaomi3 =>
      'Ở màn hình ứng dụng gần đây, kéo Sipling xuống và chạm biểu tượng ổ khóa';

  @override
  String get batSamsung1 =>
      'Cài đặt → Ứng dụng → Sipling → Pin → \"Không hạn chế\"';

  @override
  String get batSamsung2 =>
      'Cài đặt → Pin → Giới hạn dùng nền → bỏ Sipling khỏi danh sách \"Ứng dụng đang ngủ\"';

  @override
  String get batHuawei1 =>
      'Cài đặt → Pin → Khởi chạy ứng dụng → Sipling → tắt Quản lý tự động';

  @override
  String get batHuawei2 => 'Bật Tự khởi chạy, Khởi chạy phụ và Chạy nền';

  @override
  String get batOppo1 =>
      'Cài đặt → Pin → Tiêu thụ điện nền cao → cho phép Sipling';

  @override
  String get batOppo2 =>
      'Cài đặt → Ứng dụng → Sipling → Mức dùng pin → Cho phép hoạt động nền';

  @override
  String get batFooter =>
      'Tên menu có thể hơi khác tùy mẫu điện thoại. Thứ bạn cần tìm là cài đặt như \"tối ưu pin\", \"hoạt động nền\" hay \"tự khởi động\".';

  @override
  String get setTitle => 'Cài đặt';

  @override
  String get setSectionGoal => 'Mục tiêu';

  @override
  String get setSectionReminders => 'Lời nhắc';

  @override
  String get setSectionCups => 'Cốc của tôi';

  @override
  String get setSectionHealth => 'Sức khỏe';

  @override
  String get setSectionAppearance => 'Giao diện';

  @override
  String get setSectionApp => 'Ứng dụng';

  @override
  String get setProTagline => 'Không quảng cáo, mở mọi cây';

  @override
  String get setDailyGoal => 'Mục tiêu hằng ngày';

  @override
  String setMl(int ml) {
    return '$ml ml';
  }

  @override
  String get setProfileInfo => 'Hồ sơ của tôi';

  @override
  String setWeightKg(int kg) {
    return '$kg kg';
  }

  @override
  String get setRemindersOn => 'Bật lời nhắc';

  @override
  String get setFrequency => 'Tần suất';

  @override
  String get setAwakeHours => 'Giờ thức của tôi';

  @override
  String get setStopWhenDone => 'Dừng khi đạt mục tiêu';

  @override
  String get setStopWhenDoneSub =>
      'Khi bạn đạt mục tiêu ngày, các lời nhắc còn lại sẽ bị hủy';

  @override
  String get setSilent => 'Thông báo im lặng';

  @override
  String get setSilentSub => 'Không âm thanh hay rung';

  @override
  String get setNotifNotArriving => 'Thông báo không đến?';

  @override
  String get setNotifNotArrivingSub =>
      'Cài đặt pin của điện thoại có thể đang chặn chúng';

  @override
  String get setHealthWrite => 'Ghi vào Health Connect';

  @override
  String get setHealthWriteSub =>
      'Lượng nước của bạn cũng được lưu vào hồ sơ sức khỏe của Android. Sipling không bao giờ đọc gì từ đó.';

  @override
  String get setDarkTheme => 'Giao diện tối';

  @override
  String get setForestTheme => 'Giao diện khu rừng';

  @override
  String get setTreeSpecies => 'Loài cây';

  @override
  String get setMyData => 'Dữ liệu của tôi';

  @override
  String get setMyDataSub =>
      'Mọi thứ ở trên máy của bạn và không bao giờ gửi đi đâu';

  @override
  String get setResetAll => 'Đặt lại toàn bộ dữ liệu';

  @override
  String setEveryHours(int h) {
    return 'Mỗi $h giờ';
  }

  @override
  String setEveryMinutes(int m) {
    return 'Mỗi $m phút';
  }

  @override
  String get setHealthNoConnect => 'Thiết bị này không có Health Connect.';

  @override
  String get setHealthNotInstalledTitle => 'Health Connect chưa được cài';

  @override
  String get setHealthNeedsUpdateTitle => 'Health Connect cần cập nhật';

  @override
  String get setHealthInstallBody =>
      'Cần ứng dụng Health Connect để ghi lượng nước của bạn vào hồ sơ sức khỏe của Android.';

  @override
  String get setOpenPlayStore => 'Mở trong Play Store';

  @override
  String get setHealthPermissionDenied =>
      'Quyền bị từ chối, sẽ không có gì được ghi vào hồ sơ sức khỏe.';

  @override
  String get setHealthEnabled =>
      'Từ giờ lượng nước của bạn cũng sẽ được ghi vào Health Connect.';

  @override
  String get setCancel => 'Hủy';

  @override
  String get setSave => 'Lưu';

  @override
  String setSuggested(int ml) {
    return 'Đề xuất: $ml ml';
  }

  @override
  String get setBackToSuggested => 'Trở lại mức đề xuất';

  @override
  String get setIntervalDialogTitle => 'Nên nhắc bạn bao lâu một lần?';

  @override
  String get setWakeHelp => 'Bạn thức dậy lúc mấy giờ?';

  @override
  String get setSleepHelp => 'Bạn đi ngủ lúc mấy giờ?';

  @override
  String get setAwakeMin4h => 'Giờ thức của bạn phải ít nhất 4 tiếng';

  @override
  String get setResetConfirmTitle => 'Bạn chắc chứ?';

  @override
  String get setResetConfirmBody =>
      'Khu rừng, chuỗi ngày và mọi bản ghi của bạn sẽ bị xóa. Không thể hoàn tác.';

  @override
  String get setResetConfirmButton => 'Đặt lại';

  @override
  String get statsTitle => 'Thống kê';

  @override
  String get statsDailyAverage => 'Trung bình mỗi ngày';

  @override
  String get statsGoalDays => 'Số ngày đạt mục tiêu';

  @override
  String get statsCurrentStreak => 'Chuỗi hiện tại';

  @override
  String get statsUnitDays => 'ngày';

  @override
  String get statsTotalTrees => 'Tổng số cây';

  @override
  String statsLastDays(int days) {
    return '$days ngày gần nhất';
  }

  @override
  String get statsYourDrinks => 'Đồ uống của bạn';

  @override
  String statsRangeDays(int days) {
    return '$days ngày';
  }

  @override
  String get statsWeekdayMon => 'T2';

  @override
  String get statsWeekdayTue => 'T3';

  @override
  String get statsWeekdayWed => 'T4';

  @override
  String get statsWeekdayThu => 'T5';

  @override
  String get statsWeekdayFri => 'T6';

  @override
  String get statsWeekdaySat => 'T7';

  @override
  String get statsWeekdaySun => 'CN';

  @override
  String get statsNoRecords => 'Chưa có bản ghi nào.';

  @override
  String get statsBmiTitle => 'Chỉ số khối cơ thể';

  @override
  String get statsBmiDisclaimer =>
      'Chỉ để tham khảo,\nkhông phải lời khuyên y tế';

  @override
  String get statsAchievements => 'Thành tựu';

  @override
  String statsAchievementsEarned(int count) {
    return 'đạt $count';
  }

  @override
  String get achScreenTitle => 'Thành tựu';

  @override
  String get forestTitle => 'Khu rừng của bạn';

  @override
  String forestSubtitle(int trees, int days) {
    return '$trees cây • chuỗi tốt nhất $days ngày';
  }

  @override
  String get forestSpeciesTooltip => 'Loài cây';

  @override
  String get forestEmptyTitle => 'Khu rừng của bạn vẫn trống';

  @override
  String get forestEmptyBody =>
      'Khi bạn uống ly nước đầu tiên, một cây non sẽ hiện ra ở đây.';

  @override
  String get speciesScreenTitle => 'Loài cây';

  @override
  String get speciesScreenIntro =>
      'Bạn có thể chọn loài cho cây non ngày mai. Những cây cũ trong rừng vẫn giữ loài lúc được trồng.';

  @override
  String get speciesScreenSelected => 'Đã chọn';

  @override
  String get speciesScreenUnlocked => 'Đã mở';

  @override
  String speciesScreenUnlockTitle(String name) {
    return 'Mở cây $name';
  }

  @override
  String get speciesScreenRewardBody =>
      'Xem một quảng cáo ngắn để mở loài này vĩnh viễn. Quảng cáo hoàn toàn tùy chọn — không có quảng cáo bắt buộc ở bất kỳ đâu trong ứng dụng.';

  @override
  String get speciesScreenCancel => 'Hủy';

  @override
  String get speciesScreenWatchAd => 'Xem quảng cáo';

  @override
  String get seasonScreenTitle => 'Giao diện khu rừng';

  @override
  String get seasonScreenIntro =>
      'Màu khu rừng của bạn thay đổi, không phải cây. Không giao diện nào ảnh hưởng đến việc theo dõi, mục tiêu hay chuỗi ngày của bạn.';

  @override
  String get seasonScreenProOnly => 'Chỉ dành cho Pro';

  @override
  String get seasonScreenSelected => 'Đã chọn';

  @override
  String get setSectionHome => 'Màn hình chính';

  @override
  String get setAddWidget => 'Thêm tiện ích vào màn hình chính';

  @override
  String get setAddWidgetSub =>
      'Thêm nước chỉ với một chạm, không cần mở ứng dụng';

  @override
  String get setAddWidgetManual =>
      'Nhấn giữ màn hình chính → Tiện ích → chọn Sipling';

  @override
  String get wrappedTitle => 'Tổng kết khu rừng của bạn';

  @override
  String get wrappedHeadline => 'Hành trình của bạn đến nay';

  @override
  String wrappedLiters(int liters) {
    return '$liters L';
  }

  @override
  String get wrappedLitersLabel => 'tổng lượng nước';

  @override
  String get wrappedTreesLabel => 'cây';

  @override
  String get wrappedStreakLabel => 'chuỗi tốt nhất';

  @override
  String get wrappedDaysLabel => 'ngày';

  @override
  String get wrappedShare => 'Chia sẻ';

  @override
  String get wrappedShareText =>
      'Tôi đang vun trồng khu rừng của mình với Sipling, từng ngụm một 🌱 sipling-app.web.app';

  @override
  String get homeMoreDrinks => 'Khác';

  @override
  String addFactorWaterEq(int ml, int percent) {
    return '≈ $ml ml nước ($percent%)';
  }

  @override
  String proPerMonth(String price) {
    return '$price / tháng';
  }

  @override
  String get proRestore => 'Khôi phục giao dịch';

  @override
  String get proTerms => 'Điều khoản sử dụng';

  @override
  String get proPrivacyLink => 'Chính sách bảo mật';

  @override
  String get proStoreUnavailable => 'Cửa hàng hiện không khả dụng';

  @override
  String get proAutoRenew =>
      'Gói đăng ký hàng tháng, tự động gia hạn. Hủy ít nhất 24 giờ trước khi gia hạn trong cài đặt tài khoản cửa hàng; nếu không sẽ tự gia hạn.';
}
