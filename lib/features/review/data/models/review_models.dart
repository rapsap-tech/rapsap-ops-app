import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/network/json_converters.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/manager_dashboard.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/review_detail.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/review_item.dart';

part 'review_models.freezed.dart';
part 'review_models.g.dart';

@freezed
abstract class SectionProgressModel with _$SectionProgressModel {
  const factory({
    required String id,
    required String name,
    required String status,
    required int done,
    required int total,
    @Default(0) int missed,
  }) = _SectionProgressModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$SectionProgressModelFromJson(json);

  static const Map<String, SectionStatus> _statuses = {
    'not_started': SectionStatus.inProgress,
    'in_progress': SectionStatus.inProgress,
    'completed': SectionStatus.ready,
    'critical': SectionStatus.critical,
    'ready': SectionStatus.ready,
    'submitted': SectionStatus.submitted,
    'approved': SectionStatus.approved,
    'returned': SectionStatus.returned,
  };

  SectionProgress toEntity() => SectionProgress(
    id: id,
    name: name,
    status: _statuses[status] ?? SectionStatus.inProgress,
    done: done,
    total: total,
    missed: missed,
  );
}

@freezed
abstract class SalesSummaryModel with _$SalesSummaryModel {
  const factory({
    required DateTime month,
    required num salesMtd,
    required num target,
    required DateTime dsrDueAt,
  }) = _SalesSummaryModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$SalesSummaryModelFromJson(json);

  SalesSummary toEntity() => SalesSummary(
    month: month,
    salesMtd: salesMtd,
    target: target,
    dsrDueAt: dsrDueAt,
  );
}

@freezed
abstract class ManagerDashboardModel with _$ManagerDashboardModel {
  const factory({
    required DateTime date,
    required int done,
    required int total,
    required int toReview,
    required int missed,
    required int notDone,
    required List<SectionProgressModel> sections,
    SalesSummaryModel? sales,
  }) = _ManagerDashboardModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$ManagerDashboardModelFromJson(json);

  ManagerDashboard toEntity() => ManagerDashboard(
    date: date,
    done: done,
    total: total,
    toReview: toReview,
    missed: missed,
    notDone: notDone,
    sections: [for (final s in sections) s.toEntity()],
    sales: sales?.toEntity(),
  );
}

@freezed
abstract class ReviewItemModel with _$ReviewItemModel {
  const factory({
    @IdConverter() required String taskId,
    required int number,
    required String title,
    required String section,
    required String kind,
    @Default('') String staffName,
    @Default('') String staffRole,
    DateTime? at,
    String? reason,
  }) = _ReviewItemModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$ReviewItemModelFromJson(json);

  static const Map<String, ReviewKind> _kinds = {
    'needs_review': ReviewKind.needsReview,
    'missed': ReviewKind.missed,
    'not_done': ReviewKind.notDone,
    'open_now': ReviewKind.openNow,
  };

  ReviewItem toEntity() => ReviewItem(
    taskId: taskId,
    number: number,
    title: title,
    section: section,
    staffName: staffName,
    staffRole: staffRole,
    kind: _kinds[kind] ?? ReviewKind.needsReview,
    at: at ?? DateTime.now(),
    reason: reason,
  );
}

/// The task as `/review/{taskId}` describes it: no staff, kind or time.
@freezed
abstract class ReviewTaskModel with _$ReviewTaskModel {
  const factory({
    required int number,
    required String title,
    required String section,
  }) = _ReviewTaskModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$ReviewTaskModelFromJson(json);
}

@freezed
abstract class ReviewDetailModel with _$ReviewDetailModel {
  const factory({
    ReviewTaskModel? item,
    String? status,
    String? reason,
    String? photoUrl,
    String? videoUrl,
    String? remarks,
    DateTime? lockedAt,
    @Default(30) int unlockMinutes,
  }) = _ReviewDetailModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$ReviewDetailModelFromJson(json);

  /// [queued] is this task's row from `/review/queue`, which carries the
  /// staff and time the detail lacks; a task no longer queued (e.g. already
  /// verified) falls back to what the detail has.
  ReviewDetail toEntity(String taskId, ReviewItem? queued) {
    final task = item;
    // The server returns a submitted clip in `photo_url`.
    final photoIsVideo =
        photoUrl != null && AppConstants.videoUrlPattern.hasMatch(photoUrl!);
    return ReviewDetail(
      item:
          queued ??
          ReviewItem(
            taskId: taskId,
            number: task?.number ?? 0,
            title: task?.title ?? '',
            section: task?.section ?? '',
            staffName: '',
            staffRole: '',
            kind: status == 'not_done'
                ? ReviewKind.notDone
                : ReviewKind.needsReview,
            at: DateTime.now(),
            reason: reason,
          ),
      photoUrl: photoIsVideo ? null : photoUrl,
      videoUrl: videoUrl ?? (photoIsVideo ? photoUrl : null),
      remarks: remarks,
      lockedAt: lockedAt,
      unlockMinutes: unlockMinutes,
    );
  }
}
