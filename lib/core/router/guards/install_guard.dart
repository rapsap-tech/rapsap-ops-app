import 'package:rapsap_ops_app/core/router/route_paths.dart';

/// Phone browsers stay on the install page until the PWA is installed.
String? installRedirect(Uri uri) =>
    uri.path == RoutePaths.install ? null : RoutePaths.install;
