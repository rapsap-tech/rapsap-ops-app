import 'package:rapsap_ops_app/core/constants/app_constants.dart';

extension PhoneMaskX on String {
  /// 9876543210 → 98XXXXX210, so full numbers never show on screen.
  String get maskedPhone {
    const start = AppConstants.maskedPhoneVisibleStart;
    const end = AppConstants.maskedPhoneVisibleEnd;
    if (length <= start + end) return this;
    return '${substring(0, start)}${'X' * (length - start - end)}'
        '${substring(length - end)}';
  }
}
