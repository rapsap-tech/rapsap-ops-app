import 'package:rapsap_ops_app/core/network/network_info.dart';

/// [NetworkInfo] for tests that don't care about connectivity.
class AlwaysOnline implements NetworkInfo {
  const new();

  @override
  Future<bool> get isConnected async => true;

  @override
  Stream<bool> get onStatusChange => const Stream.empty();
}
