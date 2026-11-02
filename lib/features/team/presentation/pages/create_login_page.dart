import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/widgets/app_scaffold.dart';
import 'package:rapsap_ops_app/core/widgets/page_header.dart';
import 'package:rapsap_ops_app/core/widgets/result_view.dart';
import 'package:rapsap_ops_app/features/team/presentation/bloc/create_login_cubit.dart';
import 'package:rapsap_ops_app/features/team/presentation/widgets/create_details_step.dart';
import 'package:rapsap_ops_app/features/team/presentation/widgets/create_review_step.dart';
import 'package:rapsap_ops_app/features/team/presentation/widgets/create_roles_step.dart';

/// C8 details · C9 roles · C10 review & send · X7 SMS failed.
class CreateLoginPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CreateLoginCubit>(),
      child: BlocListener<CreateLoginCubit, CreateLoginState>(
        listenWhen: (p, n) =>
            p.status != n.status &&
            n.status == CreateStatus.created &&
            (n.result?.smsSent ?? false),
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.l10n.teamLoginCreated(state.name))),
          );
          context.pop();
        },
        child: const _View(),
      ),
    );
  }
}

class _View extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<CreateLoginCubit>().state;
    final cubit = context.read<CreateLoginCubit>();
    final result = state.result;
    if (result != null && !result.smsSent) return _SmsFailed(state: state);
    final (subtitle, body) = switch (state.step) {
      CreateStep.details => (l10n.teamStep1, const CreateDetailsStep()),
      CreateStep.roles => (l10n.teamStep2, const CreateRolesStep()),
      CreateStep.review => (l10n.teamStep3, const CreateReviewStep()),
    };
    return PopScope(
      canPop: state.step == CreateStep.details,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) cubit.goTo(CreateStep.values[state.step.index - 1]);
      },
      child: AppScaffold(
        header: PageHeader(title: l10n.teamNewLogin, subtitle: subtitle),
        body: body,
      ),
    );
  }
}

class _SmsFailed extends StatelessWidget {
  const new({required this.state});

  final CreateLoginState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final roles =
        state.catalog?.roles
            .where((r) => state.roleIds.contains(r.id))
            .map((r) => r.name)
            .join(', ') ??
        '';
    return AppScaffold(
      header: PageHeader(title: l10n.teamNewLogin),
      body: ResultView(
        tone: ResultTone.actionNeeded,
        badge: l10n.resultActionNeeded,
        title: l10n.teamSmsFailedTitle,
        message: l10n.teamSmsFailedBody(state.name),
        details: [
          l10n.chatSenderWithRole(state.name, roles),
          '${AppConstants.countryCode} ${state.phone}',
          l10n.teamNotSignedIn,
        ],
        primary: ResultAction(
          label: l10n.actionRetry,
          isLoading: state.status == CreateStatus.submitting,
          onPressed: context.read<CreateLoginCubit>().resendSms,
        ),
        secondary: ResultAction(
          label: l10n.teamBackToTeam,
          onPressed: context.pop,
        ),
      ),
    );
  }
}
