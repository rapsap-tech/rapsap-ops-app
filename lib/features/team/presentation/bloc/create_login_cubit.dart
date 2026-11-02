import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/team/domain/entities/team_member.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/create_login.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/get_role_catalog.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/resend_invite.dart';

enum CreateStep { details, roles, review }

enum CreateStatus { idle, submitting, created, failure }

class CreateLoginState extends Equatable {
  const new({
    this.step = CreateStep.details,
    this.phone = '',
    this.name = '',
    this.roleIds = const {},
    this.extraTaskIds = const {},
    this.catalog,
    this.status = CreateStatus.idle,
    this.result,
    this.failure,
  });

  final CreateStep step;
  final String phone;
  final String name;
  final Set<String> roleIds;
  final Set<String> extraTaskIds;
  final RoleCatalog? catalog;
  final CreateStatus status;
  final CreateLoginResult? result;
  final Failure? failure;

  /// Server said this number already has a login (C8).
  bool get phoneTaken =>
      failure is ValidationFailure &&
      (failure! as ValidationFailure).fieldErrors.containsKey('phone');

  List<TaskTemplate> get tasks {
    final c = catalog;
    if (c == null) return const [];
    return [
      ...c.tasksFor(roleIds),
      for (final t in c.tasks)
        if (extraTaskIds.contains(t.id) && !t.roleIds.any(roleIds.contains)) t,
    ];
  }

  CreateLoginState copyWith({
    CreateStep? step,
    String? phone,
    String? name,
    Set<String>? roleIds,
    Set<String>? extraTaskIds,
    RoleCatalog? catalog,
    CreateStatus? status,
    CreateLoginResult? result,
    Failure? failure,
  }) => CreateLoginState(
    step: step ?? this.step,
    phone: phone ?? this.phone,
    name: name ?? this.name,
    roleIds: roleIds ?? this.roleIds,
    extraTaskIds: extraTaskIds ?? this.extraTaskIds,
    catalog: catalog ?? this.catalog,
    status: status ?? this.status,
    result: result ?? this.result,
    failure: failure,
  );

  @override
  List<Object?> get props => [
    step,
    phone,
    name,
    roleIds,
    extraTaskIds,
    catalog,
    status,
    result,
    failure,
  ];
}

/// C8 details → C9 roles → C10 review & send (→ X7 if the SMS failed).
@injectable
class CreateLoginCubit extends Cubit<CreateLoginState> {
  new(this._catalog, this._create, this._resend)
    : super(const CreateLoginState()) {
    unawaited(loadCatalog());
  }

  final GetRoleCatalog _catalog;
  final CreateLogin _create;
  final ResendInvite _resend;

  Future<void> loadCatalog() async {
    final result = await _catalog();
    if (isClosed) return;
    result.match(
      (f) => emit(state.copyWith(failure: f)),
      (c) => emit(state.copyWith(catalog: c)),
    );
  }

  void phoneChanged(String v) => emit(state.copyWith(phone: v));

  void nameChanged(String v) => emit(state.copyWith(name: v));

  void toggleRole(String id) =>
      emit(state.copyWith(roleIds: _toggled(state.roleIds, id)));

  void toggleTask(String id) =>
      emit(state.copyWith(extraTaskIds: _toggled(state.extraTaskIds, id)));

  void goTo(CreateStep step) => emit(state.copyWith(step: step));

  Future<void> submit() async {
    if (state.status == CreateStatus.submitting) return;
    emit(state.copyWith(status: CreateStatus.submitting));
    final result = await _create(
      NewLogin(
        phone: state.phone,
        name: state.name,
        roleIds: state.roleIds,
        extraTaskIds: state.extraTaskIds,
      ),
    );
    if (isClosed) return;
    result.match((f) {
      final taken =
          f is ValidationFailure && f.fieldErrors.containsKey('phone');
      emit(
        state.copyWith(
          status: CreateStatus.failure,
          failure: f,
          step: taken ? CreateStep.details : state.step,
        ),
      );
    }, (r) => emit(state.copyWith(status: CreateStatus.created, result: r)));
  }

  /// X7 · "Try again" for the invitation SMS.
  Future<void> resendSms() async {
    final result = state.result;
    if (result == null || state.status == CreateStatus.submitting) return;
    emit(state.copyWith(status: CreateStatus.submitting));
    final sent = await _resend(result.memberId);
    if (isClosed) return;
    emit(
      sent.match(
        (f) => state.copyWith(status: CreateStatus.created, failure: f),
        (_) => state.copyWith(
          status: CreateStatus.created,
          result: CreateLoginResult(memberId: result.memberId, smsSent: true),
        ),
      ),
    );
  }

  static Set<String> _toggled(Set<String> set, String id) =>
      set.contains(id) ? ({...set}..remove(id)) : {...set, id};
}
