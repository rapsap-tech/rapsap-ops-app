import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:rapsap_ops_app/core/services/locks/tab_lock.dart';
import 'package:web/web.dart' as web;

TabLock createTabLock() => _WebTabLock();

/// Uses the Web Locks API, shared by every tab of the same origin.
class _WebTabLock implements TabLock {
  @override
  Future<T> run<T>(String name, Future<T> Function() action) async {
    // Browsers without the API (before Safari 15.4) run unlocked.
    if (!web.window.navigator.has('locks')) return await action();
    late T result;
    Object? error;
    StackTrace? stackTrace;
    // The lock is held until the returned promise settles.
    JSPromise<JSAny?> onGranted(web.Lock? _) => action()
        .then<void>(
          (value) => result = value,
          onError: (Object e, StackTrace s) {
            error = e;
            stackTrace = s;
          },
        )
        .toJS;
    await web.window.navigator.locks.request(name, onGranted.toJS).toDart;
    final failure = error;
    if (failure != null) Error.throwWithStackTrace(failure, stackTrace!);
    return result;
  }
}
