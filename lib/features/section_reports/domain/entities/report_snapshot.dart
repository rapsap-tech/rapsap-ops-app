import 'package:equatable/equatable.dart';

enum SnapshotMark { done, missed, notDone }

class SnapshotLine extends Equatable {
  const new({
    required this.number,
    required this.title,
    required this.mark,
    this.by,
    this.at,
  });

  final int number;
  final String title;
  final SnapshotMark mark;
  final String? by;
  final DateTime? at;

  @override
  List<Object?> get props => [number, title, mark, by, at];
}

class PostTarget extends Equatable {
  const new({required this.conversationId, required this.name});

  final String conversationId;
  final String name;

  @override
  List<Object?> get props => [conversationId, name];
}

/// SM-32: the image the app makes and posts to chat.
class ReportSnapshot extends Equatable {
  const new({
    required this.reportId,
    required this.title,
    required this.storeName,
    required this.date,
    required this.opensAt,
    required this.closesAt,
    required this.done,
    required this.total,
    required this.lines,
    required this.photoUrls,
    required this.targets,
    this.sentAt,
  });

  final String reportId;
  final String title;
  final String storeName;
  final DateTime date;
  final DateTime opensAt;
  final DateTime closesAt;
  final int done;
  final int total;
  final List<SnapshotLine> lines;

  /// Up to 8 proof photos.
  final List<String> photoUrls;
  final List<PostTarget> targets;
  final DateTime? sentAt;

  @override
  List<Object?> get props => [
    reportId,
    title,
    storeName,
    date,
    opensAt,
    closesAt,
    done,
    total,
    lines,
    photoUrls,
    targets,
    sentAt,
  ];
}
