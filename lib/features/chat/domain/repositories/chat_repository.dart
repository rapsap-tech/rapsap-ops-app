import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/chat_message.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/conversation.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<Conversation>>> conversations();
  Future<Either<Failure, Conversation>> conversation(String id);

  /// The one-to-one chat with the user's store manager.
  Future<Either<Failure, Conversation>> managerConversation();

  /// Older messages before [beforeId] (or the latest page when null).
  Future<Either<Failure, MessagePage>> messages(String id, {String? beforeId});
  Future<Either<Failure, ChatMessage>> sendText(
    String conversationId, {
    required String clientId,
    required String text,
  });
  Future<Either<Failure, ChatMessage>> sendPhoto(
    String conversationId, {
    required String clientId,
    required Uint8List photo,
  });
  Future<Either<Failure, Unit>> report(String messageId);
  Future<Either<Failure, Unit>> setMuted(
    String conversationId, {
    required bool muted,
  });

  /// New messages for [conversationId] pushed over the socket.
  Stream<ChatMessage> live(String conversationId);
}
