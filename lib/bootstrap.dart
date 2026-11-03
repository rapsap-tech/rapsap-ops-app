import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:rapsap_ops_app/app.dart';
import 'package:rapsap_ops_app/core/bloc/app_bloc_observer.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';
import 'package:rapsap_ops_app/core/utils/sentry_scrubber.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  EnvConfig.instance.validate();

  FlutterError.onError = (details) {
    appLogger.e(
      details.exceptionAsString(),
      error: details.exception,
      stackTrace: details.stack,
    );
    if (kDebugMode) FlutterError.presentError(details);
  };
  PlatformDispatcher.instance.onError = (error, stackTrace) {
    appLogger.e('Uncaught error', error: error, stackTrace: stackTrace);
    return true;
  };

  Bloc.observer = const AppBlocObserver();
  await configureDependencies();
  unawaited(getIt<SessionCubit>().restore());

  final dsn = EnvConfig.instance.sentryDsn;
  if (dsn.isEmpty) return runApp(const App());
  await SentryFlutter.init(
    (options) => options
      ..dsn = dsn
      ..environment = kReleaseMode ? 'release' : 'debug'
      ..sendDefaultPii = false
      ..enablePrintBreadcrumbs = false
      ..beforeSend = scrubSentryEvent
      ..beforeBreadcrumb = scrubSentryBreadcrumb,
    appRunner: () => runApp(SentryWidget(child: const App())),
  );
}
