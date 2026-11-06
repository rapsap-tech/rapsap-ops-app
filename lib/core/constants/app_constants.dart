import 'package:flutter/widgets.dart';

class AppConstants {
  new _();

  static const String appName = 'rapsap';
  static const String appNameDot = '.';

  static const Size designSize = Size(390, 844);
  static const double maxPhoneWidth = 430;
  static const double phoneFrameBreakpoint = 500;
  static const double minTextScale = 0.9;
  static const double maxTextScale = 1.3;

  static const List<String> supportedLanguageCodes = ['en', 'mr', 'hi'];
  static const String defaultLanguageCode = 'en';
  static const String localDbName = 'local_db';

  /// Shape of any id that goes into an API path.
  static final RegExp idPattern = RegExp(r'^[A-Za-z0-9_-]{1,64}$');
  static const String localDbBlobsName = 'local_db_blobs';
  static const String savedVideosFolder = 'saved_videos';
  static const String marathiCode = 'mr';
  static const String hindiCode = 'hi';

  static const int phoneLength = 10;
  static const String countryCode = '+91';
  static const int otpLength = 6;
  static const int otpResendSeconds = 30;
  static const int otpLockMinutes = 15;
  static const int otpValidMinutes = 5;
  static const int otpMaxWrongTries = 5;

  static const int pageSize = 20;
  static const String currencyLocale = 'en_IN';
  static const String currencySymbol = '₹';
  static const int lakh = 100000;
  static const int chatMessageMaxLength = 1000;
  static const Duration socketRetryBase = Duration(seconds: 2);
  static const Duration socketRetryMax = Duration(seconds: 30);
  static const Duration socketStableAfter = Duration(seconds: 30);

  static const int remarksMaxLength = 300;
  static const int sendBackMaxLength = 200;
  static final RegExp integerInput = RegExp(r'\d');
  static final RegExp decimalInput = RegExp(r'[\d.]');
  static const int reasonMinLength = 5;
  static const int photoMaxSide = 1280;
  static const int photoMaxBytes = 300 * 1024;
  static const List<int> photoJpegQualities = [80, 65, 50, 35];
  static const String photoFileName = 'proof.jpg';
  static const String videoFileName = 'proof.mp4';
  static final RegExp videoUrlPattern = RegExp(
    r'\.(mp4|webm|mov)(\?|$)',
    caseSensitive: false,
  );
  static const String stampBrand = 'RAPSAP';
  static const String stampSeparator = ' · ';
  static const String stampDateFormat = 'd MMM yyyy';
  static const String stampTimeFormat = 'h:mm:ss a';
  static const String stampZone = 'IST';
  static const String stampTaskPrefix = 'Task #';
  static const String stampLocale = 'en_US';
  static const int dsrMaxUploadMb = 5;
  static const int bytesPerKb = 1024;
  static const int bytesPerMb = 1024 * 1024;
  static const String xlsxMime =
      'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
  static const String apiDateFormat = 'yyyy-MM-dd';
  static const String dsrGroupId = 'c-dsr';
  static const int maxVideoSeconds = 45;
  static const int summaryMaxCount = 999;
  static const int summaryMaxAmount = 9999999;
  static const int summaryNumberMaxLength = 9;
  static const int videoMaxBytes = 25 * 1024 * 1024;
  static const int socketAuthFailedCode = 4401;
  static const String refreshLockName = 'auth-refresh';

  static const Duration connectivityDebounce = Duration(seconds: 1);
  static const int maxGetRetries = 2;
  static const Duration retryBaseDelay = Duration(milliseconds: 500);

  /// Stores run on IST (Asia/Kolkata, no DST), so a fixed offset is exact.
  static const Duration storeUtcOffset = Duration(hours: 5, minutes: 30);
  static const int dueSoonMinutes = 30;
  static const String timeFormat = 'HH:mm';
  static const String clockFormat = 'h:mm a';
  static const String headerDateFormat = 'd MMM yyyy';
  static const String shortDateFormat = 'd MMM';

  static final RegExp indianMobile = RegExp(r'^[6-9]\d{9}$');
  static final RegExp personName = RegExp(
    r"^[\p{L}\p{M} .'-]+$",
    unicode: true,
  );
  static const int nameMinLength = 2;
  static const int nameMaxLength = 50;
  static const int maskedPhoneVisibleStart = 2;
  static const int maskedPhoneVisibleEnd = 3;
}
