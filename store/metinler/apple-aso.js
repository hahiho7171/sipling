/**
 * App Store ASO — 20 mağaza dili için ad / alt başlık / anahtar kelime.
 *
 * Neden böyle kuruldu (2026-07-27, Apple'ın kendi iTunes Search API'siyle ölçülen rakip verisi):
 *  · Apple aramada YALNIZ şunları indeksler: uygulama ADI (30) + ALT BAŞLIK (30) +
 *    ANAHTAR KELİME alanı (100). AÇIKLAMA indekslenmez (o sadece indirmeye ikna eder).
 *  · Zirvedeki tüm rakipler adı her ülkeye göre çeviriyor:
 *      Waterllama → US "Water tracker Waterllama" · DE "Wasser trinken Erinnerung Lama"
 *                   ES "Beber agua recordar Waterllama" · FR "Boire de l'eau Waterllama"
 *    Hepsi kendi ülkesinde 1. sırada. Sipling'in adı her yerde sadece "Sipling"di.
 *  · Kural: ADDA geçen kelime ALT BAŞLIKTA ve ANAHTAR KELİMEDE TEKRARLANMAZ (Apple hepsini
 *    birleştirip ifade üretir; tekrar = boşa giden karakter).
 *  · Anahtar kelimeler virgülle, ARADA BOŞLUK YOK (boşluk karakter yakar).
 *  · Rakip marka adı YAZILMAZ (Apple reddediyor).
 *
 * Sınırlar: name<=30, subtitle<=30, keywords<=100, promo<=170, description<=4000
 */

