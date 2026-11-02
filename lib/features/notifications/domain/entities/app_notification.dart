import 'package:equatable/equatable.dart';

enum NotificationTargetType { task, conversation, none }

/// One row of the in-app notification list. Title/subtitle come from the
/// server already in the user's language.
class AppNotification extends Equatable {
  const new({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.createdAt,
    required this.read,
    this.targetType = NotificationTargetType.none,
    this.targetId,
  });

  final String id;
  final String title;
  final String subtitle;
  final DateTime createdAt;
  final bool read;
  final NotificationTargetType targetType;
  final String? targetId;

  AppNotification markRead() => AppNotification(
    id: id,
    title: title,
    subtitle: subtitle,
    createdAt: createdAt,
    read: true,
    targetType: targetType,
    targetId: targetId,
  );

  @override
  List<Object?> get props => [
    id,
    title,
    subtitle,
    createdAt,
    read,
    targetType,
    targetId,
  ];
}
