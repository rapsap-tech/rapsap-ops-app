import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rapsap_ops_app/core/network/json_converters.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/chat_message.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/conversation.dart';

part 'chat_models.freezed.dart';
part 'chat_models.g.dart';

@freezed
abstract class ConversationModel with _$ConversationModel {
  const factory({
    @IdConverter() required String id,
    required String title,
    required String kind,
    @Default(0) int memberCount,
    @Default(0) int unread,
    @Default(false) bool muted,
    @Default(true) bool canPost,
    String? lastPreview,
    DateTime? lastAt,
    String? pinnedText,
  }) = _ConversationModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$ConversationModelFromJson(json);

  Conversation toEntity() => Conversation(
    id: id,
    title: title,
    kind: switch (kind) {
      'direct' => ConversationKind.direct,
      'announcements' => ConversationKind.announcements,
      _ => ConversationKind.group,
    },
    memberCount: memberCount,
    unread: unread,
    muted: muted,
    canPost: canPost,
    lastPreview: lastPreview,
    lastAt: lastAt,
    pinnedText: pinnedText,
  );
}

@freezed
abstract class ChatMessageModel with _$ChatMessageModel {
  const factory({
    @IdConverter() required String id,
    @Default('') String senderName,
    @JsonKey(name: 'created_at') DateTime? sentAt,
    @IdConverter() String? senderId,
    @Default(false) bool isMine,
    String? senderRole,
    String? text,
    String? photoUrl,
    String? videoUrl,
    @Default(0) int seenBy,
  }) = _ChatMessageModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);

  ChatMessage toEntity({String? myId}) => ChatMessage(
    id: id,
    senderName: senderName,
    senderRole: senderRole,
    isMine: isMine || (senderId != null && senderId == myId),
    sentAt: sentAt ?? DateTime.now(),
    text: text,
    photoUrl: photoUrl,
    videoUrl: videoUrl,
    seenBy: seenBy,
  );
}

@freezed
abstract class MessagePageModel with _$MessagePageModel {
  const factory({
    required List<ChatMessageModel> messages,
    @Default(false) bool hasMore,
  }) = _MessagePageModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$MessagePageModelFromJson(json);

  MessagePage toEntity({String? myId}) => MessagePage(
    messages: [for (final m in messages) m.toEntity(myId: myId)],
    hasMore: hasMore,
  );
}
