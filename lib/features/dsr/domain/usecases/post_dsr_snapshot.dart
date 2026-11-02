import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/dsr/domain/repositories/dsr_repository.dart';

@injectable
class PostDsrSnapshot {
  const new(this._repository);

  final DsrRepository _repository;

  Future<Either<Failure, Unit>> call({
    required DateTime date,
    required Uint8List image,
    required List<String> conversationIds,
  }) => _repository.post(
    date: date,
    image: image,
    conversationIds: conversationIds,
  );
}
