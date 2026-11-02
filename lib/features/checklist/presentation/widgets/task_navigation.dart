import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/router/route_paths.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/bloc/today_checklist_cubit.dart';

/// Opens a task and refreshes today's list when the user comes back.
Future<void> openTask(
  BuildContext context,
  String taskId, {
  bool openCamera = false,
}) async {
  final checklist = context.read<TodayChecklistCubit>();
  await context.pushNamed(
    RouteNames.task,
    pathParameters: {RoutePaths.taskIdParam: taskId},
    queryParameters: openCamera
        ? {RoutePaths.openCameraQuery: RoutePaths.queryTrue}
        : const {},
  );
  if (!checklist.isClosed) await checklist.load();
}
