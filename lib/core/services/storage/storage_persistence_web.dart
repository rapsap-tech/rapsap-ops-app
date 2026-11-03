import 'dart:js_interop';

import 'package:rapsap_ops_app/core/utils/logger.dart';
import 'package:web/web.dart' as web;

/// Asks the browser not to evict saved proof and cache when space is low.
Future<void> requestPersistentStorage() async {
  try {
    final granted = await web.window.navigator.storage.persist().toDart;
    if (!granted.toDart) appLogger.i('Persistent storage not granted');
  } on Object catch (error) {
    appLogger.w('Persistent storage request failed', error: error.runtimeType);
  }
}
