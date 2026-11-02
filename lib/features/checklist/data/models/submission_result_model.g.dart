// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubmissionResultModel _$SubmissionResultModelFromJson(
  Map<String, dynamic> json,
) => _SubmissionResultModel(
  submittedAt: DateTime.parse(json['submitted_at'] as String),
  onTime: json['on_time'] as bool,
);

Map<String, dynamic> _$SubmissionResultModelToJson(
  _SubmissionResultModel instance,
) => <String, dynamic>{
  'submitted_at': instance.submittedAt.toIso8601String(),
  'on_time': instance.onTime,
};
