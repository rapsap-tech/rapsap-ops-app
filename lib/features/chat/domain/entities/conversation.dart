import 'package:equatable/equatable.dart';

enum ConversationKind { group, direct, announcements }

class Conversation extends Equatable {
  const new({
    required this.id,
    required this.title,
    required this.kind,
    required this.memberCount,
    required this.unread,
    required this.muted,
    required this.canPost,
    this.lastPreview,
    this.lastAt,
    this.pinnedText,
  });

  final String id;
  final String title;
  final ConversationKind kind;
  final int memberCount;
  final int unread;
  final bool muted;

  /// False in Rapsap Announcements for everyone but Admin.
  final bool canPost;
  final String? lastPreview;
  final DateTime? lastAt;
  final String? pinnedText;

  Conversation copyWith({int? unread, bool? muted}) => Conversation(
    id: id,
    title: title,
    kind: kind,
    memberCount: memberCount,
    unread: unread ?? this.unread,
    muted: muted ?? this.muted,
    canPost: canPost,
    lastPreview: lastPreview,
    lastAt: lastAt,
    pinnedText: pinnedText,
  );

  @override
  List<Object?> get props => [
    id,
    title,
    kind,
    memberCount,
    unread,
    muted,
    canPost,
    lastPreview,
    lastAt,
    pinnedText,
  ];
}
