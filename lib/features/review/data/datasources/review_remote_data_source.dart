import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/constants/api_constants.dart';
import 'package:rapsap_ops_app/core/network/dio_client.dart';
import 'package:rapsap_ops_app/core/network/media_part.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/features/review/data/models/review_models.dart';

abstract class ReviewRemoteDataSource {
  Future<ManagerDashboardModel> dashboard();
  Future<List<ReviewItemModel>> queue();
  Future<ReviewDetailModel> detail(String taskId);
  Future<void> verify(String taskId);
  Future<void> sendBack(String taskId, String reason);
  Future<void> edit({
    required String taskId,
    required MediaFile media,
    required String captureToken,
    required String reason,
    required String remarks,
  });
  Future<void> unlock(String taskId);
  Future<void> takeOver(String taskId);
}

Map<String, dynamic> _json(Object? data) => data! as Map<String, dynamic>;

@realApi
@LazySingleton(as: ReviewRemoteDataSource)
class ReviewRemoteDataSourceImpl implements ReviewRemoteDataSource {
  const new(this._client);

  final DioClient _client;

  @override
  Future<ManagerDashboardModel> dashboard() => _client.get(
    ApiConstants.review.dashboard,
    fromData: (d) => ManagerDashboardModel.fromJson(_json(d)),
  );

  @override
  Future<List<ReviewItemModel>> queue() => _client.get(
    ApiConstants.review.queue,
    fromData: (d) => [
      for (final i in d! as List<dynamic>)
        ReviewItemModel.fromJson(i as Map<String, dynamic>),
    ],
  );

  @override
  Future<ReviewDetailModel> detail(String taskId) => _client.get(
    ApiConstants.review.detail(taskId),
    fromData: (d) => ReviewDetailModel.fromJson(_json(d)),
  );

  @override
  Future<void> verify(String taskId) =>
      _client.post(ApiConstants.review.verify(taskId), fromData: (_) {});

  @override
  Future<void> sendBack(String taskId, String reason) => _client.post(
    ApiConstants.review.sendBack(taskId),
    data: {'reason': reason},
    fromData: (_) {},
  );

  @override
  Future<void> edit({
    required String taskId,
    required MediaFile media,
    required String captureToken,
    required String reason,
    required String remarks,
  }) => _client.upload(
    ApiConstants.review.edit(taskId),
    formData: FormData.fromMap({
      'capture_token': captureToken,
      'reason': reason,
      'remarks': remarks,
      ...mediaPart(media),
    }),
    fromData: (_) {},
  );

  @override
  Future<void> unlock(String taskId) =>
      _client.post(ApiConstants.review.unlock(taskId), fromData: (_) {});

  @override
  Future<void> takeOver(String taskId) =>
      _client.post(ApiConstants.review.takeOver(taskId), fromData: (_) {});
}
