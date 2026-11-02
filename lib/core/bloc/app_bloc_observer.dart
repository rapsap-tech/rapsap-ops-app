import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class AppBlocObserver extends BlocObserver {
  const new();

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    appLogger.e(
      '${bloc.runtimeType} error',
      error: error,
      stackTrace: stackTrace,
    );
    unawaited(Sentry.captureException(error, stackTrace: stackTrace));
    super.onError(bloc, error, stackTrace);
  }
}
