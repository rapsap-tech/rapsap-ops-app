import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/string_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_avatar.dart';
import 'package:rapsap_ops_app/core/widgets/app_scaffold.dart';
import 'package:rapsap_ops_app/core/widgets/info_rows_card.dart';
import 'package:rapsap_ops_app/core/widgets/load_state_view.dart';
import 'package:rapsap_ops_app/core/widgets/page_header.dart';
import 'package:rapsap_ops_app/core/widgets/status_chip.dart';
import 'package:rapsap_ops_app/features/profile/domain/entities/profile.dart';
import 'package:rapsap_ops_app/features/profile/presentation/bloc/profile_cubit.dart';
import 'package:rapsap_ops_app/features/profile/presentation/widgets/month_stats_card.dart';

/// B13 · My profile.
class ProfilePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = getIt<ProfileCubit>();
        unawaited(cubit.load());
        return cubit;
      },
      child: AppScaffold(
        header: PageHeader(title: context.l10n.profileTitle),
        body: LoadStateView<ProfileCubit, Profile>(
          builder: (context, profile) => _ProfileBody(profile: profile),
        ),
      ),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const new({required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final contact = profile.emergencyContact;
    return ListView(
      padding: Dimens.pagePadding,
      children: [
        Row(
          children: [
            AppAvatar(name: profile.name, size: Dimens.avatarLarge),
            16.wSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(profile.name, style: AppTextStyles.base.s22.w700),
                  8.hSpace,
                  Wrap(
                    spacing: Dimens.paddingSmall,
                    runSpacing: Dimens.paddingSmall,
                    children: [
                      for (final tag in profile.tags)
                        StatusChip(label: tag, tone: StatusTone.neutral),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        20.hSpace,
        InfoRowsCard(
          rows: [
            if (profile.employeeId.isNotEmpty)
              (l10n.profileEmployeeId, profile.employeeId),
            if (profile.phone.isNotEmpty)
              (
                l10n.profileMobile,
                '${AppConstants.countryCode} ${profile.phone.maskedPhone}',
              ),
            if (profile.storeName.isNotEmpty)
              (l10n.profileStore, profile.storeName),
            if (profile.reportsTo.isNotEmpty)
              (l10n.profileReportsTo, profile.reportsTo),
          ],
        ),
        if (profile.doneThisMonth + profile.missedThisMonth > 0) ...[
          20.hSpace,
          MonthStatsCard(profile: profile),
        ],
        if (contact != null) ...[
          20.hSpace,
          InfoRowsCard(rows: [(l10n.profileEmergencyContact, contact)]),
        ],
      ],
    );
  }
}
