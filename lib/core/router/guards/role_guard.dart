import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/router/route_paths.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/user.dart';

/// SM-only routes (review, team, section reports, DSR) send staff home.
GoRouterRedirect managerOnly(SessionCubit session) =>
    (_, _) => isManager(session.state.user) ? null : RoutePaths.home;

bool isManager(User? user) =>
    user?.role == UserRole.storeManager || user?.role == UserRole.admin;
