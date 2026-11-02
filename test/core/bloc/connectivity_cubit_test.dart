import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rapsap_ops_app/core/bloc/connectivity_cubit.dart';
import 'package:rapsap_ops_app/core/network/network_info.dart';

class _MockNetworkInfo extends Mock implements NetworkInfo;

void main() {
  late _MockNetworkInfo networkInfo;
  late StreamController<bool> controller;

  setUp(() {
    networkInfo = _MockNetworkInfo();
    controller = StreamController<bool>();
    when(() => networkInfo.onStatusChange).thenAnswer((_) => controller.stream);
    when(() => networkInfo.isConnected).thenAnswer((_) async => true);
  });

  tearDown(() => controller.close());

  blocTest<ConnectivityCubit, ConnectivityStatus>(
    'emits online from the initial check',
    build: () => ConnectivityCubit(networkInfo),
    expect: () => [ConnectivityStatus.online],
  );

  blocTest<ConnectivityCubit, ConnectivityStatus>(
    'debounces quick flips and keeps only the last status',
    build: () => ConnectivityCubit(networkInfo),
    act: (_) async {
      await Future<void>.delayed(Duration.zero);
      controller
        ..add(false)
        ..add(true)
        ..add(false);
    },
    wait: const Duration(milliseconds: 1100),
    expect: () => [ConnectivityStatus.online, ConnectivityStatus.offline],
  );
}
