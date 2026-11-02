import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/extensions/string_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_otp_field.dart';
import 'package:rapsap_ops_app/core/widgets/message_banner.dart';
import 'package:rapsap_ops_app/features/auth/presentation/bloc/otp_cubit.dart';
import 'package:rapsap_ops_app/features/auth/presentation/pages/otp_page.dart';
import 'package:rapsap_ops_app/features/auth/presentation/widgets/resend_row.dart';

class OtpForm extends StatefulWidget {
  const new({required this.args, super.key});

  final OtpPageArgs args;

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<OtpCubit>();
    return BlocConsumer<OtpCubit, OtpState>(
      // Clear the boxes when a new code is requested.
      listenWhen: (prev, next) => next.otp.isEmpty && prev.otp.isNotEmpty,
      listener: (_, _) => _controller.clear(),
      builder: (context, state) {
        final failure = state.failure;
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: Dimens.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.otpTitle, style: AppTextStyles.base.s24.w700.l1),
              8.hSpace,
              Text(
                l10n.otpSentTo(
                  AppConstants.countryCode,
                  widget.args.phone.maskedPhone,
                  widget.args.ticket.validMinutes,
                ),
                style: AppTextStyles.base.s15.secondaryTextColor(),
              ),
              24.hSpace,
              AppOtpField(
                controller: _controller,
                semanticLabel: l10n.otpTitle,
                enabled: state.status != OtpStatus.locked && !state.isBusy,
                hasError: failure != null,
                onChanged: cubit.otpChanged,
                onCompleted: (_) => cubit.verify(),
              ),
              24.hSpace,
              const ResendRow(),
              if (failure != null) ...[
                24.hSpace,
                MessageBanner(failure.message(l10n)),
              ],
            ],
          ),
        );
      },
    );
  }
}
