import 'package:flutter/widgets.dart';
import 'package:rapsap_ops_app/core/l10n/gen/app_localizations.dart';

extension ContextX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

extension SectionNameX on AppLocalizations {
  /// The API sends section keys (`back_store`); other names show as sent.
  String sectionName(String key) => switch (key.toLowerCase()) {
    'opening' => sectionNameOpening,
    'trading' => sectionNameTrading,
    'back_store' => sectionNameBackStore,
    'hygiene' => sectionNameHygiene,
    'closing' => sectionNameClosing,
    _ => key,
  };
}
