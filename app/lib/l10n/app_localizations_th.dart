// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class LTh extends L {
  LTh([String locale = 'th']) : super(locale);

  @override
  String get appName => 'Sipling';

  @override
  String get drinkWater => 'น้ำ';

  @override
  String get drinkTea => 'ชา';

  @override
  String get drinkCoffee => 'กาแฟ';

  @override
  String get drinkMilk => 'นม';

  @override
  String get drinkJuice => 'น้ำผลไม้';

  @override
  String get drinkSoda => 'น้ำอัดลม';

  @override
  String get drinkAlcohol => 'แอลกอฮอล์';

  @override
  String get speciesOak => 'โอ๊ก';

  @override
  String get speciesPine => 'สน';

  @override
  String get speciesCherry => 'ซากุระ';

  @override
  String get speciesAcacia => 'อะเคเซีย';

  @override
  String get speciesMaple => 'เมเปิล';

  @override
  String get speciesOlive => 'โอลีฟ';

  @override
  String get speciesGolden => 'ใบทอง';

  @override
  String get speciesJacaranda => 'ศรีตรัง';

  @override
  String get unlockFree => 'ปลดล็อกแล้ว';

  @override
  String unlockStreak(int days) {
    return 'ทำเป้าหมายให้ได้ $days วันติดต่อกัน';
  }

  @override
  String unlockTotalTrees(int count) {
    return 'ปลูกต้นไม้รวม $count ต้น';
  }

  @override
  String get unlockRewardedAd => 'ดูโฆษณาสั้นๆ';

  @override
  String get unlockPro => 'เฉพาะสมาชิก Pro';

  @override
  String get achFirstSproutTitle => 'หน่อแรก';

  @override
  String get achFirstSproutDesc => 'คุณดื่มแก้วแรกแล้ว';

  @override
  String get achFirstTreeTitle => 'ต้นไม้ต้นแรก';

  @override
  String get achFirstTreeDesc => 'คุณทำเป้าหมายรายวันสำเร็จ';

  @override
  String get achStreak3Title => 'นิสัยเริ่มก่อตัว';

  @override
  String get achStreak3Desc => 'คุณทำเป้าหมายได้ 3 วันติดต่อกัน';

  @override
  String get achStreak7Title => 'ครบหนึ่งสัปดาห์';

  @override
  String get achStreak7Desc => 'คุณทำเป้าหมายได้ 7 วันติดต่อกัน';

  @override
  String get achStreak30Title => 'หนึ่งเดือนไม่ขาด';

  @override
  String get achStreak30Desc => 'คุณทำเป้าหมายได้ 30 วันติดต่อกัน';

  @override
  String get achTrees10Title => 'ป่าละเมาะเล็กๆ';

  @override
  String get achTrees10Desc => 'คุณปลูกต้นไม้ได้ 10 ต้น';

  @override
  String get achTrees50Title => 'ผู้พิทักษ์ป่า';

  @override
  String get achTrees50Desc => 'คุณปลูกต้นไม้ได้ 50 ต้น';

  @override
  String get achEarlyBirdTitle => 'ตื่นเช้า';

  @override
  String get achEarlyBirdDesc => 'คุณดื่มน้ำก่อน 9 โมงเช้า';

  @override
  String get achVarietyTitle => 'รสนิยมหลากหลาย';

  @override
  String get achVarietyDesc => 'คุณบันทึกเครื่องดื่มต่างชนิดอย่างน้อย 4 อย่าง';

  @override
  String get achPerfectWeekTitle => 'สัปดาห์ที่สมบูรณ์แบบ';

  @override
  String get achPerfectWeekDesc => 'คุณทำเป้าหมายได้ทุกวันตลอด 7 วัน';

  @override
  String get seasonClassicName => 'คลาสสิก';

  @override
  String get seasonClassicDesc => 'เขียวชอุ่มตลอดทั้งปี';

  @override
  String get seasonAutoName => 'อัตโนมัติ';

  @override
  String get seasonAutoDesc => 'ให้ป่าของคุณเปลี่ยนไปตามปฏิทิน';

  @override
  String get seasonSpringName => 'ฤดูใบไม้ผลิ';

  @override
  String get seasonSpringDesc => 'ใบไม้สดใส ท้องฟ้าแจ่มใส';

  @override
  String get seasonSummerName => 'ฤดูร้อน';

  @override
  String get seasonSummerDesc => 'เขียวเข้มอิ่มตา';

  @override
  String get seasonAutumnName => 'ฤดูใบไม้ร่วง';

  @override
  String get seasonAutumnDesc => 'ใบไม้สีส้ม แสงอบอุ่น';

  @override
  String get seasonWinterName => 'ฤดูหนาว';

  @override
  String get seasonWinterDesc => 'เนินหิมะ แสงเย็นตา';

  @override
  String get bmiUnderweight => 'น้ำหนักน้อย';

  @override
  String get bmiNormal => 'ปกติ';

  @override
  String get bmiOverweight => 'น้ำหนักเกิน';

  @override
  String get bmiObese => 'อ้วน';

  @override
  String get notifTitle1 => 'ได้เวลาดื่มน้ำแล้ว 💧';

  @override
  String get notifBody1 => 'ต้นกล้าของคุณกำลังรออยู่ — ดื่มสักแก้วไหม?';

  @override
  String get notifTitle2 => 'อีกสักอึก';

  @override
  String get notifBody2 => 'การจิบเล็กๆ ทำให้ต้นไม้เติบโตใหญ่';

  @override
  String get notifTitle3 => 'ต้นกล้าของคุณกระหายน้ำ 🌱';

  @override
  String get notifBody3 => 'น้ำสักแก้วช่วยให้มันโตขึ้นอีกนิด';

  @override
  String get notifTitle4 => 'เตือนความจำ';

  @override
  String get notifBody4 => 'ใกล้ต้นไม้ของวันนี้ไปอีกก้าว';

  @override
  String get notifTitle5 => 'พักดื่มน้ำ';

  @override
  String get notifBody5 => 'แก้วที่คุณดื่มตอนนี้คือต้นไม้ของคืนนี้';

  @override
  String get activityLow => 'ไม่ค่อยขยับ';

  @override
  String get activityLowHint => 'นั่งโต๊ะ เดินน้อย';

  @override
  String get activityMedium => 'ปานกลาง';

  @override
  String get activityMediumHint => 'ออกกำลังกาย 1-3 วันต่อสัปดาห์';

  @override
  String get activityHigh => 'กระฉับกระเฉง';

  @override
  String get activityHighHint => 'ออกกำลังกาย 4 วันขึ้นไปต่อสัปดาห์';

  @override
  String get cupGlass => 'แก้ว';

  @override
  String get cupBottle => 'ขวด';

  @override
  String get cupLarge => 'ใหญ่';

  @override
  String get homeNewAchievement => 'ความสำเร็จใหม่';

  @override
  String get homeUndoLast => 'ย้อนรายการล่าสุด';

  @override
  String get homeStageSeed => 'เมล็ดของคุณอยู่ในดิน รอการจิบครั้งแรก';

  @override
  String get homeStageSprout => 'แตกหน่อแล้ว 🌱';

  @override
  String get homeStageSapling => 'ต้นกล้าของคุณกำลังโต';

  @override
  String get homeStageAlmost => 'เกือบเป็นต้นไม้แล้ว!';

  @override
  String get homeStageReady => 'ต้นไม้ของวันนี้พร้อมแล้ว 🌳';

  @override
  String get homePaceDone => 'พรุ่งนี้มีต้นกล้าใหม่รอคุณอยู่';

  @override
  String get homePaceStart => 'เริ่มวันด้วยน้ำสักแก้ว';

  @override
  String homePaceBehind(int ml) {
    return 'ชั่วโมงนี้คุณตามหลังอยู่ $ml ml — ยังตามทันได้';
  }

  @override
  String get homePaceOnTrack => 'คุณอยู่ในจังหวะพอดี 👌';

  @override
  String get homeGoalDone => 'คุณทำเป้าหมายรายวันสำเร็จแล้ว';

  @override
  String homeRemaining(int ml) {
    return 'เหลืออีก $ml ml';
  }

  @override
  String homeStreakDays(int days) {
    return '$days วัน';
  }

  @override
  String get homeCelebrateTitle => 'ต้นไม้ของคุณโตแล้ว!';

  @override
  String get homeCelebrateBody =>
      'คุณทำเป้าหมายวันนี้สำเร็จ ต้นไม้ต้นนี้เป็นส่วนหนึ่งของป่าคุณแล้ว';

  @override
  String homeStreakLabel(int days) {
    return 'ต่อเนื่อง $days วัน';
  }

  @override
  String get homeCelebrateOk => 'เยี่ยม';

  @override
  String get addWhatTitle => 'คุณดื่มอะไร?';

  @override
  String get addAmount => 'ปริมาณ';

  @override
  String get addConfirm => 'เพิ่ม';

  @override
  String get addFactorWater => 'นับเข้าเป้าหมายเต็มจำนวน';

  @override
  String get addFactorAlcohol =>
      'แอลกอฮอล์ทำให้ร่างกายเสียน้ำ จึงถูกหักออกจากเป้าหมาย';

  @override
  String addFactorPercent(int percent) {
    return 'นับเข้าเป้าหมาย $percent%';
  }

  @override
  String get sumTitle => 'สรุปเมื่อวาน';

  @override
  String get sumTreeGrown => 'ต้นไม้ของคุณโตแล้ว 🌳';

  @override
  String get sumSaplingOnWay => 'ต้นกล้าของคุณกำลังมา 🌱';

  @override
  String get sumBodyDone =>
      'คุณทำเป้าหมายสำเร็จ ต้นไม้ต้นนี้เป็นส่วนหนึ่งของป่าคุณ';

  @override
  String sumPercent(int percent) {
    return 'เมื่อวานคุณทำได้ $percent% ของเป้าหมาย ต้นกล้ารออยู่ตรงที่คุณทิ้งไว้ — ไม่มีต้นไม้ต้นใดเหี่ยวเฉา';
  }

  @override
  String get sumStatCounted => 'นับแล้ว';

  @override
  String get sumStatGoal => 'เป้าหมาย';

  @override
  String get sumStatStreak => 'ต่อเนื่อง';

  @override
  String sumStreakDays(int days) {
    return '$days วัน';
  }

  @override
  String get sumStartToday => 'เริ่มวันนี้';

  @override
  String get sumWhatDrank => 'สิ่งที่คุณดื่ม';

  @override
  String sumDrinkAmount(String name, int ml) {
    return '$name $ml ml';
  }

  @override
  String get navToday => 'วันนี้';

  @override
  String get navForest => 'ป่า';

  @override
  String get navStats => 'สถิติ';

  @override
  String get navSettings => 'ตั้งค่า';

  @override
  String get onbContinue => 'ต่อไป';

  @override
  String get onbFinish => 'ปลูกต้นกล้าของฉัน';

  @override
  String get onbWelcomeTagline =>
      'ทุกจิบคือต้นกล้าหนึ่งต้น\nดื่มน้ำแล้วต้นไม้ของคุณเติบโต วันเวลาผ่านไป ป่าของคุณก็เติบโตตาม';

  @override
  String get onbWelcomeNoPenalty =>
      'ต้นไม้ของคุณไม่มีวันเหี่ยวเฉา ที่นี่ไม่มีบทลงโทษ';

  @override
  String get onbGenderTitle => 'มาทำความรู้จักกัน';

  @override
  String get onbGenderSubtitle =>
      'เป้าหมายน้ำรายวันคำนวณจากข้อมูลนี้ ทุกอย่างอยู่ในเครื่องของคุณและไม่ถูกส่งไปที่ไหนเลย';

  @override
  String get onbGenderFemale => 'หญิง';

  @override
  String get onbGenderMale => 'ชาย';

  @override
  String get onbGenderOther => 'ไม่ขอระบุ';

  @override
  String get onbBodyTitle => 'ส่วนสูง น้ำหนัก อายุ';

  @override
  String get onbBodySubtitle => 'เลื่อนเพื่อปรับ';

  @override
  String get onbBodyAge => 'อายุ';

  @override
  String get onbBodyHeight => 'ส่วนสูง';

  @override
  String get onbBodyWeight => 'น้ำหนัก';

  @override
  String get onbBodyBmiLabel => 'ดัชนีมวลกายของคุณ';

  @override
  String get onbBodyDisclaimer =>
      'เพื่อเป็นข้อมูลเท่านั้น ไม่ใช่คำแนะนำทางการแพทย์';

  @override
  String get onbActivityTitle => 'คุณเคลื่อนไหวมากแค่ไหน?';

  @override
  String get onbActivitySubtitle => 'ยิ่งเหงื่อออกมาก คุณยิ่งต้องการน้ำมากขึ้น';

  @override
  String get onbGoalTitle => 'เป้าหมายรายวันของคุณ';

  @override
  String get onbGoalSubtitle => 'เปลี่ยนได้ทุกเมื่อในหน้าตั้งค่า';

  @override
  String get onbGoalUnit => 'มิลลิลิตร / วัน';

  @override
  String onbGoalGlasses(int glasses) {
    return 'ประมาณ $glasses แก้ว';
  }

  @override
  String get onbGoalReference =>
      'เป้าหมายนี้ปรับตามน้ำหนักและระดับการเคลื่อนไหวของคุณ อ้างอิงจากค่าปริมาณน้ำที่เพียงพอของสำนักงานความปลอดภัยด้านอาหารยุโรป (EFSA, 2010) น้ำที่ได้จากอาหารไม่รวมอยู่ในตัวเลขนี้';

  @override
  String get proAppBarTitle => 'Sipling Pro';

  @override
  String get proHeaderTitle => 'Sipling ไร้โฆษณา';

  @override
  String get proHeaderSub => 'ให้ป่าของคุณเติบโตต่อไป';

  @override
  String get proPerkNoAdsTitle => 'ไม่มีโฆษณาเลย';

  @override
  String get proPerkNoAdsSub => 'แม้แต่โฆษณาในสรุปรายวันก็หายไป';

  @override
  String get proPerkTreesTitle => 'ต้นไม้ครบทุกชนิด';

  @override
  String get proPerkTreesSub => 'รวมถึงใบทองและศรีตรัง';

  @override
  String get proPerkHistoryTitle => 'ประวัติไม่จำกัด';

  @override
  String get proPerkHistorySub => 'สถิติละเอียดของทุกเดือน';

  @override
  String get proPerkThemesTitle => 'ตัวเลือกธีม';

  @override
  String get proPerkThemesSub => 'หน้าตาป่าตามฤดูกาล';

  @override
  String get proPerkSupportTitle => 'สนับสนุนการพัฒนา';

  @override
  String get proPerkSupportSub => 'Sipling เป็นโปรเจกต์ของคนคนเดียว';

  @override
  String get proNotConnectedNote =>
      'ยังไม่ได้เชื่อมต่อการซื้อ ตอนนี้คุณเปิดปิด Pro เพื่อลองใช้ได้';

  @override
  String get proButtonOn => 'Pro เปิดอยู่ — ปิด';

  @override
  String get proButtonTry => 'ลอง Pro';

  @override
  String get batAppBarTitle => 'ถ้าการแจ้งเตือนไม่มา';

  @override
  String get batIntro =>
      'โทรศัพท์บางยี่ห้อปิดแอปที่ทำงานเบื้องหลังเพื่อประหยัดแบตเตอรี่ การแจ้งเตือนจึงอาจล่าช้าหรือไม่มาเลย แค่ตั้งค่าด้านล่างนี้ครั้งเดียวก็พอ';

  @override
  String get batXiaomi1 =>
      'ตั้งค่า → แอป → Sipling → ประหยัดแบตเตอรี่ → \"ไม่จำกัด\"';

  @override
  String get batXiaomi2 => 'ตั้งค่า → แอป → Sipling → เริ่มอัตโนมัติ → เปิด';

  @override
  String get batXiaomi3 => 'ในหน้าแอปล่าสุด ดึง Sipling ลงแล้วแตะไอคอนแม่กุญแจ';

  @override
  String get batSamsung1 =>
      'ตั้งค่า → แอป → Sipling → แบตเตอรี่ → \"ไม่จำกัด\"';

  @override
  String get batSamsung2 =>
      'ตั้งค่า → แบตเตอรี่ → ขีดจำกัดการใช้เบื้องหลัง → นำ Sipling ออกจากรายการ \"แอปที่หลับอยู่\"';

  @override
  String get batHuawei1 =>
      'ตั้งค่า → แบตเตอรี่ → การเปิดแอป → Sipling → ปิดจัดการอัตโนมัติ';

  @override
  String get batHuawei2 => 'เปิดเริ่มอัตโนมัติ เริ่มรอง และทำงานเบื้องหลัง';

  @override
  String get batOppo1 =>
      'ตั้งค่า → แบตเตอรี่ → การใช้พลังงานเบื้องหลังสูง → อนุญาต Sipling';

  @override
  String get batOppo2 =>
      'ตั้งค่า → แอป → Sipling → การใช้แบตเตอรี่ → อนุญาตการทำงานเบื้องหลัง';

  @override
  String get batFooter =>
      'ชื่อเมนูอาจต่างกันเล็กน้อยตามรุ่นโทรศัพท์ สิ่งที่คุณกำลังหาคือการตั้งค่าอย่าง \"ปรับแต่งแบตเตอรี่\" \"การทำงานเบื้องหลัง\" หรือ \"เริ่มอัตโนมัติ\"';

  @override
  String get setTitle => 'ตั้งค่า';

  @override
  String get setSectionGoal => 'เป้าหมาย';

  @override
  String get setSectionReminders => 'การเตือน';

  @override
  String get setSectionCups => 'แก้วของฉัน';

  @override
  String get setSectionHealth => 'สุขภาพ';

  @override
  String get setSectionAppearance => 'รูปลักษณ์';

  @override
  String get setSectionApp => 'แอป';

  @override
  String get setProTagline => 'ไร้โฆษณา ปลดล็อกต้นไม้ทุกชนิด';

  @override
  String get setDailyGoal => 'เป้าหมายรายวัน';

  @override
  String setMl(int ml) {
    return '$ml ml';
  }

  @override
  String get setProfileInfo => 'โปรไฟล์ของฉัน';

  @override
  String setWeightKg(int kg) {
    return '$kg kg';
  }

  @override
  String get setRemindersOn => 'เปิดการเตือน';

  @override
  String get setFrequency => 'ความถี่';

  @override
  String get setAwakeHours => 'ช่วงเวลาที่ฉันตื่น';

  @override
  String get setStopWhenDone => 'หยุดเมื่อถึงเป้าหมาย';

  @override
  String get setStopWhenDoneSub =>
      'เมื่อคุณถึงเป้าหมายรายวัน การเตือนที่เหลือจะถูกยกเลิก';

  @override
  String get setSilent => 'การแจ้งเตือนแบบเงียบ';

  @override
  String get setSilentSub => 'ไม่มีเสียงหรือการสั่น';

  @override
  String get setNotifNotArriving => 'การแจ้งเตือนไม่มาใช่ไหม?';

  @override
  String get setNotifNotArrivingSub =>
      'การตั้งค่าแบตเตอรี่ของโทรศัพท์อาจกำลังบล็อกอยู่';

  @override
  String get setHealthWrite => 'บันทึกลง Health Connect';

  @override
  String get setHealthWriteSub =>
      'ปริมาณน้ำของคุณจะถูกบันทึกลงสมุดสุขภาพของ Android ด้วย Sipling ไม่เคยอ่านอะไรจากที่นั่นเลย';

  @override
  String get setDarkTheme => 'ธีมมืด';

  @override
  String get setForestTheme => 'ธีมป่า';

  @override
  String get setTreeSpecies => 'ชนิดต้นไม้';

  @override
  String get setMyData => 'ข้อมูลของฉัน';

  @override
  String get setMyDataSub =>
      'ทุกอย่างเก็บอยู่ในเครื่องของคุณและไม่ถูกส่งไปที่ไหนเลย';

  @override
  String get setResetAll => 'รีเซ็ตข้อมูลทั้งหมด';

  @override
  String setEveryHours(int h) {
    return 'ทุก $h ชั่วโมง';
  }

  @override
  String setEveryMinutes(int m) {
    return 'ทุก $m นาที';
  }

  @override
  String get setHealthNoConnect => 'อุปกรณ์นี้ไม่มี Health Connect';

  @override
  String get setHealthNotInstalledTitle => 'ยังไม่ได้ติดตั้ง Health Connect';

  @override
  String get setHealthNeedsUpdateTitle => 'Health Connect ต้องอัปเดต';

  @override
  String get setHealthInstallBody =>
      'ต้องใช้แอป Health Connect เพื่อบันทึกปริมาณน้ำของคุณลงสมุดสุขภาพของ Android';

  @override
  String get setOpenPlayStore => 'เปิดใน Play Store';

  @override
  String get setHealthPermissionDenied =>
      'ปฏิเสธสิทธิ์แล้ว จะไม่มีการบันทึกลงสมุดสุขภาพ';

  @override
  String get setHealthEnabled =>
      'จากนี้ไปปริมาณน้ำของคุณจะถูกบันทึกลง Health Connect ด้วย';

  @override
  String get setCancel => 'ยกเลิก';

  @override
  String get setSave => 'บันทึก';

  @override
  String setSuggested(int ml) {
    return 'แนะนำ: $ml ml';
  }

  @override
  String get setBackToSuggested => 'กลับไปค่าที่แนะนำ';

  @override
  String get setIntervalDialogTitle => 'ให้เตือนบ่อยแค่ไหน?';

  @override
  String get setWakeHelp => 'คุณตื่นกี่โมง?';

  @override
  String get setSleepHelp => 'คุณเข้านอนกี่โมง?';

  @override
  String get setAwakeMin4h => 'ช่วงเวลาที่คุณตื่นต้องอย่างน้อย 4 ชั่วโมง';

  @override
  String get setResetConfirmTitle => 'แน่ใจไหม?';

  @override
  String get setResetConfirmBody =>
      'ป่า สถิติต่อเนื่อง และบันทึกทั้งหมดของคุณจะถูกลบ ย้อนกลับไม่ได้';

  @override
  String get setResetConfirmButton => 'รีเซ็ต';

  @override
  String get statsTitle => 'สถิติ';

  @override
  String get statsDailyAverage => 'เฉลี่ยต่อวัน';

  @override
  String get statsGoalDays => 'วันที่ทำเป้าหมายได้';

  @override
  String get statsCurrentStreak => 'ต่อเนื่องปัจจุบัน';

  @override
  String get statsUnitDays => 'วัน';

  @override
  String get statsTotalTrees => 'ต้นไม้ทั้งหมด';

  @override
  String statsLastDays(int days) {
    return '$days วันล่าสุด';
  }

  @override
  String get statsYourDrinks => 'เครื่องดื่มของคุณ';

  @override
  String statsRangeDays(int days) {
    return '$days วัน';
  }

  @override
  String get statsWeekdayMon => 'จ.';

  @override
  String get statsWeekdayTue => 'อ.';

  @override
  String get statsWeekdayWed => 'พ.';

  @override
  String get statsWeekdayThu => 'พฤ.';

  @override
  String get statsWeekdayFri => 'ศ.';

  @override
  String get statsWeekdaySat => 'ส.';

  @override
  String get statsWeekdaySun => 'อา.';

  @override
  String get statsNoRecords => 'ยังไม่มีบันทึก';

  @override
  String get statsBmiTitle => 'ดัชนีมวลกาย';

  @override
  String get statsBmiDisclaimer =>
      'เพื่อเป็นข้อมูลเท่านั้น\nไม่ใช่คำแนะนำทางการแพทย์';

  @override
  String get statsAchievements => 'ความสำเร็จ';

  @override
  String statsAchievementsEarned(int count) {
    return 'ได้รับ $count รายการ';
  }

  @override
  String get achScreenTitle => 'ความสำเร็จ';

  @override
  String get forestTitle => 'ป่าของคุณ';

  @override
  String forestSubtitle(int trees, int days) {
    return '$trees ต้น • ต่อเนื่องดีที่สุด $days วัน';
  }

  @override
  String get forestSpeciesTooltip => 'ชนิดต้นไม้';

  @override
  String get forestEmptyTitle => 'ป่าของคุณยังว่างอยู่';

  @override
  String get forestEmptyBody => 'เมื่อคุณดื่มแก้วแรก ต้นกล้าจะปรากฏขึ้นที่นี่';

  @override
  String get speciesScreenTitle => 'ชนิดต้นไม้';

  @override
  String get speciesScreenIntro =>
      'คุณเลือกชนิดของต้นกล้าพรุ่งนี้ได้ ต้นไม้เก่าในป่าของคุณยังคงเป็นชนิดที่ปลูกไว้ตอนแรก';

  @override
  String get speciesScreenSelected => 'เลือกอยู่';

  @override
  String get speciesScreenUnlocked => 'ปลดล็อกแล้ว';

  @override
  String speciesScreenUnlockTitle(String name) {
    return 'ปลดล็อกต้น$name';
  }

  @override
  String get speciesScreenRewardBody =>
      'ดูโฆษณาสั้นๆ เพื่อปลดล็อกชนิดนี้ถาวร โฆษณาเป็นทางเลือกทั้งหมด — ไม่มีโฆษณาบังคับที่ใดในแอปเลย';

  @override
  String get speciesScreenCancel => 'ยกเลิก';

  @override
  String get speciesScreenWatchAd => 'ดูโฆษณา';

  @override
  String get seasonScreenTitle => 'ธีมป่า';

  @override
  String get seasonScreenIntro =>
      'สีของป่าเปลี่ยน ไม่ใช่ต้นไม้ ไม่มีธีมใดกระทบการติดตาม เป้าหมาย หรือสถิติต่อเนื่องของคุณ';

  @override
  String get seasonScreenProOnly => 'เฉพาะสมาชิก Pro';

  @override
  String get seasonScreenSelected => 'เลือกอยู่';

  @override
  String get setSectionHome => 'หน้าจอหลัก';

  @override
  String get setAddWidget => 'เพิ่มวิดเจ็ตลงหน้าจอหลัก';

  @override
  String get setAddWidgetSub => 'เพิ่มน้ำได้ด้วยแตะเดียว โดยไม่ต้องเปิดแอป';

  @override
  String get setAddWidgetManual =>
      'กดค้างที่หน้าจอหลัก → วิดเจ็ต → เลือก Sipling';

  @override
  String get wrappedTitle => 'สรุปป่าของคุณ';

  @override
  String get wrappedHeadline => 'เส้นทางของคุณจนถึงตอนนี้';

  @override
  String wrappedLiters(int liters) {
    return '$liters L';
  }

  @override
  String get wrappedLitersLabel => 'น้ำทั้งหมด';

  @override
  String get wrappedTreesLabel => 'ต้นไม้';

  @override
  String get wrappedStreakLabel => 'สถิติต่อเนื่องที่ดีที่สุด';

  @override
  String get wrappedDaysLabel => 'วัน';

  @override
  String get wrappedShare => 'แชร์';

  @override
  String get wrappedShareText =>
      'ฉันกำลังปลูกป่าของฉันกับ Sipling ทีละจิบ 🌱 sipling-app.web.app';

  @override
  String get homeMoreDrinks => 'อื่นๆ';

  @override
  String addFactorWaterEq(int ml, int percent) {
    return '≈ น้ำ $ml ml ($percent%)';
  }

  @override
  String proPerMonth(String price) {
    return '$price / เดือน';
  }

  @override
  String get proRestore => 'กู้คืนการซื้อ';

  @override
  String get proTerms => 'ข้อกำหนดการใช้งาน';

  @override
  String get proPrivacyLink => 'นโยบายความเป็นส่วนตัว';

  @override
  String get proStoreUnavailable => 'ร้านค้าไม่พร้อมใช้งานขณะนี้';

  @override
  String get proAutoRenew =>
      'การสมัครสมาชิกรายเดือน ต่ออายุอัตโนมัติ ยกเลิกอย่างน้อย 24 ชั่วโมงก่อนต่ออายุในการตั้งค่าบัญชีสโตร์ มิฉะนั้นจะต่ออายุ';

  @override
  String get homeCalcNeed => 'ความต้องการน้ำของฉัน';

  @override
  String get needTitle => 'ความต้องการน้ำรายวันของคุณ';

  @override
  String get needIntro =>
      'กรอกส่วนสูง น้ำหนัก และระดับการเคลื่อนไหวของคุณ แล้ว Sipling จะคำนวณว่าคุณต้องการน้ำเท่าไรต่อวัน';

  @override
  String get needResultLabel => 'แนะนำสำหรับคุณ';

  @override
  String needCurrentGoal(int ml) {
    return 'เป้าหมายปัจจุบันของคุณ: $ml ml';
  }

  @override
  String get needApply => 'ใช้ค่านี้เป็นเป้าหมายของฉัน';

  @override
  String get needApplied => 'อัปเดตเป้าหมายของคุณแล้ว';

  @override
  String get needMeasuresTitle => 'สัดส่วนร่างกายของคุณ';

  @override
  String get needLearnTitle => 'น้ำกับร่างกายของคุณ';

  @override
  String get factNotifTitle1 => 'สามในสี่คือน้ำ';

  @override
  String get factNotifBody1 =>
      'สมองของคุณประมาณสามในสี่เป็นน้ำ ดื่มน้ำให้เพียงพอไว้เสมอ';

  @override
  String get factNotifTitle2 => 'สมาธิต้องการน้ำ';

  @override
  String get factNotifBody2 =>
      'แค่เสียน้ำในร่างกาย 1-2% ก็ทำให้มีสมาธิยากขึ้นได้';

  @override
  String get factNotifTitle3 => 'ความกระหายมาช้า';

  @override
  String get factNotifBody3 => 'พอคุณรู้สึกกระหาย ร่างกายก็เริ่มขาดน้ำไปแล้ว';

  @override
  String get factNotifTitle4 => 'ระบบทำความเย็นในตัวคุณ';

  @override
  String get factNotifBody4 =>
      'การขับเหงื่อคือวิธีที่ร่างกายทำให้ตัวเย็นลง และต้องใช้น้ำในการทำเช่นนั้น';

  @override
  String get factNotifTitle5 => 'ดูสี';

  @override
  String get factNotifBody5 =>
      'สีเหลืองอ่อนมักหมายความว่าคุณได้รับน้ำเพียงพอ สีเข้มขึ้นควรดื่มน้ำเพิ่ม';

  @override
  String get factLearn1Title => 'ร่างกายของคุณกว่าครึ่งคือน้ำ';

  @override
  String get factLearn1Body =>
      'น้ำคิดเป็นประมาณ 50-60% ของร่างกายผู้ใหญ่ และประมาณ 73% ของสมอง น้ำช่วยลำเลียงสารอาหาร รองรับแรงกระแทกที่ข้อต่อ และรักษาอุณหภูมิร่างกายให้คงที่';

  @override
  String get factLearn2Title => 'จะเกิดอะไรขึ้นเมื่อคุณดื่มน้ำน้อยเกินไป';

  @override
  String get factLearn2Body =>
      'แม้แต่ภาวะขาดน้ำเล็กน้อย คือการเสียน้ำในร่างกายประมาณ 1-2% ก็เชื่อมโยงกับความเหนื่อยล้า ปวดหัว สมาธิลดลง และอารมณ์แย่ลง ในระยะยาว การดื่มน้ำน้อยเกินไปยังเพิ่มโอกาสท้องผูกและนิ่วในไต';

  @override
  String get factLearn3Title => 'ความกระหายเป็นสัญญาณที่มาช้า';

  @override
  String get factLearn3Body =>
      'ความกระหายมักเกิดขึ้นหลังจากร่างกายเสียน้ำไปแล้ว และความรู้สึกนี้จะอ่อนลงตามอายุที่มากขึ้น การดื่มน้ำเป็นระยะอย่างสม่ำเสมอได้ผลดีกว่าการรอจนกระหายแล้วค่อยดื่ม';

  @override
  String get factLearn4Title => 'สีปัสสาวะเป็นวิธีตรวจสอบที่ง่ายที่สุด';

  @override
  String get factLearn4Body =>
      'สีเหลืองอ่อนคล้ายฟางมักหมายความว่าคุณได้รับน้ำเพียงพอ ส่วนสีเหลืองเข้มบ่งบอกว่าคุณต้องการน้ำเพิ่ม วิตามินและยาบางชนิดอาจเปลี่ยนสีได้ ดังนั้นให้ถือเป็นเพียงข้อสังเกต ไม่ใช่ข้อสรุปที่แน่นอน';

  @override
  String get factLearn5Title => 'เท่าไรถึงจะเพียงพอ?';

  @override
  String get factLearn5Body =>
      'ค่าอ้างอิงของ EFSA สำหรับปริมาณน้ำที่เพียงพอจากเครื่องดื่มอยู่ที่ประมาณ 2 ลิตรต่อวันสำหรับผู้หญิง และ 2.5 ลิตรสำหรับผู้ชาย ในสภาพภูมิอากาศอบอุ่นและมีการเคลื่อนไหวระดับปานกลาง อากาศร้อน การออกกำลังกาย การตั้งครรภ์ และการให้นมบุตร ล้วนเพิ่มความต้องการนี้ Sipling ปรับค่านี้ตามน้ำหนักและระดับการเคลื่อนไหวของคุณ';

  @override
  String get homeBoost => 'วันร้อน / ออกกำลังกาย';

  @override
  String get boostTitle => 'เพิ่มเป้าหมายวันนี้';

  @override
  String get boostBody =>
      'ในวันที่อากาศร้อนหรือหลังออกกำลังกาย เพิ่มปริมาณให้เป้าหมายวันนี้ พรุ่งนี้จะรีเซ็ตเอง';

  @override
  String get boostReset => 'รีเซ็ต';

  @override
  String boostActive(int ml) {
    return 'เพิ่ม +$ml ml วันนี้แล้ว';
  }

  @override
  String get logTitle => 'รายการของวันนี้';

  @override
  String get logEmpty => 'ยังไม่มีรายการวันนี้';

  @override
  String get logOpen => 'รายการของวันนี้';

  @override
  String get logDelete => 'ลบ';

  @override
  String get setReminderStyle => 'รูปแบบการเตือน';

  @override
  String get styleNormal => 'ปกติ';

  @override
  String get styleNormalSub => 'เสียงและการสั่น';

  @override
  String get styleGentle => 'นุ่มนวล';

  @override
  String get styleGentleSub => 'สั่นอย่างเดียว ไม่มีเสียง';

  @override
  String get styleSilent => 'เงียบ';

  @override
  String get styleSilentSub => 'ไม่มีเสียงและการสั่น';

  @override
  String get speciesScreenAdUnavailable =>
      'โฆษณายังไม่พร้อม โปรดลองอีกครั้งในอีกสักครู่';

  @override
  String get setHotDayTitle => 'แจ้งเตือนวันอากาศร้อน';

  @override
  String get setHotDaySub =>
      'เตือนดื่มน้ำเพิ่มเมื่อเมืองของคุณอากาศร้อน (เฉพาะ iPhone)';

  @override
  String get setHotDayCity => 'เมือง';

  @override
  String get setHotDayCitySet => 'เลือก';

  @override
  String get setHotDayCityHint => 'เช่น อิสตันบูล';

  @override
  String get notifHotDayTitle => 'วันนี้อากาศร้อน 🌡️';

  @override
  String notifHotDayBody(int temp) {
    return 'วันนี้ $temp°C — ลองจิบน้ำบ่อยขึ้นอีกนิด';
  }

  @override
  String get setThemeTitle => 'ธีม';

  @override
  String get themeSystem => 'ตามระบบ';

  @override
  String get themeLight => 'สว่าง';

  @override
  String get themeDark => 'มืด';

  @override
  String get setHowTo => 'Sipling ใช้งานอย่างไร';

  @override
  String get tourNext => 'ถัดไป';

  @override
  String get tourBack => 'ย้อนกลับ';

  @override
  String get tourSkip => 'ข้าม';

  @override
  String get tourDone => 'เข้าใจแล้ว';

  @override
  String get tourT1 => 'ดื่มแล้วรดน้ำต้นกล้า';

  @override
  String get tourB1 =>
      'แตะแก้วบนหน้าแรกเพื่อบันทึกการดื่ม ทุกแก้วจะรดน้ำต้นกล้าของคุณ — แตะพลาดใช่ไหม ใช้ลูกศรย้อนกลับได้';

  @override
  String get tourT2 => 'เป้าหมายรายวัน';

  @override
  String get tourB2 =>
      'Sipling คำนวณเป้าหมายจากส่วนสูง น้ำหนัก อายุ และกิจกรรมของคุณ เปลี่ยนได้ทุกเมื่อในการตั้งค่า หรือคำนวณใหม่ที่หน้า “น้ำกับร่างกายคุณ”';

  @override
  String get tourT3 => 'การเตือนที่เข้ากับวันของคุณ';

  @override
  String get tourB3 =>
      'เปิดการเตือนในการตั้งค่า แล้วกำหนดช่วงเวลาที่คุณตื่นและความถี่ เมื่อถึงเป้าหมายแล้ว เวลาที่เหลือของวันจะเงียบ';

  @override
  String get tourT4 => 'ปลูกป่าของคุณ';

  @override
  String get tourB4 =>
      'เมื่อถึงเป้าหมาย ต้นกล้าจะกลายเป็นต้นไม้ในป่าของคุณ ต้นไม้ไม่มีวันเหี่ยว — วันที่พลาดไปไม่มีบทลงโทษ';
}
