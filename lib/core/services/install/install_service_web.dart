import 'dart:js_interop';

import 'package:rapsap_ops_app/core/services/install/install_service.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';
import 'package:web/web.dart' as web;

InstallService createInstallService() => _WebInstallService();

// Set by the inline script in web/index.html, because Chrome can fire
// `beforeinstallprompt` before the Flutter app has loaded.
@JS('rapsapInstallPrompt')
external _InstallPromptEvent? get _deferredPrompt;

@JS('rapsapInstallPrompt')
external set _deferredPrompt(_InstallPromptEvent? event);

@JS('rapsapInstalled')
external bool? get _installedFlag;

@JS('rapsapInstalled')
external set _installedFlag(bool? value);

extension type _InstallPromptEvent._(JSObject _) implements JSObject {
  external JSPromise<JSAny?> prompt();
  external JSPromise<_InstallChoice> get userChoice;
}

extension type _InstallChoice._(JSObject _) implements JSObject {
  external String get outcome;
}

extension on web.Navigator {
  @JS('standalone')
  external bool? get iosStandalone;
}

class _WebInstallService implements InstallService {
  static const String _changeEvent = 'rapsapinstallchange';

  late final bool _isIos = _detectIos();

  @override
  late final bool isRequired = _isPhone() && !_isStandalone();

  @override
  InstallMode get mode {
    if (!isRequired) return InstallMode.notNeeded;
    if (_installedFlag ?? false) return InstallMode.installed;
    if (_isIos) return InstallMode.iosGuide;
    if (_deferredPrompt != null) return InstallMode.prompt;
    return InstallMode.browserGuide;
  }

  @override
  Stream<InstallMode> get modeChanges =>
      const web.EventStreamProvider<web.Event>(_changeEvent)
          .forTarget(web.window)
          .map((_) => mode);

  @override
  Future<bool> prompt() async {
    final event = _deferredPrompt;
    if (event == null) return false;
    _deferredPrompt = null;
    try {
      await event.prompt().toDart;
      final choice = await event.userChoice.toDart;
      final accepted = choice.outcome == 'accepted';
      if (accepted) _installedFlag = true;
      return accepted;
    } on Object catch (error) {
      appLogger.w('Install prompt failed', error: error.runtimeType);
      return false;
    }
  }

  bool _isPhone() {
    final agent = web.window.navigator.userAgent;
    return _isIos ||
        RegExp('Android|Mobi', caseSensitive: false).hasMatch(agent);
  }

  // iPadOS reports itself as a Mac, so touch support tells them apart.
  bool _detectIos() {
    final navigator = web.window.navigator;
    return RegExp('iPhone|iPad|iPod').hasMatch(navigator.userAgent) ||
        (navigator.platform == 'MacIntel' && navigator.maxTouchPoints > 1);
  }

  bool _isStandalone() =>
      web.window.matchMedia('(display-mode: standalone)').matches ||
      (web.window.navigator.iosStandalone ?? false);
}
