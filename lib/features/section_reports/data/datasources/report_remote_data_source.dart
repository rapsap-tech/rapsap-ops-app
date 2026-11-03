import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/constants/api_constants.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/network/dio_client.dart';
import 'package:rapsap_ops_app/core/network/media_part.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/features/section_reports/data/models/report_models.dart';

abstract class ReportRemoteDataSource {
  Future<List<SectionReportModel>> reports();
  Future<void> submit(String id, String note);
  Future<DailySummaryFormModel> dailySummaryForm();
  Future<void> submitDailySummary(Map<String, dynamic> body);
  Future<ReportSnapshotModel> snapshot(String id);
  Future<void> post(String id, Uint8List image, List<String> conversationIds);
  Future<ClosingFormModel> closingForm();
  Future<void> submitClosing({
    required String taskId,
    required List<String> closedBy,
    required MediaFile media,
    required String captureToken,
  });
  Future<void> submitWalkthrough({
    required String taskId,
    required Uint8List video,
    required String fileName,
    required String captureToken,
    required void Function(int sent, int total) onProgress,
  });
}

Map<String, dynamic> _json(Object? d) => d! as Map<String, dynamic>;

MultipartFile _jpeg(Uint8List bytes) => MultipartFile.fromBytes(
  bytes,
  filename: AppConstants.photoFileName,
  contentType: DioMediaType('image', 'jpeg'),
);

@realApi
@LazySingleton(as: ReportRemoteDataSource)
class ReportRemoteDataSourceImpl implements ReportRemoteDataSource {
  const new(this._client);

  final DioClient _client;

  @override
  Future<List<SectionReportModel>> reports() => _client.get(
    ApiConstants.reports.today,
    fromData: (d) => [
      for (final r in d! as List<dynamic>)
        SectionReportModel.fromJson(r as Map<String, dynamic>),
    ],
  );

  @override
  Future<void> submit(String id, String note) => _client.post(
    ApiConstants.reports.submit(id),
    data: {'note': note},
    fromData: (_) {},
  );

  @override
  Future<DailySummaryFormModel> dailySummaryForm() => _client.get(
    ApiConstants.reports.dailySummary,
    fromData: (d) => DailySummaryFormModel.fromJson(_json(d)),
  );

  @override
  Future<void> submitDailySummary(Map<String, dynamic> body) => _client.post(
    ApiConstants.reports.dailySummary,
    data: body,
    fromData: (_) {},
  );

  @override
  Future<ReportSnapshotModel> snapshot(String id) => _client.get(
    ApiConstants.reports.snapshot(id),
    fromData: (d) => ReportSnapshotModel.fromJson(_json(d)),
  );

  @override
  Future<void> post(String id, Uint8List image, List<String> conversationIds) =>
      _client.upload(
        ApiConstants.reports.post(id),
        formData: FormData.fromMap({
          'conversation_ids': conversationIds,
          'image': _jpeg(image),
        }),
        fromData: (_) {},
      );

  @override
  Future<ClosingFormModel> closingForm() => _client.get(
    ApiConstants.reports.closing,
    fromData: (d) => ClosingFormModel.fromJson(_json(d)),
  );

  @override
  Future<void> submitClosing({
    required String taskId,
    required List<String> closedBy,
    required MediaFile media,
    required String captureToken,
  }) => _client.upload(
    ApiConstants.reports.closing,
    formData: FormData.fromMap({
      'task_id': taskId,
      'closed_by': closedBy,
      'capture_token': captureToken,
      ...mediaPart(media),
    }),
    fromData: (_) {},
  );

  @override
  Future<void> submitWalkthrough({
    required String taskId,
    required Uint8List video,
    required String fileName,
    required String captureToken,
    required void Function(int sent, int total) onProgress,
  }) => _client.upload(
    ApiConstants.reports.walkthrough,
    formData: FormData.fromMap({
      'task_id': taskId,
      'capture_token': captureToken,
      ...mediaPart(MediaFile.video(video, name: fileName, path: null)),
    }),
    onSendProgress: onProgress,
    fromData: (_) {},
  );
}
