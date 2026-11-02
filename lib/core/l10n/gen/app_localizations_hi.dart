// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'Rapsap Ops';

  @override
  String get errorServer =>
      'हमारी तरफ़ से कुछ गड़बड़ हुई. कृपया फिर से कोशिश करें.';

  @override
  String get errorUnauthorized =>
      'आपका सत्र समाप्त हो गया है. कृपया फिर से साइन इन करें.';

  @override
  String get errorForbidden => 'आपके पास इसकी अनुमति नहीं है.';

  @override
  String get errorNotFound => 'आप जो ढूँढ रहे थे वह हमें नहीं मिला.';

  @override
  String get errorValidation => 'कृपया विवरण जाँचें और फिर से कोशिश करें.';

  @override
  String get errorNoInternet =>
      'इंटरनेट कनेक्शन नहीं है. अपना मोबाइल डेटा या वाई-फ़ाई जाँचें.';

  @override
  String get errorTimeout =>
      'इसमें बहुत समय लग रहा है. कृपया फिर से कोशिश करें.';

  @override
  String get errorCancelled => 'अनुरोध रद्द किया गया.';

  @override
  String get errorForceUpdate => 'जारी रखने के लिए कृपया ऐप अपडेट करें.';

  @override
  String get errorStorage =>
      'इस डिवाइस पर डेटा सेव नहीं हो सका. कृपया फिर से कोशिश करें.';

  @override
  String get errorUnknown => 'कुछ गड़बड़ हो गई. कृपया फिर से कोशिश करें.';

  @override
  String get pageNotFoundTitle => 'पेज नहीं मिला';

  @override
  String get pageNotFoundAction => 'शुरुआत पर जाएँ';

  @override
  String get languageEnglishShort => 'EN';

  @override
  String get languageDevanagariShort => 'अ';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageMarathi => 'मराठी';

  @override
  String get languageHindi => 'हिंदी';

  @override
  String get languagePick => 'मराठी या हिंदी चुनें';

  @override
  String get offlineBanner =>
      'आप ऑफ़लाइन हैं. दोबारा कनेक्ट होने तक कुछ काम नहीं होंगे.';

  @override
  String get actionRetry => 'फिर से कोशिश करें';

  @override
  String get actionBack => 'वापस';

  @override
  String get listSeparator => ' · ';

  @override
  String errorOtpInvalid(int attempts, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      attempts,
      locale: localeName,
      other: '$attempts कोशिशें बाकी',
      one: '1 कोशिश बाकी',
    );
    return 'यह कोड मेल नहीं खाया. यह नंबर $minutes मिनट के लिए लॉक होने से पहले $_temp0.';
  }

  @override
  String errorOtpLocked(int minutes) {
    return 'बहुत सारी गलत कोशिशें. यह नंबर $minutes मिनट के लिए लॉक है. आपके स्टोर मैनेजर इसे अनलॉक कर सकते हैं.';
  }

  @override
  String get errorTooManyRequests =>
      'बहुत सारे OTP अनुरोध. कृपया थोड़ी देर बाद कोशिश करें.';

  @override
  String get validationPhoneRequired => 'अपना मोबाइल नंबर डालें.';

  @override
  String get validationPhoneInvalid => 'सही 10 अंकों का मोबाइल नंबर डालें.';

  @override
  String get loginTitle => 'ऑपरेशंस';

  @override
  String get loginSubtitle =>
      'स्टोर के काम पूरे करें, समस्याएँ बताएँ और हर शिफ्ट की ज़िम्मेदारी तय रखें.';

  @override
  String get loginPhoneLabel => 'मोबाइल नंबर';

  @override
  String get loginPhoneHint => '98765 43210';

  @override
  String get loginHelper =>
      'यहाँ साइन-अप नहीं है. आपके स्टोर मैनेजर आपका लॉगिन बनाते हैं.';

  @override
  String get loginNoAccount =>
      'इस नंबर का कोई लॉगिन नहीं मिला. नंबर जाँचें या अपने स्टोर मैनेजर से मदद लें.';

  @override
  String get loginGetOtp => 'OTP पाएँ';

  @override
  String get otpTitle => 'OTP डालें';

  @override
  String otpSentTo(String countryCode, String phone, int minutes) {
    return '$countryCode $phone पर भेजा गया. $minutes मिनट तक मान्य.';
  }

  @override
  String get otpDidntGet => 'नहीं मिला?';

  @override
  String otpResendIn(String time) {
    return '$time में फिर से भेजें';
  }

  @override
  String get otpResend => 'OTP फिर से भेजें';

  @override
  String get otpVerify => 'पुष्टि करें';

  @override
  String welcomeTitle(String name) {
    return 'स्वागत है, $name';
  }

  @override
  String welcomeSubtitle(String roles, String store) {
    return '$roles · $store';
  }

  @override
  String get welcomeCollectTitle => 'हम क्या जानकारी लेते हैं';

  @override
  String get welcomeCollectBody =>
      'आपका नाम, फ़ोन नंबर और ऐप में ली गई काम की फ़ोटो. हम इन्हें स्टोर चेकलिस्ट के लिए इस्तेमाल करते हैं. फ़ोटो 5 महीने तक रखी जाती हैं.';

  @override
  String get permissionCameraTitle => 'कैमरा';

  @override
  String get permissionCameraBody => 'काम की फ़ोटो लेने के लिए';

  @override
  String get permissionNotificationsTitle => 'नोटिफ़िकेशन';

  @override
  String get permissionNotificationsBody =>
      'समय से 15 और 5 मिनट पहले याद दिलाना';

  @override
  String get permissionAllow => 'अनुमति दें';

  @override
  String get permissionAllowed => 'अनुमति है';

  @override
  String get permissionBlocked => 'ब्लॉक है';

  @override
  String get permissionCameraDeniedHelp =>
      'कैमरा ब्लॉक है. ब्राउज़र या फ़ोन की सेटिंग में इसे चालू करें, फिर दोबारा अनुमति दें पर टैप करें.';

  @override
  String get welcomeAgree => 'सहमत हैं, आगे बढ़ें';

  @override
  String get navHome => 'होम';

  @override
  String get navChecklist => 'चेकलिस्ट';

  @override
  String get homeComingUp => 'आगे के काम';

  @override
  String get homeDoNow => 'अभी यह करें';

  @override
  String homeDueAt(String section, String time) {
    return '$section · $time तक';
  }

  @override
  String get statDone => 'पूरे';

  @override
  String get statMissed => 'छूटे';

  @override
  String get statLeft => 'बाकी';

  @override
  String statDoneValue(int done, int total) {
    return '$done / $total';
  }

  @override
  String get shiftOpening => 'ओपनिंग शिफ्ट';

  @override
  String get shiftMid => 'मिड शिफ्ट';

  @override
  String get shiftClosing => 'क्लोज़िंग शिफ्ट';

  @override
  String get checklistMyTitle => 'मेरी चेकलिस्ट';

  @override
  String checklistDoneOf(int done, int total) {
    return '$total में से $done';
  }

  @override
  String get checklistDoneToday => 'आज पूरे हुए काम';

  @override
  String get checklistEmpty => 'अभी यहाँ कोई काम नहीं है.';

  @override
  String get checklistNoTasksToday => 'आज आपके लिए कोई काम नहीं है.';

  @override
  String filterAll(int count) {
    return 'सभी $count';
  }

  @override
  String filterOpen(int count) {
    return 'खुले $count';
  }

  @override
  String filterDone(int count) {
    return 'पूरे $count';
  }

  @override
  String filterMissed(int count) {
    return 'छूटे $count';
  }

  @override
  String sectionWindow(String name, String from, String to) {
    return '$name · $from–$to';
  }

  @override
  String sectionFrom(String name, String from) {
    return '$name · $from से';
  }

  @override
  String taskTitle(int number, String title) {
    return '#$number $title';
  }

  @override
  String get taskChipLater => 'बाद में';

  @override
  String get taskChipDueSoon => 'जल्द';

  @override
  String get taskChipSubmitted => 'SM को भेजा';

  @override
  String get taskChipVerified => 'जाँचा गया';

  @override
  String get taskChipSentBack => 'वापस भेजा';

  @override
  String get taskChipMissed => 'छूटा';

  @override
  String get taskChipNotDone => 'नहीं हुआ';

  @override
  String taskOpensAt(String time) {
    return '$time पर खुलेगा';
  }

  @override
  String taskMinutesLeft(int minutes) {
    return '$minutes मिनट बाकी';
  }

  @override
  String taskSubmittedAt(String time) {
    return '$time पर भेजा';
  }

  @override
  String taskVerifiedBy(String name) {
    return '$name ने जाँचा';
  }

  @override
  String taskSentBackBy(String name) {
    return '$name ने वापस भेजा';
  }

  @override
  String get taskAskToUnlock => 'अनलॉक के लिए SM से कहें';

  @override
  String get taskMarkedNotDone => 'नहीं किया दर्ज हुआ';

  @override
  String taskHeader(String section, int number) {
    return '$section · #$number';
  }

  @override
  String taskAssignedTo(String team) {
    return '$team को सौंपा गया';
  }

  @override
  String taskDueAt(String time) {
    return '$time तक';
  }

  @override
  String taskDueSoonLeft(int minutes) {
    return 'जल्द · $minutes मिनट बाकी';
  }

  @override
  String taskReopenedLeft(int minutes) {
    return 'फिर से खुला · $minutes मिनट बाकी';
  }

  @override
  String get taskPhotoProof => 'फ़ोटो सबूत*';

  @override
  String get taskTapToOpenCamera => 'कैमरा खोलने के लिए टैप करें';

  @override
  String get taskRetake => 'फिर से लें';

  @override
  String get taskRemarks => 'टिप्पणी';

  @override
  String get taskRemarksHint => 'SM को कुछ बताना हो तो';

  @override
  String get taskCantTakePhoto => 'फ़ोटो नहीं ले सकते? SM को कारण बताएँ';

  @override
  String get taskUsePhotoInstead => 'इसके बजाय फ़ोटो लें';

  @override
  String get taskNotDoneReason => 'फ़ोटो क्यों नहीं ले सकते?*';

  @override
  String get taskNotDoneHint => 'SM को बताएँ कि क्या रुकावट है';

  @override
  String taskAutoPosted(String group) {
    return 'आपकी फ़ोटो $group ग्रुप में भी अपने आप पोस्ट होती है.';
  }

  @override
  String get taskTakePhotoFirst => 'पहले फ़ोटो लें';

  @override
  String get taskSubmit => 'सबमिट करें';

  @override
  String get taskSubmitNotDone => 'नहीं हुआ के रूप में सबमिट करें';

  @override
  String get taskRetakePhoto => 'फ़ोटो फिर से लें';

  @override
  String taskFromManager(String name) {
    return '$name (SM) से';
  }

  @override
  String get taskEarlierPhoto => 'आपकी पिछली फ़ोटो';

  @override
  String get taskYourPhoto => 'आपकी फ़ोटो';

  @override
  String taskMissedWasDue(String time) {
    return 'छूटा · $time तक था';
  }

  @override
  String taskLockedAt(String time) {
    return '$time पर काम लॉक हुआ';
  }

  @override
  String get taskLockedHelp =>
      'सिर्फ़ आपके स्टोर मैनेजर ही यह काम अनलॉक कर सकते हैं. अनलॉक होने पर आपको 30 मिनट मिलेंगे और यह देर से दिखेगा.';

  @override
  String taskOpensLater(String time) {
    return 'यह काम $time पर खुलेगा.';
  }

  @override
  String get taskBackToChecklist => 'चेकलिस्ट पर वापस';

  @override
  String taskUploading(int percent) {
    return 'फ़ोटो अपलोड हो रही है… $percent%';
  }

  @override
  String get cameraOnly => 'सिर्फ़ कैमरा · गैलरी बंद';

  @override
  String get cameraClose => 'कैमरा बंद करें';

  @override
  String get cameraTakePhoto => 'फ़ोटो लें';

  @override
  String get cameraSwitch => 'कैमरा बदलें';

  @override
  String get cameraDenied =>
      'कैमरा ब्लॉक है. ब्राउज़र या फ़ोन की सेटिंग में इसे चालू करें और फिर से कोशिश करें.';

  @override
  String get cameraUnavailable => 'इस डिवाइस पर कैमरा नहीं मिला.';

  @override
  String get resultConfirmed => 'पुष्टि हुई';

  @override
  String get resultActionNeeded => 'कार्रवाई ज़रूरी';

  @override
  String get submittedTitle => 'जाँच के लिए भेजा';

  @override
  String submittedBody(String manager) {
    return 'आपकी फ़ोटो और टिप्पणी आपके स्टोर मैनेजर $manager को भेज दी गई है.';
  }

  @override
  String get submittedNotDoneTitle => 'आपके SM को भेजा';

  @override
  String submittedNotDoneBody(String manager) {
    return 'आपका कारण आपके स्टोर मैनेजर $manager को भेज दिया गया है.';
  }

  @override
  String submittedAtOnTime(String time) {
    return '$time पर सबमिट किया · समय पर';
  }

  @override
  String submittedAtLate(String time) {
    return '$time पर सबमिट किया · देर से';
  }

  @override
  String submittedPosted(String group) {
    return 'फ़ोटो $group में पोस्ट हुई';
  }

  @override
  String get interruptedTitle => 'आपकी फ़ोटो सेव है';

  @override
  String get interruptedBody =>
      'काम भेजने से पहले कनेक्शन टूट गया. यह स्क्रीन खुली रखें और ऑनलाइन होने पर फिर से कोशिश करें.';

  @override
  String get interruptedWaiting => 'फ़ोटो ली गई · अपलोड का इंतज़ार';

  @override
  String get interruptedNotSubmitted => 'काम अभी सबमिट नहीं हुआ है.';

  @override
  String get interruptedRetry => 'फिर से अपलोड करें';

  @override
  String get interruptedBack => 'काम पर वापस';

  @override
  String get caughtUpTitle => 'सारे काम पूरे';

  @override
  String get caughtUpBody =>
      'अभी आपके लिए कोई काम नहीं है. अगला काम खुलने पर हम बताएँगे.';

  @override
  String caughtUpNext(String task) {
    return 'अगला काम  $task';
  }

  @override
  String caughtUpOpens(String time) {
    return 'आज $time पर खुलेगा';
  }

  @override
  String get homeOpenCamera => 'कैमरा खोलें';

  @override
  String validationTooLong(int max) {
    return '$max अक्षरों से कम लिखें.';
  }

  @override
  String get validationReasonRequired => 'कृपया कारण लिखें.';

  @override
  String validationReasonTooShort(int min) {
    return 'कम से कम $min अक्षर लिखें.';
  }

  @override
  String get menuOpen => 'मेनू खोलें';

  @override
  String get menuMyTeam => 'मेरी टीम';

  @override
  String menuRoleLine(String role, String roles) {
    return '$role · $roles';
  }

  @override
  String get roleStaff => 'स्टाफ़';

  @override
  String get roleStoreManager => 'स्टोर मैनेजर';

  @override
  String get roleAdmin => 'एडमिन';

  @override
  String get profileTitle => 'मेरी प्रोफ़ाइल';

  @override
  String get profileEmployeeId => 'कर्मचारी आईडी';

  @override
  String get profileMobile => 'मोबाइल (लॉगिन)';

  @override
  String get profileStore => 'स्टोर';

  @override
  String get profileReportsTo => 'रिपोर्ट करते हैं';

  @override
  String get profileEmergencyContact => 'आपातकालीन संपर्क';

  @override
  String get profileThisMonth => 'इस महीने';

  @override
  String profileOnTime(int percent) {
    return '$percent% समय पर';
  }

  @override
  String profileDoneMissed(int done, int missed) {
    return 'पूरे $done · छूटे $missed';
  }

  @override
  String get settingsTitle => 'सेटिंग';

  @override
  String get settingsLanguage => 'भाषा';

  @override
  String get settingsNotifications => 'नोटिफ़िकेशन';

  @override
  String get settingsTaskReminders => 'काम की याद';

  @override
  String get settingsAlwaysOn => 'हमेशा चालू';

  @override
  String get settingsChatMessages => 'चैट संदेश';

  @override
  String get settingsAnnouncements => 'घोषणाएँ';

  @override
  String get logOut => 'लॉग आउट';

  @override
  String get logOutAllDevices => 'सभी डिवाइस से लॉग आउट';

  @override
  String get listEmpty => 'यहाँ अभी कुछ नहीं है.';

  @override
  String get notificationsTitle => 'नोटिफ़िकेशन';

  @override
  String notificationsUnread(int count) {
    return '$count अपठित';
  }

  @override
  String get notificationsMarkAllRead => 'सब पढ़ा हुआ';

  @override
  String get filterAllPlain => 'सभी';

  @override
  String notificationsUnreadTab(int count) {
    return 'अपठित ($count)';
  }

  @override
  String get notificationsEmpty => 'सब पढ़ लिया.';

  @override
  String notificationMeta(String source, String time) {
    return '$source · $time';
  }

  @override
  String get notificationUnreadDot => 'अपठित';

  @override
  String get navChat => 'चैट';

  @override
  String get navAlerts => 'अलर्ट';

  @override
  String get chatTitle => 'चैट';

  @override
  String get chatSearch => 'चैट खोजें';

  @override
  String get chatEmpty => 'अभी कोई चैट नहीं.';

  @override
  String get chatNoMatch => 'खोज से मेल खाती कोई चैट नहीं.';

  @override
  String get chatMuted => 'म्यूट';

  @override
  String chatMembers(int count) {
    return '$count सदस्य';
  }

  @override
  String get chatMute => 'यह चैट म्यूट करें';

  @override
  String get chatUnmute => 'यह चैट अनम्यूट करें';

  @override
  String get chatPinned => 'पिन किया गया';

  @override
  String get chatNoMessages => 'अभी कोई संदेश नहीं. नमस्ते कहें.';

  @override
  String get chatLoadOlder => 'पुराने संदेश देखें';

  @override
  String chatSenderWithRole(String name, String role) {
    return '$name · $role';
  }

  @override
  String get chatNotSent => 'नहीं भेजा गया';

  @override
  String get chatReport => 'संदेश की शिकायत करें';

  @override
  String get chatReported => 'शिकायत दर्ज हुई. एडमिन जाँच करेंगे.';

  @override
  String get chatSending => 'भेजा जा रहा है…';

  @override
  String get chatFailedRetry => 'नहीं भेजा गया — फिर से कोशिश के लिए टैप करें';

  @override
  String chatSeenBy(String time, int count) {
    return '$time · ✓✓ $count ने देखा';
  }

  @override
  String get chatPhoto => 'फ़ोटो';

  @override
  String get chatReadOnly => 'यहाँ सिर्फ़ एडमिन पोस्ट कर सकते हैं.';

  @override
  String chatMutedNotice(String time) {
    return '3 संदेश ब्लॉक होने से आप $time तक म्यूट हैं. एडमिन को बताया गया है.';
  }

  @override
  String get chatMessageHint => 'संदेश';

  @override
  String get chatSend => 'भेजें';

  @override
  String get chatBlockedAbuse =>
      'इस संदेश में ऐसे शब्द हैं जिनकी अनुमति नहीं है.';

  @override
  String get chatBlockedLink => 'चैट में लिंक शेयर नहीं कर सकते.';

  @override
  String get chatBlockedFlood => 'आप बहुत तेज़ी से भेज रहे हैं. थोड़ा रुकें.';

  @override
  String get chatBlockedSensitive =>
      'यह पासवर्ड या OTP जैसा लगता है. चैट में कभी शेयर न करें.';

  @override
  String get chatBlockedMuted => 'आप अभी म्यूट हैं. एडमिन को बताया गया है.';

  @override
  String get taskMessageManager => 'मेरे SM को संदेश';

  @override
  String get submittedViewChat => 'चेकलिस्ट चैट देखें';

  @override
  String get managerSections => 'सेक्शन';

  @override
  String get managerAllChecklist => 'पूरी चेकलिस्ट';

  @override
  String get managerActivitiesDone => 'काम पूरे हुए';

  @override
  String managerToReview(int count) {
    return '$count जाँचने हैं';
  }

  @override
  String managerMissed(int count) {
    return '$count छूटे';
  }

  @override
  String managerNotDone(int count) {
    return '$count नहीं हुए';
  }

  @override
  String get sectionInProgress => 'चल रहा है';

  @override
  String sectionCritical(int count) {
    return 'गंभीर · $count छूटे';
  }

  @override
  String get sectionReady => 'सबमिट के लिए तैयार';

  @override
  String get sectionSubmitted => 'HO को भेजा';

  @override
  String get sectionApproved => 'HO ने मंज़ूर किया';

  @override
  String get sectionReturned => 'HO ने लौटाया';

  @override
  String managerSalesMtd(String month) {
    return 'बिक्री · $month MTD';
  }

  @override
  String amountOf(String amount, String target) {
    return '$target में से $amount';
  }

  @override
  String dsrDueBy(String time) {
    return 'DSR $time तक';
  }

  @override
  String percent(int percent) {
    return '$percent%';
  }

  @override
  String get sectionReportsTitle => 'सेक्शन रिपोर्ट';

  @override
  String get reviewNothing => 'अभी यहाँ कुछ नहीं है.';

  @override
  String reviewNeedsReview(int count) {
    return 'जाँचने हैं $count';
  }

  @override
  String reviewNotDone(int count) {
    return 'नहीं हुए $count';
  }

  @override
  String reviewOpenNow(int count) {
    return 'अभी खुले $count';
  }

  @override
  String reviewNotDoneLine(String name, String reason) {
    return 'नहीं हुआ · $name · “$reason”';
  }

  @override
  String reviewToday(String time) {
    return 'आज $time';
  }

  @override
  String get reviewTitle => 'रिपोर्ट जाँच';

  @override
  String get reviewMissedTitle => 'छूटा हुआ काम';

  @override
  String get reviewChipNeedsReview => 'जाँचना है';

  @override
  String reviewSubmittedBy(String name) {
    return '$name ने सबमिट किया';
  }

  @override
  String get reviewReason => 'कारण';

  @override
  String reviewAssignedTo(String name, String role) {
    return '$name · $role को सौंपा गया';
  }

  @override
  String reviewLockedAt(String time) {
    return 'छूटा · $time पर लॉक';
  }

  @override
  String reviewUnlockTitle(int minutes) {
    return '$minutes मिनट के लिए अनलॉक करें';
  }

  @override
  String reviewUnlockBody(String name, String time) {
    return '$name को सूचना मिलेगी और वे $time तक सबमिट कर सकते हैं. रिपोर्ट में यह काम देर से दिखेगा.';
  }

  @override
  String get reviewDoItTitle => 'खुद करें';

  @override
  String get reviewDoItBody =>
      '“SM ने किया” दर्ज होगा. एडमिन सेक्शन रिपोर्ट के साथ जाँचेंगे.';

  @override
  String get reviewVerify => 'सही है';

  @override
  String get reviewEdit => 'बदलें';

  @override
  String get reviewSendBack => 'वापस भेजें';

  @override
  String reviewUnlockFor(String name) {
    return '$name के लिए अनलॉक करें';
  }

  @override
  String get reviewDoItMyself => 'मैं खुद करूँगा';

  @override
  String get reviewLeaveMissed => 'छूटा ही रहने दें';

  @override
  String get reviewUnlockedTitle => 'काम अनलॉक हुआ';

  @override
  String get reviewVerifiedTitle => 'एंट्री जाँची गई';

  @override
  String reviewUnlockedBody(String name) {
    return '$name अब सबमिट कर सकते हैं. यह देर से दिखेगा.';
  }

  @override
  String reviewVerifiedBody(String name) {
    return '$name का काम जाँच लिया गया. यह उनकी चेकलिस्ट में दिखता है.';
  }

  @override
  String reviewVerifiedBy(String name) {
    return '$name ने जाँचा';
  }

  @override
  String get reviewHistoryKept => 'मूल सबूत काम के इतिहास में रहता है';

  @override
  String get reviewBackToQueue => 'जाँच पर वापस';

  @override
  String get sendBackPhotoBlurry => 'फ़ोटो धुंधली';

  @override
  String get sendBackWrongArea => 'गलत जगह';

  @override
  String get sendBackNotDone => 'काम नहीं हुआ';

  @override
  String get sendBackTitle => 'स्टाफ़ को वापस भेजें';

  @override
  String get sendBackBody => 'उनके लिए काम 30 मिनट के लिए फिर से खुलेगा.';

  @override
  String get sendBackQuick => 'झटपट कारण';

  @override
  String get sendBackReason => 'कारण*';

  @override
  String get editTitle => 'एंट्री बदलें';

  @override
  String get editPhotoUnclear => 'फ़ोटो साफ़ नहीं';

  @override
  String get editWrongPhoto => 'गलत फ़ोटो';

  @override
  String get editRemarkMissing => 'टिप्पणी नहीं';

  @override
  String get editOther => 'अन्य';

  @override
  String get editBody =>
      'उनकी मूल फ़ोटो और टिप्पणी इतिहास में रहती है और उन्हें बताया जाता है.';

  @override
  String get editNewPhoto => 'नई फ़ोटो*';

  @override
  String get editWhy => 'आप क्यों बदल रहे हैं?*';

  @override
  String get editSave => 'बदलाव सेव करें';

  @override
  String get teamTitle => 'मेरी टीम';

  @override
  String teamSubtitle(String store, int count) {
    return '$store · $count स्टाफ़';
  }

  @override
  String get teamCreateLogin => '+ स्टाफ़ लॉगिन बनाएँ';

  @override
  String teamActive(int count) {
    return 'सक्रिय $count';
  }

  @override
  String teamInvited(int count) {
    return 'SMS भेजा $count';
  }

  @override
  String teamDeactivated(int count) {
    return 'बंद $count';
  }

  @override
  String teamInvitedLine(String roles, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days दिन पहले',
      one: '1 दिन पहले',
      zero: 'आज',
    );
    return '$roles · SMS $_temp0 भेजा, साइन इन नहीं';
  }

  @override
  String teamLeftLine(String roles, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days दिन पहले',
      one: '1 दिन पहले',
      zero: 'आज',
    );
    return '$roles · $_temp0 छोड़ा';
  }

  @override
  String get teamStatusActive => 'सक्रिय';

  @override
  String get teamStatusDeactivated => 'बंद';

  @override
  String get teamSmsSent => 'SMS भेजा';

  @override
  String get teamResendSms => 'SMS फिर से भेजें';

  @override
  String teamLoginCreated(String name) {
    return 'लॉगिन बन गया. $name को SMS मिलेगा.';
  }

  @override
  String get teamStep1 => 'चरण 1/3 · विवरण';

  @override
  String get teamStep2 => 'चरण 2/3 · एक या अधिक चुनें';

  @override
  String get teamStep3 => 'चरण 3/3 · जाँचें और भेजें';

  @override
  String get teamNewLogin => 'नया स्टाफ़ लॉगिन';

  @override
  String get teamSmsFailedTitle => 'लॉगिन बना. SMS नहीं गया.';

  @override
  String teamSmsFailedBody(String name) {
    return '$name का लॉगिन तैयार है, पर निमंत्रण नहीं पहुँचा. नंबर जाँचें और फिर से कोशिश करें.';
  }

  @override
  String get teamNotSignedIn => 'खाते की स्थिति · साइन इन नहीं';

  @override
  String get teamBackToTeam => 'टीम पर वापस';

  @override
  String get teamPhoneTaken =>
      'इस नंबर का पहले से लॉगिन है. व्यक्ति को ट्रांसफ़र करने के लिए एडमिन से कहें.';

  @override
  String get teamFullName => 'पूरा नाम*';

  @override
  String get teamFullNameHint => 'पहचान पत्र जैसा · सिर्फ़ अक्षर';

  @override
  String get actionNext => 'आगे';

  @override
  String get teamJobRoles => 'काम की भूमिकाएँ';

  @override
  String get teamTasksFromRoles => 'इन भूमिकाओं के काम';

  @override
  String get teamAddTask => '+ काम जोड़ें';

  @override
  String teamPhoneStore(String countryCode, String phone, String store) {
    return '$countryCode $phone · $store';
  }

  @override
  String get teamJobRole => 'भूमिका';

  @override
  String get teamTasks => 'काम';

  @override
  String get teamChatGroups => 'चैट ग्रुप';

  @override
  String get teamDefaultGroups => 'स्टोर टीम, चेकलिस्ट';

  @override
  String teamSmsPreviewTitle(String name) {
    return '$name को मिलने वाला SMS';
  }

  @override
  String teamSmsPreview(String name) {
    return 'नमस्ते $name, आपका rapsap ops लॉगिन तैयार है. इस नंबर से OTP डालकर साइन इन करें. - Rapsap';
  }

  @override
  String get teamCreateAndSend => 'बनाएँ और SMS भेजें';

  @override
  String get teamSaved => 'बदलाव सेव हुए.';

  @override
  String get teamDeactivatedDone => 'लॉगिन बंद किया गया.';

  @override
  String get teamReactivatedDone => 'लॉगिन फिर से चालू हुआ.';

  @override
  String get teamChangeNumber => 'नंबर बदलें';

  @override
  String get teamReactivate => 'लॉगिन फिर से चालू करें';

  @override
  String get teamDeactivate => 'लॉगिन बंद करें';

  @override
  String teamDeactivateTitle(String name) {
    return '$name का लॉगिन बंद करें?';
  }

  @override
  String get teamDeactivateSignedOut => 'सभी फ़ोन से तुरंत साइन आउट';

  @override
  String get teamDeactivateGroups => 'स्टोर चैट ग्रुप से हटाए जाएँगे';

  @override
  String get teamDeactivateHistory => 'पुराने काम और फ़ोटो रिपोर्ट में रहेंगे';

  @override
  String get teamDeactivateReactivate => 'आप बाद में फिर से चालू कर सकते हैं';

  @override
  String teamReactivateTitle(String name) {
    return '$name की पहुँच फिर से दें?';
  }

  @override
  String get teamReactivateTasks => 'चालू होने पर आगे के काम फिर मिलेंगे.';

  @override
  String get actionCancel => 'रद्द करें';

  @override
  String teamNumberUpdated(String countryCode, String phone) {
    return 'नंबर बदल गया. वे अब $countryCode $phone से साइन इन कर सकते हैं.';
  }

  @override
  String get teamVerifyNumber => 'नया नंबर पुष्टि करें';

  @override
  String get teamNewNumber => 'नया मोबाइल नंबर*';

  @override
  String get teamChangeNumberHelp =>
      'हम नए नंबर पर OTP भेजेंगे. पुष्टि के लिए वे आपको पढ़कर बताएँगे. उनके काम, इतिहास और ग्रुप वैसे ही रहेंगे.';

  @override
  String get teamSendOtpNew => 'नए नंबर पर OTP भेजें';

  @override
  String teamAskForOtp(String countryCode, String phone) {
    return '$countryCode $phone पर भेजा गया 6 अंकों का OTP उनसे पूछें';
  }

  @override
  String get teamDidntArrive => 'नहीं आया?';

  @override
  String get teamVerifyAndUpdate => 'पुष्टि करें और बदलें';

  @override
  String get validationNameRequired => 'पूरा नाम डालें.';

  @override
  String validationNameLength(int min, int max) {
    return 'नाम $min–$max अक्षरों का हो.';
  }

  @override
  String get validationNameLetters => 'सिर्फ़ अक्षर इस्तेमाल करें.';

  @override
  String listSeparatorJoin(String first, String second) {
    return '$first · $second';
  }

  @override
  String get reportNotReady => 'तैयार नहीं';

  @override
  String get reportReady => 'तैयार';

  @override
  String reportSubmittedAt(String time) {
    return 'HO को भेजा · $time';
  }

  @override
  String reportApprovedAt(String time) {
    return 'HO ने मंज़ूर किया · $time';
  }

  @override
  String get reportReturned => 'HO ने लौटाया';

  @override
  String get reportSnapshot => 'स्नैपशॉट';

  @override
  String get reportFix => 'ठीक करके फिर भेजें';

  @override
  String reportReturnedLine(int number, String comment) {
    return 'लौटाया: #$number $comment';
  }

  @override
  String reportOpensWithSummary(String time) {
    return '$time पर खुलेगा · दैनिक सारांश सहित';
  }

  @override
  String get reportSendAfterLast => 'आख़िरी काम बंद होने के बाद भेजें';

  @override
  String reportStats(int notDone, int photos, int toVerify) {
    return '$notDone नहीं हुए · $photos फ़ोटो · $toVerify जाँचने हैं';
  }

  @override
  String get reportNote => 'HO के लिए नोट (वैकल्पिक)';

  @override
  String get reportSubmit => 'HO को भेजें';

  @override
  String get reportWalkthrough => '#46 स्टोर वॉकथ्रू वीडियो';

  @override
  String get reportClosing => '#47 क्लोज़िंग रिपोर्ट';

  @override
  String get reportDailySummary => 'दैनिक सारांश और सबमिट';

  @override
  String get reportResubmittedTitle => 'फिर से जाँच के लिए तैयार';

  @override
  String get reportResubmittedBody =>
      'सुधारा हुआ सबूत जोड़ दिया गया है. पहले वाला सबमिशन इतिहास में रहता है.';

  @override
  String reportRevision(String section, int revision) {
    return '$section रिपोर्ट · संशोधन $revision';
  }

  @override
  String reportNewPhoto(int number) {
    return '#$number नई फ़ोटो जोड़ी';
  }

  @override
  String get reportBackToReports => 'रिपोर्ट पर वापस';

  @override
  String reportNeedsCorrection(String section) {
    return '$section में सुधार चाहिए';
  }

  @override
  String get reportReturnedBody =>
      'HO ने यह रिपोर्ट लौटाई है. बताई गई एंट्री ठीक करें और संशोधित रिपोर्ट भेजें.';

  @override
  String reportReturnedAt(String time) {
    return 'आज $time पर लौटाया';
  }

  @override
  String get reportSendRevised => 'संशोधित रिपोर्ट भेजें';

  @override
  String get reportFixEntry => 'एंट्री ठीक करें';

  @override
  String get summaryDsrFirstTitle => 'पहले आज का DSR अपलोड करें';

  @override
  String get summaryDsrFirstBody =>
      'क्लोज़िंग सारांश के लिए आज की बिक्री और बिलों का कुल चाहिए. आपकी बाकी एंट्री सेव हैं.';

  @override
  String summaryNotAvailable(String label) {
    return '$label · उपलब्ध नहीं';
  }

  @override
  String get summarySales => 'कुल बिक्री';

  @override
  String get summaryBills => 'बिल (NOB)';

  @override
  String get summaryTicket => 'टिकट साइज़';

  @override
  String get summaryGoToSales => 'बिक्री पर जाएँ';

  @override
  String get summaryTitle => 'दैनिक सारांश';

  @override
  String get summarySubtitle => 'क्लोज़िंग · दैनिक सारांश';

  @override
  String get summaryFromDsr => 'आज के DSR से · सिर्फ़ पढ़ें';

  @override
  String get summaryFixExcel => 'गलत है? Excel ठीक करके फिर अपलोड करें.';

  @override
  String get summaryMargin => 'मार्जिन %*';

  @override
  String get summaryComplaints => 'ग्राहक शिकायतें*';

  @override
  String get summaryDamages => 'नुकसान ₹*';

  @override
  String get summaryShrinkage => 'श्रिंकेज ₹*';

  @override
  String summaryManpower(int total) {
    return 'मौजूद स्टाफ़ ($total में से)*';
  }

  @override
  String get summaryKeyIssues => 'HO के लिए मुख्य मुद्दे';

  @override
  String get summarySend => 'HO को भेजें';

  @override
  String get validationNumberRequired => 'संख्या डालें.';

  @override
  String validationNumberRange(int min, int max) {
    return '$min से $max के बीच संख्या डालें.';
  }

  @override
  String get snapshotPostTo => 'यहाँ पोस्ट करें';

  @override
  String get snapshotPost => 'चैट में पोस्ट करें';

  @override
  String get snapshotSharedTitle => 'रिपोर्ट शेयर हुई';

  @override
  String get snapshotSharedBody => 'आपका स्नैपशॉट सफलतापूर्वक पोस्ट हो गया.';

  @override
  String snapshotWindow(String date, String from, String to) {
    return '$date · $from–$to';
  }

  @override
  String get snapshotMarkDone => '✓';

  @override
  String get snapshotMarkMissed => '✕';

  @override
  String get snapshotMarkNotDone => '—';

  @override
  String get closingSent => 'क्लोज़िंग रिपोर्ट भेजी गई.';

  @override
  String get closingShutter => 'शटर फ़ोटो*';

  @override
  String closingSubtitle(String time) {
    return 'क्लोज़िंग · #47 · $time तक';
  }

  @override
  String get closingTime => 'बंद करने का समय';

  @override
  String get closingTimeHelp => 'सबमिट करते समय घड़ी से लिया जाता है.';

  @override
  String closingEarly(String time) {
    return '$time से पहले';
  }

  @override
  String get closingWho => 'स्टोर किसने बंद किया?*';

  @override
  String closingFlagNote(String time) {
    return '$time से पहले बंद करने पर एडमिन को बताया जाता है.';
  }

  @override
  String get walkthroughSent => 'वॉकथ्रू वीडियो भेजा गया.';

  @override
  String get walkthroughTitle => '#46 स्टोर वॉकथ्रू';

  @override
  String walkthroughSubtitle(String time) {
    return 'फ़्लोर + बैक स्टोर · $time तक';
  }

  @override
  String walkthroughRec(String elapsed, String limit) {
    return '● REC $elapsed / $limit';
  }

  @override
  String get walkthroughStop => 'रिकॉर्डिंग रोकें';

  @override
  String get walkthroughStart => 'रिकॉर्डिंग शुरू करें';

  @override
  String get walkthroughReviewTitle => 'अपना वॉकथ्रू जाँचें';

  @override
  String get walkthroughReviewBody =>
      'भेजने से पहले देखें कि फ़्लोर और बैक स्टोर साफ़ दिख रहे हैं.';

  @override
  String get walkthroughPlay => 'वीडियो चलाएँ या रोकें';

  @override
  String walkthroughMeta(String time) {
    return 'काम #46 · आज, $time';
  }

  @override
  String get walkthroughSend => 'वीडियो भेजें';

  @override
  String get navSales => 'बिक्री';

  @override
  String get salesTitle => 'बिक्री (DSR)';

  @override
  String get dsrNotUploaded => 'अपलोड नहीं';

  @override
  String dsrUploadedOnTime(String time) {
    return '$time पर अपलोड · समय पर';
  }

  @override
  String dsrUploadedLate(String time) {
    return '$time पर अपलोड · देर से';
  }

  @override
  String get dsrUpload => 'आज का DSR Excel अपलोड करें';

  @override
  String get dsrReupload => 'फिर से अपलोड करें';

  @override
  String dsrMonthTarget(String month) {
    return '$month लक्ष्य';
  }

  @override
  String dsrAchieved(int percent) {
    return '$percent% हासिल';
  }

  @override
  String dsrNeedPerDay(String amount) {
    return 'बाकी महीने के लिए रोज़ $amount चाहिए';
  }

  @override
  String get dsrTrend => 'रुझान';

  @override
  String get dsrChange => 'बदलें';

  @override
  String get dsrPeriod1M => '1M';

  @override
  String get dsrPeriod3M => '3M';

  @override
  String get dsrPeriod6M => '6M';

  @override
  String get dsrPeriod1Y => '1Y';

  @override
  String get dsrTrendLabel =>
      'इस अवधि की दैनिक बिक्री, पिछली अवधि के उन्हीं दिनों से तुलना';

  @override
  String get dsrLegend => '— यह अवधि   - - पिछली अवधि के वही दिन';

  @override
  String get dsrHistory => 'पोस्टिंग इतिहास';

  @override
  String get dsrOnTime => 'समय पर';

  @override
  String get dsrLate => 'देर से';

  @override
  String get dsrReading => 'आपकी फ़ाइल पढ़ी जा रही है…';

  @override
  String get dsrCheckTitle => 'सेव करने से पहले जाँचें';

  @override
  String get dsrRejectedTitle => 'यह फ़ाइल सेव नहीं हो सकती';

  @override
  String get dsrXlsx => 'XLSX';

  @override
  String dsrFileMeta(int kb, String note) {
    return '$kb KB · $note';
  }

  @override
  String get dsrReadNow => 'अभी पढ़ी गई';

  @override
  String get dsrNotReadable => 'स्वीकार नहीं हुई';

  @override
  String get dsrDate => 'तारीख';

  @override
  String get dsrNetSales => 'शुद्ध बिक्री';

  @override
  String get dsrMonthTargetShort => 'महीने का लक्ष्य';

  @override
  String get dsrReplaces =>
      'इस तारीख के लिए पहले से अपलोड है? सेव करने पर वह बदल जाएगा. पुराना संस्करण इतिहास में रहेगा.';

  @override
  String get dsrSave => 'DSR सेव करें';

  @override
  String dsrWrongStore(String store) {
    return 'यह $store का DSR लगता है. आप सिर्फ़ अपने स्टोर का DSR अपलोड कर सकते हैं. अपने स्टोर की आज की फ़ाइल चुनें और फिर से कोशिश करें.';
  }

  @override
  String get dsrUnreadableDate => 'तारीख पढ़ी नहीं जा सकी';

  @override
  String get dsrNoSales => 'बिक्री का आँकड़ा नहीं';

  @override
  String dsrTooLarge(int mb) {
    return '$mb MB से बड़ी';
  }

  @override
  String get dsrHasMacros => 'मैक्रो हैं';

  @override
  String get dsrOtherReasons => 'फ़ाइल ब्लॉक होने के अन्य कारण';

  @override
  String get dsrUploadAnother => 'दूसरी फ़ाइल अपलोड करें';

  @override
  String dsrSavedOnTime(String time) {
    return 'DSR सेव हुआ · $time · समय पर';
  }

  @override
  String dsrSavedLate(String time) {
    return 'DSR सेव हुआ · $time · देर से';
  }

  @override
  String dsrSnapshotTitle(String date) {
    return 'DSR · $date';
  }

  @override
  String dsrSnapshotLine(int bills, String ticket, int percent) {
    return '$bills बिल · $ticket टिकट · MTD $percent%';
  }

  @override
  String get dsrReportsGroup => 'DSR Reports';

  @override
  String get dsrPostedBody => 'आपका DSR स्नैपशॉट सफलतापूर्वक पोस्ट हो गया.';

  @override
  String dsrSalesBills(String sales, int bills) {
    return '$sales बिक्री · $bills बिल';
  }

  @override
  String get dsrBackToSales => 'बिक्री पर वापस';

  @override
  String dsrChangePercent(String sign, String value) {
    return '$sign$value%';
  }

  @override
  String get installTitle => 'Rapsap Ops इंस्टॉल करें';

  @override
  String get installBody =>
      'आगे बढ़ने के लिए ऐप को अपने फ़ोन पर इंस्टॉल करें। यह फ़ुल स्क्रीन में खुलता है और आपको टास्क अलर्ट भेजता है।';

  @override
  String get installNow => 'अभी इंस्टॉल करें';

  @override
  String get installIosStepShare =>
      'Safari में शेयर दबाएँ। नहीं दिख रहा? पहले एड्रेस बार के पास मेन्यू (⋯ या ≡) दबाएँ';

  @override
  String get installIosStepAdd =>
      'नीचे स्क्रॉल करें और \"Add to Home Screen\" दबाएँ';

  @override
  String get installBrowserStepMenu => 'ब्राउज़र मेनू (⋮) खोलें';

  @override
  String get installBrowserStepAdd =>
      '\"Install app\" या \"Add to Home screen\" दबाएँ';

  @override
  String get installStepOpen => 'होम स्क्रीन से Rapsap Ops खोलें';

  @override
  String get installIosNote =>
      'यह लिंक किसी दूसरे ऐप में खुला है? पहले इसे Safari में खोलें।';

  @override
  String get installBrowserNote =>
      'पहले से इंस्टॉल है? होम स्क्रीन से Rapsap Ops खोलें।';

  @override
  String get installDoneTitle => 'ऐप इंस्टॉल हो गया';

  @override
  String get installDoneBody =>
      'यह टैब बंद करें और होम स्क्रीन से Rapsap Ops खोलें।';
}
