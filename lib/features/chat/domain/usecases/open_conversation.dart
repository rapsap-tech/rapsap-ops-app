import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/chat_message.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/conversation.dart';
import 'package:rapsap_ops_app/features/chat/domain/repositories/chat_repository.dart';

/// Conversation header + its latest page of messages.
@injectable
class OpenConversation {
  const new(this._repository);

  final ChatRepository _repository;

  Future<Either<Failure, (Conversation, MessagePage)>> call(String id) async {
    final conversation = await _repository.conversation(id);
    switch (conversation) {
      case Left(:final value):
        return Left(value);
      case Right(value: final c):
        final page = await _repository.messages(id);
        return page.map((p) => (c, p));
    }
  }
}
