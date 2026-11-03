import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/extensions/navigation_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/router/route_paths.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/core/widgets/app_error_view.dart';
import 'package:rapsap_ops_app/core/widgets/app_loader.dart';
import 'package:rapsap_ops_app/core/widgets/app_scaffold.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/checklist_task.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/bloc/task_cubit.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/pages/camera_page.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/task_body.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/task_footer.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/task_header.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/task_result_views.dart';

/// B3 task sheet, B5 photo + submit, B7 sent back, B8 missed, and the
/// X3 submitted / X4 upload-interrupted outcomes.
class TaskPage extends StatelessWidget {
  const new({required this.taskId, this.openCamera = false, super.key});

  final String taskId;
  final bool openCamera;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = getIt<TaskCubit>();
        unawaited(cubit.load(taskId));
        return cubit;
      },
      child: MultiBlocListener(
        listeners: [
          BlocListener<TaskCubit, TaskState>(
            listenWhen: (prev, next) =>
                openCamera &&
                prev.load != next.load &&
                next.load == TaskLoadStatus.success &&
                next.action != TaskAction.interrupted,
            listener: (context, state) {
              final phase = state.detail?.task.phaseAt(DateTime.now());
              if (phase == TaskPhase.open || phase == TaskPhase.sentBack) {
                unawaited(context.read<TaskCubit>().openCamera());
              }
            },
          ),
          BlocListener<TaskCubit, TaskState>(
            listenWhen: (prev, next) =>
                prev.action != next.action &&
                next.action == TaskAction.cameraReady,
            listener: _openCamera,
          ),
        ],
        child: const _TaskView(),
      ),
    );
  }

  Future<void> _openCamera(BuildContext context, TaskState state) async {
    final cubit = context.read<TaskCubit>();
    final session = state.session;
    final detail = state.detail;
    final media = await context.pushNamedOffHistory<MediaFile>(
      RouteNames.taskCamera,
      pathParameters: {RoutePaths.taskIdParam: taskId},
      extra: session == null || detail == null
          ? null
          : CameraPageArgs(
              session: session,
              title: context.l10n.taskTitle(
                detail.task.number,
                detail.task.title,
              ),
            ),
    );
    if (!cubit.isClosed) cubit.mediaTaken(media ?? state.media);
  }
}

class _TaskView extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TaskCubit>().state;
    final detail = state.detail;
    if (state.action == TaskAction.submitted && detail != null) {
      return SubmittedView(detail: detail, state: state);
    }
    if (state.action == TaskAction.interrupted && detail != null) {
      return InterruptedView(detail: detail);
    }
    return AppScaffold(
      header: TaskHeader(detail: detail),
      body: switch (state.load) {
        TaskLoadStatus.loading => const Center(child: AppLoader()),
        TaskLoadStatus.failure => AppMessageView(
          message:
              state.failure?.message(context.l10n) ?? context.l10n.errorUnknown,
          onRetry: context.read<TaskCubit>().reload,
        ),
        TaskLoadStatus.success => const TaskBody(),
      },
      footer: detail == null ? null : const TaskFooter(),
    );
  }
}
