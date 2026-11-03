import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/app_scaffold.dart';
import 'package:rapsap_ops_app/core/widgets/message_banner.dart';
import 'package:rapsap_ops_app/core/widgets/page_header.dart';
import 'package:rapsap_ops_app/core/widgets/video_box.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/closing_form.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/bloc/walkthrough_cubit.dart';

/// X9 · Review the walkthrough before sending.
class WalkthroughReview extends StatelessWidget {
  const new({required this.form, super.key});

  final ClosingForm form;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final state = context.watch<WalkthroughCubit>().state;
    final cubit = context.read<WalkthroughCubit>();
    final user = context.select<SessionCubit, String>(
      (c) => '${c.state.user?.storeName ?? ''} · ${c.state.user?.name ?? ''}',
    );
    final clip = state.clip;
    final sending = state.status == WalkStatus.sending;
    final failure = state.failure;
    return AppScaffold(
      header: PageHeader(title: l10n.walkthroughReviewTitle),
      body: ListView(
        padding: Dimens.pagePadding,
        children: [
          Text(
            l10n.walkthroughReviewBody,
            style: AppTextStyles.base.s14.secondaryTextColor(),
          ),
          16.hSpace,
          if (clip != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(Dimens.radius16),
              child: VideoBox.local(clip.path),
            ),
          12.hSpace,
          Text(
            l10n.walkthroughMeta(DateTime.now().storeClock(locale)),
            style: AppTextStyles.base.s13.w600,
          ),
          Text(user, style: AppTextStyles.base.s12.secondaryTextColor()),
          if (sending) ...[
            16.hSpace,
            LinearProgressIndicator(
              value: state.progress,
              color: AppColors.primary,
              backgroundColor: AppColors.track,
            ),
          ],
          if (failure != null) ...[
            16.hSpace,
            MessageBanner(failure.message(l10n)),
          ],
        ],
      ),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(
            label: l10n.walkthroughSend,
            isLoading: sending,
            onPressed: () => cubit.send(form.walkthroughTaskId),
          ),
          12.hSpace,
          AppButton(
            label: l10n.taskRetake,
            variant: AppButtonVariant.secondary,
            onPressed: sending ? null : cubit.retake,
          ),
        ],
      ),
    );
  }
}
