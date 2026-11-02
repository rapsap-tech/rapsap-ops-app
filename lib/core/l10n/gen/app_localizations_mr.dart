// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'Rapsap Ops';

  @override
  String get errorServer =>
      'आमच्याकडून काहीतरी चूक झाली. कृपया पुन्हा प्रयत्न करा.';

  @override
  String get errorUnauthorized =>
      'तुमचे सत्र संपले आहे. कृपया पुन्हा साइन इन करा.';

  @override
  String get errorForbidden => 'तुम्हाला याचा प्रवेश नाही.';

  @override
  String get errorNotFound => 'तुम्ही शोधत असलेले आम्हाला सापडले नाही.';

  @override
  String get errorValidation => 'कृपया तपशील तपासा आणि पुन्हा प्रयत्न करा.';

  @override
  String get errorNoInternet =>
      'इंटरनेट कनेक्शन नाही. तुमचा मोबाइल डेटा किंवा वाय-फाय तपासा.';

  @override
  String get errorTimeout => 'याला खूप वेळ लागत आहे. कृपया पुन्हा प्रयत्न करा.';

  @override
  String get errorCancelled => 'विनंती रद्द केली.';

  @override
  String get errorForceUpdate => 'पुढे जाण्यासाठी कृपया ॲप अपडेट करा.';

  @override
  String get errorStorage =>
      'या डिव्हाइसवर डेटा सेव्ह करता आला नाही. कृपया पुन्हा प्रयत्न करा.';

  @override
  String get errorUnknown => 'काहीतरी चूक झाली. कृपया पुन्हा प्रयत्न करा.';

  @override
  String get pageNotFoundTitle => 'पेज सापडले नाही';

  @override
  String get pageNotFoundAction => 'सुरुवातीला जा';

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
  String get languagePick => 'मराठी किंवा हिंदी निवडा';

  @override
  String get offlineBanner =>
      'तुम्ही ऑफलाइन आहात. पुन्हा कनेक्ट होईपर्यंत काही गोष्टी चालणार नाहीत.';

  @override
  String get actionRetry => 'पुन्हा प्रयत्न करा';

  @override
  String get actionBack => 'मागे';

  @override
  String get listSeparator => ' · ';

  @override
  String errorOtpInvalid(int attempts, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      attempts,
      locale: localeName,
      other: '$attempts प्रयत्न बाकी',
      one: '1 प्रयत्न बाकी',
    );
    return 'हा कोड जुळला नाही. हा नंबर $minutes मिनिटांसाठी लॉक होण्यापूर्वी $_temp0.';
  }

  @override
  String errorOtpLocked(int minutes) {
    return 'खूप चुकीचे प्रयत्न. हा नंबर $minutes मिनिटांसाठी लॉक आहे. तुमचे स्टोअर मॅनेजर तो अनलॉक करू शकतात.';
  }

  @override
  String get errorTooManyRequests =>
      'खूप OTP विनंत्या. कृपया थोड्या वेळाने प्रयत्न करा.';

  @override
  String get validationPhoneRequired => 'तुमचा मोबाइल नंबर टाका.';

  @override
  String get validationPhoneInvalid => 'योग्य 10 अंकी मोबाइल नंबर टाका.';

  @override
  String get loginTitle => 'ऑपरेशन्स';

  @override
  String get loginSubtitle =>
      'स्टोअरची कामे पूर्ण करा, अडचणी कळवा आणि प्रत्येक शिफ्टची जबाबदारी ठेवा.';

  @override
  String get loginPhoneLabel => 'मोबाइल नंबर';

  @override
  String get loginPhoneHint => '98765 43210';

  @override
  String get loginHelper =>
      'इथे साइन-अप नाही. तुमचे स्टोअर मॅनेजर तुमचे लॉगिन तयार करतात.';

  @override
  String get loginNoAccount =>
      'या नंबरसाठी लॉगिन सापडले नाही. नंबर तपासा किंवा तुमच्या स्टोअर मॅनेजरची मदत घ्या.';

  @override
  String get loginGetOtp => 'OTP मिळवा';

  @override
  String get otpTitle => 'OTP टाका';

  @override
  String otpSentTo(String countryCode, String phone, int minutes) {
    return '$countryCode $phone वर पाठवला. $minutes मिनिटांसाठी वैध.';
  }

  @override
  String get otpDidntGet => 'मिळाला नाही?';

  @override
  String otpResendIn(String time) {
    return '$time मध्ये पुन्हा पाठवा';
  }

  @override
  String get otpResend => 'OTP पुन्हा पाठवा';

  @override
  String get otpVerify => 'पडताळा';

  @override
  String welcomeTitle(String name) {
    return 'स्वागत आहे, $name';
  }

  @override
  String welcomeSubtitle(String roles, String store) {
    return '$roles · $store';
  }

  @override
  String get welcomeCollectTitle => 'आम्ही काय गोळा करतो';

  @override
  String get welcomeCollectBody =>
      'तुमचे नाव, फोन नंबर आणि ॲपमध्ये तुम्ही काढलेले कामाचे फोटो. स्टोअर चेकलिस्टसाठी आम्ही ते वापरतो. फोटो 5 महिने ठेवले जातात.';

  @override
  String get permissionCameraTitle => 'कॅमेरा';

  @override
  String get permissionCameraBody => 'कामाचे फोटो काढण्यासाठी';

  @override
  String get permissionNotificationsTitle => 'नोटिफिकेशन्स';

  @override
  String get permissionNotificationsBody => 'वेळेच्या 15 आणि 5 मिनिटे आधी आठवण';

  @override
  String get permissionAllow => 'परवानगी द्या';

  @override
  String get permissionAllowed => 'परवानगी दिली';

  @override
  String get permissionBlocked => 'ब्लॉक केले';

  @override
  String get permissionCameraDeniedHelp =>
      'कॅमेरा ब्लॉक आहे. ब्राउझर किंवा फोन सेटिंग्जमध्ये तो चालू करा आणि पुन्हा परवानगी द्या वर टॅप करा.';

  @override
  String get welcomeAgree => 'मान्य करा आणि पुढे जा';

  @override
  String get navHome => 'होम';

  @override
  String get navChecklist => 'चेकलिस्ट';

  @override
  String get homeComingUp => 'पुढील कामे';

  @override
  String get homeDoNow => 'आता हे करा';

  @override
  String homeDueAt(String section, String time) {
    return '$section · $time पर्यंत';
  }

  @override
  String get statDone => 'झाले';

  @override
  String get statMissed => 'चुकले';

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
  String get shiftClosing => 'क्लोजिंग शिफ्ट';

  @override
  String get checklistMyTitle => 'माझी चेकलिस्ट';

  @override
  String checklistDoneOf(int done, int total) {
    return '$total पैकी $done';
  }

  @override
  String get checklistDoneToday => 'आज झालेली कामे';

  @override
  String get checklistEmpty => 'सध्या इथे कोणतीही कामे नाहीत.';

  @override
  String get checklistNoTasksToday => 'आज तुमच्यासाठी कोणतीही कामे नाहीत.';

  @override
  String filterAll(int count) {
    return 'सर्व $count';
  }

  @override
  String filterOpen(int count) {
    return 'चालू $count';
  }

  @override
  String filterDone(int count) {
    return 'झाले $count';
  }

  @override
  String filterMissed(int count) {
    return 'चुकले $count';
  }

  @override
  String sectionWindow(String name, String from, String to) {
    return '$name · $from–$to';
  }

  @override
  String sectionFrom(String name, String from) {
    return '$name · $from पासून';
  }

  @override
  String taskTitle(int number, String title) {
    return '#$number $title';
  }

  @override
  String get taskChipLater => 'नंतर';

  @override
  String get taskChipDueSoon => 'लवकरच';

  @override
  String get taskChipSubmitted => 'SM कडे पाठवले';

  @override
  String get taskChipVerified => 'तपासले';

  @override
  String get taskChipSentBack => 'परत पाठवले';

  @override
  String get taskChipMissed => 'चुकले';

  @override
  String get taskChipNotDone => 'केले नाही';

  @override
  String taskOpensAt(String time) {
    return '$time ला सुरू';
  }

  @override
  String taskMinutesLeft(int minutes) {
    return '$minutes मिनिटे बाकी';
  }

  @override
  String taskSubmittedAt(String time) {
    return '$time ला पाठवले';
  }

  @override
  String taskVerifiedBy(String name) {
    return '$name यांनी तपासले';
  }

  @override
  String taskSentBackBy(String name) {
    return '$name यांनी परत पाठवले';
  }

  @override
  String get taskAskToUnlock => 'अनलॉकसाठी SM ला विचारा';

  @override
  String get taskMarkedNotDone => 'केले नाही असे नोंदवले';

  @override
  String taskHeader(String section, int number) {
    return '$section · #$number';
  }

  @override
  String taskAssignedTo(String team) {
    return '$team कडे सोपवले';
  }

  @override
  String taskDueAt(String time) {
    return '$time पर्यंत';
  }

  @override
  String taskDueSoonLeft(int minutes) {
    return 'लवकरच · $minutes मिनिटे बाकी';
  }

  @override
  String taskReopenedLeft(int minutes) {
    return 'पुन्हा उघडले · $minutes मिनिटे बाकी';
  }

  @override
  String get taskPhotoProof => 'फोटो पुरावा*';

  @override
  String get taskTapToOpenCamera => 'कॅमेरा उघडण्यासाठी टॅप करा';

  @override
  String get taskRetake => 'पुन्हा काढा';

  @override
  String get taskRemarks => 'टिप्पणी';

  @override
  String get taskRemarksHint => 'SM ला काही सांगायचे असल्यास';

  @override
  String get taskCantTakePhoto => 'फोटो काढता येत नाही? SM ला कारण सांगा';

  @override
  String get taskUsePhotoInstead => 'त्याऐवजी फोटो काढा';

  @override
  String get taskNotDoneReason => 'फोटो का काढता येत नाही?*';

  @override
  String get taskNotDoneHint => 'काय अडचण आहे ते SM ला सांगा';

  @override
  String taskAutoPosted(String group) {
    return 'तुमचा फोटो $group ग्रुपमध्येही आपोआप पोस्ट होतो.';
  }

  @override
  String get taskTakePhotoFirst => 'आधी फोटो काढा';

  @override
  String get taskSubmit => 'सबमिट करा';

  @override
  String get taskSubmitNotDone => 'केले नाही म्हणून सबमिट करा';

  @override
  String get taskRetakePhoto => 'फोटो पुन्हा काढा';

  @override
  String taskFromManager(String name) {
    return '$name (SM) कडून';
  }

  @override
  String get taskEarlierPhoto => 'तुमचा आधीचा फोटो';

  @override
  String get taskYourPhoto => 'तुमचा फोटो';

  @override
  String taskMissedWasDue(String time) {
    return 'चुकले · $time पर्यंत होते';
  }

  @override
  String taskLockedAt(String time) {
    return '$time ला काम लॉक झाले';
  }

  @override
  String get taskLockedHelp =>
      'फक्त तुमचे स्टोअर मॅनेजर हे काम अनलॉक करू शकतात. अनलॉक झाल्यास तुम्हाला 30 मिनिटे मिळतील आणि ते उशिरा म्हणून दिसेल.';

  @override
  String taskOpensLater(String time) {
    return 'हे काम $time ला सुरू होईल.';
  }

  @override
  String get taskBackToChecklist => 'चेकलिस्टकडे परत';

  @override
  String taskUploading(int percent) {
    return 'फोटो अपलोड होत आहे… $percent%';
  }

  @override
  String get cameraOnly => 'फक्त कॅमेरा · गॅलरी बंद';

  @override
  String get cameraClose => 'कॅमेरा बंद करा';

  @override
  String get cameraTakePhoto => 'फोटो काढा';

  @override
  String get cameraSwitch => 'कॅमेरा बदला';

  @override
  String get cameraDenied =>
      'कॅमेरा ब्लॉक आहे. ब्राउझर किंवा फोन सेटिंग्जमध्ये तो चालू करा आणि पुन्हा प्रयत्न करा.';

  @override
  String get cameraUnavailable => 'या डिव्हाइसवर कॅमेरा सापडला नाही.';

  @override
  String get resultConfirmed => 'पुष्टी झाली';

  @override
  String get resultActionNeeded => 'कृती आवश्यक';

  @override
  String get submittedTitle => 'तपासणीसाठी पाठवले';

  @override
  String submittedBody(String manager) {
    return 'तुमचा फोटो आणि टिप्पणी तुमचे स्टोअर मॅनेजर $manager यांना पाठवले.';
  }

  @override
  String get submittedNotDoneTitle => 'तुमच्या SM ला पाठवले';

  @override
  String submittedNotDoneBody(String manager) {
    return 'तुमचे कारण तुमचे स्टोअर मॅनेजर $manager यांना पाठवले.';
  }

  @override
  String submittedAtOnTime(String time) {
    return '$time ला सबमिट केले · वेळेवर';
  }

  @override
  String submittedAtLate(String time) {
    return '$time ला सबमिट केले · उशिरा';
  }

  @override
  String submittedPosted(String group) {
    return 'फोटो $group मध्ये पोस्ट केला';
  }

  @override
  String get interruptedTitle => 'तुमचा फोटो सेव्ह आहे';

  @override
  String get interruptedBody =>
      'काम पाठवण्यापूर्वी कनेक्शन तुटले. ही स्क्रीन उघडी ठेवा आणि ऑनलाइन आल्यावर पुन्हा प्रयत्न करा.';

  @override
  String get interruptedWaiting => 'फोटो काढला · अपलोडची वाट';

  @override
  String get interruptedNotSubmitted => 'काम अजून सबमिट झालेले नाही.';

  @override
  String get interruptedRetry => 'पुन्हा अपलोड करा';

  @override
  String get interruptedBack => 'कामाकडे परत';

  @override
  String get caughtUpTitle => 'सगळी कामे पूर्ण';

  @override
  String get caughtUpBody =>
      'सध्या तुमच्यासाठी कोणतेही काम नाही. पुढचे काम सुरू झाल्यावर आम्ही कळवू.';

  @override
  String caughtUpNext(String task) {
    return 'पुढचे काम  $task';
  }

  @override
  String caughtUpOpens(String time) {
    return 'आज $time ला सुरू';
  }

  @override
  String get homeOpenCamera => 'कॅमेरा उघडा';

  @override
  String validationTooLong(int max) {
    return '$max अक्षरांपेक्षा कमी लिहा.';
  }

  @override
  String get validationReasonRequired => 'कृपया कारण लिहा.';

  @override
  String validationReasonTooShort(int min) {
    return 'किमान $min अक्षरे लिहा.';
  }

  @override
  String get menuOpen => 'मेनू उघडा';

  @override
  String get menuMyTeam => 'माझी टीम';

  @override
  String menuRoleLine(String role, String roles) {
    return '$role · $roles';
  }

  @override
  String get roleStaff => 'स्टाफ';

  @override
  String get roleStoreManager => 'स्टोअर मॅनेजर';

  @override
  String get roleAdmin => 'ॲडमिन';

  @override
  String get profileTitle => 'माझे प्रोफाइल';

  @override
  String get profileEmployeeId => 'कर्मचारी आयडी';

  @override
  String get profileMobile => 'मोबाइल (लॉगिन)';

  @override
  String get profileStore => 'स्टोअर';

  @override
  String get profileReportsTo => 'रिपोर्टिंग';

  @override
  String get profileEmergencyContact => 'आपत्कालीन संपर्क';

  @override
  String get profileThisMonth => 'या महिन्यात';

  @override
  String profileOnTime(int percent) {
    return '$percent% वेळेवर';
  }

  @override
  String profileDoneMissed(int done, int missed) {
    return 'झाले $done · चुकले $missed';
  }

  @override
  String get settingsTitle => 'सेटिंग्ज';

  @override
  String get settingsLanguage => 'भाषा';

  @override
  String get settingsNotifications => 'नोटिफिकेशन्स';

  @override
  String get settingsTaskReminders => 'कामाची आठवण';

  @override
  String get settingsAlwaysOn => 'नेहमी चालू';

  @override
  String get settingsChatMessages => 'चॅट संदेश';

  @override
  String get settingsAnnouncements => 'घोषणा';

  @override
  String get logOut => 'लॉग आउट';

  @override
  String get logOutAllDevices => 'सर्व डिव्हाइसवरून लॉग आउट';

  @override
  String get listEmpty => 'इथे अजून काही नाही.';

  @override
  String get notificationsTitle => 'नोटिफिकेशन्स';

  @override
  String notificationsUnread(int count) {
    return '$count न वाचलेले';
  }

  @override
  String get notificationsMarkAllRead => 'सर्व वाचले';

  @override
  String get filterAllPlain => 'सर्व';

  @override
  String notificationsUnreadTab(int count) {
    return 'न वाचलेले ($count)';
  }

  @override
  String get notificationsEmpty => 'सगळे वाचून झाले.';

  @override
  String notificationMeta(String source, String time) {
    return '$source · $time';
  }

  @override
  String get notificationUnreadDot => 'न वाचलेले';

  @override
  String get navChat => 'चॅट';

  @override
  String get navAlerts => 'सूचना';

  @override
  String get chatTitle => 'चॅट';

  @override
  String get chatSearch => 'चॅट शोधा';

  @override
  String get chatEmpty => 'अजून कोणतेही चॅट नाहीत.';

  @override
  String get chatNoMatch => 'शोधाशी जुळणारे चॅट नाहीत.';

  @override
  String get chatMuted => 'म्यूट';

  @override
  String chatMembers(int count) {
    return '$count सदस्य';
  }

  @override
  String get chatMute => 'हे चॅट म्यूट करा';

  @override
  String get chatUnmute => 'हे चॅट अनम्यूट करा';

  @override
  String get chatPinned => 'पिन केलेले';

  @override
  String get chatNoMessages => 'अजून संदेश नाहीत. नमस्कार म्हणा.';

  @override
  String get chatLoadOlder => 'जुने संदेश पाहा';

  @override
  String chatSenderWithRole(String name, String role) {
    return '$name · $role';
  }

  @override
  String get chatNotSent => 'पाठवले नाही';

  @override
  String get chatReport => 'संदेशाची तक्रार करा';

  @override
  String get chatReported => 'तक्रार नोंदवली. ॲडमिन तपासतील.';

  @override
  String get chatSending => 'पाठवत आहे…';

  @override
  String get chatFailedRetry => 'अयशस्वी — पुन्हा प्रयत्नासाठी टॅप करा';

  @override
  String chatSeenBy(String time, int count) {
    return '$time · ✓✓ $count जणांनी पाहिले';
  }

  @override
  String get chatPhoto => 'फोटो';

  @override
  String get chatReadOnly => 'इथे फक्त ॲडमिन पोस्ट करू शकतात.';

  @override
  String chatMutedNotice(String time) {
    return '3 संदेश ब्लॉक झाल्याने तुम्ही $time पर्यंत म्यूट आहात. ॲडमिनला कळवले आहे.';
  }

  @override
  String get chatMessageHint => 'संदेश';

  @override
  String get chatSend => 'पाठवा';

  @override
  String get chatBlockedAbuse => 'या संदेशात परवानगी नसलेले शब्द आहेत.';

  @override
  String get chatBlockedLink => 'चॅटमध्ये लिंक शेअर करता येत नाहीत.';

  @override
  String get chatBlockedFlood => 'तुम्ही खूप वेगाने पाठवत आहात. थोडे थांबा.';

  @override
  String get chatBlockedSensitive =>
      'हा पासवर्ड किंवा OTP सारखा दिसतो. चॅटमध्ये कधीही शेअर करू नका.';

  @override
  String get chatBlockedMuted => 'तुम्ही सध्या म्यूट आहात. ॲडमिनला कळवले आहे.';

  @override
  String get taskMessageManager => 'माझ्या SM ला संदेश';

  @override
  String get submittedViewChat => 'चेकलिस्ट चॅट पाहा';

  @override
  String get managerSections => 'विभाग';

  @override
  String get managerAllChecklist => 'संपूर्ण चेकलिस्ट';

  @override
  String get managerActivitiesDone => 'कामे पूर्ण';

  @override
  String managerToReview(int count) {
    return '$count तपासायचे';
  }

  @override
  String managerMissed(int count) {
    return '$count चुकले';
  }

  @override
  String managerNotDone(int count) {
    return '$count केले नाही';
  }

  @override
  String get sectionInProgress => 'सुरू आहे';

  @override
  String sectionCritical(int count) {
    return 'गंभीर · $count चुकले';
  }

  @override
  String get sectionReady => 'सबमिट करण्यास तयार';

  @override
  String get sectionSubmitted => 'HO ला पाठवले';

  @override
  String get sectionApproved => 'HO ने मंजूर केले';

  @override
  String get sectionReturned => 'HO ने परत केले';

  @override
  String managerSalesMtd(String month) {
    return 'विक्री · $month MTD';
  }

  @override
  String amountOf(String amount, String target) {
    return '$target पैकी $amount';
  }

  @override
  String dsrDueBy(String time) {
    return 'DSR $time पर्यंत';
  }

  @override
  String percent(int percent) {
    return '$percent%';
  }

  @override
  String get sectionReportsTitle => 'विभाग अहवाल';

  @override
  String get reviewNothing => 'सध्या इथे काही नाही.';

  @override
  String reviewNeedsReview(int count) {
    return 'तपासायचे $count';
  }

  @override
  String reviewNotDone(int count) {
    return 'केले नाही $count';
  }

  @override
  String reviewOpenNow(int count) {
    return 'आता सुरू $count';
  }

  @override
  String reviewNotDoneLine(String name, String reason) {
    return 'केले नाही · $name · “$reason”';
  }

  @override
  String reviewToday(String time) {
    return 'आज $time';
  }

  @override
  String get reviewTitle => 'अहवाल तपासणी';

  @override
  String get reviewMissedTitle => 'चुकलेले काम';

  @override
  String get reviewChipNeedsReview => 'तपासायचे';

  @override
  String reviewSubmittedBy(String name) {
    return '$name यांनी सबमिट केले';
  }

  @override
  String get reviewReason => 'कारण';

  @override
  String reviewAssignedTo(String name, String role) {
    return '$name · $role यांना सोपवले';
  }

  @override
  String reviewLockedAt(String time) {
    return 'चुकले · $time ला लॉक';
  }

  @override
  String reviewUnlockTitle(int minutes) {
    return '$minutes मिनिटांसाठी अनलॉक करा';
  }

  @override
  String reviewUnlockBody(String name, String time) {
    return '$name यांना सूचना मिळेल आणि ते $time पर्यंत सबमिट करू शकतात. अहवालात हे काम उशिरा दिसेल.';
  }

  @override
  String get reviewDoItTitle => 'स्वतः करा';

  @override
  String get reviewDoItBody =>
      '“SM ने केले” असे नोंदवले जाईल. ॲडमिन विभाग अहवालासोबत तपासतील.';

  @override
  String get reviewVerify => 'तपासले';

  @override
  String get reviewEdit => 'बदला';

  @override
  String get reviewSendBack => 'परत पाठवा';

  @override
  String reviewUnlockFor(String name) {
    return '$name साठी अनलॉक करा';
  }

  @override
  String get reviewDoItMyself => 'मी स्वतः करतो';

  @override
  String get reviewLeaveMissed => 'चुकलेलेच ठेवा';

  @override
  String get reviewUnlockedTitle => 'काम अनलॉक केले';

  @override
  String get reviewVerifiedTitle => 'नोंद तपासली';

  @override
  String reviewUnlockedBody(String name) {
    return '$name आता सबमिट करू शकतात. हे उशिरा दिसेल.';
  }

  @override
  String reviewVerifiedBody(String name) {
    return '$name यांचे काम तपासले गेले. हे त्यांच्या चेकलिस्टमध्ये दिसते.';
  }

  @override
  String reviewVerifiedBy(String name) {
    return '$name यांनी तपासले';
  }

  @override
  String get reviewHistoryKept => 'मूळ पुरावा कामाच्या इतिहासात राहतो';

  @override
  String get reviewBackToQueue => 'तपासणीकडे परत';

  @override
  String get sendBackPhotoBlurry => 'फोटो अस्पष्ट';

  @override
  String get sendBackWrongArea => 'चुकीची जागा';

  @override
  String get sendBackNotDone => 'काम केले नाही';

  @override
  String get sendBackTitle => 'स्टाफला परत पाठवा';

  @override
  String get sendBackBody => 'त्यांच्यासाठी काम पुन्हा 30 मिनिटांसाठी उघडेल.';

  @override
  String get sendBackQuick => 'झटपट कारणे';

  @override
  String get sendBackReason => 'कारण*';

  @override
  String get editTitle => 'नोंद बदला';

  @override
  String get editPhotoUnclear => 'फोटो अस्पष्ट';

  @override
  String get editWrongPhoto => 'चुकीचा फोटो';

  @override
  String get editRemarkMissing => 'टिप्पणी नाही';

  @override
  String get editOther => 'इतर';

  @override
  String get editBody =>
      'त्यांचा मूळ फोटो आणि टिप्पणी इतिहासात राहते आणि त्यांना कळवले जाते.';

  @override
  String get editNewPhoto => 'नवीन फोटो*';

  @override
  String get editWhy => 'तुम्ही का बदलत आहात?*';

  @override
  String get editSave => 'बदल सेव्ह करा';

  @override
  String get teamTitle => 'माझी टीम';

  @override
  String teamSubtitle(String store, int count) {
    return '$store · $count स्टाफ';
  }

  @override
  String get teamCreateLogin => '+ स्टाफ लॉगिन तयार करा';

  @override
  String teamActive(int count) {
    return 'सक्रिय $count';
  }

  @override
  String teamInvited(int count) {
    return 'SMS पाठवला $count';
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
      other: '$days दिवसांपूर्वी',
      one: '1 दिवसापूर्वी',
      zero: 'आज',
    );
    return '$roles · SMS $_temp0 पाठवला, साइन इन नाही';
  }

  @override
  String teamLeftLine(String roles, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days दिवसांपूर्वी',
      one: '1 दिवसापूर्वी',
      zero: 'आज',
    );
    return '$roles · $_temp0 सोडले';
  }

  @override
  String get teamStatusActive => 'सक्रिय';

  @override
  String get teamStatusDeactivated => 'बंद';

  @override
  String get teamSmsSent => 'SMS पाठवला';

  @override
  String get teamResendSms => 'SMS पुन्हा पाठवा';

  @override
  String teamLoginCreated(String name) {
    return 'लॉगिन तयार झाले. $name यांना SMS मिळेल.';
  }

  @override
  String get teamStep1 => 'पायरी 1/3 · तपशील';

  @override
  String get teamStep2 => 'पायरी 2/3 · एक किंवा अधिक निवडा';

  @override
  String get teamStep3 => 'पायरी 3/3 · तपासा आणि पाठवा';

  @override
  String get teamNewLogin => 'नवीन स्टाफ लॉगिन';

  @override
  String get teamSmsFailedTitle => 'लॉगिन तयार. SMS गेला नाही.';

  @override
  String teamSmsFailedBody(String name) {
    return '$name यांचे लॉगिन तयार आहे, पण आमंत्रण पोहोचले नाही. नंबर तपासा आणि पुन्हा प्रयत्न करा.';
  }

  @override
  String get teamNotSignedIn => 'खाते स्थिती · साइन इन नाही';

  @override
  String get teamBackToTeam => 'टीमकडे परत';

  @override
  String get teamPhoneTaken =>
      'या नंबरचे आधीच लॉगिन आहे. व्यक्ती हलवण्यासाठी ॲडमिनला सांगा.';

  @override
  String get teamFullName => 'पूर्ण नाव*';

  @override
  String get teamFullNameHint => 'ओळखपत्राप्रमाणे · फक्त अक्षरे';

  @override
  String get actionNext => 'पुढे';

  @override
  String get teamJobRoles => 'कामाच्या भूमिका';

  @override
  String get teamTasksFromRoles => 'या भूमिकांची कामे';

  @override
  String get teamAddTask => '+ काम जोडा';

  @override
  String teamPhoneStore(String countryCode, String phone, String store) {
    return '$countryCode $phone · $store';
  }

  @override
  String get teamJobRole => 'भूमिका';

  @override
  String get teamTasks => 'कामे';

  @override
  String get teamChatGroups => 'चॅट ग्रुप';

  @override
  String get teamDefaultGroups => 'स्टोअर टीम, चेकलिस्ट';

  @override
  String teamSmsPreviewTitle(String name) {
    return '$name यांना मिळणारा SMS';
  }

  @override
  String teamSmsPreview(String name) {
    return 'नमस्कार $name, तुमचे rapsap ops लॉगिन तयार आहे. या नंबरने OTP वापरून साइन इन करा. - Rapsap';
  }

  @override
  String get teamCreateAndSend => 'तयार करा आणि SMS पाठवा';

  @override
  String get teamSaved => 'बदल सेव्ह झाले.';

  @override
  String get teamDeactivatedDone => 'लॉगिन बंद केले.';

  @override
  String get teamReactivatedDone => 'लॉगिन पुन्हा सुरू केले.';

  @override
  String get teamChangeNumber => 'नंबर बदला';

  @override
  String get teamReactivate => 'लॉगिन पुन्हा सुरू करा';

  @override
  String get teamDeactivate => 'लॉगिन बंद करा';

  @override
  String teamDeactivateTitle(String name) {
    return '$name यांचे लॉगिन बंद करायचे?';
  }

  @override
  String get teamDeactivateSignedOut => 'सर्व फोनवरून लगेच साइन आउट';

  @override
  String get teamDeactivateGroups => 'स्टोअर चॅट ग्रुपमधून काढले जाईल';

  @override
  String get teamDeactivateHistory => 'जुनी कामे आणि फोटो अहवालात राहतील';

  @override
  String get teamDeactivateReactivate => 'तुम्ही नंतर पुन्हा सुरू करू शकता';

  @override
  String teamReactivateTitle(String name) {
    return '$name यांचा प्रवेश पुन्हा द्यायचा?';
  }

  @override
  String get teamReactivateTasks => 'सुरू केल्यावर पुढील कामे पुन्हा मिळतील.';

  @override
  String get actionCancel => 'रद्द करा';

  @override
  String teamNumberUpdated(String countryCode, String phone) {
    return 'नंबर बदलला. ते आता $countryCode $phone ने साइन इन करू शकतात.';
  }

  @override
  String get teamVerifyNumber => 'नवीन नंबर पडताळा';

  @override
  String get teamNewNumber => 'नवीन मोबाइल नंबर*';

  @override
  String get teamChangeNumberHelp =>
      'आम्ही नवीन नंबरवर OTP पाठवू. पुष्टीसाठी ते तुम्हाला वाचून सांगतील. त्यांची कामे, इतिहास आणि ग्रुप तसेच राहतील.';

  @override
  String get teamSendOtpNew => 'नवीन नंबरवर OTP पाठवा';

  @override
  String teamAskForOtp(String countryCode, String phone) {
    return '$countryCode $phone वर पाठवलेला 6 अंकी OTP त्यांना विचारा';
  }

  @override
  String get teamDidntArrive => 'आला नाही?';

  @override
  String get teamVerifyAndUpdate => 'पडताळा आणि बदला';

  @override
  String get validationNameRequired => 'पूर्ण नाव टाका.';

  @override
  String validationNameLength(int min, int max) {
    return 'नाव $min–$max अक्षरांचे असावे.';
  }

  @override
  String get validationNameLetters => 'फक्त अक्षरे वापरा.';

  @override
  String listSeparatorJoin(String first, String second) {
    return '$first · $second';
  }

  @override
  String get reportNotReady => 'तयार नाही';

  @override
  String get reportReady => 'तयार';

  @override
  String reportSubmittedAt(String time) {
    return 'HO ला पाठवले · $time';
  }

  @override
  String reportApprovedAt(String time) {
    return 'HO ने मंजूर केले · $time';
  }

  @override
  String get reportReturned => 'HO ने परत केले';

  @override
  String get reportSnapshot => 'स्नॅपशॉट';

  @override
  String get reportFix => 'दुरुस्त करून पुन्हा पाठवा';

  @override
  String reportReturnedLine(int number, String comment) {
    return 'परत: #$number $comment';
  }

  @override
  String reportOpensWithSummary(String time) {
    return '$time ला सुरू · दैनिक सारांशासह';
  }

  @override
  String get reportSendAfterLast => 'शेवटचे काम बंद झाल्यावर पाठवा';

  @override
  String reportStats(int notDone, int photos, int toVerify) {
    return '$notDone केले नाही · $photos फोटो · $toVerify तपासायचे';
  }

  @override
  String get reportNote => 'HO साठी टीप (ऐच्छिक)';

  @override
  String get reportSubmit => 'HO ला पाठवा';

  @override
  String get reportWalkthrough => '#46 स्टोअर वॉकथ्रू व्हिडिओ';

  @override
  String get reportClosing => '#47 क्लोजिंग अहवाल';

  @override
  String get reportDailySummary => 'दैनिक सारांश आणि सबमिट';

  @override
  String get reportResubmittedTitle => 'पुन्हा तपासणीसाठी तयार';

  @override
  String get reportResubmittedBody =>
      'दुरुस्त पुरावा जोडला आहे. आधीचे सबमिशन इतिहासात राहते.';

  @override
  String reportRevision(String section, int revision) {
    return '$section अहवाल · आवृत्ती $revision';
  }

  @override
  String reportNewPhoto(int number) {
    return '#$number नवीन फोटो जोडला';
  }

  @override
  String get reportBackToReports => 'अहवालांकडे परत';

  @override
  String reportNeedsCorrection(String section) {
    return '$section मध्ये दुरुस्ती हवी';
  }

  @override
  String get reportReturnedBody =>
      'HO ने हा अहवाल परत केला. दाखवलेली नोंद दुरुस्त करा आणि सुधारित अहवाल पाठवा.';

  @override
  String reportReturnedAt(String time) {
    return 'आज $time ला परत केला';
  }

  @override
  String get reportSendRevised => 'सुधारित अहवाल पाठवा';

  @override
  String get reportFixEntry => 'नोंद दुरुस्त करा';

  @override
  String get summaryDsrFirstTitle => 'आधी आजचा DSR अपलोड करा';

  @override
  String get summaryDsrFirstBody =>
      'क्लोजिंग सारांशासाठी आजची विक्री आणि बिलांची बेरीज लागते. तुमच्या बाकी नोंदी सेव्ह आहेत.';

  @override
  String summaryNotAvailable(String label) {
    return '$label · उपलब्ध नाही';
  }

  @override
  String get summarySales => 'एकूण विक्री';

  @override
  String get summaryBills => 'बिले (NOB)';

  @override
  String get summaryTicket => 'तिकीट साइज';

  @override
  String get summaryGoToSales => 'विक्रीकडे जा';

  @override
  String get summaryTitle => 'दैनिक सारांश';

  @override
  String get summarySubtitle => 'क्लोजिंग · दैनिक सारांश';

  @override
  String get summaryFromDsr => 'आजच्या DSR मधून · फक्त वाचा';

  @override
  String get summaryFixExcel => 'चूक आहे? Excel दुरुस्त करून पुन्हा अपलोड करा.';

  @override
  String get summaryMargin => 'मार्जिन %*';

  @override
  String get summaryComplaints => 'ग्राहक तक्रारी*';

  @override
  String get summaryDamages => 'नुकसान ₹*';

  @override
  String get summaryShrinkage => 'श्रिंकेज ₹*';

  @override
  String summaryManpower(int total) {
    return 'हजर मनुष्यबळ ($total पैकी)*';
  }

  @override
  String get summaryKeyIssues => 'HO साठी मुख्य मुद्दे';

  @override
  String get summarySend => 'HO ला पाठवा';

  @override
  String get validationNumberRequired => 'संख्या टाका.';

  @override
  String validationNumberRange(int min, int max) {
    return '$min ते $max मधील संख्या टाका.';
  }

  @override
  String get snapshotPostTo => 'इथे पोस्ट करा';

  @override
  String get snapshotPost => 'चॅटमध्ये पोस्ट करा';

  @override
  String get snapshotSharedTitle => 'अहवाल शेअर केला';

  @override
  String get snapshotSharedBody => 'तुमचा स्नॅपशॉट यशस्वीपणे पोस्ट झाला.';

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
  String get closingSent => 'क्लोजिंग अहवाल पाठवला.';

  @override
  String get closingShutter => 'शटर फोटो*';

  @override
  String closingSubtitle(String time) {
    return 'क्लोजिंग · #47 · $time पर्यंत';
  }

  @override
  String get closingTime => 'बंद करण्याची वेळ';

  @override
  String get closingTimeHelp => 'सबमिट करताना घड्याळावरून घेतली जाते.';

  @override
  String closingEarly(String time) {
    return '$time च्या आधी';
  }

  @override
  String get closingWho => 'स्टोअर कोणी बंद केले?*';

  @override
  String closingFlagNote(String time) {
    return '$time च्या आधी बंद केल्यास ॲडमिनला कळवले जाते.';
  }

  @override
  String get walkthroughSent => 'वॉकथ्रू व्हिडिओ पाठवला.';

  @override
  String get walkthroughTitle => '#46 स्टोअर वॉकथ्रू';

  @override
  String walkthroughSubtitle(String time) {
    return 'फ्लोअर + बॅक स्टोअर · $time पर्यंत';
  }

  @override
  String walkthroughRec(String elapsed, String limit) {
    return '● REC $elapsed / $limit';
  }

  @override
  String get walkthroughStop => 'रेकॉर्डिंग थांबवा';

  @override
  String get walkthroughStart => 'रेकॉर्डिंग सुरू करा';

  @override
  String get walkthroughReviewTitle => 'तुमचा वॉकथ्रू तपासा';

  @override
  String get walkthroughReviewBody =>
      'पाठवण्यापूर्वी फ्लोअर आणि बॅक स्टोअर स्पष्ट दिसत आहेत का ते पाहा.';

  @override
  String get walkthroughPlay => 'व्हिडिओ चालू किंवा थांबवा';

  @override
  String walkthroughMeta(String time) {
    return 'काम #46 · आज, $time';
  }

  @override
  String get walkthroughSend => 'व्हिडिओ पाठवा';

  @override
  String get navSales => 'विक्री';

  @override
  String get salesTitle => 'विक्री (DSR)';

  @override
  String get dsrNotUploaded => 'अपलोड नाही';

  @override
  String dsrUploadedOnTime(String time) {
    return '$time ला अपलोड · वेळेवर';
  }

  @override
  String dsrUploadedLate(String time) {
    return '$time ला अपलोड · उशिरा';
  }

  @override
  String get dsrUpload => 'आजचा DSR Excel अपलोड करा';

  @override
  String get dsrReupload => 'पुन्हा अपलोड करा';

  @override
  String dsrMonthTarget(String month) {
    return '$month लक्ष्य';
  }

  @override
  String dsrAchieved(int percent) {
    return '$percent% साध्य';
  }

  @override
  String dsrNeedPerDay(String amount) {
    return 'उरलेल्या महिन्यासाठी दररोज $amount हवे';
  }

  @override
  String get dsrTrend => 'कल';

  @override
  String get dsrChange => 'बदला';

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
      'या कालावधीतील दैनिक विक्री, मागील कालावधीतील त्याच दिवसांशी तुलना';

  @override
  String get dsrLegend => '— हा कालावधी   - - मागील कालावधीचे तेच दिवस';

  @override
  String get dsrHistory => 'पोस्टिंग इतिहास';

  @override
  String get dsrOnTime => 'वेळेवर';

  @override
  String get dsrLate => 'उशिरा';

  @override
  String get dsrReading => 'तुमची फाइल वाचत आहे…';

  @override
  String get dsrCheckTitle => 'सेव्ह करण्यापूर्वी तपासा';

  @override
  String get dsrRejectedTitle => 'ही फाइल सेव्ह करता येत नाही';

  @override
  String get dsrXlsx => 'XLSX';

  @override
  String dsrFileMeta(int kb, String note) {
    return '$kb KB · $note';
  }

  @override
  String get dsrReadNow => 'आत्ताच वाचली';

  @override
  String get dsrNotReadable => 'स्वीकारली नाही';

  @override
  String get dsrDate => 'तारीख';

  @override
  String get dsrNetSales => 'निव्वळ विक्री';

  @override
  String get dsrMonthTargetShort => 'महिन्याचे लक्ष्य';

  @override
  String get dsrReplaces =>
      'या तारखेसाठी आधीच अपलोड केले आहे? सेव्ह केल्यास ते बदलेल. जुनी आवृत्ती इतिहासात राहील.';

  @override
  String get dsrSave => 'DSR सेव्ह करा';

  @override
  String dsrWrongStore(String store) {
    return 'हा $store चा DSR दिसतो. तुम्ही फक्त तुमच्या स्टोअरचा DSR अपलोड करू शकता. तुमच्या स्टोअरची आजची फाइल निवडा आणि पुन्हा प्रयत्न करा.';
  }

  @override
  String get dsrUnreadableDate => 'तारीख वाचता येत नाही';

  @override
  String get dsrNoSales => 'विक्रीचा आकडा नाही';

  @override
  String dsrTooLarge(int mb) {
    return '$mb MB पेक्षा मोठी';
  }

  @override
  String get dsrHasMacros => 'मॅक्रो आहेत';

  @override
  String get dsrOtherReasons => 'फाइल ब्लॉक होण्याची इतर कारणे';

  @override
  String get dsrUploadAnother => 'दुसरी फाइल अपलोड करा';

  @override
  String dsrSavedOnTime(String time) {
    return 'DSR सेव्ह · $time · वेळेवर';
  }

  @override
  String dsrSavedLate(String time) {
    return 'DSR सेव्ह · $time · उशिरा';
  }

  @override
  String dsrSnapshotTitle(String date) {
    return 'DSR · $date';
  }

  @override
  String dsrSnapshotLine(int bills, String ticket, int percent) {
    return '$bills बिले · $ticket तिकीट · MTD $percent%';
  }

  @override
  String get dsrReportsGroup => 'DSR Reports';

  @override
  String get dsrPostedBody => 'तुमचा DSR स्नॅपशॉट यशस्वीपणे पोस्ट झाला.';

  @override
  String dsrSalesBills(String sales, int bills) {
    return '$sales विक्री · $bills बिले';
  }

  @override
  String get dsrBackToSales => 'विक्रीकडे परत';

  @override
  String dsrChangePercent(String sign, String value) {
    return '$sign$value%';
  }

  @override
  String get installTitle => 'Rapsap Ops इन्स्टॉल करा';

  @override
  String get installBody =>
      'पुढे जाण्यासाठी ॲप तुमच्या फोनवर इन्स्टॉल करा. ते फुल स्क्रीनमध्ये उघडते आणि तुम्हाला टास्क अलर्ट पाठवते.';

  @override
  String get installNow => 'आता इन्स्टॉल करा';

  @override
  String get installIosStepShare => 'Safari टूलबारमधील शेअर बटण दाबा';

  @override
  String get installIosStepAdd =>
      'खाली स्क्रोल करा आणि \"Add to Home Screen\" दाबा';

  @override
  String get installBrowserStepMenu => 'ब्राउझर मेनू (⋮) उघडा';

  @override
  String get installBrowserStepAdd =>
      '\"Install app\" किंवा \"Add to Home screen\" दाबा';

  @override
  String get installStepOpen => 'होम स्क्रीनवरून Rapsap Ops उघडा';

  @override
  String get installIosNote =>
      'ही लिंक दुसऱ्या ॲपमध्ये उघडली आहे? आधी ती Safari मध्ये उघडा.';

  @override
  String get installBrowserNote =>
      'आधीच इन्स्टॉल केले आहे? होम स्क्रीनवरून Rapsap Ops उघडा.';

  @override
  String get installDoneTitle => 'ॲप इन्स्टॉल झाले';

  @override
  String get installDoneBody =>
      'हा टॅब बंद करा आणि होम स्क्रीनवरून Rapsap Ops उघडा.';
}
