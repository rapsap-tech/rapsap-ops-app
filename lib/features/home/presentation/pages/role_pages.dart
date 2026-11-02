import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/router/guards/role_guard.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/pages/checklist_page.dart';
import 'package:rapsap_ops_app/features/home/presentation/pages/staff_home_page.dart';
import 'package:rapsap_ops_app/features/review/presentation/pages/manager_checklist_page.dart';
import 'package:rapsap_ops_app/features/review/presentation/pages/manager_home_page.dart';

/// Home tab: B1 for staff, C1 for the store manager.
class RoleHomePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) =>
      context.select<SessionCubit, bool>((c) => isManager(c.state.user))
      ? const ManagerHomePage()
      : const StaffHomePage();
}

/// Checklist tab: B2 for staff, C2 review queue for the store manager.
class RoleChecklistPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) =>
      context.select<SessionCubit, bool>((c) => isManager(c.state.user))
      ? const ManagerChecklistPage()
      : const ChecklistPage();
}
