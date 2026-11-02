import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/constants/api_constants.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/network/dio_client.dart';
import 'package:rapsap_ops_app/features/checklist/data/models/capture_session_model.dart';
import 'package:rapsap_ops_app/features/checklist/data/models/submission_result_model.dart';
import 'package:rapsap_ops_app/features/checklist/data/models/task_detail_model.dart';
import 'package:rapsap_ops_app/features/checklist/data/models/today_checklist_model.dart';

abstract class ChecklistRemoteDataSource {
  Future<TodayChecklistModel> today();
  Future<TaskDetailModel> taskDetail(String taskId);
  Future<CaptureSessionModel> startCapture(String taskId);
  Future<SubmissionResultModel> submitPhoto({
    required String taskId,
    required Uint8List photo,
    required String captureToken,
    required String remarks,
    required void Function(int sent, int total) onProgress,
  });
  Future<SubmissionResultModel> submitNotDone({
    required String taskId,
    required String reason,
  });
}

Map<String, dynamic> _json(Object? data) => data! as Map<String, dynamic>;

@realApi
@LazySingleton(as: ChecklistRemoteDataSource)
class ChecklistRemoteDataSourceImpl implements ChecklistRemoteDataSource {
  const new(this._client);

  final DioClient _client;

  @override
  Future<TodayChecklistModel> today() => _client.get(
    ApiConstants.checklist.today,
    fromData: (data) => TodayChecklistModel.fromJson(_json(data)),
  );

  @override
  Future<TaskDetailModel> taskDetail(String taskId) => _client.get(
    ApiConstants.tasks.byId(taskId),
    fromData: (data) => TaskDetailModel.fromJson(_json(data)),
  );

  @override
  Future<CaptureSessionModel> startCapture(String taskId) => _client.post(
    ApiConstants.tasks.captureToken(taskId),
    fromData: (data) => CaptureSessionModel.fromJson(_json(data)),
  );

  @override
  Future<SubmissionResultModel> submitPhoto({
    required String taskId,
    required Uint8List photo,
    required String captureToken,
    required String remarks,
    required void Function(int sent, int total) onProgress,
  }) => _client.upload(
    ApiConstants.tasks.submit(taskId),
    formData: FormData.fromMap({
      'capture_token': captureToken,
      'remarks': remarks,
      'photo': MultipartFile.fromBytes(
        photo,
        filename: AppConstants.photoFileName,
        contentType: DioMediaType('image', 'jpeg'),
      ),
    }),
    onSendProgress: onProgress,
    fromData: (data) => SubmissionResultModel.fromJson(_json(data)),
  );

  @override
  Future<SubmissionResultModel> submitNotDone({
    required String taskId,
    required String reason,
  }) => _client.post(
    ApiConstants.tasks.notDone(taskId),
    data: {'reason': reason},
    fromData: (data) => SubmissionResultModel.fromJson(_json(data)),
  );
}
