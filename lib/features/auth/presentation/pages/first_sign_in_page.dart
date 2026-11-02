import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/core/widgets/app_scaffold.dart';
import 'package:rapsap_ops_app/core/widgets/brand_logo.dart';
import 'package:rapsap_ops_app/core/widgets/message_banner.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/user.dart';
import 'package:rapsap_ops_app/features/auth/presentation/bloc/first_sign_in_cubit.dart';
import 'package:rapsap_ops_app/features/auth/presentation/widgets/permission_list.dart';

/// A5 · First sign-in: privacy notice and camera/notification permissions.
class FirstSignInPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = getIt<FirstSignInCubit>();
        unawaited(cubit.load());
        return cubit;
      },
      child: BlocListener<FirstSignInCubit, FirstSignInState>(
        listenWhen: (prev, next) =>
            prev.status != next.status && next.status == ConsentStatus.success,
        listener: (context, _) {
          final session = context.read<SessionCubit>();
          final user = session.state.user;
          if (user != null) {
            session.signedIn(user.copyWith(consentAccepted: true));
          }
        },
        child: const AppScaffold(body: _Body(), footer: _AgreeFooter()),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final user = context.select<SessionCubit, User?>((c) => c.state.user);
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        Dimens.paddingMedium,
        Dimens.paddingExtraLarge,
        Dimens.paddingMedium,
        Dimens.paddingMedium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BrandLogo(),
          16.hSpace,
          Text(
            l10n.welcomeTitle(user?.name ?? ''),
            style: AppTextStyles.base.s24.w700.l1,
          ),
          6.hSpace,
          Text(
            l10n.welcomeSubtitle(
              user?.jobRoles.join(', ') ?? '',
              user?.storeName ?? '',
            ),
            style: AppTextStyles.base.s14.secondaryTextColor(),
          ),
          24.hSpace,
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.welcomeCollectTitle,
                  style: AppTextStyles.base.s16.w700,
                ),
                6.hSpace,
                Text(
                  l10n.welcomeCollectBody,
                  style: AppTextStyles.base.s14
                      .lineHeight(20.3)
                      .secondaryTextColor(),
                ),
              ],
            ),
          ),
          12.hSpace,
          const PermissionList(),
        ],
      ),
    );
  }
}

class _AgreeFooter extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FirstSignInCubit>().state;
    final failure = state.status == ConsentStatus.failure
        ? state.failure
        : null;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (failure != null) ...[
          MessageBanner(failure.message(context.l10n)),
          16.hSpace,
        ],
        AppButton(
          label: context.l10n.welcomeAgree,
          isLoading: state.status == ConsentStatus.submitting,
          onPressed: state.canContinue
              ? context.read<FirstSignInCubit>().agree
              : null,
        ),
      ],
    );
  }
}
