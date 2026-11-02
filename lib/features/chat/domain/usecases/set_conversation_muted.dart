import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/chat/domain/repositories/chat_repository.dart';

@injectable
class SetConversationMuted {
  const new(this._repository);

  final ChatRepository _repository;

  Future<Either<Failure, Unit>> call(String id, {required bool muted}) =>
      _repository.setMuted(id, muted: muted);
}
