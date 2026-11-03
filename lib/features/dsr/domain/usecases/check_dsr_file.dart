import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/dsr/domain/entities/dsr_check.dart';
import 'package:rapsap_ops_app/features/dsr/domain/repositories/dsr_repository.dart';

/// Rejects files over 5 MB before uploading (DSR-01); the server checks
/// the rest (store format, date, sales figure, macros).
@injectable
class CheckDsrFile {
  const new(this._repository);

  final DsrRepository _repository;

  Future<Either<Failure, DsrCheck>> call({
    required String fileName,
    required Uint8List bytes,
    int? size,
  }) async {
    final length = size ?? bytes.length;
    if (length > AppConstants.dsrMaxUploadMb * AppConstants.bytesPerMb) {
      return const Left(DsrRejectedFailure(DsrRejection.tooLarge));
    }
    return await _repository.check(fileName: fileName, bytes: bytes);
  }
}
