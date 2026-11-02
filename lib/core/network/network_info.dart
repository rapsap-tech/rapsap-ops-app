import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/constants/api_constants.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<bool> get onStatusChange;
}

/// Checks real reachability; on web it pings our own health endpoint,
/// since browsers block cross-origin pings.
@realApi
@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  new(Connectivity connectivity)
    : _checker = InternetConnection.createInstance(
        useDefaultOptions: !kIsWeb,
        customCheckOptions: [
          InternetCheckOption(
            uri: Uri.parse('${ApiConstants.baseUrl}${ApiConstants.app.health}'),
            responseStatusFn: (_) => true,
          ),
        ],
        triggerStream: connectivity.onConnectivityChanged,
      );

  final InternetConnection _checker;

  @override
  Future<bool> get isConnected => _checker.hasInternetAccess;

  @override
  Stream<bool> get onStatusChange => _checker.onStatusChange.map(
    (status) => status == InternetStatus.connected,
  );
}

/// With fake data sources there is no server to ping, so only the device
/// network is checked.
@fakeApi
@LazySingleton(as: NetworkInfo)
class DeviceNetworkInfo implements NetworkInfo {
  new(this._connectivity);

  final Connectivity _connectivity;

  @override
  Future<bool> get isConnected async =>
      _hasNetwork(await _connectivity.checkConnectivity());

  @override
  Stream<bool> get onStatusChange =>
      _connectivity.onConnectivityChanged.map(_hasNetwork);

  bool _hasNetwork(List<ConnectivityResult> results) =>
      results.any((r) => r != ConnectivityResult.none);
}
