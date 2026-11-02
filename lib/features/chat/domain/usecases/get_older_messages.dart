import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/chat_message.dart';
import 'package:rapsap_ops_app/features/chat/domain/repositories/chat_repository.dart';

@injectable
class GetOlderMessages {
  const new(this._repository);

  final ChatRepository _repository;

  Future<Either<Failure, MessagePage>> call(String id, String beforeId) =>
      _repository.messages(id, beforeId: beforeId);
}
