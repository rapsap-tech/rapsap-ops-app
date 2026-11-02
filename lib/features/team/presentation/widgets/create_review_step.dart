import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_avatar.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/core/widgets/info_rows_card.dart';
import 'package:rapsap_ops_app/core/widgets/message_banner.dart';
import 'package:rapsap_ops_app/features/team/presentation/bloc/create_login_cubit.dart';

/// C10 · Review & send.
class CreateReviewStep extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<CreateLoginCubit>().state;
    final store = context.select<SessionCubit, String>(
      (c) => c.state.user?.storeName ?? '',
    );
    final roles =
        state.catalog?.roles
            .where((r) => state.roleIds.contains(r.id))
            .map((r) => r.name)
            .join(', ') ??
        '';
    final failure = state.status == CreateStatus.failure ? state.failure : null;
    return ListView(
      padding: Dimens.pagePadding,
      children: [
        Row(
          children: [
            AppAvatar(name: state.name),
            12.wSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(state.name, style: AppTextStyles.base.s16.w700),
                  Text(
                    l10n.teamPhoneStore(
                      AppConstants.countryCode,
                      state.phone,
                      store,
                    ),
                    style: AppTextStyles.base.s12.secondaryTextColor(),
                  ),
                ],
              ),
            ),
          ],
        ),
        16.hSpace,
        InfoRowsCard(
          rows: [
            (l10n.teamJobRole, roles),
            (l10n.teamTasks, '${state.tasks.length}'),
            (l10n.teamChatGroups, l10n.teamDefaultGroups),
          ],
        ),
        16.hSpace,
        Text(
          l10n.teamSmsPreviewTitle(state.name),
          style: AppTextStyles.base.s14.w600,
        ),
        8.hSpace,
        AppCard(
          child: Text(
            l10n.teamSmsPreview(state.name),
            style: AppTextStyles.base.s14,
          ),
        ),
        if (failure != null) ...[
          16.hSpace,
          MessageBanner(failure.message(l10n)),
        ],
        24.hSpace,
        AppButton(
          label: l10n.teamCreateAndSend,
          isLoading: state.status == CreateStatus.submitting,
          onPressed: context.read<CreateLoginCubit>().submit,
        ),
      ],
    );
  }
}
