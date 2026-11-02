import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rapsap_ops_app/core/bloc/locale_cubit.dart';
import 'package:rapsap_ops_app/core/services/storage/local_storage_service.dart';

class _MockStorage extends Mock implements LocalStorageService;

void main() {
  late _MockStorage storage;

  setUp(() {
    storage = _MockStorage();
    when(() => storage.languageCode).thenReturn('mr');
    when(() => storage.setLanguageCode(any())).thenAnswer((_) async => true);
  });

  test('starts with the saved language', () {
    expect(LocaleCubit(storage).state, const Locale('mr'));
  });

  blocTest<LocaleCubit, Locale>(
    'saves and emits a supported language',
    build: () => LocaleCubit(storage),
    act: (cubit) => cubit.setLanguage('hi'),
    expect: () => [const Locale('hi')],
    verify: (_) => verify(() => storage.setLanguageCode('hi')).called(1),
  );

  blocTest<LocaleCubit, Locale>(
    'ignores unsupported languages',
    build: () => LocaleCubit(storage),
    act: (cubit) => cubit.setLanguage('fr'),
    expect: () => <Locale>[],
  );
}
