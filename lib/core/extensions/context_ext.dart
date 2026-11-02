import 'package:flutter/widgets.dart';
import 'package:rapsap_ops_app/core/l10n/gen/app_localizations.dart';

extension ContextX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
