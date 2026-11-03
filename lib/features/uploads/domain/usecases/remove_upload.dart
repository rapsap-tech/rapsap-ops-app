import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/uploads/domain/repositories/upload_outbox_repository.dart';

@injectable
class RemoveUpload {
  const new(this._repository);

  final UploadOutboxRepository _repository;

  Future<Either<Failure, Unit>> call(String id) => _repository.remove(id);
}
