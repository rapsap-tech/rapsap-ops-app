import 'dart:async';

import 'package:flutter/foundation.dart';

/// Lets go_router re-run redirects whenever the given stream emits.
class GoRouterRefreshStream extends ChangeNotifier {
  new(Stream<dynamic> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    unawaited(_subscription.cancel());
    super.dispose();
  }
}
