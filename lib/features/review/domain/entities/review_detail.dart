import 'package:equatable/equatable.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/review_item.dart';

/// C3 / C6: one staff entry as the SM sees it.
class ReviewDetail extends Equatable {
  const new({
    required this.item,
    this.photoUrl,
    this.videoUrl,
    this.remarks,
    this.lockedAt,
    this.unlockMinutes = 30,
  });

  final ReviewItem item;
  final String? photoUrl;
  final String? videoUrl;
  final String? remarks;
  final DateTime? lockedAt;
  final int unlockMinutes;

  @override
  List<Object?> get props => [
    item,
    photoUrl,
    videoUrl,
    remarks,
    lockedAt,
    unlockMinutes,
  ];
}
