/**
 * Google Play TAM AÇIKLAMA'ya eklenen blok — 20 dil.
 *
 * NEDEN (Apple'dan farkı): Apple açıklamayı aramada İNDEKSLEMEZ, Google İNDEKSLER.
 * Play açıklamalarımız 4000 karakterin ancak yarısını kullanıyordu (850–2565) →
 * her dilde 1400–3150 karakter boşa gidiyordu. Bu blok o yeri, insanların gerçekten
 * aradığı ifadelerle (su takibi, su hatırlatıcı, günde ne kadar su içmeliyim, kahve
 * su sayılır mı…) DOĞAL bir özellik listesi + mini SSS olarak dolduruyor.
 *
 * 🚨 Buradaki her iddia KODDAN doğrulandı (2026-07-27):
 *   8 ağaç türü (`data/tree_species.dart` → oak,pine,cherry,acacia,maple,olive,golden,jacaranda)
 *   10 başarı (`data/achievements.dart`) · istatistik 7 ve 30 gün (`stats_screen.dart:162`)
 *   hedef EFSA referans değerlerine göre · hesapsız/sunucusuz çalışır.
 * Play emoji KABUL EDER (Apple etmez) — bu blokta yine de emoji yok, sade tutuldu.
 */
module.exports = {
  'en-US': `

WHAT'S INSIDE
- Water tracking with a drink log you can edit any time
- A water reminder you control: set your waking hours and how often it nudges you
- Tap the reminder to add a glass without opening the app
- A daily water goal worked out from your weight, sex, age and activity level
- Tea, coffee, milk, juice and soda counted by the water they really contain
- Home screen widget: add a glass and watch your tree grow right there
- 7-day and 30-day statistics with a breakdown of what you drank
- 8 tree species and 10 achievements to unlock
- Works offline. No account, no sign-up, no server.
- 20 languages

COMMON QUESTIONS
How much water should I drink a day?
Sipling works out a daily water goal from your weight, sex, age and activity level, based on the European Food Safety Authority's reference values for water from drinks. You can adjust it whenever you like.

How do I set a drink water reminder?
Open Settings, choose your waking hours and the reminder interval. Sipling goes quiet once you reach your goal for the day.

Do coffee and tea count as water?
Yes, but not one to one. Every drink has its own hydration factor, so 250 ml of coffee adds less than 250 ml of water. Alcohol counts against your goal, honestly.

Does it need internet or an account?
No. There is no sign-up and no server. Your water log stays on your device and you can erase all of it in a single tap.`,

  'tr-TR': `

NELER VAR
- Su takibi ve istediğin an düzenleyebildiğin içme geçmişi
- Kontrolü sende olan su hatırlatıcı: uyanık saatlerini ve aralığı sen seçersin
- Bildirime dokun, uygulamayı açmadan bardağı ekle
- Kilo, cinsiyet, yaş ve hareket düzeyine göre hesaplanan günlük su hedefi
- Çay, kahve, süt, meyve suyu ve gazlı içecekler gerçekte içerdikleri suya göre sayılır
- Ana ekran widget'ı: bardağı oradan ekle, ağacın orada büyüsün
- 7 ve 30 günlük istatistik, ne içtiğinin dökümüyle
- Açılacak 8 ağaç türü ve 10 başarı
- İnternetsiz çalışır. Hesap yok, kayıt yok, sunucu yok.
- 20 dil

SIK SORULANLAR
Günde ne kadar su içmeliyim?
Sipling günlük su hedefini kilonuza, cinsiyetinize, yaşınıza ve hareket düzeyinize göre hesaplar; temeli Avrupa Gıda Güvenliği Otoritesi'nin (EFSA) içeceklerden alınan su için verdiği referans değerlerdir. İstediğiniz an kendiniz de değiştirebilirsiniz.

Su içme hatırlatıcısını nasıl ayarlarım?
Ayarlar'ı açın, uyanık saatlerinizi ve hatırlatma aralığını seçin. Günlük hedefinize ulaştığınızda Sipling susar.

Kahve ve çay su sayılır mı?
Sayılır ama birebir değil. Her içeceğin kendi hidrasyon katsayısı vardır; 250 ml kahve, 250 ml sudan daha az su ekler. Alkol ise dürüstçe hedefinizden düşer.

İnternet veya hesap gerekiyor mu?
Hayır. Kayıt yok, sunucu yok. Su geçmişiniz cihazınızda kalır ve tek dokunuşla tamamen silebilirsiniz.`,

  'de-DE': `

WAS DRIN IST
- Wasser tracken mit einem Trinkprotokoll, das du jederzeit bearbeiten kannst
- Eine Trinkerinnerung, die du steuerst: Wachzeiten und Intervall bestimmst du
- Auf die Erinnerung tippen und ein Glas eintragen, ohne die App zu öffnen
- Tagesziel, berechnet aus Gewicht, Geschlecht, Alter und Aktivität
- Tee, Kaffee, Milch, Saft und Limo zählen mit ihrem echten Wasseranteil
- Homescreen-Widget: Glas eintragen und den Baum dort wachsen sehen
- Statistiken über 7 und 30 Tage samt Aufschlüsselung der Getränke
- 8 Baumarten und 10 Erfolge zum Freischalten
- Funktioniert offline. Kein Konto, keine Anmeldung, kein Server.
- 20 Sprachen

HÄUFIGE FRAGEN
Wie viel Wasser sollte ich am Tag trinken?
Sipling berechnet dein Tagesziel aus Gewicht, Geschlecht, Alter und Aktivität, auf Basis der Referenzwerte der Europäischen Behörde für Lebensmittelsicherheit (EFSA) für Wasser aus Getränken. Du kannst es jederzeit anpassen.

Wie stelle ich die Trinkerinnerung ein?
Öffne die Einstellungen und wähle deine Wachzeiten und das Intervall. Sobald du dein Tagesziel erreichst, wird Sipling still.

Zählen Kaffee und Tee als Wasser?
Ja, aber nicht eins zu eins. Jedes Getränk hat seinen eigenen Hydrationsfaktor, 250 ml Kaffee bringen also weniger als 250 ml Wasser. Alkohol wird ehrlich abgezogen.

Braucht die App Internet oder ein Konto?
Nein. Keine Anmeldung, kein Server. Dein Trinkprotokoll bleibt auf dem Gerät und lässt sich mit einem Tippen komplett löschen.`,

  'es-ES': `

QUÉ INCLUYE
- Registro de agua que puedes editar cuando quieras
- Un recordatorio para beber agua que controlas tú: eliges tus horas y el intervalo
- Toca la notificación y añade un vaso sin abrir la app
- Objetivo diario calculado según tu peso, sexo, edad y nivel de actividad
- Té, café, leche, zumo y refrescos cuentan por el agua que realmente aportan
- Widget en la pantalla de inicio: añade un vaso y ve crecer tu árbol ahí mismo
- Estadísticas de 7 y 30 días con el desglose de lo que bebiste
- 8 especies de árboles y 10 logros por desbloquear
- Funciona sin conexión. Sin cuenta, sin registro, sin servidor.
- 20 idiomas

PREGUNTAS FRECUENTES
¿Cuánta agua debo beber al día?
Sipling calcula tu objetivo diario a partir de tu peso, sexo, edad y nivel de actividad, según los valores de referencia de la Autoridad Europea de Seguridad Alimentaria (EFSA) para el agua procedente de bebidas. Puedes ajustarlo cuando quieras.

¿Cómo configuro el recordatorio para beber agua?
Abre Ajustes y elige tus horas de vigilia y el intervalo. Cuando alcanzas tu objetivo del día, Sipling se calla.

¿El café y el té cuentan como agua?
Sí, pero no uno a uno. Cada bebida tiene su factor de hidratación, así que 250 ml de café aportan menos que 250 ml de agua. El alcohol resta de tu objetivo.

¿Necesita internet o una cuenta?
No. Sin registro y sin servidor. Tu historial se queda en el dispositivo y puedes borrarlo entero con un toque.`,

  'fr-FR': `

CE QU'IL Y A DEDANS
- Un journal de l'eau modifiable à tout moment
- Un rappel pour boire que tu contrôles : tes heures d'éveil et l'intervalle
- Touche la notification pour ajouter un verre sans ouvrir l'application
- Un objectif quotidien calculé selon ton poids, ton sexe, ton âge et ton activité
- Thé, café, lait, jus et sodas comptés selon l'eau qu'ils apportent vraiment
- Widget sur l'écran d'accueil : ajoute un verre et vois ton arbre pousser
- Statistiques sur 7 et 30 jours avec le détail de ce que tu as bu
- 8 espèces d'arbres et 10 succès à débloquer
- Fonctionne hors ligne. Pas de compte, pas d'inscription, pas de serveur.
- 20 langues

QUESTIONS FRÉQUENTES
Combien d'eau faut-il boire par jour ?
Sipling calcule ton objectif quotidien selon ton poids, ton sexe, ton âge et ton activité, d'après les valeurs de référence de l'EFSA (Autorité européenne de sécurité des aliments) pour l'eau apportée par les boissons. Ajustable à tout moment.

Comment régler le rappel pour boire de l'eau ?
Ouvre les réglages, choisis tes heures d'éveil et l'intervalle. Une fois ton objectif atteint, Sipling se tait.

Le café et le thé comptent-ils comme de l'eau ?
Oui, mais pas un pour un. Chaque boisson a son facteur d'hydratation : 250 ml de café apportent moins que 250 ml d'eau. L'alcool est retiré de ton objectif.

Faut-il internet ou un compte ?
Non. Aucune inscription, aucun serveur. Ton journal reste sur ton téléphone et s'efface entièrement d'un seul geste.`,

  'it-IT': `

COSA C'È DENTRO
- Monitoraggio dell'acqua con un diario modificabile in qualsiasi momento
- Un promemoria per bere che decidi tu: ore di veglia e intervallo
- Tocca la notifica e aggiungi un bicchiere senza aprire l'app
- Obiettivo giornaliero calcolato su peso, sesso, età e livello di attività
- Tè, caffè, latte, succhi e bibite contano per l'acqua che apportano davvero
- Widget in schermata Home: aggiungi un bicchiere e guarda crescere l'albero
- Statistiche a 7 e 30 giorni con il dettaglio di cosa hai bevuto
- 8 specie di alberi e 10 obiettivi da sbloccare
- Funziona offline. Nessun account, nessuna registrazione, nessun server.
- 20 lingue

DOMANDE FREQUENTI
Quanta acqua bisogna bere al giorno?
Sipling calcola l'obiettivo giornaliero da peso, sesso, età e attività, sulla base dei valori di riferimento dell'Autorità europea per la sicurezza alimentare (EFSA) per l'acqua assunta dalle bevande. Puoi modificarlo quando vuoi.

Come imposto il promemoria per bere acqua?
Apri le Impostazioni e scegli le ore di veglia e l'intervallo. Raggiunto l'obiettivo, Sipling tace.

Caffè e tè contano come acqua?
Sì, ma non uno a uno. Ogni bevanda ha il suo fattore di idratazione: 250 ml di caffè apportano meno di 250 ml d'acqua. L'alcol viene sottratto dall'obiettivo.

Servono internet o un account?
No. Nessuna registrazione e nessun server. Il diario resta sul dispositivo e puoi cancellarlo tutto con un tocco.`,

  'pt-BR': `

O QUE TEM DENTRO
- Controle de água com um histórico que você edita quando quiser
- Um lembrete para beber água no seu ritmo: você define horários e intervalo
- Toque na notificação e registre um copo sem abrir o app
- Meta diária calculada pelo seu peso, sexo, idade e nível de atividade
- Chá, café, leite, suco e refrigerante contam pela água que realmente têm
- Widget na tela inicial: registre um copo e veja sua árvore crescer ali
- Estatísticas de 7 e 30 dias com o detalhamento do que você bebeu
- 8 espécies de árvores e 10 conquistas para desbloquear
- Funciona sem internet. Sem conta, sem cadastro, sem servidor.
- 20 idiomas

PERGUNTAS FREQUENTES
Quanta água devo beber por dia?
O Sipling calcula sua meta diária a partir do peso, sexo, idade e nível de atividade, com base nos valores de referência da Autoridade Europeia para a Segurança dos Alimentos (EFSA) para a água vinda de bebidas. Você pode ajustar quando quiser.

Como configuro o lembrete para beber água?
Abra os Ajustes e escolha seus horários e o intervalo. Ao bater a meta do dia, o Sipling silencia.

Café e chá contam como água?
Contam, mas não um para um. Cada bebida tem seu fator de hidratação, então 250 ml de café somam menos que 250 ml de água. O álcool é descontado da meta.

Precisa de internet ou conta?
Não. Sem cadastro e sem servidor. Seu histórico fica no aparelho e pode ser apagado por completo com um toque.`,

  'nl-NL': `

WAT ERIN ZIT
- Water bijhouden met een drinkdagboek dat je altijd kunt aanpassen
- Een waterherinnering die jij bepaalt: wakkere uren en interval
- Tik op de melding en voeg een glas toe zonder de app te openen
- Dagdoel berekend op basis van gewicht, geslacht, leeftijd en activiteit
- Thee, koffie, melk, sap en frisdrank tellen mee met hun echte wateraandeel
- Widget op het startscherm: voeg een glas toe en zie je boom daar groeien
- Statistieken over 7 en 30 dagen met een overzicht van wat je dronk
- 8 boomsoorten en 10 prestaties om vrij te spelen
- Werkt offline. Geen account, geen registratie, geen server.
- 20 talen

VEELGESTELDE VRAGEN
Hoeveel water moet ik per dag drinken?
Sipling berekent je dagdoel uit gewicht, geslacht, leeftijd en activiteit, op basis van de referentiewaarden van de Europese Autoriteit voor voedselveiligheid (EFSA) voor water uit dranken. Je kunt het altijd zelf aanpassen.

Hoe stel ik de waterherinnering in?
Open Instellingen en kies je wakkere uren en het interval. Zodra je je dagdoel haalt, wordt Sipling stil.

Tellen koffie en thee als water?
Ja, maar niet één op één. Elke drank heeft zijn eigen hydratatiefactor: 250 ml koffie levert minder dan 250 ml water. Alcohol gaat van je doel af.

Is internet of een account nodig?
Nee. Geen registratie en geen server. Je drinkgeschiedenis blijft op je toestel en wis je in één tik volledig.`,

  'pl-PL': `

CO W ŚRODKU
- Śledzenie wody z dziennikiem picia, który zawsze możesz poprawić
- Przypomnienie o piciu, które ustawiasz sam: godziny czuwania i odstęp
- Dotknij powiadomienia i dodaj szklankę bez otwierania aplikacji
- Dzienny cel wyliczony z wagi, płci, wieku i poziomu aktywności
- Herbata, kawa, mleko, sok i napoje liczą się według realnej zawartości wody
- Widżet na ekranie głównym: dodaj szklankę i patrz, jak rośnie drzewo
- Statystyki z 7 i 30 dni wraz z podziałem na napoje
- 8 gatunków drzew i 10 osiągnięć do odblokowania
- Działa offline. Bez konta, bez rejestracji, bez serwera.
- 20 języków

CZĘSTE PYTANIA
Ile wody należy pić dziennie?
Sipling wylicza dzienny cel na podstawie wagi, płci, wieku i aktywności, opierając się na wartościach referencyjnych Europejskiego Urzędu ds. Bezpieczeństwa Żywności (EFSA) dla wody z napojów. Możesz go zmienić w każdej chwili.

Jak ustawić przypomnienie o piciu wody?
Otwórz Ustawienia i wybierz godziny czuwania oraz odstęp. Po osiągnięciu celu Sipling milknie.

Czy kawa i herbata liczą się jako woda?
Tak, ale nie jeden do jednego. Każdy napój ma własny współczynnik nawodnienia, więc 250 ml kawy daje mniej niż 250 ml wody. Alkohol jest odejmowany od celu.

Czy potrzebny jest internet albo konto?
Nie. Bez rejestracji i bez serwera. Historia zostaje na urządzeniu i możesz ją skasować jednym dotknięciem.`,

  'ru-RU': `

ЧТО ВНУТРИ
- Учёт воды и дневник питья, который можно поправить в любой момент
- Напоминание пить воду под вашим контролем: часы бодрствования и интервал
- Нажмите на уведомление и добавьте стакан, не открывая приложение
- Дневная норма, рассчитанная по весу, полу, возрасту и уровню активности
- Чай, кофе, молоко, сок и газировка считаются по реальной доле воды
- Виджет на главном экране: добавьте стакан и смотрите, как растёт дерево
- Статистика за 7 и 30 дней с разбивкой по напиткам
- 8 видов деревьев и 10 достижений
- Работает без интернета. Без аккаунта, без регистрации, без сервера.
- 20 языков

ЧАСТЫЕ ВОПРОСЫ
Сколько воды нужно пить в день?
Sipling рассчитывает дневную норму по весу, полу, возрасту и уровню активности, опираясь на референсные значения Европейского агентства по безопасности продуктов питания (EFSA) для воды из напитков. Норму можно изменить вручную.

Как настроить напоминание пить воду?
Откройте настройки и выберите часы бодрствования и интервал. Как только норма выполнена, Sipling замолкает.

Считаются ли кофе и чай за воду?
Да, но не один к одному. У каждого напитка свой коэффициент гидратации: 250 мл кофе дают меньше, чем 250 мл воды. Алкоголь честно вычитается из нормы.

Нужен ли интернет или аккаунт?
Нет. Ни регистрации, ни сервера. История остаётся на устройстве, и её можно стереть одним нажатием.`,

  uk: `

ЩО ВСЕРЕДИНІ
- Облік води та щоденник пиття, який можна змінити будь-коли
- Нагадування пити воду під вашим контролем: години активності та інтервал
- Торкніться сповіщення й додайте склянку, не відкриваючи застосунок
- Денна норма, розрахована за вагою, статтю, віком і рівнем активності
- Чай, кава, молоко, сік і газованка рахуються за реальною часткою води
- Віджет на головному екрані: додайте склянку й дивіться, як росте дерево
- Статистика за 7 і 30 днів із розподілом за напоями
- 8 видів дерев і 10 досягнень
- Працює без інтернету. Без облікового запису, без реєстрації, без сервера.
- 20 мов

ЧАСТІ ЗАПИТАННЯ
Скільки води треба пити на день?
Sipling розраховує денну норму за вагою, статтю, віком і рівнем активності, спираючись на референсні значення Європейського агентства з безпечності харчових продуктів (EFSA) для води з напоїв. Норму можна змінити вручну.

Як налаштувати нагадування пити воду?
Відкрийте налаштування та виберіть години активності й інтервал. Щойно норму виконано, Sipling замовкає.

Чи рахуються кава і чай як вода?
Так, але не один до одного. Кожен напій має свій коефіцієнт гідратації: 250 мл кави дають менше, ніж 250 мл води. Алкоголь чесно віднімається від норми.

Чи потрібні інтернет або обліковий запис?
Ні. Ні реєстрації, ні сервера. Історія лишається на пристрої, і її можна стерти одним дотиком.`,

  'ja-JP': `

主な機能
- 飲水記録は後からいつでも編集できます
- 通知は自分で設定: 起きている時間帯と間隔を選べます
- 通知をタップすれば、アプリを開かずに一杯追加できます
- 体重・性別・年齢・活動量から1日の水分目標を算出
- お茶、コーヒー、牛乳、ジュース、炭酸は実際の水分量で計算
- ホーム画面ウィジェット: その場で一杯追加し、木の成長を確認
- 7日間と30日間の統計、飲んだ内容の内訳つき
- 8種類の木と10種類の実績
- オフラインで動作。アカウント登録なし、サーバーなし。
- 20言語対応

よくある質問
1日にどれくらい水を飲むべき?
Sipling は体重・性別・年齢・活動量から1日の目標を算出します。欧州食品安全機関 (EFSA) の飲料由来の水分に関する参照値が基準です。手動で変更もできます。

水分補給リマインダーの設定方法は?
設定を開き、起きている時間帯と通知の間隔を選んでください。目標を達成すると通知は止まります。

コーヒーやお茶も水に数えますか?
数えますが、同じではありません。飲み物ごとに水分係数があり、コーヒー250 mlは水250 mlより少なくカウントされます。アルコールは目標から差し引かれます。

インターネットやアカウントは必要ですか?
不要です。登録もサーバーもありません。記録は端末内に残り、ワンタップで全消去できます。`,

  'ko-KR': `

주요 기능
- 마신 물 기록은 언제든지 수정할 수 있어요
- 알림은 내 마음대로: 활동 시간대와 간격을 직접 정합니다
- 알림을 누르면 앱을 열지 않고도 한 잔을 추가할 수 있어요
- 체중, 성별, 나이, 활동량으로 계산한 하루 물 목표
- 차, 커피, 우유, 주스, 탄산음료는 실제 수분량으로 계산
- 홈 화면 위젯: 바로 한 잔 추가하고 나무가 자라는 걸 확인
- 7일과 30일 통계, 무엇을 마셨는지 분석까지
- 나무 8종과 업적 10가지
- 오프라인 동작. 계정 없음, 가입 없음, 서버 없음.
- 20개 언어

자주 묻는 질문
하루에 물을 얼마나 마셔야 하나요?
Sipling은 체중, 성별, 나이, 활동량으로 하루 목표를 계산합니다. 유럽식품안전청(EFSA)의 음료 수분 참고값을 기준으로 하며, 직접 조정할 수도 있어요.

물 마시기 알림은 어떻게 설정하나요?
설정에서 활동 시간대와 알림 간격을 고르세요. 하루 목표를 채우면 알림이 멈춥니다.

커피와 차도 물에 포함되나요?
포함되지만 1대1은 아닙니다. 음료마다 수분 계수가 달라서 커피 250 ml는 물 250 ml보다 적게 반영돼요. 술은 목표에서 차감됩니다.

인터넷이나 계정이 필요한가요?
아니요. 가입도 서버도 없습니다. 기록은 기기에만 남고 한 번에 모두 지울 수 있어요.`,

  'zh-CN': `

功能一览
- 饮水记录随时可以修改
- 提醒由你掌控: 自己设定清醒时段和提醒间隔
- 点击通知即可加一杯，无需打开应用
- 根据体重、性别、年龄和活动量计算每日饮水目标
- 茶、咖啡、牛奶、果汁和汽水按真实含水量计入
- 主屏幕小组件: 就地加一杯，看着树长大
- 7 天与 30 天统计，附饮品明细
- 8 种树木和 10 项成就
- 离线可用。无账号、无注册、无服务器。
- 支持 20 种语言

常见问题
每天该喝多少水?
Sipling 依据体重、性别、年龄和活动量计算每日目标，参考欧洲食品安全局 (EFSA) 关于饮料补水的参考值。你也可以随时手动调整。

怎么设置喝水提醒?
打开设置，选择清醒时段和提醒间隔。达成当日目标后，提醒会自动安静下来。

咖啡和茶算水吗?
算，但不是一比一。每种饮品都有自己的补水系数，250 毫升咖啡计入的水量少于 250 毫升水。酒精则从目标中扣减。

需要联网或账号吗?
不需要。没有注册，也没有服务器。记录只留在你的设备上，一键即可全部清除。`,

  'zh-TW': `

功能一覽
- 飲水記錄隨時可以修改
- 提醒由你掌控: 自己設定清醒時段和提醒間隔
- 點一下通知就能加一杯，不必打開應用程式
- 依體重、性別、年齡和活動量計算每日飲水目標
- 茶、咖啡、牛奶、果汁和汽水按真實含水量計入
- 主畫面小工具: 就地加一杯，看著樹長大
- 7 天與 30 天統計，附飲品明細
- 8 種樹木和 10 項成就
- 離線可用。無帳號、無註冊、無伺服器。
- 支援 20 種語言

常見問題
每天該喝多少水?
Sipling 依體重、性別、年齡和活動量計算每日目標，參考歐洲食品安全局 (EFSA) 關於飲料補水的參考值。你也可以隨時手動調整。

要怎麼設定喝水提醒?
打開設定，選擇清醒時段和提醒間隔。達成當日目標後，提醒會自動安靜下來。

咖啡和茶算水嗎?
算，但不是一比一。每種飲品都有自己的補水係數，250 毫升咖啡計入的水量少於 250 毫升水。酒精則從目標中扣除。

需要連網或帳號嗎?
不需要。沒有註冊，也沒有伺服器。記錄只留在你的裝置上，一鍵即可全部清除。`,

  id: `

APA SAJA DI DALAMNYA
- Pelacakan air dengan catatan minum yang bisa diedit kapan saja
- Pengingat minum yang kamu atur: jam bangun dan intervalnya kamu pilih
- Ketuk notifikasi untuk menambah segelas tanpa membuka aplikasi
- Target harian dihitung dari berat, jenis kelamin, usia, dan tingkat aktivitas
- Teh, kopi, susu, jus, dan soda dihitung sesuai kandungan air sebenarnya
- Widget layar utama: tambah segelas dan lihat pohonmu tumbuh di sana
- Statistik 7 dan 30 hari lengkap dengan rincian minumanmu
- 8 spesies pohon dan 10 pencapaian
- Bekerja offline. Tanpa akun, tanpa pendaftaran, tanpa server.
- 20 bahasa

PERTANYAAN UMUM
Berapa banyak air yang harus diminum sehari?
Sipling menghitung target harian dari berat, jenis kelamin, usia, dan tingkat aktivitas, berdasarkan nilai acuan Otoritas Keamanan Pangan Eropa (EFSA) untuk air dari minuman. Kamu bisa mengubahnya kapan saja.

Bagaimana cara mengatur pengingat minum air?
Buka Pengaturan, pilih jam bangunmu dan interval pengingat. Begitu target harian tercapai, Sipling akan diam.

Apakah kopi dan teh dihitung sebagai air?
Dihitung, tapi tidak satu banding satu. Setiap minuman punya faktor hidrasinya sendiri, jadi 250 ml kopi menambah lebih sedikit daripada 250 ml air. Alkohol dikurangi dari targetmu.

Perlu internet atau akun?
Tidak. Tanpa pendaftaran dan tanpa server. Riwayatmu tersimpan di perangkat dan bisa dihapus seluruhnya dengan sekali ketuk.`,

  vi: `

CÓ GÌ BÊN TRONG
- Theo dõi lượng nước với nhật ký uống có thể sửa bất cứ lúc nào
- Lời nhắc uống nước do bạn quyết định: giờ thức và khoảng cách nhắc
- Chạm vào thông báo để thêm một ly mà không cần mở ứng dụng
- Mục tiêu hằng ngày tính theo cân nặng, giới tính, tuổi và mức vận động
- Trà, cà phê, sữa, nước ép và nước ngọt được tính theo lượng nước thật
- Widget màn hình chính: thêm một ly và xem cây lớn lên ngay tại đó
- Thống kê 7 ngày và 30 ngày kèm phân tích thức uống
- 8 loài cây và 10 thành tựu
- Hoạt động ngoại tuyến. Không tài khoản, không đăng ký, không máy chủ.
- 20 ngôn ngữ

CÂU HỎI THƯỜNG GẶP
Mỗi ngày nên uống bao nhiêu nước?
Sipling tính mục tiêu hằng ngày từ cân nặng, giới tính, tuổi và mức vận động, dựa trên giá trị tham chiếu của Cơ quan An toàn Thực phẩm châu Âu (EFSA) về nước từ đồ uống. Bạn có thể tự chỉnh bất cứ lúc nào.

Cài lời nhắc uống nước thế nào?
Mở Cài đặt, chọn giờ thức và khoảng cách nhắc. Khi đạt mục tiêu trong ngày, Sipling sẽ im lặng.

Cà phê và trà có tính là nước không?
Có, nhưng không phải một đổi một. Mỗi đồ uống có hệ số bù nước riêng, nên 250 ml cà phê cộng ít hơn 250 ml nước. Rượu bia bị trừ khỏi mục tiêu.

Có cần internet hay tài khoản không?
Không. Không đăng ký, không máy chủ. Nhật ký nằm trên máy bạn và có thể xóa sạch chỉ với một chạm.`,

  th: `

มีอะไรบ้าง
- บันทึกการดื่มน้ำที่แก้ไขได้ทุกเมื่อ
- การเตือนที่คุณกำหนดเอง: เลือกช่วงเวลาตื่นและระยะห่างการเตือน
- แตะการแจ้งเตือนเพื่อเพิ่มหนึ่งแก้วโดยไม่ต้องเปิดแอป
- เป้าหมายรายวันคำนวณจากน้ำหนัก เพศ อายุ และระดับกิจกรรม
- ชา กาแฟ นม น้ำผลไม้ และน้ำอัดลม นับตามปริมาณน้ำจริง
- วิดเจ็ตหน้าจอหลัก: เพิ่มน้ำหนึ่งแก้วและดูต้นไม้เติบโตตรงนั้น
- สถิติ 7 วันและ 30 วัน พร้อมรายละเอียดเครื่องดื่ม
- ต้นไม้ 8 ชนิดและความสำเร็จ 10 รายการ
- ใช้งานออฟไลน์ ไม่มีบัญชี ไม่ต้องสมัคร ไม่มีเซิร์ฟเวอร์
- 20 ภาษา

คำถามที่พบบ่อย
ควรดื่มน้ำวันละเท่าไร
Sipling คำนวณเป้าหมายรายวันจากน้ำหนัก เพศ อายุ และระดับกิจกรรม โดยอ้างอิงค่าอ้างอิงของหน่วยงานความปลอดภัยด้านอาหารแห่งยุโรป (EFSA) สำหรับน้ำที่ได้จากเครื่องดื่ม คุณปรับเองได้ทุกเมื่อ

ตั้งการเตือนดื่มน้ำอย่างไร
เปิดการตั้งค่า เลือกช่วงเวลาตื่นและระยะห่างการเตือน เมื่อถึงเป้าหมายของวัน Sipling จะเงียบเอง

กาแฟและชานับเป็นน้ำไหม
นับ แต่ไม่เท่ากันหนึ่งต่อหนึ่ง เครื่องดื่มแต่ละชนิดมีค่าการให้น้ำของตัวเอง กาแฟ 250 มล. จึงนับได้น้อยกว่าน้ำ 250 มล. ส่วนแอลกอฮอล์จะถูกหักออกจากเป้าหมาย

ต้องใช้อินเทอร์เน็ตหรือบัญชีไหม
ไม่ต้อง ไม่มีการสมัครและไม่มีเซิร์ฟเวอร์ ประวัติอยู่ในเครื่องของคุณและลบทั้งหมดได้ด้วยการแตะครั้งเดียว`,

  'hi-IN': `

इसमें क्या है
- पानी की ट्रैकिंग और पीने का रिकॉर्ड, जिसे कभी भी बदला जा सकता है
- रिमाइंडर आपके हिसाब से: जागने का समय और अंतराल आप चुनते हैं
- नोटिफिकेशन पर टैप करें और ऐप खोले बिना एक गिलास जोड़ें
- वज़न, लिंग, उम्र और गतिविधि के स्तर से बना रोज़ का लक्ष्य
- चाय, कॉफ़ी, दूध, जूस और सोडा उनमें मौजूद असली पानी के हिसाब से गिने जाते हैं
- होम स्क्रीन विजेट: वहीं से एक गिलास जोड़ें और पेड़ बढ़ते देखें
- 7 और 30 दिन के आँकड़े, आपने क्या पिया उसके ब्योरे के साथ
- 8 पेड़ की प्रजातियाँ और 10 उपलब्धियाँ
- ऑफ़लाइन चलता है। कोई खाता नहीं, कोई साइन-अप नहीं, कोई सर्वर नहीं।
- 20 भाषाएँ

आम सवाल
दिन में कितना पानी पीना चाहिए?
Sipling आपका रोज़ का लक्ष्य वज़न, लिंग, उम्र और गतिविधि के स्तर से निकालता है, जिसका आधार यूरोपीय खाद्य सुरक्षा प्राधिकरण (EFSA) के पेय से मिलने वाले पानी के संदर्भ मान हैं। आप इसे कभी भी बदल सकते हैं।

पानी पीने का रिमाइंडर कैसे लगाएँ?
सेटिंग खोलें, जागने का समय और रिमाइंडर का अंतराल चुनें। दिन का लक्ष्य पूरा होते ही Sipling चुप हो जाता है।

क्या कॉफ़ी और चाय पानी में गिने जाते हैं?
गिने जाते हैं, पर एक-के-बराबर-एक नहीं। हर पेय का अपना हाइड्रेशन गुणांक है, इसलिए 250 मिली कॉफ़ी 250 मिली पानी से कम जुड़ती है। शराब लक्ष्य से घटा दी जाती है।

क्या इंटरनेट या खाता चाहिए?
नहीं। न साइन-अप, न सर्वर। आपका रिकॉर्ड आपके फ़ोन में रहता है और एक टैप में पूरा मिटाया जा सकता है।`,

  ar: `

ماذا يوجد بالداخل
- تتبّع الماء مع سجل شرب يمكنك تعديله في أي وقت
- تذكير أنت من يضبطه: ساعات استيقاظك والفاصل بين التنبيهات
- المس الإشعار لإضافة كوب دون فتح التطبيق
- هدف يومي محسوب من وزنك وجنسك وعمرك ومستوى نشاطك
- الشاي والقهوة والحليب والعصير والمشروبات الغازية تُحتسب بما تحويه فعلاً من ماء
- أداة الشاشة الرئيسية: أضف كوبًا وشاهد شجرتك تكبر هناك
- إحصاءات 7 و30 يومًا مع تفصيل ما شربته
- 8 أنواع من الأشجار و10 إنجازات
- يعمل دون إنترنت. بلا حساب، بلا تسجيل، بلا خادم.
- 20 لغة

أسئلة شائعة
كم كوب ماء يجب أن أشرب يوميًا؟
يحسب Sipling هدفك اليومي من وزنك وجنسك وعمرك ومستوى نشاطك، استنادًا إلى القيم المرجعية للهيئة الأوروبية لسلامة الأغذية (EFSA) للماء المتناوَل من المشروبات. ويمكنك تعديله متى شئت.

كيف أضبط تذكير شرب الماء؟
افتح الإعدادات واختر ساعات استيقاظك والفاصل بين التنبيهات. وعند بلوغ هدف اليوم يصمت التطبيق.

هل تُحتسب القهوة والشاي ماءً؟
نعم، لكن ليس واحدًا بواحد. لكل مشروب معامل ترطيب خاص به، فـ250 مل من القهوة تضيف أقل من 250 مل ماء. أما الكحول فيُخصم من هدفك.

هل يحتاج إلى إنترنت أو حساب؟
لا. لا تسجيل ولا خادم. يبقى سجلك على جهازك ويمكنك محوه بالكامل بلمسة واحدة.`,
};
