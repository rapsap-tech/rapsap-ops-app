import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/features/settings/domain/entities/notification_prefs.dart';
import 'package:rapsap_ops_app/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:rapsap_ops_app/features/settings/presentation/widgets/settings_section.dart';

class NotificationSection extends StatelessWidget {
  const new({required this.prefs, super.key});

  final NotificationPrefs prefs;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<SettingsCubit>();
    return SettingsSection(
      title: l10n.settingsNotifications,
      children: [
        ListTile(
          title: Text(
            l10n.settingsTaskReminders,
            style: AppTextStyles.base.s15,
          ),
          trailing: Text(
            l10n.settingsAlwaysOn,
            style: AppTextStyles.base.s13.secondaryTextColor(),
          ),
        ),
        SwitchListTile(
          value: prefs.chatMessages,
          activeThumbColor: AppColors.primary,
          title: Text(l10n.settingsChatMessages, style: AppTextStyles.base.s15),
          onChanged: (v) =>
              unawaited(cubit.update(prefs.copyWith(chatMessages: v))),
        ),
        SwitchListTile(
          value: prefs.announcements,
          activeThumbColor: AppColors.primary,
          title: Text(
            l10n.settingsAnnouncements,
            style: AppTextStyles.base.s15,
          ),
          onChanged: (v) =>
              unawaited(cubit.update(prefs.copyWith(announcements: v))),
        ),
      ],
    );
  }
}
