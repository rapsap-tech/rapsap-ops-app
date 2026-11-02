import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/permissions/permission_service.dart';
import 'package:rapsap_ops_app/features/auth/domain/usecases/accept_consent.dart';

enum ConsentStatus { idle, submitting, success, failure }

class FirstSignInState extends Equatable {
  const new({
    this.camera = AppPermissionStatus.unknown,
    this.notifications = AppPermissionStatus.unknown,
    this.requesting,
    this.status = ConsentStatus.idle,
    this.failure,
  });

  final AppPermissionStatus camera;
  final AppPermissionStatus notifications;

  /// Which permission prompt is open, so its button shows a spinner.
  final PermissionKind? requesting;
  final ConsentStatus status;
  final Failure? failure;

  /// Camera is required for proof photos (PLAT-01a); push is strongly asked
  /// for but a denial only shows a warning later (Home).
  bool get canContinue =>
      camera == AppPermissionStatus.granted &&
      notifications != AppPermissionStatus.unknown &&
      status != ConsentStatus.submitting;

  FirstSignInState copyWith({
    AppPermissionStatus? camera,
    AppPermissionStatus? notifications,
    PermissionKind? requesting,
    ConsentStatus? status,
    Failure? failure,
  }) => FirstSignInState(
    camera: camera ?? this.camera,
    notifications: notifications ?? this.notifications,
    requesting: requesting,
    status: status ?? this.status,
    failure: failure,
  );

  @override
  List<Object?> get props => [
    camera,
    notifications,
    requesting,
    status,
    failure,
  ];
}

enum PermissionKind { camera, notifications }

@injectable
class FirstSignInCubit extends Cubit<FirstSignInState> {
  new(this._permissions, this._acceptConsent) : super(const FirstSignInState());

  final PermissionService _permissions;
  final AcceptConsent _acceptConsent;

  Future<void> load() async {
    final camera = await _permissions.cameraStatus();
    final notifications = await _permissions.notificationStatus();
    if (isClosed) return;
    emit(state.copyWith(camera: camera, notifications: notifications));
  }

  Future<void> request(PermissionKind kind) async {
    if (state.requesting != null) return;
    emit(state.copyWith(requesting: kind));
    final result = kind == PermissionKind.camera
        ? await _permissions.requestCamera()
        : await _permissions.requestNotifications();
    if (isClosed) return;
    emit(
      kind == PermissionKind.camera
          ? state.copyWith(camera: result)
          : state.copyWith(notifications: result),
    );
  }

  Future<void> agree() async {
    if (!state.canContinue) return;
    emit(state.copyWith(status: ConsentStatus.submitting));
    final result = await _acceptConsent();
    if (isClosed) return;
    emit(
      result.match(
        (failure) =>
            state.copyWith(status: ConsentStatus.failure, failure: failure),
        (_) => state.copyWith(status: ConsentStatus.success),
      ),
    );
  }
}
