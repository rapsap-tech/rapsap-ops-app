import 'dart:async';

import 'package:injectable/injectable.dart';

enum NetworkEvent { sessionExpired, forceUpdateRequired }

/// App-wide signals raised by the network layer (e.g. refresh failed, 426).
@lazySingleton
class NetworkEvents {
  final StreamController<NetworkEvent> _controller =
      StreamController<NetworkEvent>.broadcast();

  Stream<NetworkEvent> get stream => _controller.stream;

  void emit(NetworkEvent event) => _controller.add(event);

  @disposeMethod
  Future<void> dispose() => _controller.close();
}
