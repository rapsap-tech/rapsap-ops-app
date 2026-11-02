import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/team/domain/entities/team_member.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/get_role_catalog.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/get_team_member.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/set_member_active.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/update_member_roles.dart';

enum MemberAction { save, deactivate, reactivate }

class MemberDetailState extends Equatable {
  const new({
    this.load = LoadStatus.loading,
    this.member,
    this.catalog,
    this.roleIds = const {},
    this.running,
    this.done,
    this.failure,
  });

  final LoadStatus load;
  final TeamMember? member;
  final RoleCatalog? catalog;

  /// Roles as edited on screen.
  final Set<String> roleIds;
  final MemberAction? running;
  final MemberAction? done;
  final Failure? failure;

  bool get dirty {
    final saved = member?.roles.map((r) => r.id).toSet() ?? const {};
    return roleIds.length != saved.length || !saved.every(roleIds.contains);
  }

  MemberDetailState copyWith({
    LoadStatus? load,
    TeamMember? member,
    RoleCatalog? catalog,
    Set<String>? roleIds,
    MemberAction? running,
    MemberAction? done,
    Failure? failure,
  }) => MemberDetailState(
    load: load ?? this.load,
    member: member ?? this.member,
    catalog: catalog ?? this.catalog,
    roleIds: roleIds ?? this.roleIds,
    running: running,
    done: done,
    failure: failure,
  );

  @override
  List<Object?> get props => [
    load,
    member,
    catalog,
    roleIds,
    running,
    done,
    failure,
  ];
}

/// C11 staff detail, C14 deactivate, X8 reactivate.
@injectable
class MemberDetailCubit extends Cubit<MemberDetailState> {
  new(this._member, this._catalog, this._roles, this._active)
    : super(const MemberDetailState());

  final GetTeamMember _member;
  final GetRoleCatalog _catalog;
  final UpdateMemberRoles _roles;
  final SetMemberActive _active;
  late String _id;

  Future<void> load(String id) async {
    _id = id;
    emit(state.copyWith(load: LoadStatus.loading));
    final results = await Future.wait([_member(id), _catalog()]);
    if (isClosed) return;
    final member = results[0] as Either<Failure, TeamMember>;
    final catalog = results[1] as Either<Failure, RoleCatalog>;
    final failure =
        member.getLeft().toNullable() ?? catalog.getLeft().toNullable();
    if (failure != null) {
      emit(state.copyWith(load: LoadStatus.failure, failure: failure));
      return;
    }
    final m = member.toNullable()!;
    emit(
      state.copyWith(
        load: LoadStatus.success,
        member: m,
        catalog: catalog.toNullable(),
        roleIds: {for (final r in m.roles) r.id},
      ),
    );
  }

  Future<void> reload() => load(_id);

  void toggleRole(String id) => emit(
    state.copyWith(
      roleIds: state.roleIds.contains(id)
          ? ({...state.roleIds}..remove(id))
          : {...state.roleIds, id},
    ),
  );

  Future<void> save() async {
    if (state.roleIds.isEmpty) return;
    await _run(MemberAction.save, () => _roles(_id, state.roleIds));
  }

  Future<void> deactivate() =>
      _run(MemberAction.deactivate, () => _active(_id, active: false));

  Future<void> reactivate() =>
      _run(MemberAction.reactivate, () => _active(_id, active: true));

  Future<void> _run(
    MemberAction action,
    Future<Either<Failure, Unit>> Function() call,
  ) async {
    if (state.running != null) return;
    emit(state.copyWith(running: action));
    final result = await call();
    if (isClosed) return;
    result.match((f) => emit(state.copyWith(failure: f)), (_) {
      emit(state.copyWith(done: action));
      unawaited(load(_id));
    });
  }
}
