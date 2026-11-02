import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/extensions/navigation_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/router/route_paths.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/utils/validators.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/message_banner.dart';
import 'package:rapsap_ops_app/features/chat/presentation/bloc/manager_chat_cubit.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/checklist_task.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/bloc/task_cubit.dart';

/// Bottom action for the task: Take photo first / Submit / Submit as not
/// done / Retake photo, with upload progress and errors above it.
class TaskFooter extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TaskCubit>().state;
    final detail = state.detail;
    if (detail == null) return const SizedBox.shrink();
    final phase = detail.task.phaseAt(DateTime.now());
    final failure = state.action == TaskAction.failure ? state.failure : null;
    final uploading =
        state.action == TaskAction.submitting && !state.notDoneMode;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (state.photo != null && !state.notDoneMode) ...[
          _AutoPostNote(group: detail.checklistGroup),
          12.hSpace,
        ],
        if (failure != null) ...[
          MessageBanner(failure.message(context.l10n)),
          12.hSpace,
        ],
        if (uploading) ...[
          _UploadProgress(progress: state.progress),
          12.hSpace,
        ],
        _MainButton(state: state, phase: phase),
      ],
    );
  }
}

class _MainButton extends StatelessWidget {
  const new({required this.state, required this.phase});

  final TaskState state;
  final TaskPhase phase;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<TaskCubit>();
    final canAct = phase == TaskPhase.open || phase == TaskPhase.sentBack;
    if (phase == TaskPhase.missed) return const _MessageManagerButton();
    if (!canAct) {
      return AppButton(
        label: l10n.taskBackToChecklist,
        onPressed: () => context.back(fallback: RouteNames.checklist),
        variant: AppButtonVariant.secondary,
      );
    }
    final loading = state.isBusy;
    if (state.notDoneMode) {
      return AppButton(
        label: l10n.taskSubmitNotDone,
        isLoading: loading,
        variant: AppButtonVariant.danger,
        onPressed: Validators.reason(state.reason, l10n) == null
            ? cubit.submitNotDone
            : null,
      );
    }
    if (state.photo != null) {
      return AppButton(
        label: l10n.taskSubmit,
        isLoading: loading,
        onPressed: Validators.optionalText(state.remarks, l10n) == null
            ? cubit.submit
            : null,
      );
    }
    if (phase == TaskPhase.sentBack) {
      return AppButton(
        label: l10n.taskRetakePhoto,
        isLoading: loading,
        onPressed: cubit.openCamera,
      );
    }
    return AppButton(
      label: l10n.taskTakePhotoFirst,
      isLoading: loading,
      onPressed: null,
    );
  }
}

class _AutoPostNote extends StatelessWidget {
  const new({required this.group});

  final String group;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: Dimens.bannerPadding,
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(Dimens.radius12),
      ),
      child: Text(
        context.l10n.taskAutoPosted(group),
        textAlign: TextAlign.center,
        style: AppTextStyles.base.s12.copyWith(color: AppColors.infoBannerText),
      ),
    );
  }
}

class _UploadProgress extends StatelessWidget {
  const new({required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    final percent = (progress * 100).round();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.taskUploading(percent),
          style: AppTextStyles.base.s12.secondaryTextColor(),
        ),
        6.hSpace,
        ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.radiusPill),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: Dimens.progressHeight,
            color: AppColors.primary,
            backgroundColor: AppColors.track,
          ),
        ),
      ],
    );
  }
}

class _MessageManagerButton extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ManagerChatCubit>(),
      child: BlocConsumer<ManagerChatCubit, ManagerChatState>(
        listenWhen: (prev, next) =>
            next.conversationId != null && prev.conversationId == null,
        listener: (context, state) => unawaited(
          context.pushNamed(
            RouteNames.conversation,
            pathParameters: {
              RoutePaths.conversationIdParam: state.conversationId ?? '',
            },
          ),
        ),
        builder: (context, state) {
          final failure = state.failure;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (failure != null) ...[
                MessageBanner(failure.message(context.l10n)),
                12.hSpace,
              ],
              AppButton(
                label: context.l10n.taskMessageManager,
                variant: AppButtonVariant.outline,
                isLoading: state.loading,
                onPressed: context.read<ManagerChatCubit>().open,
              ),
            ],
          );
        },
      ),
    );
  }
}
