import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/extensions/navigation_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/widgets/app_scaffold.dart';
import 'package:rapsap_ops_app/core/widgets/brand_header.dart';
import 'package:rapsap_ops_app/core/widgets/result_view.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/task_detail.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/bloc/task_cubit.dart';

class _ResultScaffold extends StatelessWidget {
  const new({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final store = context.select<SessionCubit, String>(
      (c) => c.state.user?.storeName ?? '',
    );
    return AppScaffold(
      header: BrandHeader(storeName: store),
      body: child,
    );
  }
}

/// X3 · Task submitted.
class SubmittedView extends StatelessWidget {
  const new({required this.detail, required this.state, super.key});

  final TaskDetail detail;
  final TaskState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final result = state.result;
    final time = result?.submittedAt.storeClock(locale) ?? '';
    final notDone = state.notDoneMode;
    return _ResultScaffold(
      child: ResultView(
        tone: ResultTone.confirmed,
        badge: l10n.resultConfirmed,
        title: notDone ? l10n.submittedNotDoneTitle : l10n.submittedTitle,
        message: notDone
            ? l10n.submittedNotDoneBody(detail.managerName)
            : l10n.submittedBody(detail.managerName),
        details: [
          l10n.taskTitle(detail.task.number, detail.task.title),
          if (result?.onTime ?? true)
            l10n.submittedAtOnTime(time)
          else
            l10n.submittedAtLate(time),
          if (!notDone) l10n.submittedPosted(detail.checklistGroup),
        ],
        primary: ResultAction(
          label: l10n.taskBackToChecklist,
          onPressed: () => context.back(fallback: RouteNames.checklist),
        ),
        secondary: notDone
            ? null
            : ResultAction(
                label: l10n.submittedViewChat,
                onPressed: () => context.goNamed(RouteNames.chat),
              ),
      ),
    );
  }
}

/// X4 · Upload interrupted: the photo is kept; retry when back online.
class InterruptedView extends StatelessWidget {
  const new({required this.detail, super.key});

  final TaskDetail detail;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<TaskCubit>();
    return _ResultScaffold(
      child: ResultView(
        tone: ResultTone.actionNeeded,
        badge: l10n.resultActionNeeded,
        title: l10n.interruptedTitle,
        message: l10n.interruptedBody,
        details: [
          l10n.taskTitle(detail.task.number, detail.task.title),
          l10n.interruptedWaiting,
          l10n.interruptedNotSubmitted,
        ],
        primary: ResultAction(
          label: l10n.interruptedRetry,
          onPressed: cubit.submit,
        ),
        secondary: ResultAction(
          label: l10n.interruptedBack,
          onPressed: cubit.backToTask,
        ),
      ),
    );
  }
}
