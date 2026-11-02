import 'package:intl/intl.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';

extension StoreDateX on DateTime {
  /// Wall-clock time at the store, whatever the device time zone is.
  DateTime get inStoreTime => toUtc().add(AppConstants.storeUtcOffset);

  String storeTime() => DateFormat(AppConstants.timeFormat).format(inStoreTime);

  String storeClock(String locale) =>
      DateFormat(AppConstants.clockFormat, locale).format(inStoreTime);

  String storeShortDate(String locale) =>
      DateFormat(AppConstants.shortDateFormat, locale).format(inStoreTime);

  String storeHeaderDate(String locale) => DateFormat(
    AppConstants.headerDateFormat,
    locale,
  ).format(inStoreTime).toUpperCase();
}
