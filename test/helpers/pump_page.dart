import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rapsap_ops_app/core/bloc/connectivity_cubit.dart';
import 'package:rapsap_ops_app/core/bloc/locale_cubit.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/l10n/gen/app_localizations.dart';
import 'package:rapsap_ops_app/core/theme/app_theme.dart';

/// Loads the bundled fonts so text measures like the real app.
Future<void> loadAppFonts() async {
  final families = <String, List<String>>{};
  for (final file in Directory('assets/fonts').listSync().whereType<File>()) {
    final name = file.uri.pathSegments.last;
    final family = name.startsWith('DMSans')
        ? 'DMSans'
        : name.startsWith('Barlow')
        ? 'BarlowCondensed'
        : 'NotoSansDevanagari';
    families.putIfAbsent(family, () => []).add(file.path);
  }
  for (final entry in families.entries) {
    final loader = FontLoader(entry.key);
    for (final path in entry.value) {
      loader.addFont(
        Future.value(ByteData.sublistView(File(path).readAsBytesSync())),
      );
    }
    await loader.load();
  }
}

Future<void> pumpPage(
  WidgetTester tester,
  Widget page, {
  required SessionCubit session,
  required LocaleCubit locale,
  required ConnectivityCubit connectivity,
  String languageCode = 'en',
  double textScale = 1,
}) async {
  tester.view
    ..physicalSize = AppConstants.designSize
    ..devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  ScreenUtil.configure(
    data: const MediaQueryData(size: AppConstants.designSize),
    designSize: AppConstants.designSize,
    minTextAdapt: true,
    splitScreenMode: true,
  );
  await tester.pumpWidget(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: session),
        BlocProvider.value(value: locale),
        BlocProvider.value(value: connectivity),
      ],
      child: MaterialApp(
        theme: AppTheme.light,
        locale: Locale(languageCode),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(textScale)),
          child: child!,
        ),
        home: page,
      ),
    ),
  );
  await tester.pump(const Duration(milliseconds: 100));
}
