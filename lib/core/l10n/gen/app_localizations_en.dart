// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Rapsap Ops';

  @override
  String get errorServer =>
      'Something went wrong on our side. Please try again.';

  @override
  String get errorUnauthorized =>
      'Your session has ended. Please sign in again.';

  @override
  String get errorForbidden => 'You don\'t have access to this.';

  @override
  String get errorNotFound => 'We couldn\'t find what you were looking for.';

  @override
  String get errorValidation => 'Please check the details and try again.';

  @override
  String get errorNoInternet =>
      'No internet connection. Check your mobile data or Wi-Fi.';

  @override
  String get errorTimeout => 'This is taking too long. Please try again.';

  @override
  String get errorCancelled => 'Request cancelled.';

  @override
  String get errorForceUpdate => 'Please update the app to continue.';

  @override
  String get errorStorage =>
      'Couldn\'t save data on this device. Please try again.';

  @override
  String get errorUnknown => 'Something went wrong. Please try again.';

  @override
  String get pageNotFoundTitle => 'Page not found';

  @override
  String get pageNotFoundAction => 'Go to start';

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
  String get languagePick => 'Choose Marathi or Hindi';

  @override
  String get offlineBanner =>
      'You\'re offline. Some actions won\'t work until you reconnect.';

  @override
  String get actionRetry => 'Try again';

  @override
  String get actionBack => 'Back';

  @override
  String get listSeparator => ' · ';

  @override
  String errorOtpInvalid(int attempts, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      attempts,
      locale: localeName,
      other: '$attempts tries left',
      one: '1 try left',
    );
    return 'That code didn\'t match. $_temp0 before this number is locked for $minutes minutes.';
  }

  @override
  String errorOtpLocked(int minutes) {
    return 'Too many wrong tries. This number is locked for $minutes minutes. Your store manager can unlock it.';
  }

  @override
  String get errorTooManyRequests =>
      'Too many OTP requests. Please try again later.';

  @override
  String get validationPhoneRequired => 'Enter your mobile number.';

  @override
  String get validationPhoneInvalid => 'Enter a valid 10-digit mobile number.';

  @override
  String get loginTitle => 'Operations';

  @override
  String get loginSubtitle =>
      'Complete store operations, report issues, and keep every shift accountable.';

  @override
  String get loginPhoneLabel => 'Mobile number';

  @override
  String get loginPhoneHint => '98765 43210';

  @override
  String get loginHelper =>
      'No sign-up here. Your store manager creates your login.';

  @override
  String get loginNoAccount =>
      'No login found for this number. Check the number or ask your store manager for help.';

  @override
  String get loginGetOtp => 'Get OTP';

  @override
  String get otpTitle => 'Enter OTP';

  @override
  String otpSentTo(String countryCode, String phone, int minutes) {
    return 'Sent to $countryCode $phone. Valid for $minutes minutes.';
  }

  @override
  String get otpDidntGet => 'Didn\'t get it?';

  @override
  String otpResendIn(String time) {
    return 'Resend in $time';
  }

  @override
  String get otpResend => 'Resend OTP';

  @override
  String get otpVerify => 'Verify';

  @override
  String welcomeTitle(String name) {
    return 'Welcome, $name';
  }

  @override
  String welcomeSubtitle(String roles, String store) {
    return '$roles · $store';
  }

  @override
  String get welcomeCollectTitle => 'What we collect';

  @override
  String get welcomeCollectBody =>
      'Your name, phone number and the task photos you take in the app. We use them to track the store checklist. Photos are kept for 5 months.';

  @override
  String get permissionCameraTitle => 'Camera';

  @override
  String get permissionCameraBody => 'To take task photos';

  @override
  String get permissionNotificationsTitle => 'Notifications';

  @override
  String get permissionNotificationsBody => 'Reminders 15 and 5 min before due';

  @override
  String get permissionAllow => 'Allow';

  @override
  String get permissionAllowed => 'Allowed';

  @override
  String get permissionBlocked => 'Blocked';

  @override
  String get permissionCameraDeniedHelp =>
      'Camera is blocked. Turn it on in your browser or phone settings, then tap Allow again.';

  @override
  String get welcomeAgree => 'Agree and continue';

  @override
  String get navHome => 'Home';

  @override
  String get navChecklist => 'Checklist';

  @override
  String get homeComingUp => 'Coming up';

  @override
  String get homeDoNow => 'Do this now';

  @override
  String homeDueAt(String section, String time) {
    return '$section · due $time';
  }

  @override
  String get statDone => 'Done';

  @override
  String get statMissed => 'Missed';

  @override
  String get statLeft => 'Left';

  @override
  String statDoneValue(int done, int total) {
    return '$done / $total';
  }

  @override
  String get shiftOpening => 'Opening shift';

  @override
  String get shiftMid => 'Mid shift';

  @override
  String get shiftClosing => 'Closing shift';

  @override
  String get checklistMyTitle => 'My checklist';

  @override
  String checklistDoneOf(int done, int total) {
    return '$done of $total';
  }

  @override
  String get checklistDoneToday => 'tasks done today';

  @override
  String get checklistEmpty => 'No tasks here right now.';

  @override
  String get checklistNoTasksToday => 'No tasks for you today.';

  @override
  String filterAll(int count) {
    return 'All $count';
  }

  @override
  String filterOpen(int count) {
    return 'Open $count';
  }

  @override
  String filterDone(int count) {
    return 'Done $count';
  }

  @override
  String filterMissed(int count) {
    return 'Missed $count';
  }

  @override
  String sectionWindow(String name, String from, String to) {
    return '$name · $from–$to';
  }

  @override
  String sectionFrom(String name, String from) {
    return '$name · from $from';
  }

  @override
  String taskTitle(int number, String title) {
    return '#$number $title';
  }

  @override
  String get taskChipLater => 'Later';

  @override
  String get taskChipDueSoon => 'Due soon';

  @override
  String get taskChipSubmitted => 'Sent to SM';

  @override
  String get taskChipVerified => 'Verified';

  @override
  String get taskChipSentBack => 'Sent back';

  @override
  String get taskChipMissed => 'Missed';

  @override
  String get taskChipNotDone => 'Not done';

  @override
  String taskOpensAt(String time) {
    return 'Opens $time';
  }

  @override
  String taskMinutesLeft(int minutes) {
    return '$minutes min left';
  }

  @override
  String taskSubmittedAt(String time) {
    return 'Submitted $time';
  }

  @override
  String taskVerifiedBy(String name) {
    return 'Verified by $name';
  }

  @override
  String taskSentBackBy(String name) {
    return 'Sent back by $name';
  }

  @override
  String get taskAskToUnlock => 'Ask your SM to unlock';

  @override
  String get taskMarkedNotDone => 'Marked not done';

  @override
  String taskHeader(String section, int number) {
    return '$section · #$number';
  }

  @override
  String taskAssignedTo(String team) {
    return 'Assigned to $team';
  }

  @override
  String taskDueAt(String time) {
    return 'Due $time';
  }

  @override
  String taskDueSoonLeft(int minutes) {
    return 'Due soon · $minutes min left';
  }

  @override
  String taskReopenedLeft(int minutes) {
    return 'Reopened · $minutes min left';
  }

  @override
  String get taskPhotoProof => 'Photo proof*';

  @override
  String get taskTapToOpenCamera => 'Tap to open camera';

  @override
  String get taskRetake => 'Retake';

  @override
  String get taskRemarks => 'Remarks';

  @override
  String get taskRemarksHint => 'Anything your SM should know';

  @override
  String get taskCantTakePhoto => 'Can\'t take a photo? Tell your SM why';

  @override
  String get taskUsePhotoInstead => 'Take a photo instead';

  @override
  String get taskNotDoneReason => 'Why can\'t you take a photo?*';

  @override
  String get taskNotDoneHint => 'Tell your SM what\'s stopping you';

  @override
  String taskAutoPosted(String group) {
    return 'Your photo is also posted to $group automatically.';
  }

  @override
  String get taskTakePhotoFirst => 'Take photo first';

  @override
  String get taskSubmit => 'Submit';

  @override
  String get taskSubmitNotDone => 'Submit as not done';

  @override
  String get taskRetakePhoto => 'Retake photo';

  @override
  String taskFromManager(String name) {
    return 'From $name (SM)';
  }

  @override
  String get taskEarlierPhoto => 'Your earlier photo';

  @override
  String get taskYourPhoto => 'Your photo';

  @override
  String taskMissedWasDue(String time) {
    return 'Missed · was due $time';
  }

  @override
  String taskLockedAt(String time) {
    return 'Task locked at $time';
  }

  @override
  String get taskLockedHelp =>
      'Only your store manager can unlock this task. If unlocked, you get 30 minutes and it shows as late.';

  @override
  String taskOpensLater(String time) {
    return 'This task opens at $time.';
  }

  @override
  String get taskBackToChecklist => 'Back to checklist';

  @override
  String taskUploading(int percent) {
    return 'Uploading photo… $percent%';
  }

  @override
  String get cameraOnly => 'Camera only · gallery is off';

  @override
  String get cameraClose => 'Close camera';

  @override
  String get cameraTakePhoto => 'Take photo';

  @override
  String get cameraSwitch => 'Switch camera';

  @override
  String get cameraDenied =>
      'Camera is blocked. Turn it on in your browser or phone settings and try again.';

  @override
  String get cameraUnavailable => 'No camera found on this device.';

  @override
  String get resultConfirmed => 'Confirmed';

  @override
  String get resultActionNeeded => 'Action needed';

  @override
  String get submittedTitle => 'Sent for review';

  @override
  String submittedBody(String manager) {
    return 'Your photo and remarks have been sent to $manager, your store manager.';
  }

  @override
  String get submittedNotDoneTitle => 'Sent to your SM';

  @override
  String submittedNotDoneBody(String manager) {
    return 'Your reason has been sent to $manager, your store manager.';
  }

  @override
  String submittedAtOnTime(String time) {
    return 'Submitted at $time · On time';
  }

  @override
  String submittedAtLate(String time) {
    return 'Submitted at $time · Late';
  }

  @override
  String submittedPosted(String group) {
    return 'Photo posted to $group';
  }

  @override
  String get interruptedTitle => 'Your photo is saved';

  @override
  String get interruptedBody =>
      'The connection dropped before your task could be sent. Keep this screen open and retry when you\'re online.';

  @override
  String get interruptedWaiting => 'Photo captured · Waiting to upload';

  @override
  String get interruptedNotSubmitted => 'The task is not submitted yet.';

  @override
  String get interruptedRetry => 'Retry upload';

  @override
  String get interruptedBack => 'Back to task';

  @override
  String get caughtUpTitle => 'You\'re all caught up';

  @override
  String get caughtUpBody =>
      'No tasks need your attention right now. We\'ll let you know when the next one opens.';

  @override
  String caughtUpNext(String task) {
    return 'Next task  $task';
  }

  @override
  String caughtUpOpens(String time) {
    return 'Opens today at $time';
  }

  @override
  String get homeOpenCamera => 'Open camera';

  @override
  String validationTooLong(int max) {
    return 'Keep it under $max characters.';
  }

  @override
  String get validationReasonRequired => 'Please write a reason.';

  @override
  String validationReasonTooShort(int min) {
    return 'Write at least $min characters.';
  }

  @override
  String get menuOpen => 'Open menu';

  @override
  String get menuMyTeam => 'My Team';

  @override
  String menuRoleLine(String role, String roles) {
    return '$role · $roles';
  }

  @override
  String get roleStaff => 'Staff';

  @override
  String get roleStoreManager => 'Store Manager';

  @override
  String get roleAdmin => 'Admin';

  @override
  String get profileTitle => 'My profile';

  @override
  String get profileEmployeeId => 'Employee ID';

  @override
  String get profileMobile => 'Mobile (login)';

  @override
  String get profileStore => 'Store';

  @override
  String get profileReportsTo => 'Reports to';

  @override
  String get profileEmergencyContact => 'Emergency contact';

  @override
  String get profileThisMonth => 'This month';

  @override
  String profileOnTime(int percent) {
    return '$percent% on time';
  }

  @override
  String profileDoneMissed(int done, int missed) {
    return 'Done $done · Missed $missed';
  }

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsTaskReminders => 'Task reminders';

  @override
  String get settingsAlwaysOn => 'Always on';

  @override
  String get settingsChatMessages => 'Chat messages';

  @override
  String get settingsAnnouncements => 'Announcements';

  @override
  String get logOut => 'Log out';

  @override
  String get logOutAllDevices => 'Log out on all devices';

  @override
  String get listEmpty => 'Nothing here yet.';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String notificationsUnread(int count) {
    return '$count unread';
  }

  @override
  String get notificationsMarkAllRead => 'Mark all read';

  @override
  String get filterAllPlain => 'All';

  @override
  String notificationsUnreadTab(int count) {
    return 'Unread ($count)';
  }

  @override
  String get notificationsEmpty => 'You\'re all caught up.';

  @override
  String notificationMeta(String source, String time) {
    return '$source · $time';
  }

  @override
  String get notificationUnreadDot => 'Unread';

  @override
  String get navChat => 'Chat';

  @override
  String get navAlerts => 'Alerts';

  @override
  String get chatTitle => 'Chat';

  @override
  String get chatSearch => 'Search chats';

  @override
  String get chatEmpty => 'No chats yet.';

  @override
  String get chatNoMatch => 'No chats match your search.';

  @override
  String get chatMuted => 'Muted';

  @override
  String chatMembers(int count) {
    return '$count members';
  }

  @override
  String get chatMute => 'Mute this chat';

  @override
  String get chatUnmute => 'Unmute this chat';

  @override
  String get chatPinned => 'Pinned';

  @override
  String get chatNoMessages => 'No messages yet. Say hello.';

  @override
  String get chatLoadOlder => 'Load older';

  @override
  String chatSenderWithRole(String name, String role) {
    return '$name · $role';
  }

  @override
  String get chatNotSent => 'Not sent';

  @override
  String get chatReport => 'Report message';

  @override
  String get chatReported => 'Message reported. Admin will review it.';

  @override
  String get chatSending => 'Sending…';

  @override
  String get chatFailedRetry => 'Failed — tap to retry';

  @override
  String chatSeenBy(String time, int count) {
    return '$time · ✓✓ Seen by $count';
  }

  @override
  String get chatPhoto => 'Photo';

  @override
  String get chatReadOnly => 'Only Admin can post here.';

  @override
  String chatMutedNotice(String time) {
    return 'You\'re muted until $time after 3 blocked messages. Admin has been told.';
  }

  @override
  String get chatMessageHint => 'Message';

  @override
  String get chatSend => 'Send';

  @override
  String get chatBlockedAbuse =>
      'This message has words that aren\'t allowed here.';

  @override
  String get chatBlockedLink => 'Links can\'t be shared in chat.';

  @override
  String get chatBlockedFlood => 'You\'re sending too fast. Wait a moment.';

  @override
  String get chatBlockedSensitive =>
      'This looks like a password or OTP. Never share them in chat.';

  @override
  String get chatBlockedMuted => 'You\'re muted for now. Admin has been told.';

  @override
  String get taskMessageManager => 'Message my SM';

  @override
  String get submittedViewChat => 'View checklist chat';

  @override
  String get managerSections => 'Sections';

  @override
  String get managerAllChecklist => 'All Checklist';

  @override
  String get managerActivitiesDone => 'activities completed';

  @override
  String managerToReview(int count) {
    return '$count to review';
  }

  @override
  String managerMissed(int count) {
    return '$count missed';
  }

  @override
  String managerNotDone(int count) {
    return '$count not done';
  }

  @override
  String get sectionInProgress => 'In progress';

  @override
  String sectionCritical(int count) {
    return 'Critical · $count missed';
  }

  @override
  String get sectionReady => 'Ready to submit';

  @override
  String get sectionSubmitted => 'Submitted to HO';

  @override
  String get sectionApproved => 'Approved by HO';

  @override
  String get sectionReturned => 'Returned by HO';

  @override
  String managerSalesMtd(String month) {
    return 'Sales · $month MTD';
  }

  @override
  String amountOf(String amount, String target) {
    return '$amount of $target';
  }

  @override
  String dsrDueBy(String time) {
    return 'DSR due by $time';
  }

  @override
  String percent(int percent) {
    return '$percent%';
  }

  @override
  String get sectionReportsTitle => 'Section reports';

  @override
  String get reviewNothing => 'Nothing here right now.';

  @override
  String reviewNeedsReview(int count) {
    return 'Needs review $count';
  }

  @override
  String reviewNotDone(int count) {
    return 'Not done $count';
  }

  @override
  String reviewOpenNow(int count) {
    return 'Open now $count';
  }

  @override
  String reviewNotDoneLine(String name, String reason) {
    return 'Not done · $name · “$reason”';
  }

  @override
  String reviewToday(String time) {
    return 'Today $time';
  }

  @override
  String get reviewTitle => 'Report review';

  @override
  String get reviewMissedTitle => 'Missed task';

  @override
  String get reviewChipNeedsReview => 'Needs review';

  @override
  String reviewSubmittedBy(String name) {
    return 'Submitted by $name';
  }

  @override
  String get reviewReason => 'Reason';

  @override
  String reviewAssignedTo(String name, String role) {
    return 'Assigned to $name · $role';
  }

  @override
  String reviewLockedAt(String time) {
    return 'Missed · locked at $time';
  }

  @override
  String reviewUnlockTitle(int minutes) {
    return 'Unlock for $minutes minutes';
  }

  @override
  String reviewUnlockBody(String name, String time) {
    return '$name gets a notification and can submit until $time. The task shows as late in reports.';
  }

  @override
  String get reviewDoItTitle => 'Do it yourself';

  @override
  String get reviewDoItBody =>
      'Marked “Done by SM”. Admin verifies it with the section report.';

  @override
  String get reviewVerify => 'Verify';

  @override
  String get reviewEdit => 'Edit';

  @override
  String get reviewSendBack => 'Send back';

  @override
  String reviewUnlockFor(String name) {
    return 'Unlock for $name';
  }

  @override
  String get reviewDoItMyself => 'Do it myself';

  @override
  String get reviewLeaveMissed => 'Leave missed';

  @override
  String get reviewUnlockedTitle => 'Task unlocked';

  @override
  String get reviewVerifiedTitle => 'Entry verified';

  @override
  String reviewUnlockedBody(String name) {
    return '$name can submit it now. It will show as late.';
  }

  @override
  String reviewVerifiedBody(String name) {
    return '$name\'s task is now verified. The update is visible in their checklist.';
  }

  @override
  String reviewVerifiedBy(String name) {
    return 'Verified by $name';
  }

  @override
  String get reviewHistoryKept => 'Original evidence stays in task history';

  @override
  String get reviewBackToQueue => 'Back to review';

  @override
  String get sendBackPhotoBlurry => 'Photo blurry';

  @override
  String get sendBackWrongArea => 'Wrong area';

  @override
  String get sendBackNotDone => 'Task not done';

  @override
  String get sendBackTitle => 'Send back to staff';

  @override
  String get sendBackBody => 'The task opens again for them for 30 minutes.';

  @override
  String get sendBackQuick => 'Quick reasons';

  @override
  String get sendBackReason => 'Reason*';

  @override
  String get editTitle => 'Edit entry';

  @override
  String get editPhotoUnclear => 'Photo unclear';

  @override
  String get editWrongPhoto => 'Wrong photo';

  @override
  String get editRemarkMissing => 'Remark missing';

  @override
  String get editOther => 'Other';

  @override
  String get editBody =>
      'Their original photo and remark stay in history and they are notified.';

  @override
  String get editNewPhoto => 'New photo*';

  @override
  String get editWhy => 'Why are you editing?*';

  @override
  String get editSave => 'Save changes';

  @override
  String get teamTitle => 'My team';

  @override
  String teamSubtitle(String store, int count) {
    return '$store · $count staff';
  }

  @override
  String get teamCreateLogin => '+ Create staff login';

  @override
  String teamActive(int count) {
    return 'Active $count';
  }

  @override
  String teamInvited(int count) {
    return 'SMS sent $count';
  }

  @override
  String teamDeactivated(int count) {
    return 'Deactivated $count';
  }

  @override
  String teamInvitedLine(String roles, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days ago',
      one: '1 day ago',
      zero: 'today',
    );
    return '$roles · SMS sent $_temp0, not signed in';
  }

  @override
  String teamLeftLine(String roles, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days ago',
      one: '1 day ago',
      zero: 'today',
    );
    return '$roles · left $_temp0';
  }

  @override
  String get teamStatusActive => 'Active';

  @override
  String get teamStatusDeactivated => 'Deactivated';

  @override
  String get teamSmsSent => 'SMS sent';

  @override
  String get teamResendSms => 'Resend SMS';

  @override
  String teamLoginCreated(String name) {
    return 'Login created. $name will get an SMS.';
  }

  @override
  String get teamStep1 => 'Step 1 of 3 · Details';

  @override
  String get teamStep2 => 'Step 2 of 3 · Pick one or more';

  @override
  String get teamStep3 => 'Step 3 of 3 · Review & send';

  @override
  String get teamNewLogin => 'New staff login';

  @override
  String get teamSmsFailedTitle => 'Login created. SMS not sent.';

  @override
  String teamSmsFailedBody(String name) {
    return '$name\'s login is ready, but the invitation could not be delivered. Check the number and try again.';
  }

  @override
  String get teamNotSignedIn => 'Account status · Not signed in';

  @override
  String get teamBackToTeam => 'Back to team';

  @override
  String get teamPhoneTaken =>
      'This number already has a login. Ask Admin to move the person.';

  @override
  String get teamFullName => 'Full name*';

  @override
  String get teamFullNameHint => 'As on ID card · letters only';

  @override
  String get actionNext => 'Next';

  @override
  String get teamJobRoles => 'Job roles';

  @override
  String get teamTasksFromRoles => 'Tasks from these roles';

  @override
  String get teamAddTask => '+ Add a task';

  @override
  String teamPhoneStore(String countryCode, String phone, String store) {
    return '$countryCode $phone · $store';
  }

  @override
  String get teamJobRole => 'Job role';

  @override
  String get teamTasks => 'Tasks';

  @override
  String get teamChatGroups => 'Chat groups';

  @override
  String get teamDefaultGroups => 'Store Team, Checklist';

  @override
  String teamSmsPreviewTitle(String name) {
    return 'SMS $name will get';
  }

  @override
  String teamSmsPreview(String name) {
    return 'Hi $name, your rapsap ops login is ready. Sign in with this number using OTP. - Rapsap';
  }

  @override
  String get teamCreateAndSend => 'Create & send SMS';

  @override
  String get teamSaved => 'Changes saved.';

  @override
  String get teamDeactivatedDone => 'Login deactivated.';

  @override
  String get teamReactivatedDone => 'Login reactivated.';

  @override
  String get teamChangeNumber => 'Change number';

  @override
  String get teamReactivate => 'Reactivate login';

  @override
  String get teamDeactivate => 'Deactivate login';

  @override
  String teamDeactivateTitle(String name) {
    return 'Deactivate $name\'s login?';
  }

  @override
  String get teamDeactivateSignedOut =>
      'Signed out on all phones straight away';

  @override
  String get teamDeactivateGroups => 'Removed from store chat groups';

  @override
  String get teamDeactivateHistory => 'Past tasks and photos stay in reports';

  @override
  String get teamDeactivateReactivate => 'You can reactivate them later';

  @override
  String teamReactivateTitle(String name) {
    return 'Restore $name\'s access?';
  }

  @override
  String get teamReactivateTasks =>
      'Future assigned tasks resume after activation.';

  @override
  String get actionCancel => 'Cancel';

  @override
  String teamNumberUpdated(String countryCode, String phone) {
    return 'Number updated. They can now sign in with $countryCode $phone.';
  }

  @override
  String get teamVerifyNumber => 'Verify new number';

  @override
  String get teamNewNumber => 'New mobile number*';

  @override
  String get teamChangeNumberHelp =>
      'We\'ll send an OTP to the new number. They read it out to you to confirm. Their tasks, history and groups stay the same.';

  @override
  String get teamSendOtpNew => 'Send OTP to new number';

  @override
  String teamAskForOtp(String countryCode, String phone) {
    return 'Ask them for the 6-digit OTP sent to $countryCode $phone';
  }

  @override
  String get teamDidntArrive => 'Didn\'t arrive?';

  @override
  String get teamVerifyAndUpdate => 'Verify and update';

  @override
  String get validationNameRequired => 'Enter the full name.';

  @override
  String validationNameLength(int min, int max) {
    return 'Name must be $min–$max characters.';
  }

  @override
  String get validationNameLetters => 'Use letters only.';

  @override
  String listSeparatorJoin(String first, String second) {
    return '$first · $second';
  }

  @override
  String get reportNotReady => 'Not ready';

  @override
  String get reportReady => 'Ready';

  @override
  String reportSubmittedAt(String time) {
    return 'Submitted to HO · $time';
  }

  @override
  String reportApprovedAt(String time) {
    return 'Approved by HO · $time';
  }

  @override
  String get reportReturned => 'Returned by HO';

  @override
  String get reportSnapshot => 'Snapshot';

  @override
  String get reportFix => 'Fix and resend';

  @override
  String reportReturnedLine(int number, String comment) {
    return 'Returned: #$number $comment';
  }

  @override
  String reportOpensWithSummary(String time) {
    return 'Opens $time · includes daily summary';
  }

  @override
  String get reportSendAfterLast => 'Send after the last task closes';

  @override
  String reportStats(int notDone, int photos, int toVerify) {
    return '$notDone not done · $photos photos · $toVerify to verify';
  }

  @override
  String get reportNote => 'Note to HO (optional)';

  @override
  String get reportSubmit => 'Submit to HO';

  @override
  String get reportWalkthrough => '#46 Store walkthrough video';

  @override
  String get reportClosing => '#47 Closing report';

  @override
  String get reportDailySummary => 'Daily summary & submit';

  @override
  String get reportResubmittedTitle => 'Ready for another review';

  @override
  String get reportResubmittedBody =>
      'The corrected evidence is attached. The earlier submission remains in history.';

  @override
  String reportRevision(String section, int revision) {
    return '$section report · Revision $revision';
  }

  @override
  String reportNewPhoto(int number) {
    return '#$number New photo attached';
  }

  @override
  String get reportBackToReports => 'Back to reports';

  @override
  String reportNeedsCorrection(String section) {
    return '$section needs a correction';
  }

  @override
  String get reportReturnedBody =>
      'HO returned this report. Fix the flagged entry and send a revised report.';

  @override
  String reportReturnedAt(String time) {
    return 'Returned today at $time';
  }

  @override
  String get reportSendRevised => 'Send revised report';

  @override
  String get reportFixEntry => 'Fix the entry';

  @override
  String get summaryDsrFirstTitle => 'Upload today\'s DSR first';

  @override
  String get summaryDsrFirstBody =>
      'The closing summary needs today\'s sales and bill totals. Your other entries are saved.';

  @override
  String summaryNotAvailable(String label) {
    return '$label · Not available';
  }

  @override
  String get summarySales => 'Total sales';

  @override
  String get summaryBills => 'Bills (NOB)';

  @override
  String get summaryTicket => 'Ticket size';

  @override
  String get summaryGoToSales => 'Go to Sales';

  @override
  String get summaryTitle => 'Daily summary';

  @override
  String get summarySubtitle => 'Closing · daily summary';

  @override
  String get summaryFromDsr => 'From today\'s DSR · read-only';

  @override
  String get summaryFixExcel => 'Wrong? Fix the Excel and re-upload.';

  @override
  String get summaryMargin => 'Margin %*';

  @override
  String get summaryComplaints => 'Customer complaints*';

  @override
  String get summaryDamages => 'Damages ₹*';

  @override
  String get summaryShrinkage => 'Shrinkage ₹*';

  @override
  String summaryManpower(int total) {
    return 'Manpower present (of $total)*';
  }

  @override
  String get summaryKeyIssues => 'Key issues for HO';

  @override
  String get summarySend => 'Send to HO';

  @override
  String get validationNumberRequired => 'Enter a number.';

  @override
  String validationNumberRange(int min, int max) {
    return 'Enter a number from $min to $max.';
  }

  @override
  String get snapshotPostTo => 'Post to';

  @override
  String get snapshotPost => 'Post to chat';

  @override
  String get snapshotSharedTitle => 'Report shared';

  @override
  String get snapshotSharedBody => 'Your snapshot was posted successfully.';

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
  String get closingSent => 'Closing report sent.';

  @override
  String get closingShutter => 'Shutter photo*';

  @override
  String closingSubtitle(String time) {
    return 'Closing · #47 · due $time';
  }

  @override
  String get closingTime => 'Closing time';

  @override
  String get closingTimeHelp => 'Taken from the clock when you submit.';

  @override
  String closingEarly(String time) {
    return 'Before $time';
  }

  @override
  String get closingWho => 'Who closed the store?*';

  @override
  String closingFlagNote(String time) {
    return 'Closing before $time is flagged to Admin.';
  }

  @override
  String get walkthroughSent => 'Walkthrough video sent.';

  @override
  String get walkthroughTitle => '#46 Store walkthrough';

  @override
  String walkthroughSubtitle(String time) {
    return 'Floor + back store · due $time';
  }

  @override
  String walkthroughRec(String elapsed, String limit) {
    return '● REC $elapsed / $limit';
  }

  @override
  String get walkthroughStop => 'Stop recording';

  @override
  String get walkthroughStart => 'Start recording';

  @override
  String get walkthroughReviewTitle => 'Review your walkthrough';

  @override
  String get walkthroughReviewBody =>
      'Check that the floor and back store are clearly visible before sending.';

  @override
  String get walkthroughPlay => 'Play or pause the video';

  @override
  String walkthroughMeta(String time) {
    return 'Task #46 · Today, $time';
  }

  @override
  String get walkthroughSend => 'Send video';

  @override
  String get navSales => 'Sales';

  @override
  String get salesTitle => 'Sales (DSR)';

  @override
  String get dsrNotUploaded => 'Not uploaded';

  @override
  String dsrUploadedOnTime(String time) {
    return 'Uploaded $time · On time';
  }

  @override
  String dsrUploadedLate(String time) {
    return 'Uploaded $time · Late';
  }

  @override
  String get dsrUpload => 'Upload today\'s DSR Excel';

  @override
  String get dsrReupload => 'Upload again';

  @override
  String dsrMonthTarget(String month) {
    return '$month target';
  }

  @override
  String dsrAchieved(int percent) {
    return '$percent% achieved';
  }

  @override
  String dsrNeedPerDay(String amount) {
    return 'Need $amount a day for the rest of the month';
  }

  @override
  String get dsrTrend => 'Trend';

  @override
  String get dsrChange => 'Change';

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
      'Daily sales this period compared with the same days last period';

  @override
  String get dsrLegend => '— This period   - - Same days last period';

  @override
  String get dsrHistory => 'Posting history';

  @override
  String get dsrOnTime => 'On time';

  @override
  String get dsrLate => 'Late';

  @override
  String get dsrReading => 'Reading your file…';

  @override
  String get dsrCheckTitle => 'Check before saving';

  @override
  String get dsrRejectedTitle => 'Can\'t save this file';

  @override
  String get dsrXlsx => 'XLSX';

  @override
  String dsrFileMeta(int kb, String note) {
    return '$kb KB · $note';
  }

  @override
  String get dsrReadNow => 'read just now';

  @override
  String get dsrNotReadable => 'not accepted';

  @override
  String get dsrDate => 'Date';

  @override
  String get dsrNetSales => 'Net sales';

  @override
  String get dsrMonthTargetShort => 'Month target';

  @override
  String get dsrReplaces =>
      'Already uploaded for this date? Saving replaces it. The old version stays in history.';

  @override
  String get dsrSave => 'Save DSR';

  @override
  String dsrWrongStore(String store) {
    return 'This looks like $store\'s DSR. You can only upload your store\'s DSR. Pick today\'s file for your store and try again.';
  }

  @override
  String get dsrUnreadableDate => 'Unreadable date';

  @override
  String get dsrNoSales => 'No sales figure';

  @override
  String dsrTooLarge(int mb) {
    return 'Over $mb MB';
  }

  @override
  String get dsrHasMacros => 'Has macros';

  @override
  String get dsrOtherReasons => 'Other reasons a file is blocked';

  @override
  String get dsrUploadAnother => 'Upload another file';

  @override
  String dsrSavedOnTime(String time) {
    return 'DSR saved · $time · on time';
  }

  @override
  String dsrSavedLate(String time) {
    return 'DSR saved · $time · late';
  }

  @override
  String dsrSnapshotTitle(String date) {
    return 'DSR · $date';
  }

  @override
  String dsrSnapshotLine(int bills, String ticket, int percent) {
    return '$bills bills · $ticket ticket · MTD $percent%';
  }

  @override
  String get dsrReportsGroup => 'DSR Reports';

  @override
  String get dsrPostedBody => 'Your DSR snapshot was posted successfully.';

  @override
  String dsrSalesBills(String sales, int bills) {
    return '$sales sales · $bills bills';
  }

  @override
  String get dsrBackToSales => 'Back to Sales';

  @override
  String dsrChangePercent(String sign, String value) {
    return '$sign$value%';
  }

  @override
  String get installTitle => 'Install Rapsap Ops';

  @override
  String get installBody =>
      'Install the app on your phone to continue. It opens full screen and sends you task alerts.';

  @override
  String get installNow => 'Install now';

  @override
  String get installIosStepShare =>
      'Tap Share in Safari. Don\'t see it? Tap the menu (⋯ or ≡) next to the address bar first';

  @override
  String get installIosStepAdd => 'Scroll down and tap \"Add to Home Screen\"';

  @override
  String get installBrowserStepMenu => 'Open the browser menu (⋮)';

  @override
  String get installBrowserStepAdd =>
      'Tap \"Install app\" or \"Add to Home screen\"';

  @override
  String get installStepOpen => 'Open Rapsap Ops from your home screen';

  @override
  String get installIosNote =>
      'Opened this link inside another app? Open it in Safari first.';

  @override
  String get installBrowserNote =>
      'Already installed? Open Rapsap Ops from your home screen.';

  @override
  String get installDoneTitle => 'App installed';

  @override
  String get installDoneBody =>
      'Close this tab and open Rapsap Ops from your home screen.';
}
