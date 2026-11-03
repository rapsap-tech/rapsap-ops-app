import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/extensions/num_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_loader.dart';
import 'package:rapsap_ops_app/core/widgets/record_button.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/camera_top_bar.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/closing_form.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/bloc/walkthrough_cubit.dart';

/// C15 · live camera with "● REC 0:27 / 0:45" and a stop button.
class WalkthroughRecorder extends StatelessWidget {
  const new({required this.form, super.key});

  final ClosingForm form;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final state = context.watch<WalkthroughCubit>().state;
    final cubit = context.read<WalkthroughCubit>();
    final recording = state.status == WalkStatus.recording;
    return Scaffold(
      backgroundColor: AppColors.cameraBackground,
      body: SafeArea(
        child: Column(
          children: [
            CameraTopBar(title: l10n.walkthroughTitle),
            Text(
              l10n.walkthroughSubtitle(form.dueAt.storeClock(locale)),
              style: AppTextStyles.base.s12.copyWith(
                color: AppColors.cameraSubtitle,
              ),
            ),
            12.hSpace,
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimens.space12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimens.radius20),
                  child: switch (state.status) {
                    WalkStatus.starting => const Center(child: AppLoader()),
                    WalkStatus.denied => _Message(l10n.cameraDenied),
                    WalkStatus.unavailable => _Message(l10n.cameraUnavailable),
                    _ => SizedBox.expand(child: cubit.camera.preview()),
                  },
                ),
              ),
            ),
            if (recording)
              Padding(
                padding: EdgeInsets.only(top: Dimens.space12),
                child: Text(
                  l10n.cameraRec(
                    state.seconds.clock,
                    AppConstants.maxVideoSeconds.clock,
                  ),
                  style: AppTextStyles.base.s15.w700.copyWith(
                    color: AppColors.error,
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Dimens.paddingLarge),
              child: Semantics(
                button: true,
                label: recording
                    ? l10n.cameraStopRecording
                    : l10n.cameraStartRecording,
                child: GestureDetector(
                  onTap: recording
                      ? cubit.stop
                      : state.status == WalkStatus.ready
                      ? () => cubit.record(form.walkthroughTaskId)
                      : null,
                  child: RecordButton(recording: recording),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Message extends StatelessWidget {
  const new(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: Dimens.pagePadding,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyles.base.s15.whiteColor(),
      ),
    ),
  );
}
