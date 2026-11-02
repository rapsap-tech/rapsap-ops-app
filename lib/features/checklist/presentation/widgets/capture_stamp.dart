import 'package:intl/intl.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/capture_session.dart';

/// CK-12 stamp lines. Fixed English format so HO can read every photo.
List<String> captureStampLines(CaptureSession session, Duration elapsed) {
  final time = session.serverTime.add(elapsed).inStoreTime;
  const sep = AppConstants.stampSeparator;
  const locale = AppConstants.stampLocale;
  final date = DateFormat(AppConstants.stampDateFormat, locale).format(time);
  final clock = DateFormat(AppConstants.stampTimeFormat, locale).format(time);
  final store = '${session.storeCode} ${session.storeName}';
  final task = '${AppConstants.stampTaskPrefix}${session.taskNumber}';
  return [
    '${AppConstants.stampBrand}$sep$store',
    '${session.staffName}$sep$task',
    '$date$sep$clock ${AppConstants.stampZone}',
  ];
}
