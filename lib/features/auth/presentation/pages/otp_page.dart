import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/app_scaffold.dart';
import 'package:rapsap_ops_app/core/widgets/app_svg_icon.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/otp_ticket.dart';
import 'package:rapsap_ops_app/features/auth/presentation/bloc/otp_cubit.dart';
import 'package:rapsap_ops_app/features/auth/presentation/widgets/otp_form.dart';
import 'package:rapsap_ops_app/gen/assets.gen.dart';

class OtpPageArgs {
  const new({required this.phone, required this.ticket});

  final String phone;
  final OtpTicket ticket;
}

/// A4 · Enter OTP (with wrong-code and locked states).
class OtpPage extends StatelessWidget {
  const new({required this.args, super.key});

  final OtpPageArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<OtpCubit>()..start(args.phone, args.ticket.resendAfterSeconds),
      child: BlocListener<OtpCubit, OtpState>(
        listenWhen: (prev, next) =>
            prev.status != next.status && next.status == OtpStatus.success,
        // Session change makes the router move on to first sign-in or home.
        listener: (context, state) =>
            context.read<SessionCubit>().signedIn(state.user!),
        child: AppScaffold(
          header: const _BackBar(),
          body: OtpForm(args: args),
          footer: const _VerifyButton(),
        ),
      ),
    );
  }
}

class _BackBar extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: EdgeInsets.all(Dimens.paddingExtraSmall),
      child: IconButton(
        tooltip: context.l10n.actionBack,
        onPressed: context.pop,
        icon: AppSvgIcon(
          Assets.icons.back,
          size: Dimens.iconMedium,
          color: AppColors.textPrimary,
        ),
      ),
    ),
  );
}

class _VerifyButton extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<OtpCubit>().state;
    return AppButton(
      label: context.l10n.otpVerify,
      isLoading: state.status == OtpStatus.verifying,
      onPressed: state.canVerify ? context.read<OtpCubit>().verify : null,
    );
  }
}
