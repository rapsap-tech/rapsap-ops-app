import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/capture_session.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/start_capture.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/closing_form.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/get_closing_form.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/submit_closing_report.dart';

enum ClosingStatus { idle, preparingCamera, cameraReady, sending, sent }

class ClosingState extends Equatable {
  const new({
    this.load = LoadStatus.loading,
    this.form,
    this.closedBy = const {},
    this.session,
    this.media,
    this.status = ClosingStatus.idle,
    this.failure,
  });

  final LoadStatus load;
  final ClosingForm? form;
  final Set<String> closedBy;
  final CaptureSession? session;
  final MediaFile? media;
  final ClosingStatus status;
  final Failure? failure;

  bool get canSubmit =>
      closedBy.isNotEmpty && media != null && status == ClosingStatus.idle;

  ClosingState copyWith({
    LoadStatus? load,
    ClosingForm? form,
    Set<String>? closedBy,
    CaptureSession? session,
    MediaFile? media,
    ClosingStatus? status,
    Failure? failure,
  }) => ClosingState(
    load: load ?? this.load,
    form: form ?? this.form,
    closedBy: closedBy ?? this.closedBy,
    session: session ?? this.session,
    media: media ?? this.media,
    status: status ?? this.status,
    failure: failure,
  );

  @override
  List<Object?> get props => [
    load,
    form,
    closedBy,
    session,
    media,
    status,
    failure,
  ];
}

/// C16 · Closing report: who closed + shutter photo or video (CK-31, CK-32).
@injectable
class ClosingCubit extends Cubit<ClosingState> {
  new(this._form, this._capture, this._submit) : super(const ClosingState()) {
    unawaited(load());
  }

  final GetClosingForm _form;
  final StartCapture _capture;
  final SubmitClosingReport _submit;

  Future<void> load() async {
    final result = await _form();
    if (isClosed) return;
    emit(
      result.match(
        (f) => state.copyWith(load: LoadStatus.failure, failure: f),
        (form) => state.copyWith(load: LoadStatus.success, form: form),
      ),
    );
  }

  void toggle(String staffId) => emit(
    state.copyWith(
      closedBy: state.closedBy.contains(staffId)
          ? ({...state.closedBy}..remove(staffId))
          : {...state.closedBy, staffId},
    ),
  );

  Future<void> openCamera() async {
    final form = state.form;
    if (form == null || state.status != ClosingStatus.idle) return;
    emit(state.copyWith(status: ClosingStatus.preparingCamera));
    final result = await _capture(form.taskId);
    if (isClosed) return;
    emit(
      result.match(
        (f) => state.copyWith(status: ClosingStatus.idle, failure: f),
        (s) => state.copyWith(status: ClosingStatus.cameraReady, session: s),
      ),
    );
  }

  void mediaTaken(MediaFile? media) =>
      emit(state.copyWith(status: ClosingStatus.idle, media: media));

  Future<void> submit() async {
    final form = state.form;
    final media = state.media;
    final session = state.session;
    if (!state.canSubmit || form == null || media == null || session == null) {
      return;
    }
    emit(state.copyWith(status: ClosingStatus.sending));
    final result = await _submit(
      taskId: form.taskId,
      closedBy: state.closedBy.toList(),
      media: media,
      captureToken: session.token,
    );
    if (isClosed) return;
    emit(
      result.match(
        (f) => state.copyWith(status: ClosingStatus.idle, failure: f),
        (_) => state.copyWith(status: ClosingStatus.sent),
      ),
    );
  }
}
