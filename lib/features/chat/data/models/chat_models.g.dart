// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConversationModel _$ConversationModelFromJson(Map<String, dynamic> json) =>
    _ConversationModel(
      id: json['id'] as String,
      title: json['title'] as String,
      kind: json['kind'] as String,
      memberCount: (json['member_count'] as num?)?.toInt() ?? 0,
      unread: (json['unread'] as num?)?.toInt() ?? 0,
      muted: json['muted'] as bool? ?? false,
      canPost: json['can_post'] as bool? ?? true,
      lastPreview: json['last_preview'] as String?,
      lastAt: json['last_at'] == null
          ? null
          : DateTime.parse(json['last_at'] as String),
      pinnedText: json['pinned_text'] as String?,
    );

Map<String, dynamic> _$ConversationModelToJson(_ConversationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'kind': instance.kind,
      'member_count': instance.memberCount,
      'unread': instance.unread,
      'muted': instance.muted,
      'can_post': instance.canPost,
      'last_preview': instance.lastPreview,
      'last_at': instance.lastAt?.toIso8601String(),
      'pinned_text': instance.pinnedText,
    };

_ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) =>
    _ChatMessageModel(
      id: json['id'] as String,
      senderName: json['sender_name'] as String,
      sentAt: DateTime.parse(json['sent_at'] as String),
      isMine: json['is_mine'] as bool? ?? false,
      senderRole: json['sender_role'] as String?,
      text: json['text'] as String?,
      photoUrl: json['photo_url'] as String?,
      seenBy: (json['seen_by'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ChatMessageModelToJson(_ChatMessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sender_name': instance.senderName,
      'sent_at': instance.sentAt.toIso8601String(),
      'is_mine': instance.isMine,
      'sender_role': instance.senderRole,
      'text': instance.text,
      'photo_url': instance.photoUrl,
      'seen_by': instance.seenBy,
    };

_MessagePageModel _$MessagePageModelFromJson(Map<String, dynamic> json) =>
    _MessagePageModel(
      messages: (json['messages'] as List<dynamic>)
          .map((e) => ChatMessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['has_more'] as bool? ?? false,
    );

Map<String, dynamic> _$MessagePageModelToJson(_MessagePageModel instance) =>
    <String, dynamic>{
      'messages': instance.messages.map((e) => e.toJson()).toList(),
      'has_more': instance.hasMore,
    };
