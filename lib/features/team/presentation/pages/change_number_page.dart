import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/app_otp_field.dart';
import 'package:rapsap_ops_app/core/widgets/app_phone_field.dart';
import 'package:rapsap_ops_app/core/widgets/app_scaffold.dart';
import 'package:rapsap_ops_app/core/widgets/message_banner.dart';
import 'package:rapsap_ops_app/core/widgets/page_header.dart';
import 'package:rapsap_ops_app/features/team/presentation/bloc/change_number_cubit.dart';

/// C12 new number → C13 verify with the OTP the staff member reads out.
class ChangeNumberPage extends StatelessWidget {
  const new({required this.memberId, super.key});

  final String memberId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ChangeNumberCubit>(),
      child: BlocListener<ChangeNumberCubit, ChangeNumberState>(
        listenWhen: (p, n) => p.step != n.step && n.step == NumberStep.done,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                context.l10n.teamNumberUpdated(
                  AppConstants.countryCode,
                  state.phone,
                ),
              ),
            ),
          );
          context.pop();
        },
        child: BlocBuilder<ChangeNumberCubit, ChangeNumberState>(
          buildWhen: (p, n) => p.step != n.step,
          builder: (context, state) => AppScaffold(
            header: PageHeader(
              title: state.step == NumberStep.enter
                  ? context.l10n.teamChangeNumber
                  : context.l10n.teamVerifyNumber,
            ),
            body: state.step == NumberStep.enter
                ? _Enter(memberId: memberId)
                : _Verify(memberId: memberId),
          ),
        ),
      ),
    );
  }
}

class _Enter extends StatelessWidget {
  const new({required this.memberId});

  final String memberId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<ChangeNumberCubit>().state;
    final cubit = context.read<ChangeNumberCubit>();
    final failure = state.failure;
    return ListView(
      padding: Dimens.pagePadding,
      children: [
        Text(l10n.teamNewNumber, style: AppTextStyles.base.s14.w600),
        8.hSpace,
        AppPhoneField(onChanged: cubit.phoneChanged),
        12.hSpace,
        Text(
          l10n.teamChangeNumberHelp,
          style: AppTextStyles.base.s13.secondaryTextColor(),
        ),
        if (failure != null) ...[
          16.hSpace,
          MessageBanner(failure.message(l10n)),
        ],
        24.hSpace,
        AppButton(
          label: l10n.teamSendOtpNew,
          isLoading: state.busy,
          onPressed: state.canSend ? () => cubit.sendOtp(memberId) : null,
        ),
      ],
    );
  }
}

class _Verify extends StatefulWidget {
  const new({required this.memberId});

  final String memberId;

  @override
  State<_Verify> createState() => _VerifyState();
}

class _VerifyState extends State<_Verify> {
  final TextEditingController _otp = TextEditingController();

  @override
  void dispose() {
    _otp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<ChangeNumberCubit>().state;
    final cubit = context.read<ChangeNumberCubit>();
    final failure = state.failure;
    return ListView(
      padding: Dimens.pagePadding,
      children: [
        Text(
          l10n.teamAskForOtp(AppConstants.countryCode, state.phone),
          style: AppTextStyles.base.s15.secondaryTextColor(),
        ),
        20.hSpace,
        AppOtpField(
          controller: _otp,
          semanticLabel: l10n.otpTitle,
          hasError: failure != null,
          enabled: !state.busy,
          onChanged: cubit.otpChanged,
          onCompleted: (_) => cubit.verify(widget.memberId),
        ),
        16.hSpace,
        Row(
          children: [
            Expanded(
              child: Text(
                l10n.teamDidntArrive,
                style: AppTextStyles.base.s13.secondaryTextColor(),
              ),
            ),
            if (state.resendIn > 0)
              Text(
                l10n.otpResendIn(
                  '0:${state.resendIn.toString().padLeft(2, '0')}',
                ),
                style: AppTextStyles.base.s13.w600.secondaryTextColor(),
              )
            else
              TextButton(
                onPressed: state.busy
                    ? null
                    : () => cubit.sendOtp(widget.memberId),
                child: Text(l10n.otpResend),
              ),
          ],
        ),
        if (failure != null) ...[
          16.hSpace,
          MessageBanner(failure.message(l10n)),
        ],
        24.hSpace,
        AppButton(
          label: l10n.teamVerifyAndUpdate,
          isLoading: state.busy,
          onPressed: state.canVerify
              ? () => cubit.verify(widget.memberId)
              : null,
        ),
      ],
    );
  }
}
