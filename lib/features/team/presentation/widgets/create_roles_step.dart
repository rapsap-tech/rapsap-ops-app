import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/app_error_view.dart';
import 'package:rapsap_ops_app/core/widgets/app_loader.dart';
import 'package:rapsap_ops_app/features/team/presentation/bloc/create_login_cubit.dart';
import 'package:rapsap_ops_app/features/team/presentation/widgets/role_picker.dart';
import 'package:rapsap_ops_app/features/team/presentation/widgets/task_list_card.dart';

/// C9 · Job roles and the tasks they bring.
class CreateRolesStep extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<CreateLoginCubit>().state;
    final cubit = context.read<CreateLoginCubit>();
    final catalog = state.catalog;
    final failure = state.failure;
    if (catalog == null) {
      return failure == null
          ? const Center(child: AppLoader())
          : AppMessageView(
              message: failure.message(l10n),
              onRetry: cubit.loadCatalog,
            );
    }
    return ListView(
      padding: Dimens.pagePadding,
      children: [
        Text(l10n.teamJobRoles, style: AppTextStyles.base.s16.w700),
        8.hSpace,
        RolePicker(
          roles: catalog.roles,
          selected: state.roleIds,
          onToggle: cubit.toggleRole,
        ),
        20.hSpace,
        TaskListCard(
          tasks: state.tasks,
          catalog: catalog,
          extraTaskIds: state.extraTaskIds,
          onToggleExtra: cubit.toggleTask,
        ),
        24.hSpace,
        AppButton(
          label: l10n.actionNext,
          onPressed: state.roleIds.isEmpty
              ? null
              : () => cubit.goTo(CreateStep.review),
        ),
      ],
    );
  }
}
