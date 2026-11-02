import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/widgets/app_loader.dart';
import 'package:rapsap_ops_app/features/auth/presentation/bloc/otp_cubit.dart';

/// "Didn't get it?" with the resend countdown, then a resend link.
class ResendRow extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<OtpCubit>().state;
    final style = AppTextStyles.base.s13.secondaryTextColor();
    final Widget action;
    if (state.status == OtpStatus.resending) {
      action = const AppLoader();
    } else if (state.canResend) {
      action = TextButton(
        onPressed: context.read<OtpCubit>().resend,
        child: Text(l10n.otpResend, style: style.w600.primaryColor()),
      );
    } else {
      action = Text(
        l10n.otpResendIn(_clock(state.resendIn)),
        style: style.w600,
      );
    }
    return Row(
      children: [
        Expanded(child: Text(l10n.otpDidntGet, style: style)),
        action,
      ],
    );
  }

  String _clock(int seconds) =>
      '${seconds ~/ 60}:${(seconds % 60).toString().padLeft(2, '0')}';
}
