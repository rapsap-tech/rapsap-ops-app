import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/services/locks/tab_lock_stub.dart'
    if (dart.library.js_interop) 'package:rapsap_ops_app/core/services/locks/tab_lock_web.dart'
    if (dart.library.io) 'package:rapsap_ops_app/core/services/locks/tab_lock_mobile.dart';

/// Work that must not run in two PWA tabs at once (e.g. token refresh).
@lazySingleton
abstract class TabLock {
  @factoryMethod
  static TabLock create() => createTabLock();

  /// Runs [action] while no other tab holds the lock called [name].
  Future<T> run<T>(String name, Future<T> Function() action);
}
