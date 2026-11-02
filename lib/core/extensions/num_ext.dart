import 'package:intl/intl.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';

extension MoneyX on num {
  /// ₹1,23,456 (Indian grouping).
  String rupees(String locale) => NumberFormat.currency(
    locale: AppConstants.currencyLocale,
    symbol: AppConstants.currencySymbol,
    decimalDigits: 0,
  ).format(this);

  /// ₹18.4 L for lakh amounts, otherwise the full rupee amount.
  String lakhs(String locale) {
    if (this < AppConstants.lakh) return rupees(locale);
    final value = (this / AppConstants.lakh).toStringAsFixed(1);
    return '${AppConstants.currencySymbol}$value L';
  }

  String grouped() =>
      NumberFormat.decimalPattern(AppConstants.currencyLocale).format(this);
}

extension MonthX on DateTime {
  String monthName(String locale) => DateFormat.MMMM(locale).format(this);
}
