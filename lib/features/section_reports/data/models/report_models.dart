import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/closing_form.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/daily_summary.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/report_snapshot.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/section_report.dart';

part 'report_models.freezed.dart';
part 'report_models.g.dart';

@freezed
abstract class ReturnNoteModel with _$ReturnNoteModel {
  const factory({
    required String taskId,
    required int taskNumber,
    required String taskTitle,
    required String comment,
    required DateTime at,
  }) = _ReturnNoteModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$ReturnNoteModelFromJson(json);

  ReturnNote toEntity() => ReturnNote(
    taskId: taskId,
    taskNumber: taskNumber,
    taskTitle: taskTitle,
    comment: comment,
    at: at,
  );
}

@freezed
abstract class SectionReportModel with _$SectionReportModel {
  const factory({
    required String id,
    required String section,
    required String status,
    required DateTime opensAt,
    required DateTime closesAt,
    required int done,
    required int total,
    @Default(0) int notDone,
    @Default(0) int photos,
    @Default(0) int toVerify,
    @Default(1) int revision,
    @Default(false) bool includesDailySummary,
    DateTime? statusAt,
    ReturnNoteModel? returnNote,
  }) = _SectionReportModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$SectionReportModelFromJson(json);

  static const Map<String, ReportStatus> _statuses = {
    'not_ready': ReportStatus.notReady,
    'ready': ReportStatus.ready,
    'submitted': ReportStatus.submitted,
    'approved': ReportStatus.approved,
    'returned': ReportStatus.returned,
  };

  SectionReport toEntity() => SectionReport(
    id: id,
    section: section,
    status: _statuses[status] ?? ReportStatus.notReady,
    opensAt: opensAt,
    closesAt: closesAt,
    done: done,
    total: total,
    notDone: notDone,
    photos: photos,
    toVerify: toVerify,
    revision: revision,
    includesDailySummary: includesDailySummary,
    statusAt: statusAt,
    returnNote: returnNote?.toEntity(),
  );
}

@freezed
abstract class DailySummaryFormModel with _$DailySummaryFormModel {
  const factory({required int staffTotal, num? sales, int? bills}) =
      _DailySummaryFormModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$DailySummaryFormModelFromJson(json);

  DailySummaryForm toEntity() {
    final s = sales;
    final b = bills;
    return DailySummaryForm(
      staffTotal: staffTotal,
      dsr: s == null || b == null ? null : DsrFigures(sales: s, bills: b),
    );
  }
}

@freezed
abstract class SnapshotLineModel with _$SnapshotLineModel {
  const factory({
    required int number,
    required String title,
    required String mark,
    String? by,
    DateTime? at,
  }) = _SnapshotLineModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$SnapshotLineModelFromJson(json);

  SnapshotLine toEntity() => SnapshotLine(
    number: number,
    title: title,
    mark: switch (mark) {
      'missed' => SnapshotMark.missed,
      'not_done' => SnapshotMark.notDone,
      _ => SnapshotMark.done,
    },
    by: by,
    at: at,
  );
}

@freezed
abstract class PostTargetModel with _$PostTargetModel {
  const factory({required String conversationId, required String name}) =
      _PostTargetModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$PostTargetModelFromJson(json);

  PostTarget toEntity() =>
      PostTarget(conversationId: conversationId, name: name);
}

@freezed
abstract class ReportSnapshotModel with _$ReportSnapshotModel {
  const factory({
    required String reportId,
    required String title,
    required String storeName,
    required DateTime date,
    required DateTime opensAt,
    required DateTime closesAt,
    required int done,
    required int total,
    required List<SnapshotLineModel> lines,
    @Default(<String>[]) List<String> photoUrls,
    @Default(<PostTargetModel>[]) List<PostTargetModel> targets,
    DateTime? sentAt,
  }) = _ReportSnapshotModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$ReportSnapshotModelFromJson(json);

  ReportSnapshot toEntity() => ReportSnapshot(
    reportId: reportId,
    title: title,
    storeName: storeName,
    date: date,
    opensAt: opensAt,
    closesAt: closesAt,
    done: done,
    total: total,
    lines: [for (final l in lines) l.toEntity()],
    photoUrls: photoUrls,
    targets: [for (final t in targets) t.toEntity()],
    sentAt: sentAt,
  );
}

@freezed
abstract class ClosingFormModel with _$ClosingFormModel {
  const factory({
    required String taskId,
    required String walkthroughTaskId,
    required DateTime dueAt,
    required DateTime earlyBefore,
    required List<Map<String, String>> staff,
  }) = _ClosingFormModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$ClosingFormModelFromJson(json);

  ClosingForm toEntity() => ClosingForm(
    taskId: taskId,
    walkthroughTaskId: walkthroughTaskId,
    dueAt: dueAt,
    earlyBefore: earlyBefore,
    staff: [
      for (final s in staff)
        StaffOption(id: s['id'] ?? '', name: s['name'] ?? ''),
    ],
  );
}
