import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_mr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi'),
    Locale('mr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Rapsap Ops'**
  String get appTitle;

  /// No description provided for @errorServer.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong on our side. Please try again.'**
  String get errorServer;

  /// No description provided for @errorUnauthorized.
  ///
  /// In en, this message translates to:
  /// **'Your session has ended. Please sign in again.'**
  String get errorUnauthorized;

  /// No description provided for @errorForbidden.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have access to this.'**
  String get errorForbidden;

  /// No description provided for @errorNotFound.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find what you were looking for.'**
  String get errorNotFound;

  /// No description provided for @errorValidation.
  ///
  /// In en, this message translates to:
  /// **'Please check the details and try again.'**
  String get errorValidation;

  /// No description provided for @errorNoInternet.
  ///
  /// In en, this message translates to:
  /// **'No internet connection. Check your mobile data or Wi-Fi.'**
  String get errorNoInternet;

  /// No description provided for @errorTimeout.
  ///
  /// In en, this message translates to:
  /// **'This is taking too long. Please try again.'**
  String get errorTimeout;

  /// No description provided for @errorCancelled.
  ///
  /// In en, this message translates to:
  /// **'Request cancelled.'**
  String get errorCancelled;

  /// No description provided for @errorForceUpdate.
  ///
  /// In en, this message translates to:
  /// **'Please update the app to continue.'**
  String get errorForceUpdate;

  /// No description provided for @errorStorage.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t save data on this device. Please try again.'**
  String get errorStorage;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorUnknown;

  /// No description provided for @pageNotFoundTitle.
  ///
  /// In en, this message translates to:
  /// **'Page not found'**
  String get pageNotFoundTitle;

  /// No description provided for @pageNotFoundAction.
  ///
  /// In en, this message translates to:
  /// **'Go to start'**
  String get pageNotFoundAction;

  /// No description provided for @languageEnglishShort.
  ///
  /// In en, this message translates to:
  /// **'EN'**
  String get languageEnglishShort;

  /// No description provided for @languageDevanagariShort.
  ///
  /// In en, this message translates to:
  /// **'अ'**
  String get languageDevanagariShort;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageMarathi.
  ///
  /// In en, this message translates to:
  /// **'मराठी'**
  String get languageMarathi;

  /// No description provided for @languageHindi.
  ///
  /// In en, this message translates to:
  /// **'हिंदी'**
  String get languageHindi;

  /// No description provided for @languagePick.
  ///
  /// In en, this message translates to:
  /// **'Choose Marathi or Hindi'**
  String get languagePick;

  /// No description provided for @offlineBanner.
  ///
  /// In en, this message translates to:
  /// **'You\'re offline. Some actions won\'t work until you reconnect.'**
  String get offlineBanner;

  /// No description provided for @actionRetry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get actionRetry;

  /// No description provided for @actionBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get actionBack;

  /// No description provided for @listSeparator.
  ///
  /// In en, this message translates to:
  /// **' · '**
  String get listSeparator;

  /// No description provided for @errorOtpInvalid.
  ///
  /// In en, this message translates to:
  /// **'That code didn\'t match. {attempts, plural, =1{1 try left} other{{attempts} tries left}} before this number is locked for {minutes} minutes.'**
  String errorOtpInvalid(int attempts, int minutes);

  /// No description provided for @errorOtpLocked.
  ///
  /// In en, this message translates to:
  /// **'Too many wrong tries. This number is locked for {minutes} minutes. Your store manager can unlock it.'**
  String errorOtpLocked(int minutes);

  /// No description provided for @errorTooManyRequests.
  ///
  /// In en, this message translates to:
  /// **'Too many OTP requests. Please try again later.'**
  String get errorTooManyRequests;

  /// No description provided for @validationPhoneRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter your mobile number.'**
  String get validationPhoneRequired;

  /// No description provided for @validationPhoneInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid 10-digit mobile number.'**
  String get validationPhoneInvalid;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Operations'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Complete store operations, report issues, and keep every shift accountable.'**
  String get loginSubtitle;

  /// No description provided for @loginPhoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Mobile number'**
  String get loginPhoneLabel;

  /// No description provided for @loginPhoneHint.
  ///
  /// In en, this message translates to:
  /// **'98765 43210'**
  String get loginPhoneHint;

  /// No description provided for @loginHelper.
  ///
  /// In en, this message translates to:
  /// **'No sign-up here. Your store manager creates your login.'**
  String get loginHelper;

  /// No description provided for @loginNoAccount.
  ///
  /// In en, this message translates to:
  /// **'No login found for this number. Check the number or ask your store manager for help.'**
  String get loginNoAccount;

  /// No description provided for @loginGetOtp.
  ///
  /// In en, this message translates to:
  /// **'Get OTP'**
  String get loginGetOtp;

  /// No description provided for @otpTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP'**
  String get otpTitle;

  /// No description provided for @otpSentTo.
  ///
  /// In en, this message translates to:
  /// **'Sent to {countryCode} {phone}. Valid for {minutes} minutes.'**
  String otpSentTo(String countryCode, String phone, int minutes);

  /// No description provided for @otpDidntGet.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t get it?'**
  String get otpDidntGet;

  /// No description provided for @otpResendIn.
  ///
  /// In en, this message translates to:
  /// **'Resend in {time}'**
  String otpResendIn(String time);

  /// No description provided for @otpResend.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get otpResend;

  /// No description provided for @otpVerify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get otpVerify;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}'**
  String welcomeTitle(String name);

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{roles} · {store}'**
  String welcomeSubtitle(String roles, String store);

  /// No description provided for @welcomeCollectTitle.
  ///
  /// In en, this message translates to:
  /// **'What we collect'**
  String get welcomeCollectTitle;

  /// No description provided for @welcomeCollectBody.
  ///
  /// In en, this message translates to:
  /// **'Your name, phone number and the task photos you take in the app. We use them to track the store checklist. Photos are kept for 5 months.'**
  String get welcomeCollectBody;

  /// No description provided for @permissionCameraTitle.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get permissionCameraTitle;

  /// No description provided for @permissionCameraBody.
  ///
  /// In en, this message translates to:
  /// **'To take task photos'**
  String get permissionCameraBody;

  /// No description provided for @permissionNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get permissionNotificationsTitle;

  /// No description provided for @permissionNotificationsBody.
  ///
  /// In en, this message translates to:
  /// **'Reminders 15 and 5 min before due'**
  String get permissionNotificationsBody;

  /// No description provided for @permissionAllow.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get permissionAllow;

  /// No description provided for @permissionAllowed.
  ///
  /// In en, this message translates to:
  /// **'Allowed'**
  String get permissionAllowed;

  /// No description provided for @permissionBlocked.
  ///
  /// In en, this message translates to:
  /// **'Blocked'**
  String get permissionBlocked;

  /// No description provided for @permissionCameraDeniedHelp.
  ///
  /// In en, this message translates to:
  /// **'Camera is blocked. Turn it on in your browser or phone settings, then tap Allow again.'**
  String get permissionCameraDeniedHelp;

  /// No description provided for @welcomeAgree.
  ///
  /// In en, this message translates to:
  /// **'Agree and continue'**
  String get welcomeAgree;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navChecklist.
  ///
  /// In en, this message translates to:
  /// **'Checklist'**
  String get navChecklist;

  /// No description provided for @homeComingUp.
  ///
  /// In en, this message translates to:
  /// **'Coming up'**
  String get homeComingUp;

  /// No description provided for @homeDoNow.
  ///
  /// In en, this message translates to:
  /// **'Do this now'**
  String get homeDoNow;

  /// No description provided for @homeDueAt.
  ///
  /// In en, this message translates to:
  /// **'{section} · due {time}'**
  String homeDueAt(String section, String time);

  /// No description provided for @statDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get statDone;

  /// No description provided for @statMissed.
  ///
  /// In en, this message translates to:
  /// **'Missed'**
  String get statMissed;

  /// No description provided for @statLeft.
  ///
  /// In en, this message translates to:
  /// **'Left'**
  String get statLeft;

  /// No description provided for @statDoneValue.
  ///
  /// In en, this message translates to:
  /// **'{done} / {total}'**
  String statDoneValue(int done, int total);

  /// No description provided for @shiftOpening.
  ///
  /// In en, this message translates to:
  /// **'Opening shift'**
  String get shiftOpening;

  /// No description provided for @shiftMid.
  ///
  /// In en, this message translates to:
  /// **'Mid shift'**
  String get shiftMid;

  /// No description provided for @shiftClosing.
  ///
  /// In en, this message translates to:
  /// **'Closing shift'**
  String get shiftClosing;

  /// No description provided for @checklistMyTitle.
  ///
  /// In en, this message translates to:
  /// **'My checklist'**
  String get checklistMyTitle;

  /// No description provided for @checklistDoneOf.
  ///
  /// In en, this message translates to:
  /// **'{done} of {total}'**
  String checklistDoneOf(int done, int total);

  /// No description provided for @checklistDoneToday.
  ///
  /// In en, this message translates to:
  /// **'tasks done today'**
  String get checklistDoneToday;

  /// No description provided for @checklistEmpty.
  ///
  /// In en, this message translates to:
  /// **'No tasks here right now.'**
  String get checklistEmpty;

  /// No description provided for @checklistNoTasksToday.
  ///
  /// In en, this message translates to:
  /// **'No tasks for you today.'**
  String get checklistNoTasksToday;

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All {count}'**
  String filterAll(int count);

  /// No description provided for @filterOpen.
  ///
  /// In en, this message translates to:
  /// **'Open {count}'**
  String filterOpen(int count);

  /// No description provided for @filterDone.
  ///
  /// In en, this message translates to:
  /// **'Done {count}'**
  String filterDone(int count);

  /// No description provided for @filterMissed.
  ///
  /// In en, this message translates to:
  /// **'Missed {count}'**
  String filterMissed(int count);

  /// No description provided for @sectionWindow.
  ///
  /// In en, this message translates to:
  /// **'{name} · {from}–{to}'**
  String sectionWindow(String name, String from, String to);

  /// No description provided for @sectionFrom.
  ///
  /// In en, this message translates to:
  /// **'{name} · from {from}'**
  String sectionFrom(String name, String from);

  /// No description provided for @taskTitle.
  ///
  /// In en, this message translates to:
  /// **'#{number} {title}'**
  String taskTitle(int number, String title);

  /// No description provided for @taskChipLater.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get taskChipLater;

  /// No description provided for @taskChipDueSoon.
  ///
  /// In en, this message translates to:
  /// **'Due soon'**
  String get taskChipDueSoon;

  /// No description provided for @taskChipSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Sent to SM'**
  String get taskChipSubmitted;

  /// No description provided for @taskChipVerified.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get taskChipVerified;

  /// No description provided for @taskChipSentBack.
  ///
  /// In en, this message translates to:
  /// **'Sent back'**
  String get taskChipSentBack;

  /// No description provided for @taskChipMissed.
  ///
  /// In en, this message translates to:
  /// **'Missed'**
  String get taskChipMissed;

  /// No description provided for @taskChipNotDone.
  ///
  /// In en, this message translates to:
  /// **'Not done'**
  String get taskChipNotDone;

  /// No description provided for @taskOpensAt.
  ///
  /// In en, this message translates to:
  /// **'Opens {time}'**
  String taskOpensAt(String time);

  /// No description provided for @taskMinutesLeft.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min left'**
  String taskMinutesLeft(int minutes);

  /// No description provided for @taskSubmittedAt.
  ///
  /// In en, this message translates to:
  /// **'Submitted {time}'**
  String taskSubmittedAt(String time);

  /// No description provided for @taskVerifiedBy.
  ///
  /// In en, this message translates to:
  /// **'Verified by {name}'**
  String taskVerifiedBy(String name);

  /// No description provided for @taskSentBackBy.
  ///
  /// In en, this message translates to:
  /// **'Sent back by {name}'**
  String taskSentBackBy(String name);

  /// No description provided for @taskAskToUnlock.
  ///
  /// In en, this message translates to:
  /// **'Ask your SM to unlock'**
  String get taskAskToUnlock;

  /// No description provided for @taskMarkedNotDone.
  ///
  /// In en, this message translates to:
  /// **'Marked not done'**
  String get taskMarkedNotDone;

  /// No description provided for @taskHeader.
  ///
  /// In en, this message translates to:
  /// **'{section} · #{number}'**
  String taskHeader(String section, int number);

  /// No description provided for @taskAssignedTo.
  ///
  /// In en, this message translates to:
  /// **'Assigned to {team}'**
  String taskAssignedTo(String team);

  /// No description provided for @taskDueAt.
  ///
  /// In en, this message translates to:
  /// **'Due {time}'**
  String taskDueAt(String time);

  /// No description provided for @taskDueSoonLeft.
  ///
  /// In en, this message translates to:
  /// **'Due soon · {minutes} min left'**
  String taskDueSoonLeft(int minutes);

  /// No description provided for @taskReopenedLeft.
  ///
  /// In en, this message translates to:
  /// **'Reopened · {minutes} min left'**
  String taskReopenedLeft(int minutes);

  /// No description provided for @taskPhotoProof.
  ///
  /// In en, this message translates to:
  /// **'Photo proof*'**
  String get taskPhotoProof;

  /// No description provided for @taskTapToOpenCamera.
  ///
  /// In en, this message translates to:
  /// **'Tap to open camera'**
  String get taskTapToOpenCamera;

  /// No description provided for @taskRetake.
  ///
  /// In en, this message translates to:
  /// **'Retake'**
  String get taskRetake;

  /// No description provided for @taskRemarks.
  ///
  /// In en, this message translates to:
  /// **'Remarks'**
  String get taskRemarks;

  /// No description provided for @taskRemarksHint.
  ///
  /// In en, this message translates to:
  /// **'Anything your SM should know'**
  String get taskRemarksHint;

  /// No description provided for @taskCantTakePhoto.
  ///
  /// In en, this message translates to:
  /// **'Can\'t take a photo? Tell your SM why'**
  String get taskCantTakePhoto;

  /// No description provided for @taskUsePhotoInstead.
  ///
  /// In en, this message translates to:
  /// **'Take a photo instead'**
  String get taskUsePhotoInstead;

  /// No description provided for @taskNotDoneReason.
  ///
  /// In en, this message translates to:
  /// **'Why can\'t you take a photo?*'**
  String get taskNotDoneReason;

  /// No description provided for @taskNotDoneHint.
  ///
  /// In en, this message translates to:
  /// **'Tell your SM what\'s stopping you'**
  String get taskNotDoneHint;

  /// No description provided for @taskAutoPosted.
  ///
  /// In en, this message translates to:
  /// **'Your photo is also posted to {group} automatically.'**
  String taskAutoPosted(String group);

  /// No description provided for @taskTakePhotoFirst.
  ///
  /// In en, this message translates to:
  /// **'Take photo first'**
  String get taskTakePhotoFirst;

  /// No description provided for @taskSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get taskSubmit;

  /// No description provided for @taskSubmitNotDone.
  ///
  /// In en, this message translates to:
  /// **'Submit as not done'**
  String get taskSubmitNotDone;

  /// No description provided for @taskRetakePhoto.
  ///
  /// In en, this message translates to:
  /// **'Retake photo'**
  String get taskRetakePhoto;

  /// No description provided for @taskFromManager.
  ///
  /// In en, this message translates to:
  /// **'From {name} (SM)'**
  String taskFromManager(String name);

  /// No description provided for @taskEarlierPhoto.
  ///
  /// In en, this message translates to:
  /// **'Your earlier photo'**
  String get taskEarlierPhoto;

  /// No description provided for @taskYourPhoto.
  ///
  /// In en, this message translates to:
  /// **'Your photo'**
  String get taskYourPhoto;

  /// No description provided for @taskMissedWasDue.
  ///
  /// In en, this message translates to:
  /// **'Missed · was due {time}'**
  String taskMissedWasDue(String time);

  /// No description provided for @taskLockedAt.
  ///
  /// In en, this message translates to:
  /// **'Task locked at {time}'**
  String taskLockedAt(String time);

  /// No description provided for @taskLockedHelp.
  ///
  /// In en, this message translates to:
  /// **'Only your store manager can unlock this task. If unlocked, you get 30 minutes and it shows as late.'**
  String get taskLockedHelp;

  /// No description provided for @taskOpensLater.
  ///
  /// In en, this message translates to:
  /// **'This task opens at {time}.'**
  String taskOpensLater(String time);

  /// No description provided for @taskBackToChecklist.
  ///
  /// In en, this message translates to:
  /// **'Back to checklist'**
  String get taskBackToChecklist;

  /// No description provided for @taskUploading.
  ///
  /// In en, this message translates to:
  /// **'Uploading photo… {percent}%'**
  String taskUploading(int percent);

  /// No description provided for @cameraOnly.
  ///
  /// In en, this message translates to:
  /// **'Camera only · gallery is off'**
  String get cameraOnly;

  /// No description provided for @cameraClose.
  ///
  /// In en, this message translates to:
  /// **'Close camera'**
  String get cameraClose;

  /// No description provided for @cameraTakePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take photo'**
  String get cameraTakePhoto;

  /// No description provided for @cameraDenied.
  ///
  /// In en, this message translates to:
  /// **'Camera is blocked. Turn it on in your browser or phone settings and try again.'**
  String get cameraDenied;

  /// No description provided for @cameraUnavailable.
  ///
  /// In en, this message translates to:
  /// **'No camera found on this device.'**
  String get cameraUnavailable;

  /// No description provided for @resultConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get resultConfirmed;

  /// No description provided for @resultActionNeeded.
  ///
  /// In en, this message translates to:
  /// **'Action needed'**
  String get resultActionNeeded;

  /// No description provided for @submittedTitle.
  ///
  /// In en, this message translates to:
  /// **'Sent for review'**
  String get submittedTitle;

  /// No description provided for @submittedBody.
  ///
  /// In en, this message translates to:
  /// **'Your photo and remarks have been sent to {manager}, your store manager.'**
  String submittedBody(String manager);

  /// No description provided for @submittedNotDoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Sent to your SM'**
  String get submittedNotDoneTitle;

  /// No description provided for @submittedNotDoneBody.
  ///
  /// In en, this message translates to:
  /// **'Your reason has been sent to {manager}, your store manager.'**
  String submittedNotDoneBody(String manager);

  /// No description provided for @submittedAtOnTime.
  ///
  /// In en, this message translates to:
  /// **'Submitted at {time} · On time'**
  String submittedAtOnTime(String time);

  /// No description provided for @submittedAtLate.
  ///
  /// In en, this message translates to:
  /// **'Submitted at {time} · Late'**
  String submittedAtLate(String time);

  /// No description provided for @submittedPosted.
  ///
  /// In en, this message translates to:
  /// **'Photo posted to {group}'**
  String submittedPosted(String group);

  /// No description provided for @interruptedTitle.
  ///
  /// In en, this message translates to:
  /// **'Your photo is saved'**
  String get interruptedTitle;

  /// No description provided for @interruptedBody.
  ///
  /// In en, this message translates to:
  /// **'The connection dropped before your task could be sent. Keep this screen open and retry when you\'re online.'**
  String get interruptedBody;

  /// No description provided for @interruptedWaiting.
  ///
  /// In en, this message translates to:
  /// **'Photo captured · Waiting to upload'**
  String get interruptedWaiting;

  /// No description provided for @interruptedNotSubmitted.
  ///
  /// In en, this message translates to:
  /// **'The task is not submitted yet.'**
  String get interruptedNotSubmitted;

  /// No description provided for @interruptedRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry upload'**
  String get interruptedRetry;

  /// No description provided for @interruptedBack.
  ///
  /// In en, this message translates to:
  /// **'Back to task'**
  String get interruptedBack;

  /// No description provided for @caughtUpTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re all caught up'**
  String get caughtUpTitle;

  /// No description provided for @caughtUpBody.
  ///
  /// In en, this message translates to:
  /// **'No tasks need your attention right now. We\'ll let you know when the next one opens.'**
  String get caughtUpBody;

  /// No description provided for @caughtUpNext.
  ///
  /// In en, this message translates to:
  /// **'Next task  {task}'**
  String caughtUpNext(String task);

  /// No description provided for @caughtUpOpens.
  ///
  /// In en, this message translates to:
  /// **'Opens today at {time}'**
  String caughtUpOpens(String time);

  /// No description provided for @homeOpenCamera.
  ///
  /// In en, this message translates to:
  /// **'Open camera'**
  String get homeOpenCamera;

  /// No description provided for @validationTooLong.
  ///
  /// In en, this message translates to:
  /// **'Keep it under {max} characters.'**
  String validationTooLong(int max);

  /// No description provided for @validationReasonRequired.
  ///
  /// In en, this message translates to:
  /// **'Please write a reason.'**
  String get validationReasonRequired;

  /// No description provided for @validationReasonTooShort.
  ///
  /// In en, this message translates to:
  /// **'Write at least {min} characters.'**
  String validationReasonTooShort(int min);

  /// No description provided for @menuOpen.
  ///
  /// In en, this message translates to:
  /// **'Open menu'**
  String get menuOpen;

  /// No description provided for @menuMyTeam.
  ///
  /// In en, this message translates to:
  /// **'My Team'**
  String get menuMyTeam;

  /// No description provided for @menuRoleLine.
  ///
  /// In en, this message translates to:
  /// **'{role} · {roles}'**
  String menuRoleLine(String role, String roles);

  /// No description provided for @roleStaff.
  ///
  /// In en, this message translates to:
  /// **'Staff'**
  String get roleStaff;

  /// No description provided for @roleStoreManager.
  ///
  /// In en, this message translates to:
  /// **'Store Manager'**
  String get roleStoreManager;

  /// No description provided for @roleAdmin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get roleAdmin;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'My profile'**
  String get profileTitle;

  /// No description provided for @profileEmployeeId.
  ///
  /// In en, this message translates to:
  /// **'Employee ID'**
  String get profileEmployeeId;

  /// No description provided for @profileMobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile (login)'**
  String get profileMobile;

  /// No description provided for @profileStore.
  ///
  /// In en, this message translates to:
  /// **'Store'**
  String get profileStore;

  /// No description provided for @profileReportsTo.
  ///
  /// In en, this message translates to:
  /// **'Reports to'**
  String get profileReportsTo;

  /// No description provided for @profileEmergencyContact.
  ///
  /// In en, this message translates to:
  /// **'Emergency contact'**
  String get profileEmergencyContact;

  /// No description provided for @profileThisMonth.
  ///
  /// In en, this message translates to:
  /// **'This month'**
  String get profileThisMonth;

  /// No description provided for @profileOnTime.
  ///
  /// In en, this message translates to:
  /// **'{percent}% on time'**
  String profileOnTime(int percent);

  /// No description provided for @profileDoneMissed.
  ///
  /// In en, this message translates to:
  /// **'Done {done} · Missed {missed}'**
  String profileDoneMissed(int done, int missed);

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsNotifications;

  /// No description provided for @settingsTaskReminders.
  ///
  /// In en, this message translates to:
  /// **'Task reminders'**
  String get settingsTaskReminders;

  /// No description provided for @settingsAlwaysOn.
  ///
  /// In en, this message translates to:
  /// **'Always on'**
  String get settingsAlwaysOn;

  /// No description provided for @settingsChatMessages.
  ///
  /// In en, this message translates to:
  /// **'Chat messages'**
  String get settingsChatMessages;

  /// No description provided for @settingsAnnouncements.
  ///
  /// In en, this message translates to:
  /// **'Announcements'**
  String get settingsAnnouncements;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logOut;

  /// No description provided for @logOutAllDevices.
  ///
  /// In en, this message translates to:
  /// **'Log out on all devices'**
  String get logOutAllDevices;

  /// No description provided for @listEmpty.
  ///
  /// In en, this message translates to:
  /// **'Nothing here yet.'**
  String get listEmpty;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @notificationsUnread.
  ///
  /// In en, this message translates to:
  /// **'{count} unread'**
  String notificationsUnread(int count);

  /// No description provided for @notificationsMarkAllRead.
  ///
  /// In en, this message translates to:
  /// **'Mark all read'**
  String get notificationsMarkAllRead;

  /// No description provided for @filterAllPlain.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAllPlain;

  /// No description provided for @notificationsUnreadTab.
  ///
  /// In en, this message translates to:
  /// **'Unread ({count})'**
  String notificationsUnreadTab(int count);

  /// No description provided for @notificationsEmpty.
  ///
  /// In en, this message translates to:
  /// **'You\'re all caught up.'**
  String get notificationsEmpty;

  /// No description provided for @notificationMeta.
  ///
  /// In en, this message translates to:
  /// **'{source} · {time}'**
  String notificationMeta(String source, String time);

  /// No description provided for @notificationUnreadDot.
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get notificationUnreadDot;

  /// No description provided for @navChat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get navChat;

  /// No description provided for @navAlerts.
  ///
  /// In en, this message translates to:
  /// **'Alerts'**
  String get navAlerts;

  /// No description provided for @chatTitle.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chatTitle;

  /// No description provided for @chatSearch.
  ///
  /// In en, this message translates to:
  /// **'Search chats'**
  String get chatSearch;

  /// No description provided for @chatEmpty.
  ///
  /// In en, this message translates to:
  /// **'No chats yet.'**
  String get chatEmpty;

  /// No description provided for @chatNoMatch.
  ///
  /// In en, this message translates to:
  /// **'No chats match your search.'**
  String get chatNoMatch;

  /// No description provided for @chatMuted.
  ///
  /// In en, this message translates to:
  /// **'Muted'**
  String get chatMuted;

  /// No description provided for @chatMembers.
  ///
  /// In en, this message translates to:
  /// **'{count} members'**
  String chatMembers(int count);

  /// No description provided for @chatMute.
  ///
  /// In en, this message translates to:
  /// **'Mute this chat'**
  String get chatMute;

  /// No description provided for @chatUnmute.
  ///
  /// In en, this message translates to:
  /// **'Unmute this chat'**
  String get chatUnmute;

  /// No description provided for @chatPinned.
  ///
  /// In en, this message translates to:
  /// **'Pinned'**
  String get chatPinned;

  /// No description provided for @chatNoMessages.
  ///
  /// In en, this message translates to:
  /// **'No messages yet. Say hello.'**
  String get chatNoMessages;

  /// No description provided for @chatLoadOlder.
  ///
  /// In en, this message translates to:
  /// **'Load older'**
  String get chatLoadOlder;

  /// No description provided for @chatSenderWithRole.
  ///
  /// In en, this message translates to:
  /// **'{name} · {role}'**
  String chatSenderWithRole(String name, String role);

  /// No description provided for @chatNotSent.
  ///
  /// In en, this message translates to:
  /// **'Not sent'**
  String get chatNotSent;

  /// No description provided for @chatReport.
  ///
  /// In en, this message translates to:
  /// **'Report message'**
  String get chatReport;

  /// No description provided for @chatReported.
  ///
  /// In en, this message translates to:
  /// **'Message reported. Admin will review it.'**
  String get chatReported;

  /// No description provided for @chatSending.
  ///
  /// In en, this message translates to:
  /// **'Sending…'**
  String get chatSending;

  /// No description provided for @chatFailedRetry.
  ///
  /// In en, this message translates to:
  /// **'Failed — tap to retry'**
  String get chatFailedRetry;

  /// No description provided for @chatSeenBy.
  ///
  /// In en, this message translates to:
  /// **'{time} · ✓✓ Seen by {count}'**
  String chatSeenBy(String time, int count);

  /// No description provided for @chatPhoto.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get chatPhoto;

  /// No description provided for @chatReadOnly.
  ///
  /// In en, this message translates to:
  /// **'Only Admin can post here.'**
  String get chatReadOnly;

  /// No description provided for @chatMutedNotice.
  ///
  /// In en, this message translates to:
  /// **'You\'re muted until {time} after 3 blocked messages. Admin has been told.'**
  String chatMutedNotice(String time);

  /// No description provided for @chatMessageHint.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get chatMessageHint;

  /// No description provided for @chatSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get chatSend;

  /// No description provided for @chatBlockedAbuse.
  ///
  /// In en, this message translates to:
  /// **'This message has words that aren\'t allowed here.'**
  String get chatBlockedAbuse;

  /// No description provided for @chatBlockedLink.
  ///
  /// In en, this message translates to:
  /// **'Links can\'t be shared in chat.'**
  String get chatBlockedLink;

  /// No description provided for @chatBlockedFlood.
  ///
  /// In en, this message translates to:
  /// **'You\'re sending too fast. Wait a moment.'**
  String get chatBlockedFlood;

  /// No description provided for @chatBlockedSensitive.
  ///
  /// In en, this message translates to:
  /// **'This looks like a password or OTP. Never share them in chat.'**
  String get chatBlockedSensitive;

  /// No description provided for @chatBlockedMuted.
  ///
  /// In en, this message translates to:
  /// **'You\'re muted for now. Admin has been told.'**
  String get chatBlockedMuted;

  /// No description provided for @taskMessageManager.
  ///
  /// In en, this message translates to:
  /// **'Message my SM'**
  String get taskMessageManager;

  /// No description provided for @submittedViewChat.
  ///
  /// In en, this message translates to:
  /// **'View checklist chat'**
  String get submittedViewChat;

  /// No description provided for @managerSections.
  ///
  /// In en, this message translates to:
  /// **'Sections'**
  String get managerSections;

  /// No description provided for @managerAllChecklist.
  ///
  /// In en, this message translates to:
  /// **'All Checklist'**
  String get managerAllChecklist;

  /// No description provided for @managerActivitiesDone.
  ///
  /// In en, this message translates to:
  /// **'activities completed'**
  String get managerActivitiesDone;

  /// No description provided for @managerToReview.
  ///
  /// In en, this message translates to:
  /// **'{count} to review'**
  String managerToReview(int count);

  /// No description provided for @managerMissed.
  ///
  /// In en, this message translates to:
  /// **'{count} missed'**
  String managerMissed(int count);

  /// No description provided for @managerNotDone.
  ///
  /// In en, this message translates to:
  /// **'{count} not done'**
  String managerNotDone(int count);

  /// No description provided for @sectionInProgress.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get sectionInProgress;

  /// No description provided for @sectionCritical.
  ///
  /// In en, this message translates to:
  /// **'Critical · {count} missed'**
  String sectionCritical(int count);

  /// No description provided for @sectionReady.
  ///
  /// In en, this message translates to:
  /// **'Ready to submit'**
  String get sectionReady;

  /// No description provided for @sectionSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Submitted to HO'**
  String get sectionSubmitted;

  /// No description provided for @sectionApproved.
  ///
  /// In en, this message translates to:
  /// **'Approved by HO'**
  String get sectionApproved;

  /// No description provided for @sectionReturned.
  ///
  /// In en, this message translates to:
  /// **'Returned by HO'**
  String get sectionReturned;

  /// No description provided for @managerSalesMtd.
  ///
  /// In en, this message translates to:
  /// **'Sales · {month} MTD'**
  String managerSalesMtd(String month);

  /// No description provided for @amountOf.
  ///
  /// In en, this message translates to:
  /// **'{amount} of {target}'**
  String amountOf(String amount, String target);

  /// No description provided for @dsrDueBy.
  ///
  /// In en, this message translates to:
  /// **'DSR due by {time}'**
  String dsrDueBy(String time);

  /// No description provided for @percent.
  ///
  /// In en, this message translates to:
  /// **'{percent}%'**
  String percent(int percent);

  /// No description provided for @sectionReportsTitle.
  ///
  /// In en, this message translates to:
  /// **'Section reports'**
  String get sectionReportsTitle;

  /// No description provided for @reviewNothing.
  ///
  /// In en, this message translates to:
  /// **'Nothing here right now.'**
  String get reviewNothing;

  /// No description provided for @reviewNeedsReview.
  ///
  /// In en, this message translates to:
  /// **'Needs review {count}'**
  String reviewNeedsReview(int count);

  /// No description provided for @reviewNotDone.
  ///
  /// In en, this message translates to:
  /// **'Not done {count}'**
  String reviewNotDone(int count);

  /// No description provided for @reviewOpenNow.
  ///
  /// In en, this message translates to:
  /// **'Open now {count}'**
  String reviewOpenNow(int count);

  /// No description provided for @reviewNotDoneLine.
  ///
  /// In en, this message translates to:
  /// **'Not done · {name} · “{reason}”'**
  String reviewNotDoneLine(String name, String reason);

  /// No description provided for @reviewToday.
  ///
  /// In en, this message translates to:
  /// **'Today {time}'**
  String reviewToday(String time);

  /// No description provided for @reviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Report review'**
  String get reviewTitle;

  /// No description provided for @reviewMissedTitle.
  ///
  /// In en, this message translates to:
  /// **'Missed task'**
  String get reviewMissedTitle;

  /// No description provided for @reviewChipNeedsReview.
  ///
  /// In en, this message translates to:
  /// **'Needs review'**
  String get reviewChipNeedsReview;

  /// No description provided for @reviewSubmittedBy.
  ///
  /// In en, this message translates to:
  /// **'Submitted by {name}'**
  String reviewSubmittedBy(String name);

  /// No description provided for @reviewReason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get reviewReason;

  /// No description provided for @reviewAssignedTo.
  ///
  /// In en, this message translates to:
  /// **'Assigned to {name} · {role}'**
  String reviewAssignedTo(String name, String role);

  /// No description provided for @reviewLockedAt.
  ///
  /// In en, this message translates to:
  /// **'Missed · locked at {time}'**
  String reviewLockedAt(String time);

  /// No description provided for @reviewUnlockTitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock for {minutes} minutes'**
  String reviewUnlockTitle(int minutes);

  /// No description provided for @reviewUnlockBody.
  ///
  /// In en, this message translates to:
  /// **'{name} gets a notification and can submit until {time}. The task shows as late in reports.'**
  String reviewUnlockBody(String name, String time);

  /// No description provided for @reviewDoItTitle.
  ///
  /// In en, this message translates to:
  /// **'Do it yourself'**
  String get reviewDoItTitle;

  /// No description provided for @reviewDoItBody.
  ///
  /// In en, this message translates to:
  /// **'Marked “Done by SM”. Admin verifies it with the section report.'**
  String get reviewDoItBody;

  /// No description provided for @reviewVerify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get reviewVerify;

  /// No description provided for @reviewEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get reviewEdit;

  /// No description provided for @reviewSendBack.
  ///
  /// In en, this message translates to:
  /// **'Send back'**
  String get reviewSendBack;

  /// No description provided for @reviewUnlockFor.
  ///
  /// In en, this message translates to:
  /// **'Unlock for {name}'**
  String reviewUnlockFor(String name);

  /// No description provided for @reviewDoItMyself.
  ///
  /// In en, this message translates to:
  /// **'Do it myself'**
  String get reviewDoItMyself;

  /// No description provided for @reviewLeaveMissed.
  ///
  /// In en, this message translates to:
  /// **'Leave missed'**
  String get reviewLeaveMissed;

  /// No description provided for @reviewUnlockedTitle.
  ///
  /// In en, this message translates to:
  /// **'Task unlocked'**
  String get reviewUnlockedTitle;

  /// No description provided for @reviewVerifiedTitle.
  ///
  /// In en, this message translates to:
  /// **'Entry verified'**
  String get reviewVerifiedTitle;

  /// No description provided for @reviewUnlockedBody.
  ///
  /// In en, this message translates to:
  /// **'{name} can submit it now. It will show as late.'**
  String reviewUnlockedBody(String name);

  /// No description provided for @reviewVerifiedBody.
  ///
  /// In en, this message translates to:
  /// **'{name}\'s task is now verified. The update is visible in their checklist.'**
  String reviewVerifiedBody(String name);

  /// No description provided for @reviewVerifiedBy.
  ///
  /// In en, this message translates to:
  /// **'Verified by {name}'**
  String reviewVerifiedBy(String name);

  /// No description provided for @reviewHistoryKept.
  ///
  /// In en, this message translates to:
  /// **'Original evidence stays in task history'**
  String get reviewHistoryKept;

  /// No description provided for @reviewBackToQueue.
  ///
  /// In en, this message translates to:
  /// **'Back to review'**
  String get reviewBackToQueue;

  /// No description provided for @sendBackPhotoBlurry.
  ///
  /// In en, this message translates to:
  /// **'Photo blurry'**
  String get sendBackPhotoBlurry;

  /// No description provided for @sendBackWrongArea.
  ///
  /// In en, this message translates to:
  /// **'Wrong area'**
  String get sendBackWrongArea;

  /// No description provided for @sendBackNotDone.
  ///
  /// In en, this message translates to:
  /// **'Task not done'**
  String get sendBackNotDone;

  /// No description provided for @sendBackTitle.
  ///
  /// In en, this message translates to:
  /// **'Send back to staff'**
  String get sendBackTitle;

  /// No description provided for @sendBackBody.
  ///
  /// In en, this message translates to:
  /// **'The task opens again for them for 30 minutes.'**
  String get sendBackBody;

  /// No description provided for @sendBackQuick.
  ///
  /// In en, this message translates to:
  /// **'Quick reasons'**
  String get sendBackQuick;

  /// No description provided for @sendBackReason.
  ///
  /// In en, this message translates to:
  /// **'Reason*'**
  String get sendBackReason;

  /// No description provided for @editTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit entry'**
  String get editTitle;

  /// No description provided for @editPhotoUnclear.
  ///
  /// In en, this message translates to:
  /// **'Photo unclear'**
  String get editPhotoUnclear;

  /// No description provided for @editWrongPhoto.
  ///
  /// In en, this message translates to:
  /// **'Wrong photo'**
  String get editWrongPhoto;

  /// No description provided for @editRemarkMissing.
  ///
  /// In en, this message translates to:
  /// **'Remark missing'**
  String get editRemarkMissing;

  /// No description provided for @editOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get editOther;

  /// No description provided for @editBody.
  ///
  /// In en, this message translates to:
  /// **'Their original photo and remark stay in history and they are notified.'**
  String get editBody;

  /// No description provided for @editNewPhoto.
  ///
  /// In en, this message translates to:
  /// **'New photo*'**
  String get editNewPhoto;

  /// No description provided for @editWhy.
  ///
  /// In en, this message translates to:
  /// **'Why are you editing?*'**
  String get editWhy;

  /// No description provided for @editSave.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get editSave;

  /// No description provided for @teamTitle.
  ///
  /// In en, this message translates to:
  /// **'My team'**
  String get teamTitle;

  /// No description provided for @teamSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{store} · {count} staff'**
  String teamSubtitle(String store, int count);

  /// No description provided for @teamCreateLogin.
  ///
  /// In en, this message translates to:
  /// **'+ Create staff login'**
  String get teamCreateLogin;

  /// No description provided for @teamActive.
  ///
  /// In en, this message translates to:
  /// **'Active {count}'**
  String teamActive(int count);

  /// No description provided for @teamInvited.
  ///
  /// In en, this message translates to:
  /// **'SMS sent {count}'**
  String teamInvited(int count);

  /// No description provided for @teamDeactivated.
  ///
  /// In en, this message translates to:
  /// **'Deactivated {count}'**
  String teamDeactivated(int count);

  /// No description provided for @teamInvitedLine.
  ///
  /// In en, this message translates to:
  /// **'{roles} · SMS sent {days, plural, =0{today} =1{1 day ago} other{{days} days ago}}, not signed in'**
  String teamInvitedLine(String roles, int days);

  /// No description provided for @teamLeftLine.
  ///
  /// In en, this message translates to:
  /// **'{roles} · left {days, plural, =0{today} =1{1 day ago} other{{days} days ago}}'**
  String teamLeftLine(String roles, int days);

  /// No description provided for @teamStatusActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get teamStatusActive;

  /// No description provided for @teamStatusDeactivated.
  ///
  /// In en, this message translates to:
  /// **'Deactivated'**
  String get teamStatusDeactivated;

  /// No description provided for @teamSmsSent.
  ///
  /// In en, this message translates to:
  /// **'SMS sent'**
  String get teamSmsSent;

  /// No description provided for @teamResendSms.
  ///
  /// In en, this message translates to:
  /// **'Resend SMS'**
  String get teamResendSms;

  /// No description provided for @teamLoginCreated.
  ///
  /// In en, this message translates to:
  /// **'Login created. {name} will get an SMS.'**
  String teamLoginCreated(String name);

  /// No description provided for @teamStep1.
  ///
  /// In en, this message translates to:
  /// **'Step 1 of 3 · Details'**
  String get teamStep1;

  /// No description provided for @teamStep2.
  ///
  /// In en, this message translates to:
  /// **'Step 2 of 3 · Pick one or more'**
  String get teamStep2;

  /// No description provided for @teamStep3.
  ///
  /// In en, this message translates to:
  /// **'Step 3 of 3 · Review & send'**
  String get teamStep3;

  /// No description provided for @teamNewLogin.
  ///
  /// In en, this message translates to:
  /// **'New staff login'**
  String get teamNewLogin;

  /// No description provided for @teamSmsFailedTitle.
  ///
  /// In en, this message translates to:
  /// **'Login created. SMS not sent.'**
  String get teamSmsFailedTitle;

  /// No description provided for @teamSmsFailedBody.
  ///
  /// In en, this message translates to:
  /// **'{name}\'s login is ready, but the invitation could not be delivered. Check the number and try again.'**
  String teamSmsFailedBody(String name);

  /// No description provided for @teamNotSignedIn.
  ///
  /// In en, this message translates to:
  /// **'Account status · Not signed in'**
  String get teamNotSignedIn;

  /// No description provided for @teamBackToTeam.
  ///
  /// In en, this message translates to:
  /// **'Back to team'**
  String get teamBackToTeam;

  /// No description provided for @teamPhoneTaken.
  ///
  /// In en, this message translates to:
  /// **'This number already has a login. Ask Admin to move the person.'**
  String get teamPhoneTaken;

  /// No description provided for @teamFullName.
  ///
  /// In en, this message translates to:
  /// **'Full name*'**
  String get teamFullName;

  /// No description provided for @teamFullNameHint.
  ///
  /// In en, this message translates to:
  /// **'As on ID card · letters only'**
  String get teamFullNameHint;

  /// No description provided for @actionNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get actionNext;

  /// No description provided for @teamJobRoles.
  ///
  /// In en, this message translates to:
  /// **'Job roles'**
  String get teamJobRoles;

  /// No description provided for @teamTasksFromRoles.
  ///
  /// In en, this message translates to:
  /// **'Tasks from these roles'**
  String get teamTasksFromRoles;

  /// No description provided for @teamAddTask.
  ///
  /// In en, this message translates to:
  /// **'+ Add a task'**
  String get teamAddTask;

  /// No description provided for @teamPhoneStore.
  ///
  /// In en, this message translates to:
  /// **'{countryCode} {phone} · {store}'**
  String teamPhoneStore(String countryCode, String phone, String store);

  /// No description provided for @teamJobRole.
  ///
  /// In en, this message translates to:
  /// **'Job role'**
  String get teamJobRole;

  /// No description provided for @teamTasks.
  ///
  /// In en, this message translates to:
  /// **'Tasks'**
  String get teamTasks;

  /// No description provided for @teamChatGroups.
  ///
  /// In en, this message translates to:
  /// **'Chat groups'**
  String get teamChatGroups;

  /// No description provided for @teamDefaultGroups.
  ///
  /// In en, this message translates to:
  /// **'Store Team, Checklist'**
  String get teamDefaultGroups;

  /// No description provided for @teamSmsPreviewTitle.
  ///
  /// In en, this message translates to:
  /// **'SMS {name} will get'**
  String teamSmsPreviewTitle(String name);

  /// No description provided for @teamSmsPreview.
  ///
  /// In en, this message translates to:
  /// **'Hi {name}, your rapsap ops login is ready. Sign in with this number using OTP. - Rapsap'**
  String teamSmsPreview(String name);

  /// No description provided for @teamCreateAndSend.
  ///
  /// In en, this message translates to:
  /// **'Create & send SMS'**
  String get teamCreateAndSend;

  /// No description provided for @teamSaved.
  ///
  /// In en, this message translates to:
  /// **'Changes saved.'**
  String get teamSaved;

  /// No description provided for @teamDeactivatedDone.
  ///
  /// In en, this message translates to:
  /// **'Login deactivated.'**
  String get teamDeactivatedDone;

  /// No description provided for @teamReactivatedDone.
  ///
  /// In en, this message translates to:
  /// **'Login reactivated.'**
  String get teamReactivatedDone;

  /// No description provided for @teamChangeNumber.
  ///
  /// In en, this message translates to:
  /// **'Change number'**
  String get teamChangeNumber;

  /// No description provided for @teamReactivate.
  ///
  /// In en, this message translates to:
  /// **'Reactivate login'**
  String get teamReactivate;

  /// No description provided for @teamDeactivate.
  ///
  /// In en, this message translates to:
  /// **'Deactivate login'**
  String get teamDeactivate;

  /// No description provided for @teamDeactivateTitle.
  ///
  /// In en, this message translates to:
  /// **'Deactivate {name}\'s login?'**
  String teamDeactivateTitle(String name);

  /// No description provided for @teamDeactivateSignedOut.
  ///
  /// In en, this message translates to:
  /// **'Signed out on all phones straight away'**
  String get teamDeactivateSignedOut;

  /// No description provided for @teamDeactivateGroups.
  ///
  /// In en, this message translates to:
  /// **'Removed from store chat groups'**
  String get teamDeactivateGroups;

  /// No description provided for @teamDeactivateHistory.
  ///
  /// In en, this message translates to:
  /// **'Past tasks and photos stay in reports'**
  String get teamDeactivateHistory;

  /// No description provided for @teamDeactivateReactivate.
  ///
  /// In en, this message translates to:
  /// **'You can reactivate them later'**
  String get teamDeactivateReactivate;

  /// No description provided for @teamReactivateTitle.
  ///
  /// In en, this message translates to:
  /// **'Restore {name}\'s access?'**
  String teamReactivateTitle(String name);

  /// No description provided for @teamReactivateTasks.
  ///
  /// In en, this message translates to:
  /// **'Future assigned tasks resume after activation.'**
  String get teamReactivateTasks;

  /// No description provided for @actionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get actionCancel;

  /// No description provided for @teamNumberUpdated.
  ///
  /// In en, this message translates to:
  /// **'Number updated. They can now sign in with {countryCode} {phone}.'**
  String teamNumberUpdated(String countryCode, String phone);

  /// No description provided for @teamVerifyNumber.
  ///
  /// In en, this message translates to:
  /// **'Verify new number'**
  String get teamVerifyNumber;

  /// No description provided for @teamNewNumber.
  ///
  /// In en, this message translates to:
  /// **'New mobile number*'**
  String get teamNewNumber;

  /// No description provided for @teamChangeNumberHelp.
  ///
  /// In en, this message translates to:
  /// **'We\'ll send an OTP to the new number. They read it out to you to confirm. Their tasks, history and groups stay the same.'**
  String get teamChangeNumberHelp;

  /// No description provided for @teamSendOtpNew.
  ///
  /// In en, this message translates to:
  /// **'Send OTP to new number'**
  String get teamSendOtpNew;

  /// No description provided for @teamAskForOtp.
  ///
  /// In en, this message translates to:
  /// **'Ask them for the 6-digit OTP sent to {countryCode} {phone}'**
  String teamAskForOtp(String countryCode, String phone);

  /// No description provided for @teamDidntArrive.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t arrive?'**
  String get teamDidntArrive;

  /// No description provided for @teamVerifyAndUpdate.
  ///
  /// In en, this message translates to:
  /// **'Verify and update'**
  String get teamVerifyAndUpdate;

  /// No description provided for @validationNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter the full name.'**
  String get validationNameRequired;

  /// No description provided for @validationNameLength.
  ///
  /// In en, this message translates to:
  /// **'Name must be {min}–{max} characters.'**
  String validationNameLength(int min, int max);

  /// No description provided for @validationNameLetters.
  ///
  /// In en, this message translates to:
  /// **'Use letters only.'**
  String get validationNameLetters;

  /// No description provided for @listSeparatorJoin.
  ///
  /// In en, this message translates to:
  /// **'{first} · {second}'**
  String listSeparatorJoin(String first, String second);

  /// No description provided for @reportNotReady.
  ///
  /// In en, this message translates to:
  /// **'Not ready'**
  String get reportNotReady;

  /// No description provided for @reportReady.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get reportReady;

  /// No description provided for @reportSubmittedAt.
  ///
  /// In en, this message translates to:
  /// **'Submitted to HO · {time}'**
  String reportSubmittedAt(String time);

  /// No description provided for @reportApprovedAt.
  ///
  /// In en, this message translates to:
  /// **'Approved by HO · {time}'**
  String reportApprovedAt(String time);

  /// No description provided for @reportReturned.
  ///
  /// In en, this message translates to:
  /// **'Returned by HO'**
  String get reportReturned;

  /// No description provided for @reportSnapshot.
  ///
  /// In en, this message translates to:
  /// **'Snapshot'**
  String get reportSnapshot;

  /// No description provided for @reportFix.
  ///
  /// In en, this message translates to:
  /// **'Fix and resend'**
  String get reportFix;

  /// No description provided for @reportReturnedLine.
  ///
  /// In en, this message translates to:
  /// **'Returned: #{number} {comment}'**
  String reportReturnedLine(int number, String comment);

  /// No description provided for @reportOpensWithSummary.
  ///
  /// In en, this message translates to:
  /// **'Opens {time} · includes daily summary'**
  String reportOpensWithSummary(String time);

  /// No description provided for @reportSendAfterLast.
  ///
  /// In en, this message translates to:
  /// **'Send after the last task closes'**
  String get reportSendAfterLast;

  /// No description provided for @reportStats.
  ///
  /// In en, this message translates to:
  /// **'{notDone} not done · {photos} photos · {toVerify} to verify'**
  String reportStats(int notDone, int photos, int toVerify);

  /// No description provided for @reportNote.
  ///
  /// In en, this message translates to:
  /// **'Note to HO (optional)'**
  String get reportNote;

  /// No description provided for @reportSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit to HO'**
  String get reportSubmit;

  /// No description provided for @reportWalkthrough.
  ///
  /// In en, this message translates to:
  /// **'#46 Store walkthrough video'**
  String get reportWalkthrough;

  /// No description provided for @reportClosing.
  ///
  /// In en, this message translates to:
  /// **'#47 Closing report'**
  String get reportClosing;

  /// No description provided for @reportDailySummary.
  ///
  /// In en, this message translates to:
  /// **'Daily summary & submit'**
  String get reportDailySummary;

  /// No description provided for @reportResubmittedTitle.
  ///
  /// In en, this message translates to:
  /// **'Ready for another review'**
  String get reportResubmittedTitle;

  /// No description provided for @reportResubmittedBody.
  ///
  /// In en, this message translates to:
  /// **'The corrected evidence is attached. The earlier submission remains in history.'**
  String get reportResubmittedBody;

  /// No description provided for @reportRevision.
  ///
  /// In en, this message translates to:
  /// **'{section} report · Revision {revision}'**
  String reportRevision(String section, int revision);

  /// No description provided for @reportNewPhoto.
  ///
  /// In en, this message translates to:
  /// **'#{number} New photo attached'**
  String reportNewPhoto(int number);

  /// No description provided for @reportBackToReports.
  ///
  /// In en, this message translates to:
  /// **'Back to reports'**
  String get reportBackToReports;

  /// No description provided for @reportNeedsCorrection.
  ///
  /// In en, this message translates to:
  /// **'{section} needs a correction'**
  String reportNeedsCorrection(String section);

  /// No description provided for @reportReturnedBody.
  ///
  /// In en, this message translates to:
  /// **'HO returned this report. Fix the flagged entry and send a revised report.'**
  String get reportReturnedBody;

  /// No description provided for @reportReturnedAt.
  ///
  /// In en, this message translates to:
  /// **'Returned today at {time}'**
  String reportReturnedAt(String time);

  /// No description provided for @reportSendRevised.
  ///
  /// In en, this message translates to:
  /// **'Send revised report'**
  String get reportSendRevised;

  /// No description provided for @reportFixEntry.
  ///
  /// In en, this message translates to:
  /// **'Fix the entry'**
  String get reportFixEntry;

  /// No description provided for @summaryDsrFirstTitle.
  ///
  /// In en, this message translates to:
  /// **'Upload today\'s DSR first'**
  String get summaryDsrFirstTitle;

  /// No description provided for @summaryDsrFirstBody.
  ///
  /// In en, this message translates to:
  /// **'The closing summary needs today\'s sales and bill totals. Your other entries are saved.'**
  String get summaryDsrFirstBody;

  /// No description provided for @summaryNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'{label} · Not available'**
  String summaryNotAvailable(String label);

  /// No description provided for @summarySales.
  ///
  /// In en, this message translates to:
  /// **'Total sales'**
  String get summarySales;

  /// No description provided for @summaryBills.
  ///
  /// In en, this message translates to:
  /// **'Bills (NOB)'**
  String get summaryBills;

  /// No description provided for @summaryTicket.
  ///
  /// In en, this message translates to:
  /// **'Ticket size'**
  String get summaryTicket;

  /// No description provided for @summaryGoToSales.
  ///
  /// In en, this message translates to:
  /// **'Go to Sales'**
  String get summaryGoToSales;

  /// No description provided for @summaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily summary'**
  String get summaryTitle;

  /// No description provided for @summarySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Closing · daily summary'**
  String get summarySubtitle;

  /// No description provided for @summaryFromDsr.
  ///
  /// In en, this message translates to:
  /// **'From today\'s DSR · read-only'**
  String get summaryFromDsr;

  /// No description provided for @summaryFixExcel.
  ///
  /// In en, this message translates to:
  /// **'Wrong? Fix the Excel and re-upload.'**
  String get summaryFixExcel;

  /// No description provided for @summaryMargin.
  ///
  /// In en, this message translates to:
  /// **'Margin %*'**
  String get summaryMargin;

  /// No description provided for @summaryComplaints.
  ///
  /// In en, this message translates to:
  /// **'Customer complaints*'**
  String get summaryComplaints;

  /// No description provided for @summaryDamages.
  ///
  /// In en, this message translates to:
  /// **'Damages ₹*'**
  String get summaryDamages;

  /// No description provided for @summaryShrinkage.
  ///
  /// In en, this message translates to:
  /// **'Shrinkage ₹*'**
  String get summaryShrinkage;

  /// No description provided for @summaryManpower.
  ///
  /// In en, this message translates to:
  /// **'Manpower present (of {total})*'**
  String summaryManpower(int total);

  /// No description provided for @summaryKeyIssues.
  ///
  /// In en, this message translates to:
  /// **'Key issues for HO'**
  String get summaryKeyIssues;

  /// No description provided for @summarySend.
  ///
  /// In en, this message translates to:
  /// **'Send to HO'**
  String get summarySend;

  /// No description provided for @validationNumberRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter a number.'**
  String get validationNumberRequired;

  /// No description provided for @validationNumberRange.
  ///
  /// In en, this message translates to:
  /// **'Enter a number from {min} to {max}.'**
  String validationNumberRange(int min, int max);

  /// No description provided for @snapshotPostTo.
  ///
  /// In en, this message translates to:
  /// **'Post to'**
  String get snapshotPostTo;

  /// No description provided for @snapshotPost.
  ///
  /// In en, this message translates to:
  /// **'Post to chat'**
  String get snapshotPost;

  /// No description provided for @snapshotSharedTitle.
  ///
  /// In en, this message translates to:
  /// **'Report shared'**
  String get snapshotSharedTitle;

  /// No description provided for @snapshotSharedBody.
  ///
  /// In en, this message translates to:
  /// **'Your snapshot was posted successfully.'**
  String get snapshotSharedBody;

  /// No description provided for @snapshotWindow.
  ///
  /// In en, this message translates to:
  /// **'{date} · {from}–{to}'**
  String snapshotWindow(String date, String from, String to);

  /// No description provided for @snapshotMarkDone.
  ///
  /// In en, this message translates to:
  /// **'✓'**
  String get snapshotMarkDone;

  /// No description provided for @snapshotMarkMissed.
  ///
  /// In en, this message translates to:
  /// **'✕'**
  String get snapshotMarkMissed;

  /// No description provided for @snapshotMarkNotDone.
  ///
  /// In en, this message translates to:
  /// **'—'**
  String get snapshotMarkNotDone;

  /// No description provided for @closingSent.
  ///
  /// In en, this message translates to:
  /// **'Closing report sent.'**
  String get closingSent;

  /// No description provided for @closingShutter.
  ///
  /// In en, this message translates to:
  /// **'Shutter photo*'**
  String get closingShutter;

  /// No description provided for @closingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Closing · #47 · due {time}'**
  String closingSubtitle(String time);

  /// No description provided for @closingTime.
  ///
  /// In en, this message translates to:
  /// **'Closing time'**
  String get closingTime;

  /// No description provided for @closingTimeHelp.
  ///
  /// In en, this message translates to:
  /// **'Taken from the clock when you submit.'**
  String get closingTimeHelp;

  /// No description provided for @closingEarly.
  ///
  /// In en, this message translates to:
  /// **'Before {time}'**
  String closingEarly(String time);

  /// No description provided for @closingWho.
  ///
  /// In en, this message translates to:
  /// **'Who closed the store?*'**
  String get closingWho;

  /// No description provided for @closingFlagNote.
  ///
  /// In en, this message translates to:
  /// **'Closing before {time} is flagged to Admin.'**
  String closingFlagNote(String time);

  /// No description provided for @walkthroughSent.
  ///
  /// In en, this message translates to:
  /// **'Walkthrough video sent.'**
  String get walkthroughSent;

  /// No description provided for @walkthroughTitle.
  ///
  /// In en, this message translates to:
  /// **'#46 Store walkthrough'**
  String get walkthroughTitle;

  /// No description provided for @walkthroughSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Floor + back store · due {time}'**
  String walkthroughSubtitle(String time);

  /// No description provided for @walkthroughRec.
  ///
  /// In en, this message translates to:
  /// **'● REC {elapsed} / {limit}'**
  String walkthroughRec(String elapsed, String limit);

  /// No description provided for @walkthroughStop.
  ///
  /// In en, this message translates to:
  /// **'Stop recording'**
  String get walkthroughStop;

  /// No description provided for @walkthroughStart.
  ///
  /// In en, this message translates to:
  /// **'Start recording'**
  String get walkthroughStart;

  /// No description provided for @walkthroughReviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Review your walkthrough'**
  String get walkthroughReviewTitle;

  /// No description provided for @walkthroughReviewBody.
  ///
  /// In en, this message translates to:
  /// **'Check that the floor and back store are clearly visible before sending.'**
  String get walkthroughReviewBody;

  /// No description provided for @walkthroughPlay.
  ///
  /// In en, this message translates to:
  /// **'Play or pause the video'**
  String get walkthroughPlay;

  /// No description provided for @walkthroughMeta.
  ///
  /// In en, this message translates to:
  /// **'Task #46 · Today, {time}'**
  String walkthroughMeta(String time);

  /// No description provided for @walkthroughSend.
  ///
  /// In en, this message translates to:
  /// **'Send video'**
  String get walkthroughSend;

  /// No description provided for @navSales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get navSales;

  /// No description provided for @salesTitle.
  ///
  /// In en, this message translates to:
  /// **'Sales (DSR)'**
  String get salesTitle;

  /// No description provided for @dsrNotUploaded.
  ///
  /// In en, this message translates to:
  /// **'Not uploaded'**
  String get dsrNotUploaded;

  /// No description provided for @dsrUploadedOnTime.
  ///
  /// In en, this message translates to:
  /// **'Uploaded {time} · On time'**
  String dsrUploadedOnTime(String time);

  /// No description provided for @dsrUploadedLate.
  ///
  /// In en, this message translates to:
  /// **'Uploaded {time} · Late'**
  String dsrUploadedLate(String time);

  /// No description provided for @dsrUpload.
  ///
  /// In en, this message translates to:
  /// **'Upload today\'s DSR Excel'**
  String get dsrUpload;

  /// No description provided for @dsrReupload.
  ///
  /// In en, this message translates to:
  /// **'Upload again'**
  String get dsrReupload;

  /// No description provided for @dsrMonthTarget.
  ///
  /// In en, this message translates to:
  /// **'{month} target'**
  String dsrMonthTarget(String month);

  /// No description provided for @dsrAchieved.
  ///
  /// In en, this message translates to:
  /// **'{percent}% achieved'**
  String dsrAchieved(int percent);

  /// No description provided for @dsrNeedPerDay.
  ///
  /// In en, this message translates to:
  /// **'Need {amount} a day for the rest of the month'**
  String dsrNeedPerDay(String amount);

  /// No description provided for @dsrTrend.
  ///
  /// In en, this message translates to:
  /// **'Trend'**
  String get dsrTrend;

  /// No description provided for @dsrChange.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get dsrChange;

  /// No description provided for @dsrPeriod1M.
  ///
  /// In en, this message translates to:
  /// **'1M'**
  String get dsrPeriod1M;

  /// No description provided for @dsrPeriod3M.
  ///
  /// In en, this message translates to:
  /// **'3M'**
  String get dsrPeriod3M;

  /// No description provided for @dsrPeriod6M.
  ///
  /// In en, this message translates to:
  /// **'6M'**
  String get dsrPeriod6M;

  /// No description provided for @dsrPeriod1Y.
  ///
  /// In en, this message translates to:
  /// **'1Y'**
  String get dsrPeriod1Y;

  /// No description provided for @dsrTrendLabel.
  ///
  /// In en, this message translates to:
  /// **'Daily sales this period compared with the same days last period'**
  String get dsrTrendLabel;

  /// No description provided for @dsrLegend.
  ///
  /// In en, this message translates to:
  /// **'— This period   - - Same days last period'**
  String get dsrLegend;

  /// No description provided for @dsrHistory.
  ///
  /// In en, this message translates to:
  /// **'Posting history'**
  String get dsrHistory;

  /// No description provided for @dsrOnTime.
  ///
  /// In en, this message translates to:
  /// **'On time'**
  String get dsrOnTime;

  /// No description provided for @dsrLate.
  ///
  /// In en, this message translates to:
  /// **'Late'**
  String get dsrLate;

  /// No description provided for @dsrReading.
  ///
  /// In en, this message translates to:
  /// **'Reading your file…'**
  String get dsrReading;

  /// No description provided for @dsrCheckTitle.
  ///
  /// In en, this message translates to:
  /// **'Check before saving'**
  String get dsrCheckTitle;

  /// No description provided for @dsrRejectedTitle.
  ///
  /// In en, this message translates to:
  /// **'Can\'t save this file'**
  String get dsrRejectedTitle;

  /// No description provided for @dsrXlsx.
  ///
  /// In en, this message translates to:
  /// **'XLSX'**
  String get dsrXlsx;

  /// No description provided for @dsrFileMeta.
  ///
  /// In en, this message translates to:
  /// **'{kb} KB · {note}'**
  String dsrFileMeta(int kb, String note);

  /// No description provided for @dsrReadNow.
  ///
  /// In en, this message translates to:
  /// **'read just now'**
  String get dsrReadNow;

  /// No description provided for @dsrNotReadable.
  ///
  /// In en, this message translates to:
  /// **'not accepted'**
  String get dsrNotReadable;

  /// No description provided for @dsrDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get dsrDate;

  /// No description provided for @dsrNetSales.
  ///
  /// In en, this message translates to:
  /// **'Net sales'**
  String get dsrNetSales;

  /// No description provided for @dsrMonthTargetShort.
  ///
  /// In en, this message translates to:
  /// **'Month target'**
  String get dsrMonthTargetShort;

  /// No description provided for @dsrReplaces.
  ///
  /// In en, this message translates to:
  /// **'Already uploaded for this date? Saving replaces it. The old version stays in history.'**
  String get dsrReplaces;

  /// No description provided for @dsrSave.
  ///
  /// In en, this message translates to:
  /// **'Save DSR'**
  String get dsrSave;

  /// No description provided for @dsrWrongStore.
  ///
  /// In en, this message translates to:
  /// **'This looks like {store}\'s DSR. You can only upload your store\'s DSR. Pick today\'s file for your store and try again.'**
  String dsrWrongStore(String store);

  /// No description provided for @dsrUnreadableDate.
  ///
  /// In en, this message translates to:
  /// **'Unreadable date'**
  String get dsrUnreadableDate;

  /// No description provided for @dsrNoSales.
  ///
  /// In en, this message translates to:
  /// **'No sales figure'**
  String get dsrNoSales;

  /// No description provided for @dsrTooLarge.
  ///
  /// In en, this message translates to:
  /// **'Over {mb} MB'**
  String dsrTooLarge(int mb);

  /// No description provided for @dsrHasMacros.
  ///
  /// In en, this message translates to:
  /// **'Has macros'**
  String get dsrHasMacros;

  /// No description provided for @dsrOtherReasons.
  ///
  /// In en, this message translates to:
  /// **'Other reasons a file is blocked'**
  String get dsrOtherReasons;

  /// No description provided for @dsrUploadAnother.
  ///
  /// In en, this message translates to:
  /// **'Upload another file'**
  String get dsrUploadAnother;

  /// No description provided for @dsrSavedOnTime.
  ///
  /// In en, this message translates to:
  /// **'DSR saved · {time} · on time'**
  String dsrSavedOnTime(String time);

  /// No description provided for @dsrSavedLate.
  ///
  /// In en, this message translates to:
  /// **'DSR saved · {time} · late'**
  String dsrSavedLate(String time);

  /// No description provided for @dsrSnapshotTitle.
  ///
  /// In en, this message translates to:
  /// **'DSR · {date}'**
  String dsrSnapshotTitle(String date);

  /// No description provided for @dsrSnapshotLine.
  ///
  /// In en, this message translates to:
  /// **'{bills} bills · {ticket} ticket · MTD {percent}%'**
  String dsrSnapshotLine(int bills, String ticket, int percent);

  /// No description provided for @dsrReportsGroup.
  ///
  /// In en, this message translates to:
  /// **'DSR Reports'**
  String get dsrReportsGroup;

  /// No description provided for @dsrPostedBody.
  ///
  /// In en, this message translates to:
  /// **'Your DSR snapshot was posted successfully.'**
  String get dsrPostedBody;

  /// No description provided for @dsrSalesBills.
  ///
  /// In en, this message translates to:
  /// **'{sales} sales · {bills} bills'**
  String dsrSalesBills(String sales, int bills);

  /// No description provided for @dsrBackToSales.
  ///
  /// In en, this message translates to:
  /// **'Back to Sales'**
  String get dsrBackToSales;

  /// No description provided for @dsrChangePercent.
  ///
  /// In en, this message translates to:
  /// **'{sign}{value}%'**
  String dsrChangePercent(String sign, String value);

  /// No description provided for @installTitle.
  ///
  /// In en, this message translates to:
  /// **'Install Rapsap Ops'**
  String get installTitle;

  /// No description provided for @installBody.
  ///
  /// In en, this message translates to:
  /// **'Install the app on your phone to continue. It opens full screen and sends you task alerts.'**
  String get installBody;

  /// No description provided for @installNow.
  ///
  /// In en, this message translates to:
  /// **'Install now'**
  String get installNow;

  /// No description provided for @installIosStepShare.
  ///
  /// In en, this message translates to:
  /// **'Tap Share in Safari. Don\'t see it? Tap the menu (⋯ or ≡) next to the address bar first'**
  String get installIosStepShare;

  /// No description provided for @installIosStepAdd.
  ///
  /// In en, this message translates to:
  /// **'Scroll down and tap \"Add to Home Screen\"'**
  String get installIosStepAdd;

  /// No description provided for @installBrowserStepMenu.
  ///
  /// In en, this message translates to:
  /// **'Open the browser menu (⋮)'**
  String get installBrowserStepMenu;

  /// No description provided for @installBrowserStepAdd.
  ///
  /// In en, this message translates to:
  /// **'Tap \"Install app\" or \"Add to Home screen\"'**
  String get installBrowserStepAdd;

  /// No description provided for @installStepOpen.
  ///
  /// In en, this message translates to:
  /// **'Open Rapsap Ops from your home screen'**
  String get installStepOpen;

  /// No description provided for @installIosNote.
  ///
  /// In en, this message translates to:
  /// **'Opened this link inside another app? Open it in Safari first.'**
  String get installIosNote;

  /// No description provided for @installBrowserNote.
  ///
  /// In en, this message translates to:
  /// **'Already installed? Open Rapsap Ops from your home screen.'**
  String get installBrowserNote;

  /// No description provided for @installDoneTitle.
  ///
  /// In en, this message translates to:
  /// **'App installed'**
  String get installDoneTitle;

  /// No description provided for @installDoneBody.
  ///
  /// In en, this message translates to:
  /// **'Close this tab and open Rapsap Ops from your home screen.'**
  String get installDoneBody;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hi', 'mr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
    case 'mr':
      return AppLocalizationsMr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
