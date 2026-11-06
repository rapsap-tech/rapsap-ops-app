import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_scaffold.dart';
import 'package:rapsap_ops_app/core/widgets/load_state_view.dart';
import 'package:rapsap_ops_app/core/widgets/message_banner.dart';
import 'package:rapsap_ops_app/core/widgets/page_header.dart';
import 'package:rapsap_ops_app/features/auth/presentation/bloc/logout_cubit.dart';
import 'package:rapsap_ops_app/features/settings/domain/entities/notification_prefs.dart';
import 'package:rapsap_ops_app/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:rapsap_ops_app/features/settings/presentation/widgets/language_section.dart';
import 'package:rapsap_ops_app/features/settings/presentation/widgets/logout_section.dart';
import 'package:rapsap_ops_app/features/settings/presentation/widgets/notification_section.dart';

/// Settings: language, notification alerts, log out.
class SettingsPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            final cubit = getIt<SettingsCubit>();
            if (EnvConfig.instance.hasNotificationSettings) {
              unawaited(cubit.load());
            }
            return cubit;
          },
        ),
        BlocProvider(create: (_) => getIt<LogoutCubit>()),
      ],
      child: AppScaffold(
        header: PageHeader(title: context.l10n.settingsTitle),
        body: EnvConfig.instance.hasNotificationSettings
            ? LoadStateView<SettingsCubit, NotificationPrefs>(
                builder: (context, prefs) => _SettingsList(prefs: prefs),
              )
            : const _SettingsList(),
      ),
    );
  }
}

/// [prefs] is null while the server has no notification settings.
class _SettingsList extends StatelessWidget {
  const new({this.prefs});

  final NotificationPrefs? prefs;

  @override
  Widget build(BuildContext context) {
    final prefs = this.prefs;
    return ListView(
      padding: Dimens.pagePadding,
      children: [
        const LanguageSection(),
        20.hSpace,
        if (prefs != null) ...[
          NotificationSection(prefs: prefs),
          const _SaveError(),
          20.hSpace,
        ],
        const LogoutSection(),
      ],
    );
  }
}

class _SaveError extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SettingsCubit>().state;
    final failure = state.failure;
    if (state.status != LoadStatus.failure || failure == null) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: EdgeInsets.only(top: Dimens.space12),
      child: MessageBanner(failure.message(context.l10n)),
    );
  }
}
