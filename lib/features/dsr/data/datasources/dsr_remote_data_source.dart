import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/constants/api_constants.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/network/dio_client.dart';
import 'package:rapsap_ops_app/features/dsr/data/models/dsr_models.dart';

abstract class DsrRemoteDataSource {
  Future<SalesOverviewModel> overview(String period);
  Future<DsrCheckModel> check(String fileName, Uint8List bytes);
  Future<DsrSavedModel> save(String uploadId);
  Future<void> post(
    DateTime date,
    Uint8List image,
    List<String> conversationIds,
  );
}

Map<String, dynamic> _json(Object? d) => d! as Map<String, dynamic>;

@realApi
@LazySingleton(as: DsrRemoteDataSource)
class DsrRemoteDataSourceImpl implements DsrRemoteDataSource {
  const new(this._client);

  final DioClient _client;

  @override
  Future<SalesOverviewModel> overview(String period) => _client.get(
    ApiConstants.dsr.overview,
    queryParameters: {'period': period},
    fromData: (d) => SalesOverviewModel.fromJson(_json(d)),
  );

  @override
  Future<DsrCheckModel> check(String fileName, Uint8List bytes) =>
      _client.upload(
        ApiConstants.dsr.check,
        formData: FormData.fromMap({
          'file': MultipartFile.fromBytes(
            bytes,
            filename: fileName,
            contentType: DioMediaType.parse(AppConstants.xlsxMime),
          ),
        }),
        fromData: (d) => DsrCheckModel.fromJson(_json(d)),
      );

  @override
  Future<DsrSavedModel> save(String uploadId) => _client.post(
    ApiConstants.dsr.save(uploadId),
    fromData: (d) => DsrSavedModel.fromJson(_json(d)),
  );

  @override
  Future<void> post(
    DateTime date,
    Uint8List image,
    List<String> conversationIds,
  ) => _client.upload(
    ApiConstants.dsr.post,
    formData: FormData.fromMap({
      'date': DateFormat(AppConstants.apiDateFormat).format(date),
      'conversation_ids': conversationIds,
      'image': MultipartFile.fromBytes(
        image,
        filename: AppConstants.photoFileName,
        contentType: DioMediaType('image', 'jpeg'),
      ),
    }),
    fromData: (_) {},
  );
}
