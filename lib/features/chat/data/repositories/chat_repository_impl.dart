import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/error_mapper.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/core/services/socket/chat_socket_service.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';
import 'package:rapsap_ops_app/features/chat/data/datasources/chat_remote_data_source.dart';
import 'package:rapsap_ops_app/features/chat/data/models/chat_models.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/chat_message.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/conversation.dart';
import 'package:rapsap_ops_app/features/chat/domain/repositories/chat_repository.dart';

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  const new(this._remote, this._socket);

  final ChatRemoteDataSource _remote;
  final ChatSocketService _socket;

  static const String _eventType = 'message';

  @override
  Future<Either<Failure, List<Conversation>>> conversations() => guardFailure(
    () async => [for (final c in await _remote.conversations()) c.toEntity()],
  );

  @override
  Future<Either<Failure, Conversation>> conversation(String id) =>
      guardFailure(() async => (await _remote.conversation(id)).toEntity());

  @override
  Future<Either<Failure, Conversation>> managerConversation() => guardFailure(
    () async => (await _remote.managerConversation()).toEntity(),
  );

  @override
  Future<Either<Failure, MessagePage>> messages(
    String id, {
    String? beforeId,
  }) => guardFailure(
    () async => (await _remote.messages(id, beforeId: beforeId)).toEntity(),
  );

  @override
  Future<Either<Failure, ChatMessage>> sendText(
    String conversationId, {
    required String clientId,
    required String text,
  }) => guardFailure(
    () async =>
        (await _remote.sendText(conversationId, clientId, text)).toEntity(),
  );

  @override
  Future<Either<Failure, ChatMessage>> sendMedia(
    String conversationId, {
    required String clientId,
    required MediaFile media,
  }) => guardFailure(
    () async =>
        (await _remote.sendMedia(conversationId, clientId, media)).toEntity(),
  );

  @override
  Future<Either<Failure, Unit>> report(String messageId) =>
      guardFailure(() async {
        await _remote.report(messageId);
        return unit;
      });

  @override
  Future<Either<Failure, Unit>> setMuted(
    String conversationId, {
    required bool muted,
  }) => guardFailure(() async {
    await _remote.setMuted(conversationId, muted: muted);
    return unit;
  });

  @override
  Stream<ChatMessage> live(String conversationId) => _socket.events
      .where(
        (e) =>
            e['type'] == _eventType && e['conversation_id'] == conversationId,
      )
      .expand((e) {
        try {
          final message = e['message'];
          if (message is Map<String, dynamic>) {
            return [ChatMessageModel.fromJson(message).toEntity()];
          }
        } on Object catch (error) {
          appLogger.w('Bad chat event', error: error.runtimeType);
        }
        return const <ChatMessage>[];
      });
}
