import 'package:equatable/equatable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';

enum MessageStatus { sending, sent, failed, blocked }

class ChatMessage extends Equatable {
  const new({
    required this.id,
    required this.senderName,
    required this.isMine,
    required this.sentAt,
    this.senderRole,
    this.text,
    this.photoUrl,
    this.videoUrl,
    this.localMedia,
    this.status = MessageStatus.sent,
    this.seenBy = 0,
    this.blockReason,
  });

  /// Server id, or the client id while the message is still local.
  final String id;
  final String senderName;
  final String? senderRole;
  final bool isMine;
  final DateTime sentAt;
  final String? text;
  final String? photoUrl;
  final String? videoUrl;

  /// Photo or clip kept until the upload succeeds, for "tap to retry".
  final MediaFile? localMedia;
  final MessageStatus status;
  final int seenBy;

  /// Why moderation stopped it, for blocked messages.
  final BlockReason? blockReason;

  ChatMessage withStatus(MessageStatus status, {BlockReason? blockReason}) =>
      ChatMessage(
        id: id,
        senderName: senderName,
        senderRole: senderRole,
        isMine: isMine,
        sentAt: sentAt,
        text: text,
        photoUrl: photoUrl,
        videoUrl: videoUrl,
        localMedia: localMedia,
        status: status,
        seenBy: seenBy,
        blockReason: blockReason,
      );

  @override
  List<Object?> get props => [
    id,
    senderName,
    senderRole,
    isMine,
    sentAt,
    text,
    photoUrl,
    videoUrl,
    localMedia,
    status,
    seenBy,
    blockReason,
  ];
}

class MessagePage extends Equatable {
  const new({required this.messages, required this.hasMore});

  /// Oldest first.
  final List<ChatMessage> messages;
  final bool hasMore;

  @override
  List<Object?> get props => [messages, hasMore];
}
