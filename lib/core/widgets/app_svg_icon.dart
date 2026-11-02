import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/gen/assets.gen.dart';

/// Tints a stroke icon from assets/icons with [color].
class AppSvgIcon extends StatelessWidget {
  const new(this.icon, {required this.size, required this.color, super.key});

  final SvgGenImage icon;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) => icon.svg(
    width: size,
    height: size,
    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
  );
}
