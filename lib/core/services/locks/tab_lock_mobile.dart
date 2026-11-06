import 'package:rapsap_ops_app/core/services/locks/tab_lock.dart';

TabLock createTabLock() => _MobileTabLock();

/// One copy of the app runs per device, so there is nothing to wait for.
class _MobileTabLock implements TabLock {
  @override
  Future<T> run<T>(String name, Future<T> Function() action) => action();
}
