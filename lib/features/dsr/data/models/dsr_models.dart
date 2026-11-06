import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rapsap_ops_app/core/network/json_converters.dart';
import 'package:rapsap_ops_app/features/dsr/domain/entities/dsr_check.dart';
import 'package:rapsap_ops_app/features/dsr/domain/entities/sales_overview.dart';

part 'dsr_models.freezed.dart';
part 'dsr_models.g.dart';

@freezed
abstract class DsrPostingModel with _$DsrPostingModel {
  const factory({DateTime? date, DateTime? postedAt, bool? onTime}) =
      _DsrPostingModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$DsrPostingModelFromJson(json);

  /// Today's posting comes without a date; [day] fills it.
  DsrPosting toEntity(DateTime day) =>
      DsrPosting(date: date ?? day, postedAt: postedAt, onTime: onTime);
}

@freezed
abstract class TrendPointModel with _$TrendPointModel {
  const factory({
    @DayOfMonthConverter() required int day,
    required num current,
    num? previous,
  }) = _TrendPointModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$TrendPointModelFromJson(json);

  TrendPoint toEntity() =>
      TrendPoint(day: day, current: current, previous: previous);
}

@freezed
abstract class SalesOverviewModel with _$SalesOverviewModel {
  const factory({
    required DateTime date,
    required DateTime dueAt,
    required num salesMtd,
    required num target,
    required num needPerDay,
    required List<TrendPointModel> trend,
    required num changePercent,
    required List<DsrPostingModel> history,
    DsrPostingModel? todaysPosting,
  }) = _SalesOverviewModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$SalesOverviewModelFromJson(json);

  SalesOverview toEntity() => SalesOverview(
    date: date,
    dueAt: dueAt,
    salesMtd: salesMtd,
    target: target,
    needPerDay: needPerDay,
    trend: [for (final t in trend) t.toEntity()],
    changePercent: changePercent,
    history: [for (final h in history) h.toEntity(date)],
    todaysPosting: todaysPosting?.toEntity(date),
  );
}

@freezed
abstract class DsrCheckLineModel with _$DsrCheckLineModel {
  const factory({
    required String field,
    @IdConverter() required String value,
    required bool ok,
  }) = _DsrCheckLineModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$DsrCheckLineModelFromJson(json);

  static const Map<String, DsrField> _fields = {
    'store': DsrField.store,
    'date': DsrField.date,
    'net_sales': DsrField.netSales,
    'bills': DsrField.bills,
    'month_target': DsrField.monthTarget,
    'monthly_target': DsrField.monthTarget,
    'daily_target': DsrField.dayTarget,
  };

  DsrCheckLine? toEntity() {
    final f = _fields[field];
    return f == null ? null : DsrCheckLine(field: f, value: value, ok: ok);
  }
}

@freezed
abstract class DsrCheckModel with _$DsrCheckModel {
  const factory({
    @IdConverter() required String uploadId,
    required String fileName,
    required int size,
    required List<DsrCheckLineModel> lines,
    @Default(<String>[]) List<String> warnings,
    @Default(false) bool replacesExisting,
  }) = _DsrCheckModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) => _$DsrCheckModelFromJson(json);

  DsrCheck toEntity() => DsrCheck(
    uploadId: uploadId,
    fileName: fileName,
    size: size,
    lines: [for (final l in lines) ?l.toEntity()],
    warnings: warnings,
    replacesExisting: replacesExisting,
  );
}

@freezed
abstract class DsrSavedModel with _$DsrSavedModel {
  const factory({
    required DateTime date,
    required num sales,
    required int bills,
    required num mtdPercent,
    required bool onTime,
    @Default('') String storeName,
    DateTime? savedAt,
  }) = _DsrSavedModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) => _$DsrSavedModelFromJson(json);

  DsrSaved toEntity() => DsrSaved(
    date: date,
    storeName: storeName,
    sales: sales,
    bills: bills,
    mtdPercent: mtdPercent.round(),
    savedAt: savedAt ?? DateTime.now(),
    onTime: onTime,
  );
}

/// Trend days arrive as dates (`2026-11-06`); the chart needs the day number.
class DayOfMonthConverter implements JsonConverter<int, Object> {
  const new();

  @override
  int fromJson(Object json) =>
      json is num ? json.toInt() : DateTime.parse('$json').day;

  @override
  Object toJson(int day) => day;
}
