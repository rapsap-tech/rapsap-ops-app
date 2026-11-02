import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/utils/validators.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/app_scaffold.dart';
import 'package:rapsap_ops_app/core/widgets/filter_chip_button.dart';
import 'package:rapsap_ops_app/core/widgets/message_banner.dart';
import 'package:rapsap_ops_app/core/widgets/page_header.dart';
import 'package:rapsap_ops_app/features/review/presentation/bloc/send_back_cubit.dart';

/// C4 · Send back with a reason; the task reopens for 30 minutes (SM-12).
class SendBackPage extends StatelessWidget {
  const new({required this.taskId, super.key});

  final String taskId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SendBackCubit>(),
      child: BlocListener<SendBackCubit, SendBackState>(
        listenWhen: (prev, next) =>
            prev.status != next.status && next.status == SendBackStatus.sent,
        listener: (context, _) => context.pop(true),
        child: AppScaffold(
          header: PageHeader(title: context.l10n.reviewTitle),
          body: const _Form(),
          footer: _SendButton(taskId: taskId),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const new();

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final TextEditingController _reason = TextEditingController();

  @override
  void dispose() {
    _reason.dispose();
    super.dispose();
  }

  void _quick(String text) {
    _reason.text = text;
    context.read<SendBackCubit>().reasonChanged(text);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final quick = [
      l10n.sendBackPhotoBlurry,
      l10n.sendBackWrongArea,
      l10n.sendBackNotDone,
    ];
    return ListView(
      padding: Dimens.pagePadding,
      children: [
        Text(l10n.sendBackTitle, style: AppTextStyles.base.s22.w700.l1),
        8.hSpace,
        Text(
          l10n.sendBackBody,
          style: AppTextStyles.base.s14.secondaryTextColor(),
        ),
        20.hSpace,
        Text(l10n.sendBackQuick, style: AppTextStyles.base.s14.w600),
        8.hSpace,
        Wrap(
          spacing: Dimens.paddingSmall,
          runSpacing: Dimens.paddingSmall,
          children: [
            for (final text in quick)
              FilterChipButton(
                label: text,
                selected: _reason.text == text,
                onTap: () => _quick(text),
              ),
          ],
        ),
        20.hSpace,
        Text(l10n.sendBackReason, style: AppTextStyles.base.s14.w600),
        8.hSpace,
        TextFormField(
          controller: _reason,
          maxLines: 4,
          maxLength: AppConstants.sendBackMaxLength,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (v) => Validators.reason(v, l10n),
          onChanged: context.read<SendBackCubit>().reasonChanged,
          style: AppTextStyles.base.s15,
        ),
      ],
    );
  }
}

class _SendButton extends StatelessWidget {
  const new({required this.taskId});

  final String taskId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<SendBackCubit>().state;
    final failure = state.failure;
    final valid = Validators.reason(state.reason, l10n) == null;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (failure != null) ...[
          MessageBanner(failure.message(l10n)),
          12.hSpace,
        ],
        AppButton(
          label: l10n.reviewSendBack,
          variant: AppButtonVariant.danger,
          isLoading: state.status == SendBackStatus.sending,
          onPressed: valid
              ? () => context.read<SendBackCubit>().send(taskId)
              : null,
        ),
      ],
    );
  }
}
