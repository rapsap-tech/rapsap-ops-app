import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';

extension SafeBackX on BuildContext {
  /// Back if there is somewhere to go; otherwise (web refresh / deep link)
  /// go to [fallback] instead of throwing "nothing to pop".
  void back({String fallback = RouteNames.home}) =>
      canPop() ? pop() : goNamed(fallback);
}
