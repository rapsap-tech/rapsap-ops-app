import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/l10n/gen/app_localizations.dart';

class Validators {
  new _();

  static bool isValidPhone(String value) =>
      AppConstants.indianMobile.hasMatch(value.trim());

  /// 10-digit Indian mobile (starts 6–9), as required by LOG-01.
  static String? phone(String? value, AppLocalizations l10n) {
    final input = value?.trim() ?? '';
    if (input.isEmpty) return l10n.validationPhoneRequired;
    if (!isValidPhone(input)) return l10n.validationPhoneInvalid;
    return null;
  }

  /// Optional free text with an upper limit (e.g. task remarks).
  static String? optionalText(String? value, AppLocalizations l10n) {
    final length = value?.trim().length ?? 0;
    if (length > AppConstants.remarksMaxLength) {
      return l10n.validationTooLong(AppConstants.remarksMaxLength);
    }
    return null;
  }

  /// Required reason (e.g. "can't take a photo", "send back").
  static String? reason(String? value, AppLocalizations l10n) {
    final length = value?.trim().length ?? 0;
    if (length == 0) return l10n.validationReasonRequired;
    if (length < AppConstants.reasonMinLength) {
      return l10n.validationReasonTooShort(AppConstants.reasonMinLength);
    }
    return optionalText(value, l10n);
  }

  /// Full name as on the ID card: letters (any script) and spaces only.
  static String? personName(String? value, AppLocalizations l10n) {
    final input = value?.trim() ?? '';
    if (input.isEmpty) return l10n.validationNameRequired;
    if (input.length < AppConstants.nameMinLength ||
        input.length > AppConstants.nameMaxLength) {
      return l10n.validationNameLength(
        AppConstants.nameMinLength,
        AppConstants.nameMaxLength,
      );
    }
    if (!AppConstants.personName.hasMatch(input)) {
      return l10n.validationNameLetters;
    }
    return null;
  }

  static String? requiredNumber(String? value, AppLocalizations l10n) {
    if (num.tryParse(value?.trim() ?? '') == null) {
      return l10n.validationNumberRequired;
    }
    return null;
  }

  static String? numberInRange(
    String? value,
    num min,
    num max,
    AppLocalizations l10n,
  ) {
    final n = num.tryParse(value?.trim() ?? '');
    if (n == null) return l10n.validationNumberRequired;
    if (n < min || n > max) {
      return l10n.validationNumberRange(min.round(), max.round());
    }
    return null;
  }

  static bool isCompleteOtp(String value) =>
      value.length == AppConstants.otpLength && int.tryParse(value) != null;
}
