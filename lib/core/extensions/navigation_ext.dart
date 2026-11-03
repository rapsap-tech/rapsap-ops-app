import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';

extension SafeBackX on BuildContext {
  /// Back if there is somewhere to go; otherwise (web refresh / deep link)
  /// go to [fallback] instead of throwing "nothing to pop".
  void back({String fallback = RouteNames.home}) =>
      canPop() ? pop() : goNamed(fallback);

  /// Opens a screen that stays out of browser history (the camera): its
  /// data can't be saved there, so back must never land on it.
  Future<T?> pushNamedOffHistory<T extends Object?>(
    String name, {
    Map<String, String> pathParameters = const {},
    Object? extra,
  }) {
    late Future<T?> result;
    Router.neglect(this, () {
      result = pushNamed<T>(name, pathParameters: pathParameters, extra: extra);
    });
    return result;
  }

  /// Closes a screen opened with [pushNamedOffHistory].
  void popOffHistory<T extends Object?>([T? result]) =>
      Router.neglect(this, () => pop(result));
}
