import 'package:equatable/equatable.dart';

/// Chat and announcement alerts can be turned off; task reminders can't
/// (NOT-01).
class NotificationPrefs extends Equatable {
  const new({required this.chatMessages, required this.announcements});

  final bool chatMessages;
  final bool announcements;

  NotificationPrefs copyWith({bool? chatMessages, bool? announcements}) =>
      NotificationPrefs(
        chatMessages: chatMessages ?? this.chatMessages,
        announcements: announcements ?? this.announcements,
      );

  @override
  List<Object?> get props => [chatMessages, announcements];
}
