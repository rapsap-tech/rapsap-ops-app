// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dsr_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DsrPostingModel _$DsrPostingModelFromJson(Map<String, dynamic> json) =>
    _DsrPostingModel(
      date: DateTime.parse(json['date'] as String),
      postedAt: DateTime.parse(json['posted_at'] as String),
      onTime: json['on_time'] as bool,
    );

Map<String, dynamic> _$DsrPostingModelToJson(_DsrPostingModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'posted_at': instance.postedAt.toIso8601String(),
      'on_time': instance.onTime,
    };

_TrendPointModel _$TrendPointModelFromJson(Map<String, dynamic> json) =>
    _TrendPointModel(
      day: (json['day'] as num).toInt(),
      current: json['current'] as num,
      previous: json['previous'] as num?,
    );

Map<String, dynamic> _$TrendPointModelToJson(_TrendPointModel instance) =>
    <String, dynamic>{
      'day': instance.day,
      'current': instance.current,
      'previous': instance.previous,
    };

_SalesOverviewModel _$SalesOverviewModelFromJson(Map<String, dynamic> json) =>
    _SalesOverviewModel(
      date: DateTime.parse(json['date'] as String),
      dueAt: DateTime.parse(json['due_at'] as String),
      salesMtd: json['sales_mtd'] as num,
      target: json['target'] as num,
      needPerDay: json['need_per_day'] as num,
      trend: (json['trend'] as List<dynamic>)
          .map((e) => TrendPointModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      changePercent: json['change_percent'] as num,
      history: (json['history'] as List<dynamic>)
          .map((e) => DsrPostingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      todaysPosting: json['todays_posting'] == null
          ? null
          : DsrPostingModel.fromJson(
              json['todays_posting'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$SalesOverviewModelToJson(_SalesOverviewModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'due_at': instance.dueAt.toIso8601String(),
      'sales_mtd': instance.salesMtd,
      'target': instance.target,
      'need_per_day': instance.needPerDay,
      'trend': instance.trend.map((e) => e.toJson()).toList(),
      'change_percent': instance.changePercent,
      'history': instance.history.map((e) => e.toJson()).toList(),
      'todays_posting': instance.todaysPosting?.toJson(),
    };

_DsrCheckLineModel _$DsrCheckLineModelFromJson(Map<String, dynamic> json) =>
    _DsrCheckLineModel(
      field: json['field'] as String,
      value: json['value'] as String,
      ok: json['ok'] as bool,
    );

Map<String, dynamic> _$DsrCheckLineModelToJson(_DsrCheckLineModel instance) =>
    <String, dynamic>{
      'field': instance.field,
      'value': instance.value,
      'ok': instance.ok,
    };

_DsrCheckModel _$DsrCheckModelFromJson(Map<String, dynamic> json) =>
    _DsrCheckModel(
      uploadId: json['upload_id'] as String,
      fileName: json['file_name'] as String,
      size: (json['size'] as num).toInt(),
      lines: (json['lines'] as List<dynamic>)
          .map((e) => DsrCheckLineModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      warnings:
          (json['warnings'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      replacesExisting: json['replaces_existing'] as bool? ?? false,
    );

Map<String, dynamic> _$DsrCheckModelToJson(_DsrCheckModel instance) =>
    <String, dynamic>{
      'upload_id': instance.uploadId,
      'file_name': instance.fileName,
      'size': instance.size,
      'lines': instance.lines.map((e) => e.toJson()).toList(),
      'warnings': instance.warnings,
      'replaces_existing': instance.replacesExisting,
    };

_DsrSavedModel _$DsrSavedModelFromJson(Map<String, dynamic> json) =>
    _DsrSavedModel(
      date: DateTime.parse(json['date'] as String),
      storeName: json['store_name'] as String,
      sales: json['sales'] as num,
      bills: (json['bills'] as num).toInt(),
      mtdPercent: (json['mtd_percent'] as num).toInt(),
      savedAt: DateTime.parse(json['saved_at'] as String),
      onTime: json['on_time'] as bool,
    );

Map<String, dynamic> _$DsrSavedModelToJson(_DsrSavedModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'store_name': instance.storeName,
      'sales': instance.sales,
      'bills': instance.bills,
      'mtd_percent': instance.mtdPercent,
      'saved_at': instance.savedAt.toIso8601String(),
      'on_time': instance.onTime,
    };
