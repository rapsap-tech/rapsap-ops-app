import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/message_banner.dart';
import 'package:rapsap_ops_app/features/auth/presentation/bloc/logout_cubit.dart';

class LogoutSection extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<LogoutCubit>().state;
    final cubit = context.read<LogoutCubit>();
    final loading = state.status == LogoutStatus.loading;
    final failure = state.failure;
    return Column(
      children: [
        if (failure != null) ...[
          MessageBanner(failure.message(l10n)),
          12.hSpace,
        ],
        AppButton(
          label: l10n.logOut,
          variant: AppButtonVariant.outline,
          isLoading: loading && !state.allDevices,
          onPressed: loading ? null : cubit.logOut,
        ),
        12.hSpace,
        AppButton(
          label: l10n.logOutAllDevices,
          variant: AppButtonVariant.danger,
          isLoading: loading && state.allDevices,
          onPressed: loading ? null : () => cubit.logOut(allDevices: true),
        ),
      ],
    );
  }
}
