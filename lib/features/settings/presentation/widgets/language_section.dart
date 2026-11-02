import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/bloc/locale_cubit.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/features/settings/presentation/widgets/settings_section.dart';

class LanguageSection extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final code = context.select<LocaleCubit, String>(
      (c) => c.state.languageCode,
    );
    final cubit = context.read<LocaleCubit>();
    final names = {
      AppConstants.defaultLanguageCode: l10n.languageEnglish,
      AppConstants.marathiCode: l10n.languageMarathi,
      AppConstants.hindiCode: l10n.languageHindi,
    };
    return RadioGroup<String>(
      groupValue: code,
      onChanged: (value) {
        if (value != null) unawaited(cubit.setLanguage(value));
      },
      child: SettingsSection(
        title: l10n.settingsLanguage,
        children: [
          for (final entry in names.entries)
            RadioListTile<String>(
              value: entry.key,
              activeColor: AppColors.primary,
              title: Text(entry.value, style: AppTextStyles.base.s15),
            ),
        ],
      ),
    );
  }
}
