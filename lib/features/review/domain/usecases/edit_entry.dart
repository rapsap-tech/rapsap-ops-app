import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/review/domain/repositories/review_repository.dart';

/// SM replaces a staff photo; the original stays in history (SM-20).
@injectable
class EditEntry {
  const new(this._repository);

  final ReviewRepository _repository;

  Future<Either<Failure, Unit>> call({
    required String taskId,
    required Uint8List photo,
    required String captureToken,
    required EditReason reason,
    required String remarks,
  }) => _repository.editEntry(
    taskId: taskId,
    photo: photo,
    captureToken: captureToken,
    reason: reason,
    remarks: remarks.trim(),
  );
}
