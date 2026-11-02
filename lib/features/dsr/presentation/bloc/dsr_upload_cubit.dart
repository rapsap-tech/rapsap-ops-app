import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/files/file_picker_service.dart';
import 'package:rapsap_ops_app/core/services/media/photo_processor.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';
import 'package:rapsap_ops_app/features/dsr/domain/entities/dsr_check.dart';
import 'package:rapsap_ops_app/features/dsr/domain/usecases/check_dsr_file.dart';
import 'package:rapsap_ops_app/features/dsr/domain/usecases/post_dsr_snapshot.dart';
import 'package:rapsap_ops_app/features/dsr/domain/usecases/save_dsr.dart';

enum DsrStage {
  picking,
  checking,
  checked,
  rejected,
  saving,
  saved,
  posting,
  posted,
}

class DsrUploadState extends Equatable {
  const new({
    this.stage = DsrStage.picking,
    this.file,
    this.check,
    this.saved,
    this.failure,
  });

  final DsrStage stage;
  final PickedFile? file;
  final DsrCheck? check;
  final DsrSaved? saved;
  final Failure? failure;

  DsrUploadState copyWith({
    DsrStage? stage,
    PickedFile? file,
    DsrCheck? check,
    DsrSaved? saved,
    Failure? failure,
  }) => DsrUploadState(
    stage: stage ?? this.stage,
    file: file ?? this.file,
    check: check ?? this.check,
    saved: saved ?? this.saved,
    failure: failure,
  );

  @override
  List<Object?> get props => [stage, file, check, saved, failure];
}

/// Pick → C21 check (or C22 refused) → save → C23 snapshot → X13 posted.
@injectable
class DsrUploadCubit extends Cubit<DsrUploadState> {
  new(this._picker, this._check, this._save, this._post, this._processor)
    : super(const DsrUploadState());

  final FilePickerService _picker;
  final CheckDsrFile _check;
  final SaveDsr _save;
  final PostDsrSnapshot _post;
  final PhotoProcessor _processor;

  /// Returns false when the user cancelled the picker.
  Future<bool> pick() async {
    emit(const DsrUploadState());
    final PickedFile? file;
    try {
      file = await _picker.pickExcel();
    } on Object catch (error, stackTrace) {
      appLogger.e('File picker failed', error: error, stackTrace: stackTrace);
      emit(
        state.copyWith(
          stage: DsrStage.rejected,
          failure: const UnknownFailure(),
        ),
      );
      return true;
    }
    if (file == null || isClosed) return false;
    emit(state.copyWith(stage: DsrStage.checking, file: file));
    final result = await _check(fileName: file.name, bytes: file.bytes);
    if (isClosed) return true;
    emit(
      result.match(
        (f) => state.copyWith(stage: DsrStage.rejected, failure: f),
        (c) => state.copyWith(stage: DsrStage.checked, check: c),
      ),
    );
    return true;
  }

  Future<void> save() async {
    final check = state.check;
    if (check == null || state.stage == DsrStage.saving) return;
    emit(state.copyWith(stage: DsrStage.saving));
    final result = await _save(check.uploadId);
    if (isClosed) return;
    emit(
      result.match(
        (f) => state.copyWith(stage: DsrStage.checked, failure: f),
        (s) => state.copyWith(stage: DsrStage.saved, saved: s),
      ),
    );
  }

  /// [png] renders the snapshot card shown on screen.
  Future<void> post(Future<Uint8List> Function() png) async {
    final saved = state.saved;
    if (saved == null || state.stage == DsrStage.posting) return;
    emit(state.copyWith(stage: DsrStage.posting));
    final Uint8List image;
    try {
      image = await _processor.stampAndCompress(await png(), const []);
    } on Object catch (error, stackTrace) {
      appLogger.e(
        'Snapshot render failed',
        error: error,
        stackTrace: stackTrace,
      );
      if (!isClosed) {
        emit(
          state.copyWith(
            stage: DsrStage.saved,
            failure: const UnknownFailure(),
          ),
        );
      }
      return;
    }
    final result = await _post(
      date: saved.date,
      image: image,
      conversationIds: const [AppConstants.dsrGroupId],
    );
    if (isClosed) return;
    emit(
      result.match(
        (f) => state.copyWith(stage: DsrStage.saved, failure: f),
        (_) => state.copyWith(stage: DsrStage.posted),
      ),
    );
  }
}
