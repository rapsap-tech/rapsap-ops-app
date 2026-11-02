import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/submission_result.dart';

part 'submission_result_model.freezed.dart';
part 'submission_result_model.g.dart';

@freezed
abstract class SubmissionResultModel with _$SubmissionResultModel {
  const factory({required DateTime submittedAt, required bool onTime}) =
      _SubmissionResultModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$SubmissionResultModelFromJson(json);

  SubmissionResult toEntity() =>
      SubmissionResult(submittedAt: submittedAt, onTime: onTime);
}
