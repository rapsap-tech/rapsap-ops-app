// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConversationModel _$ConversationModelFromJson(Map<String, dynamic> json) =>
    _ConversationModel(
      id: const IdConverter().fromJson(json['id'] as Object),
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
      'id': const IdConverter().toJson(instance.id),
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
      id: const IdConverter().fromJson(json['id'] as Object),
      senderName: json['sender_name'] as String? ?? '',
      sentAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      senderId: _$JsonConverterFromJson<Object, String>(
        json['sender_id'],
        const IdConverter().fromJson,
      ),
      isMine: json['is_mine'] as bool? ?? false,
      senderRole: json['sender_role'] as String?,
      text: json['text'] as String?,
      photoUrl: json['photo_url'] as String?,
      videoUrl: json['video_url'] as String?,
      seenBy: (json['seen_by'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ChatMessageModelToJson(_ChatMessageModel instance) =>
    <String, dynamic>{
      'id': const IdConverter().toJson(instance.id),
      'sender_name': instance.senderName,
      'created_at': instance.sentAt?.toIso8601String(),
      'sender_id': _$JsonConverterToJson<Object, String>(
        instance.senderId,
        const IdConverter().toJson,
      ),
      'is_mine': instance.isMine,
      'sender_role': instance.senderRole,
      'text': instance.text,
      'photo_url': instance.photoUrl,
      'video_url': instance.videoUrl,
      'seen_by': instance.seenBy,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

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
