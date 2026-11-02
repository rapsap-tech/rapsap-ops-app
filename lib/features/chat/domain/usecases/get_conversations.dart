import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/conversation.dart';
import 'package:rapsap_ops_app/features/chat/domain/repositories/chat_repository.dart';

@injectable
class GetConversations {
  const new(this._repository);

  final ChatRepository _repository;

  Future<Either<Failure, List<Conversation>>> call() =>
      _repository.conversations();
}