// Apple mağaza dili  ->  { store/metinler/<dosya>.json, ad, alt başlık, anahtar kelimeler }
module.exports = {
  'en-US': {
    src: 'en-US',
    name: 'Sipling: Water Tracker',
    subtitle: 'Drink reminder & hydration',
    keywords: 'intake,hydrate,thirst,aqua,glass,bottle,daily,goal,habit,routine,health,alarm,log,sip,cup',
  },
  tr: {
    src: 'tr-TR',
    name: 'Sipling: Su Takibi',
    subtitle: 'Su içme hatırlatıcısı ve hedef',
    keywords: 'takip,hatırlatma,hidrasyon,bardak,litre,alışkanlık,sağlık,alarm,şişe,içmek,günlük,rutin',
  },
  'de-DE': {
    src: 'de-DE',
    name: 'Sipling: Wasser Tracker',
    subtitle: 'Trinken Erinnerung & Ziel',
    keywords: 'hydration,trinkplan,glas,liter,flasche,gesundheit,alarm,durst,gewohnheit,täglich,menge',
  },
  'es-ES': {
    src: 'es-ES',
    name: 'Sipling: Beber Agua',
    subtitle: 'Recordatorio y control diario',
    keywords: 'hidratación,vaso,litro,botella,salud,alarma,sed,hábito,meta,seguimiento,tomar,consumo',
  },
  'fr-FR': {
    src: 'fr-FR',
    name: "Sipling: Boire de l'eau",
    subtitle: 'Rappel et suivi quotidien',
    keywords: 'hydratation,verre,litre,bouteille,santé,alarme,soif,habitude,objectif,consommation',
  },
  it: {
    src: 'it-IT',
    name: 'Sipling: Bere Acqua',
    subtitle: 'Promemoria e monitoraggio',
    keywords: 'idratazione,bicchiere,litro,bottiglia,salute,sveglia,sete,abitudine,obiettivo,diario',
  },
  'pt-BR': {
    src: 'pt-BR',
    name: 'Sipling: Beber Água',
    subtitle: 'Lembrete e controle diário',
    keywords: 'hidratação,copo,litro,garrafa,saúde,alarme,sede,hábito,meta,registro,consumo,monitor',
  },
  'nl-NL': {
    src: 'nl-NL',
    name: 'Sipling: Water Drinken',
    subtitle: 'Herinnering en dagboek',
    keywords: 'hydratatie,glas,liter,fles,gezondheid,alarm,dorst,gewoonte,doel,tracker,inname',
  },
  pl: {
    src: 'pl-PL',
    name: 'Sipling: Pij Wodę',
    subtitle: 'Przypomnienie i licznik',
    keywords: 'nawodnienie,szklanka,litr,butelka,zdrowie,alarm,pragnienie,nawyk,cel,woda,picie',
  },
  ru: {
    src: 'ru-RU',
    name: 'Sipling: пить воду',
    subtitle: 'Напоминание и трекер',
    keywords: 'гидратация,стакан,литр,бутылка,здоровье,будильник,жажда,цель,норма,учёт,питьё,вода',
  },
  uk: {
    src: 'uk',
    name: 'Sipling: пий воду',
    subtitle: 'Нагадування та щоденник',
    keywords: "гідратація,склянка,літр,пляшка,здоров'я,будильник,спрага,ціль,норма,облік,трекер",
  },
  ja: {
    src: 'ja-JP',
    name: 'Sipling: 水分補給リマインダー',
    subtitle: '飲水記録と水分摂取トラッカー',
    keywords: '水,のむ,健康,習慣,アラーム,コップ,ペットボトル,目標,ダイエット,通知,毎日,カウンター,水筒,飲み物,水分不足,ヘルスケア,タイマー,美容,ウォーター',
  },
  ko: {
    src: 'ko-KR',
    name: 'Sipling: 물 마시기 알림',
    subtitle: '물 섭취 기록 및 습관 관리',
    keywords: '수분,건강,알람,컵,생수,목표,다이어트,하루,보충,리마인더,음수량,물병,헬스,타이머,체중,피부,알림,물마시기,카운터',
  },
  'zh-Hans': {
    src: 'zh-CN',
    name: 'Sipling：喝水提醒',
    subtitle: '饮水记录与每日目标追踪',
    keywords: '补水,水杯,健康,习惯,闹钟,毫升,饮水量,减肥,打卡,统计,喝水助手,水杯提醒,水壶,养生,减脂,计时,体重,皮肤,水提醒,饮水助手,每天喝水',
  },
  'zh-Hant': {
    src: 'zh-TW',
    name: 'Sipling：喝水提醒',
    subtitle: '飲水記錄與每日目標追蹤',
    keywords: '補水,水杯,健康,習慣,鬧鐘,毫升,飲水量,減肥,打卡,統計,喝水助手,水杯提醒,水壺,養生,減脂,計時,體重,皮膚,水提醒,飲水助手,每天喝水',
  },
  id: {
    src: 'id',
    name: 'Sipling: Pengingat Air',
    subtitle: 'Pelacak minum harian',
    keywords: 'hidrasi,gelas,liter,botol,kesehatan,alarm,haus,kebiasaan,target,catatan,konsumsi',
  },
  vi: {
    src: 'vi',
    name: 'Sipling: Nhắc uống nước',
    subtitle: 'Theo dõi và ghi chép mỗi ngày',
    keywords: 'hydrat,ly,lít,chai,sức khỏe,báo thức,khát,thói quen,mục tiêu,cốc,bình,lượng,giờ',
  },
  th: {
    src: 'th',
    name: 'Sipling: เตือนดื่มน้ำ',
    subtitle: 'บันทึกการดื่มน้ำรายวัน',
    keywords: 'ไฮเดรชั่น,แก้ว,ลิตร,ขวด,สุขภาพ,นาฬิกาปลุก,เป้าหมาย,นิสัย,แจ้งเตือน,น้ำ,ดื่ม,ขวดน้ำ,ลดน้ำหนัก,จับเวลา',
  },
  hi: {
    src: 'hi-IN',
    name: 'Sipling: पानी रिमाइंडर',
    subtitle: 'रोज़ाना पीने का ट्रैकर',
    keywords: 'हाइड्रेशन,गिलास,लीटर,बोतल,सेहत,अलार्म,प्यास,आदत,लक्ष्य,रिकॉर्ड,सूचना,वजन,टाइमर,हेल्थ,जल,पीना',
  },
  'ar-SA': {
    src: 'ar',
    name: 'Sipling: تذكير الماء',
    subtitle: 'متتبع شرب الماء اليومي',
    keywords: 'ترطيب,كوب,لتر,زجاجة,صحة,منبه,عطش,عادة,هدف,سجل,تنبيه,شرب,يومي,ماء,رجيم,وزن,رياضة,مؤقت,كمية,تطبيق ماء',
  },
};
