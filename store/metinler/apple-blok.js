/**
 * Her mağaza dilinin açıklamasının SONUNA eklenen abonelik + Kullanım Koşulları (EULA) bloğu,
 * ve o dilin sürüm notu (What's New).
 *
 * 🚨 EULA bloğu ŞART: Apple 1.0.3'ü tam olarak bu eksikten reddetti (guideline 3.1.2 —
 *    "otomatik yenilenen abonelik sunuyorsun ama metadata'da Kullanım Koşulları linki yok").
 *    Özel EULA tanımlı olmadığı için Apple'ın STANDART EULA linki kullanılır.
 * Fiyat ASC'den doğrulandı: subscriptionPricePoints → customerPrice 0.99 USD (proceeds 0.84).
 */
const EULA = 'https://www.apple.com/legal/internet-services/itunes/dev/stdeula/';
const PRIV = 'https://sipling-app.web.app/gizlilik';

const B = (baslik, satirlar, kosul, gizli) =>
  `\n\n${baslik}\n${satirlar.join('\n')}\n\n${kosul}: ${EULA}\n${gizli}: ${PRIV}`;

module.exports = {
  'en-US': {
    blok: B('SIPLING PRO SUBSCRIPTION', [
      'Sipling Pro is an auto-renewable subscription.',
      '- Length: 1 month, renewed monthly',
      '- Price: 0.99 USD per month (prices in other regions may vary)',
      '- Payment is charged to your Apple Account at confirmation of purchase. The subscription renews automatically unless it is turned off at least 24 hours before the end of the current period. You can manage or cancel it at any time in your Apple Account settings.',
    ], 'Terms of Use (EULA)', 'Privacy Policy'),
    yeni: "New in this version:\n- Hot-day reminders (iPhone): on hot days, a gentle nudge to drink a little more. Turn it on and set your city in Settings.\n- The set-up screen now lets you fine-tune your daily water goal with + / - buttons.\n- Reminder and stability improvements.",
  },
  tr: {
    blok: B('SIPLING PRO ABONELİĞİ', [
      'Sipling Pro, otomatik yenilenen bir aboneliktir.',
      '- Süre: 1 ay, her ay yenilenir',
      '- Fiyat: ayda 0,99 USD (diğer ülkelerde fiyat değişebilir)',
      '- Ücret, satın alma onaylandığında Apple Hesabınızdan tahsil edilir. Dönem bitmeden en az 24 saat önce kapatılmazsa abonelik kendiliğinden yenilenir. Apple Hesabı ayarlarınızdan dilediğiniz an yönetebilir veya iptal edebilirsiniz.',
    ], 'Kullanım Koşulları (EULA)', 'Gizlilik Politikası'),
    yeni: 'Bu sürümde yeni:\n- Sıcak gün hatırlatması (iPhone): sıcak günlerde biraz daha su içmen için nazik bir uyarı. Ayarlar\'dan açıp şehrini seç.\n- Kurulum ekranında günlük su hedefini + / - düğmeleriyle ince ayar yapabiliyorsun.\n- Hatırlatma ve kararlılık iyileştirmeleri.',
  },
  'de-DE': {
    blok: B('SIPLING PRO ABO', [
      'Sipling Pro ist ein automatisch verlängerbares Abo.',
      '- Laufzeit: 1 Monat, monatliche Verlängerung',
      '- Preis: 0,99 USD pro Monat (Preise können je nach Region abweichen)',
      '- Die Zahlung wird bei Kaufbestätigung über deinen Apple-Account abgebucht. Das Abo verlängert sich automatisch, sofern es nicht mindestens 24 Stunden vor Ende des Zeitraums deaktiviert wird. Du kannst es jederzeit in den Einstellungen deines Apple-Accounts verwalten oder kündigen.',
    ], 'Nutzungsbedingungen (EULA)', 'Datenschutzrichtlinie'),
    yeni: 'Neu in dieser Version:\n- Erinnerung an heißen Tagen (iPhone): an heißen Tagen ein sanfter Hinweis, etwas mehr zu trinken. In den Einstellungen aktivieren und Stadt wählen.\n- Im Einrichtungsbildschirm lässt sich das Tagesziel jetzt mit + / - fein einstellen.\n- Verbesserungen bei Erinnerungen und Stabilität.',
  },
  'es-ES': {
    blok: B('SUSCRIPCIÓN SIPLING PRO', [
      'Sipling Pro es una suscripción de renovación automática.',
      '- Duración: 1 mes, se renueva cada mes',
      '- Precio: 0,99 USD al mes (los precios pueden variar según la región)',
      '- El pago se cargará a tu cuenta de Apple al confirmar la compra. La suscripción se renueva automáticamente salvo que se desactive al menos 24 horas antes del final del periodo. Puedes gestionarla o cancelarla cuando quieras en los ajustes de tu cuenta de Apple.',
    ], 'Términos de uso (EULA)', 'Política de privacidad'),
    yeni: 'Novedades de esta versión:\n- Recordatorio en días calurosos (iPhone): un aviso amable para beber un poco más. Actívalo y elige tu ciudad en Ajustes.\n- La pantalla de configuración ahora permite ajustar el objetivo diario con los botones + / -.\n- Mejoras en recordatorios y estabilidad.',
  },
  'fr-FR': {
    blok: B('ABONNEMENT SIPLING PRO', [
      'Sipling Pro est un abonnement à renouvellement automatique.',
      '- Durée : 1 mois, renouvelé chaque mois',
      '- Prix : 0,99 USD par mois (les prix peuvent varier selon la région)',
      "- Le paiement est débité de votre compte Apple à la confirmation de l'achat. L'abonnement se renouvelle automatiquement sauf s'il est désactivé au moins 24 heures avant la fin de la période. Vous pouvez le gérer ou l'annuler à tout moment dans les réglages de votre compte Apple.",
    ], "Conditions d'utilisation (CLUF)", 'Politique de confidentialité'),
    yeni: "Nouveautés de cette version :\n- Rappel les jours de chaleur (iPhone) : un petit signal pour boire un peu plus. À activer dans les Réglages avec votre ville.\n- L'écran de configuration permet d'ajuster l'objectif quotidien avec les boutons + / -.\n- Améliorations des rappels et de la stabilité.",
  },
  it: {
    blok: B('ABBONAMENTO SIPLING PRO', [
      'Sipling Pro è un abbonamento a rinnovo automatico.',
      '- Durata: 1 mese, rinnovato ogni mese',
      '- Prezzo: 0,99 USD al mese (i prezzi possono variare in base alla regione)',
      "- Il pagamento viene addebitato sull'account Apple alla conferma dell'acquisto. L'abbonamento si rinnova automaticamente se non viene disattivato almeno 24 ore prima della fine del periodo. Puoi gestirlo o annullarlo quando vuoi dalle impostazioni dell'account Apple.",
    ], "Termini d'uso (EULA)", 'Informativa sulla privacy'),
    yeni: "Novità di questa versione:\n- Promemoria nei giorni caldi (iPhone): un invito gentile a bere un po' di più. Attivalo e scegli la città nelle Impostazioni.\n- Nella schermata iniziale puoi regolare l'obiettivo giornaliero con i pulsanti + / -.\n- Miglioramenti a promemoria e stabilità.",
  },
  'pt-BR': {
    blok: B('ASSINATURA SIPLING PRO', [
      'O Sipling Pro é uma assinatura de renovação automática.',
      '- Duração: 1 mês, renovada mensalmente',
      '- Preço: 0,99 USD por mês (os preços podem variar por região)',
      '- O pagamento é cobrado da sua Conta Apple ao confirmar a compra. A assinatura é renovada automaticamente, a menos que seja desativada pelo menos 24 horas antes do fim do período. Você pode gerenciá-la ou cancelá-la a qualquer momento nos ajustes da sua Conta Apple.',
    ], 'Termos de Uso (EULA)', 'Política de Privacidade'),
    yeni: 'Novidades desta versão:\n- Lembrete em dias quentes (iPhone): um aviso gentil para beber um pouco mais. Ative e escolha sua cidade nos Ajustes.\n- A tela de configuração agora permite ajustar a meta diária com os botões + / -.\n- Melhorias em lembretes e estabilidade.',
  },
  'nl-NL': {
    blok: B('SIPLING PRO-ABONNEMENT', [
      'Sipling Pro is een automatisch verlengend abonnement.',
      '- Duur: 1 maand, maandelijks verlengd',
      '- Prijs: 0,99 USD per maand (prijzen kunnen per regio verschillen)',
      '- De betaling wordt bij bevestiging van de aankoop van je Apple-account afgeschreven. Het abonnement wordt automatisch verlengd tenzij het minstens 24 uur voor het einde van de periode wordt uitgezet. Je kunt het op elk moment beheren of opzeggen in de instellingen van je Apple-account.',
    ], 'Gebruiksvoorwaarden (EULA)', 'Privacybeleid'),
    yeni: 'Nieuw in deze versie:\n- Herinnering op warme dagen (iPhone): op warme dagen een vriendelijk seintje om wat meer te drinken. Zet het aan en kies je stad in Instellingen.\n- In het instelscherm kun je je dagdoel nu bijstellen met + / -.\n- Verbeteringen aan herinneringen en stabiliteit.',
  },
  pl: {
    blok: B('SUBSKRYPCJA SIPLING PRO', [
      'Sipling Pro to subskrypcja odnawiana automatycznie.',
      '- Czas trwania: 1 miesiąc, odnawiana co miesiąc',
      '- Cena: 0,99 USD miesięcznie (ceny mogą się różnić w zależności od regionu)',
      '- Płatność zostanie pobrana z konta Apple po potwierdzeniu zakupu. Subskrypcja odnawia się automatycznie, o ile nie zostanie wyłączona co najmniej 24 godziny przed końcem okresu. Możesz nią zarządzać lub anulować w dowolnym momencie w ustawieniach konta Apple.',
    ], 'Warunki korzystania (EULA)', 'Polityka prywatności'),
    yeni: 'Nowości w tej wersji:\n- Przypomnienie w upalne dni (iPhone): delikatny sygnał, by wypić trochę więcej. Włącz je i wybierz miasto w Ustawieniach.\n- Na ekranie konfiguracji można teraz dostroić dzienny cel przyciskami + / -.\n- Ulepszenia przypomnień i stabilności.',
  },
  ru: {
    blok: B('ПОДПИСКА SIPLING PRO', [
      'Sipling Pro — подписка с автопродлением.',
      '- Срок: 1 месяц, продлевается ежемесячно',
      '- Цена: 0,99 USD в месяц (цены в других регионах могут отличаться)',
      '- Оплата списывается с вашего аккаунта Apple при подтверждении покупки. Подписка продлевается автоматически, если не отключить её не позднее чем за 24 часа до конца периода. Управлять подпиской или отменить её можно в любой момент в настройках аккаунта Apple.',
    ], 'Условия использования (EULA)', 'Политика конфиденциальности'),
    yeni: 'Что нового в этой версии:\n- Напоминание в жаркие дни (iPhone): мягкий сигнал выпить чуть больше воды. Включите и укажите город в настройках.\n- На экране настройки дневную цель теперь можно подстроить кнопками + / -.\n- Улучшения напоминаний и стабильности.',
  },
  uk: {
    blok: B('ПІДПИСКА SIPLING PRO', [
      'Sipling Pro — підписка з автоматичним продовженням.',
      '- Термін: 1 місяць, продовжується щомісяця',
      '- Ціна: 0,99 USD на місяць (ціни в інших регіонах можуть відрізнятися)',
      '- Оплата списується з вашого облікового запису Apple під час підтвердження покупки. Підписка продовжується автоматично, якщо її не вимкнути щонайменше за 24 години до кінця періоду. Керувати нею або скасувати можна будь-коли в налаштуваннях облікового запису Apple.',
    ], 'Умови використання (EULA)', 'Політика конфіденційності'),
    yeni: 'Нове в цій версії:\n- Нагадування в спекотні дні (iPhone): делікатний сигнал випити трохи більше. Увімкніть і виберіть місто в налаштуваннях.\n- На екрані налаштування денну ціль тепер можна підлаштувати кнопками + / -.\n- Покращення нагадувань і стабільності.',
  },
  ja: {
    blok: B('SIPLING PRO サブスクリプション', [
      'Sipling Pro は自動更新サブスクリプションです。',
      '- 期間: 1か月ごとの自動更新',
      '- 価格: 月額 0.99 USD（地域により価格が異なる場合があります）',
      '- 購入確定時に Apple アカウントへ請求されます。期間終了の 24 時間以上前に解約しない限り自動更新されます。Apple アカウントの設定からいつでも管理・解約できます。',
    ], '利用規約 (EULA)', 'プライバシーポリシー'),
    yeni: 'このバージョンの新機能:\n- 暑い日のリマインダー（iPhone）: 暑い日は少し多めに飲むようそっとお知らせ。設定でオンにして都市を選んでください。\n- 設定画面で 1 日の目標を + / - ボタンで微調整できるようになりました。\n- リマインダーと安定性の改善。',
  },
  ko: {
    blok: B('SIPLING PRO 구독', [
      'Sipling Pro는 자동 갱신 구독입니다.',
      '- 기간: 1개월, 매월 자동 갱신',
      '- 가격: 월 0.99 USD (지역에 따라 가격이 다를 수 있습니다)',
      '- 구매 확정 시 Apple 계정으로 결제됩니다. 현재 기간이 끝나기 최소 24시간 전에 해지하지 않으면 자동으로 갱신됩니다. Apple 계정 설정에서 언제든지 관리하거나 해지할 수 있습니다.',
    ], '이용 약관 (EULA)', '개인정보 처리방침'),
    yeni: '이번 버전의 새로운 기능:\n- 더운 날 알림(iPhone): 더운 날에는 조금 더 마시라고 부드럽게 알려줍니다. 설정에서 켜고 도시를 선택하세요.\n- 설정 화면에서 하루 목표를 + / - 버튼으로 세밀하게 조정할 수 있습니다.\n- 알림 및 안정성 개선.',
  },
  'zh-Hans': {
    blok: B('SIPLING PRO 订阅', [
      'Sipling Pro 是自动续期订阅。',
      '- 时长：1 个月，按月续期',
      '- 价格：每月 0.99 美元（其他地区价格可能不同）',
      '- 确认购买时将从你的 Apple 账户扣款。除非在当前周期结束前至少 24 小时关闭，否则订阅会自动续期。你可以随时在 Apple 账户设置中管理或取消。',
    ], '使用条款 (EULA)', '隐私政策'),
    yeni: '本版本新增：\n- 高温日提醒（iPhone）：天热时温和提示你多喝一点。在设置中开启并选择城市。\n- 设置页现在可以用 + / - 按钮微调每日目标。\n- 提醒与稳定性改进。',
  },
  'zh-Hant': {
    blok: B('SIPLING PRO 訂閱', [
      'Sipling Pro 是自動續訂的訂閱。',
      '- 期間：1 個月，每月續訂',
      '- 價格：每月 0.99 美元（其他地區價格可能不同）',
      '- 確認購買時將從你的 Apple 帳戶扣款。除非在目前週期結束前至少 24 小時關閉，否則訂閱會自動續訂。你可以隨時在 Apple 帳戶設定中管理或取消。',
    ], '使用條款 (EULA)', '隱私權政策'),
    yeni: '本版本新增：\n- 高溫日提醒（iPhone）：天熱時溫和提醒你多喝一點。在設定中開啟並選擇城市。\n- 設定頁現在可用 + / - 按鈕微調每日目標。\n- 提醒與穩定性改進。',
  },
  id: {
    blok: B('LANGGANAN SIPLING PRO', [
      'Sipling Pro adalah langganan yang diperpanjang otomatis.',
      '- Durasi: 1 bulan, diperpanjang setiap bulan',
      '- Harga: 0,99 USD per bulan (harga dapat berbeda di tiap wilayah)',
      '- Pembayaran ditagihkan ke Akun Apple Anda saat pembelian dikonfirmasi. Langganan diperpanjang otomatis kecuali dimatikan setidaknya 24 jam sebelum periode berakhir. Anda dapat mengelola atau membatalkannya kapan saja di pengaturan Akun Apple.',
    ], 'Ketentuan Penggunaan (EULA)', 'Kebijakan Privasi'),
    yeni: 'Baru di versi ini:\n- Pengingat hari panas (iPhone): saat cuaca panas, ajakan lembut untuk minum sedikit lebih banyak. Aktifkan dan pilih kotamu di Pengaturan.\n- Layar penyiapan kini bisa menyetel target harian dengan tombol + / -.\n- Peningkatan pengingat dan kestabilan.',
  },
  vi: {
    blok: B('GÓI ĐĂNG KÝ SIPLING PRO', [
      'Sipling Pro là gói đăng ký tự động gia hạn.',
      '- Thời hạn: 1 tháng, gia hạn hằng tháng',
      '- Giá: 0,99 USD mỗi tháng (giá có thể khác nhau theo khu vực)',
      '- Khoản thanh toán sẽ được tính vào Tài khoản Apple của bạn khi xác nhận mua. Gói tự động gia hạn trừ khi bạn tắt ít nhất 24 giờ trước khi kỳ hiện tại kết thúc. Bạn có thể quản lý hoặc hủy bất cứ lúc nào trong cài đặt Tài khoản Apple.',
    ], 'Điều khoản sử dụng (EULA)', 'Chính sách quyền riêng tư'),
    yeni: 'Mới trong phiên bản này:\n- Nhắc nhở ngày nóng (iPhone): vào những ngày nóng, một lời nhắc nhẹ nhàng để uống nhiều hơn một chút. Bật và chọn thành phố trong Cài đặt.\n- Màn hình thiết lập giờ cho phép tinh chỉnh mục tiêu hằng ngày bằng nút + / -.\n- Cải thiện nhắc nhở và độ ổn định.',
  },
  th: {
    blok: B('การสมัคร SIPLING PRO', [
      'Sipling Pro เป็นการสมัครสมาชิกแบบต่ออายุอัตโนมัติ',
      '- ระยะเวลา: 1 เดือน ต่ออายุทุกเดือน',
      '- ราคา: 0.99 USD ต่อเดือน (ราคาอาจต่างกันในแต่ละภูมิภาค)',
      '- ระบบจะเรียกเก็บเงินจากบัญชี Apple ของคุณเมื่อยืนยันการซื้อ การสมัครจะต่ออายุอัตโนมัติ เว้นแต่จะปิดอย่างน้อย 24 ชั่วโมงก่อนสิ้นสุดรอบปัจจุบัน คุณจัดการหรือยกเลิกได้ทุกเมื่อในการตั้งค่าบัญชี Apple',
    ], 'ข้อกำหนดการใช้งาน (EULA)', 'นโยบายความเป็นส่วนตัว'),
    yeni: 'ใหม่ในเวอร์ชันนี้:\n- การเตือนวันอากาศร้อน (iPhone): วันที่อากาศร้อนจะเตือนเบา ๆ ให้ดื่มเพิ่มอีกนิด เปิดใช้และเลือกเมืองของคุณในการตั้งค่า\n- หน้าจอตั้งค่าปรับเป้าหมายรายวันได้ด้วยปุ่ม + / - แล้ว\n- ปรับปรุงการเตือนและความเสถียร',
  },
  hi: {
    blok: B('SIPLING PRO सदस्यता', [
      'Sipling Pro एक स्वतः नवीनीकृत होने वाली सदस्यता है।',
      '- अवधि: 1 महीना, हर महीने नवीनीकरण',
      '- कीमत: 0.99 USD प्रति माह (अन्य क्षेत्रों में कीमत अलग हो सकती है)',
      '- खरीद की पुष्टि पर आपके Apple खाते से भुगतान लिया जाएगा। मौजूदा अवधि समाप्त होने से कम से कम 24 घंटे पहले बंद न करने पर सदस्यता अपने आप नवीनीकृत हो जाती है। आप इसे कभी भी अपने Apple खाते की सेटिंग में प्रबंधित या रद्द कर सकते हैं।',
    ], 'उपयोग की शर्तें (EULA)', 'गोपनीयता नीति'),
    yeni: 'इस संस्करण में नया:\n- गर्म दिन की याद (iPhone): गर्म दिनों में थोड़ा ज़्यादा पीने की हल्की याद। सेटिंग में चालू करें और अपना शहर चुनें।\n- सेटअप स्क्रीन पर अब + / - बटन से रोज़ का लक्ष्य ठीक कर सकते हैं।\n- रिमाइंडर और स्थिरता में सुधार।',
  },
  'ar-SA': {
    blok: B('اشتراك SIPLING PRO', [
      'Sipling Pro اشتراك يتجدد تلقائيًا.',
      '- المدة: شهر واحد، يتجدد شهريًا',
      '- السعر: 0.99 دولار أمريكي شهريًا (قد تختلف الأسعار حسب المنطقة)',
      '- يُخصم المبلغ من حساب Apple عند تأكيد الشراء. يتجدد الاشتراك تلقائيًا ما لم يتم إيقافه قبل 24 ساعة على الأقل من نهاية الفترة الحالية. يمكنك إدارته أو إلغاؤه في أي وقت من إعدادات حساب Apple.',
    ], 'شروط الاستخدام (EULA)', 'سياسة الخصوصية'),
    yeni: 'الجديد في هذا الإصدار:\n- تذكير الأيام الحارة (iPhone): في الأيام الحارة تنبيه لطيف لشرب المزيد قليلًا. فعّله واختر مدينتك من الإعدادات.\n- شاشة الإعداد تتيح الآن ضبط الهدف اليومي بأزرار + / -.\n- تحسينات في التذكيرات والاستقرار.',
  },
};
