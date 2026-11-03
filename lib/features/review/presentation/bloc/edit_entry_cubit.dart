import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/capture_session.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/start_capture.dart';
import 'package:rapsap_ops_app/features/review/domain/repositories/review_repository.dart';
import 'package:rapsap_ops_app/features/review/domain/usecases/edit_entry.dart';

enum EditStatus { idle, preparingCamera, cameraReady, saving, saved, failure }

class EditEntryState extends Equatable {
  const new({
    this.status = EditStatus.idle,
    this.session,
    this.media,
    this.reason,
    this.remarks = '',
    this.failure,
  });

  final EditStatus status;
  final CaptureSession? session;
  final MediaFile? media;
  final EditReason? reason;
  final String remarks;
  final Failure? failure;

  bool get canSave =>
      media != null && reason != null && status != EditStatus.saving;

  EditEntryState copyWith({
    EditStatus? status,
    CaptureSession? session,
    MediaFile? media,
    EditReason? reason,
    String? remarks,
    Failure? failure,
  }) => EditEntryState(
    status: status ?? this.status,
    session: session ?? this.session,
    media: media ?? this.media,
    reason: reason ?? this.reason,
    remarks: remarks ?? this.remarks,
    failure: failure,
  );

  @override
  List<Object?> get props => [status, session, media, reason, remarks, failure];
}

/// C5 · SM replaces a staff entry with a new stamped photo or a video (SM-20).
@injectable
class EditEntryCubit extends Cubit<EditEntryState> {
  new(this._startCapture, this._edit) : super(const EditEntryState());

  final StartCapture _startCapture;
  final EditEntry _edit;

  Future<void> openCamera(String taskId) async {
    if (state.status == EditStatus.preparingCamera) return;
    emit(state.copyWith(status: EditStatus.preparingCamera));
    final result = await _startCapture(taskId);
    if (isClosed) return;
    emit(
      result.match(
        (f) => state.copyWith(status: EditStatus.failure, failure: f),
        (s) => state.copyWith(status: EditStatus.cameraReady, session: s),
      ),
    );
  }

  void mediaTaken(MediaFile? media) =>
      emit(state.copyWith(status: EditStatus.idle, media: media));

  void reasonPicked(EditReason reason) => emit(state.copyWith(reason: reason));

  void remarksChanged(String value) => emit(state.copyWith(remarks: value));

  Future<void> save(String taskId) async {
    final media = state.media;
    final session = state.session;
    final reason = state.reason;
    if (!state.canSave || media == null || session == null || reason == null) {
      return;
    }
    emit(state.copyWith(status: EditStatus.saving));
    final result = await _edit(
      taskId: taskId,
      media: media,
      captureToken: session.token,
      reason: reason,
      remarks: state.remarks,
    );
    if (isClosed) return;
    emit(
      result.match(
        (f) => state.copyWith(status: EditStatus.failure, failure: f),
        (_) => state.copyWith(status: EditStatus.saved),
      ),
    );
  }
}
