import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/services/storage/local_storage_service.dart';

class HeadersInterceptor extends Interceptor {
  new(this._localStorage, this._appVersion);

  final LocalStorageService _localStorage;
  final String _appVersion;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      'Accept': 'application/json',
      'Accept-Language':
          _localStorage.languageCode ?? AppConstants.defaultLanguageCode,
      'X-App-Version': _appVersion,
      'X-Platform': kIsWeb ? 'web' : defaultTargetPlatform.name,
    });
    handler.next(options);
  }
}
