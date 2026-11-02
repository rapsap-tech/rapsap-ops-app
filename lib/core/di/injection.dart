import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/di/injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() =>
    getIt.init(environment: EnvConfig.instance.diEnvironment);
