import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/app_phone_field.dart';
import 'package:rapsap_ops_app/core/widgets/app_scaffold.dart';
import 'package:rapsap_ops_app/core/widgets/brand_logo.dart';
import 'package:rapsap_ops_app/core/widgets/language_toggle.dart';
import 'package:rapsap_ops_app/core/widgets/message_banner.dart';
import 'package:rapsap_ops_app/features/auth/presentation/bloc/login_cubit.dart';
import 'package:rapsap_ops_app/features/auth/presentation/pages/otp_page.dart';

/// A2 · Sign in, including the A3 "no login" state.
class LoginPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: BlocListener<LoginCubit, LoginState>(
        listenWhen: (prev, next) =>
            prev.status != next.status && next.status == LoginStatus.success,
        listener: (context, state) => context.pushNamed(
          RouteNames.otp,
          extra: OtpPageArgs(phone: state.phone, ticket: state.ticket!),
        ),
        child: const AppScaffold(
          header: _TopBar(),
          body: _LoginForm(),
          footer: _LoginFooter(),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.fromLTRB(
      Dimens.paddingMedium,
      Dimens.paddingMedium,
      Dimens.paddingMedium,
      0,
    ),
    child: const Align(
      alignment: Alignment.centerRight,
      child: LanguageToggle(),
    ),
  );
}

class _LoginForm extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<LoginCubit>();
    final loading = context.select<LoginCubit, bool>(
      (c) => c.state.status == LoginStatus.loading,
    );
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: Dimens.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Dimens.logoAreaHeight,
            child: const Center(child: BrandLogo(large: true)),
          ),
          Text(l10n.loginTitle, style: AppTextStyles.base.s24.w700.l1),
          8.hSpace,
          Text(
            l10n.loginSubtitle,
            style: AppTextStyles.base.s14.lineHeight(20.3).secondaryTextColor(),
          ),
          24.hSpace,
          Text(l10n.loginPhoneLabel, style: AppTextStyles.base.s14.w600),
          8.hSpace,
          AppPhoneField(
            enabled: !loading,
            onChanged: cubit.phoneChanged,
            onSubmitted: cubit.submit,
          ),
          16.hSpace,
          Text(
            l10n.loginHelper,
            style: AppTextStyles.base.s13.secondaryTextColor(),
          ),
        ],
      ),
    );
  }
}

class _LoginFooter extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginCubit>().state;
    final failure = state.status == LoginStatus.failure ? state.failure : null;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (failure != null) ...[
          MessageBanner(
            failure is NotFoundFailure
                ? context.l10n.loginNoAccount
                : failure.message(context.l10n),
          ),
          16.hSpace,
        ],
        AppButton(
          label: context.l10n.loginGetOtp,
          isLoading: state.status == LoginStatus.loading,
          onPressed: state.canSubmit ? context.read<LoginCubit>().submit : null,
        ),
      ],
    );
  }
}
