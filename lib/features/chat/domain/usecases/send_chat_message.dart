import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/chat_message.dart';
import 'package:rapsap_ops_app/features/chat/domain/repositories/chat_repository.dart';

/// Sends text or a camera photo or clip; moderation may block it (CHAT-04..08).
@injectable
class SendChatMessage {
  const new(this._repository);

  final ChatRepository _repository;

  Future<Either<Failure, ChatMessage>> call(
    String conversationId,
    ChatMessage draft,
  ) {
    final media = draft.localMedia;
    return media == null
        ? _repository.sendText(
            conversationId,
            clientId: draft.id,
            text: draft.text?.trim() ?? '',
          )
        : _repository.sendMedia(
            conversationId,
            clientId: draft.id,
            media: media,
          );
  }
}
