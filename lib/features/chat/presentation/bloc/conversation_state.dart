part of 'conversation_bloc.dart';

class ConversationState extends Equatable {
  const new({
    this.status = LoadStatus.loading,
    this.conversation,
    this.messages = const [],
    this.hasMore = false,
    this.loadingOlder = false,
    this.failure,
    this.notice,
    this.reportedId,
    this.mutedUntil,
  });

  final LoadStatus status;
  final Conversation? conversation;
  final List<ChatMessage> messages;
  final bool hasMore;
  final bool loadingOlder;

  /// Why the conversation couldn't load.
  final Failure? failure;

  /// One-off error for a snackbar (report / mute / load older).
  final Failure? notice;

  /// Set once a report went through, for a confirmation snackbar.
  final String? reportedId;

  /// Set when moderation muted this user (CHAT-08).
  final DateTime? mutedUntil;

  bool isMutedAt(DateTime now) {
    final until = mutedUntil;
    return until != null && now.isBefore(until);
  }

  ConversationState copyWith({
    LoadStatus? status,
    Conversation? conversation,
    List<ChatMessage>? messages,
    bool? hasMore,
    bool? loadingOlder,
    Failure? failure,
    Failure? notice,
    String? reportedId,
    DateTime? mutedUntil,
  }) => ConversationState(
    status: status ?? this.status,
    conversation: conversation ?? this.conversation,
    messages: messages ?? this.messages,
    hasMore: hasMore ?? this.hasMore,
    loadingOlder: loadingOlder ?? this.loadingOlder,
    failure: failure ?? this.failure,
    notice: notice,
    reportedId: reportedId,
    mutedUntil: mutedUntil ?? this.mutedUntil,
  );

  @override
  List<Object?> get props => [
    status,
    conversation,
    messages,
    hasMore,
    loadingOlder,
    failure,
    notice,
    reportedId,
    mutedUntil,
  ];
}
