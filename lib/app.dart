import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rapsap_ops_app/core/bloc/connectivity_cubit.dart';
import 'package:rapsap_ops_app/core/bloc/locale_cubit.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/l10n/gen/app_localizations.dart';
import 'package:rapsap_ops_app/core/router/app_router.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_theme.dart';

class App extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<SessionCubit>()),
        BlocProvider(create: (_) => getIt<LocaleCubit>()),
        BlocProvider(create: (_) => getIt<ConnectivityCubit>()),
      ],
      child: const _PhoneFrame(child: _ScreenUtilScope(child: _RouterApp())),
    );
  }
}

class _RouterApp extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LocaleCubit>().state;
    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: getIt<AppRouter>().router,
      builder: (context, child) => MediaQuery.withClampedTextScaling(
        minScaleFactor: AppConstants.minTextScale,
        maxScaleFactor: AppConstants.maxTextScale,
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}

/// On wide screens, centres the app in a phone-width column and narrows
/// MediaQuery to that width.
class _PhoneFrame extends StatelessWidget {
  const new({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    if (media.size.width <= AppConstants.phoneFrameBreakpoint) return child;
    return ColoredBox(
      color: AppColors.backdrop,
      child: Center(
        child: SizedBox(
          width: AppConstants.maxPhoneWidth,
          child: MediaQuery(
            data: media.copyWith(
              size: Size(AppConstants.maxPhoneWidth, media.size.height),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

/// Configures ScreenUtil from the inherited (phone-frame) MediaQuery.
/// ScreenUtilInit reads the raw window size, which breaks the phone frame.
class _ScreenUtilScope extends StatefulWidget {
  const new({required this.child});

  final Widget child;

  @override
  State<_ScreenUtilScope> createState() => _ScreenUtilScopeState();
}

class _ScreenUtilScopeState extends State<_ScreenUtilScope> {
  Size? _size;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final data = MediaQuery.of(context);
    ScreenUtil.configure(
      data: data,
      designSize: AppConstants.designSize,
      minTextAdapt: true,
      splitScreenMode: true,
    );
    // Sizes are read via getters during build, so rebuild everything on resize.
    if (_size != null && _size != data.size) {
      (context as Element).visitChildren(_markNeedsBuild);
    }
    _size = data.size;
  }

  void _markNeedsBuild(Element element) {
    element
      ..markNeedsBuild()
      ..visitChildren(_markNeedsBuild);
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
