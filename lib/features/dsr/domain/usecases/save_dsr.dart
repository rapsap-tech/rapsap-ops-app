import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/dsr/domain/entities/dsr_check.dart';
import 'package:rapsap_ops_app/features/dsr/domain/repositories/dsr_repository.dart';

@injectable
class SaveDsr {
  const new(this._repository);

  final DsrRepository _repository;

  Future<Either<Failure, DsrSaved>> call(String uploadId) =>
      _repository.save(uploadId);
}
