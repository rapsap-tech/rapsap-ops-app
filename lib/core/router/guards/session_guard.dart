import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/router/route_paths.dart';

const String _fromKey = 'from';

/// splash → login/OTP → first sign-in (consent) → home. While the session is
/// being restored, the requested page is kept in `?from=` so a web refresh or
/// deep link lands back on it.
String? sessionRedirect(SessionState session, Uri uri) {
  final location = uri.path;
  final onAuthPage =
      location == RoutePaths.login || location == RoutePaths.otpFull;
  final onEntryPage =
      onAuthPage ||
      location == RoutePaths.splash ||
      location == RoutePaths.welcome;
  switch (session.status) {
    case SessionStatus.unknown:
      if (location == RoutePaths.splash) return null;
      return Uri(
        path: RoutePaths.splash,
        queryParameters: {_fromKey: location},
      ).toString();
    case SessionStatus.unauthenticated:
      return onAuthPage ? null : RoutePaths.login;
    case SessionStatus.authenticated:
      if (!(session.user?.consentAccepted ?? false)) {
        return location == RoutePaths.welcome ? null : RoutePaths.welcome;
      }
      if (!onEntryPage) return null;
      final from = uri.queryParameters[_fromKey];
      final isInternal =
          from != null && from.startsWith('/') && !from.startsWith('//');
      return isInternal ? from : RoutePaths.home;
  }
}
