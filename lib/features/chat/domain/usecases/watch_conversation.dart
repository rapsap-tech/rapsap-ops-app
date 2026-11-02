import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/chat_message.dart';
import 'package:rapsap_ops_app/features/chat/domain/repositories/chat_repository.dart';

@injectable
class WatchConversation {
  const new(this._repository);

  final ChatRepository _repository;

  Stream<ChatMessage> call(String id) => _repository.live(id);
}
