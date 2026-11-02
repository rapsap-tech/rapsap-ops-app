import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';

/// White rounded card with the Figma border.
class AppCard extends StatelessWidget {
  const new({
    required this.child,
    this.padding,
    this.color = AppColors.surface,
    this.borderColor = AppColors.border,
    this.thickBorder = false,
    this.radius,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color color;
  final Color borderColor;
  final bool thickBorder;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? Dimens.cardPadding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius ?? Dimens.radius16),
        border: Border.all(
          color: borderColor,
          width: thickBorder ? Dimens.borderWidthThick : Dimens.borderWidth,
        ),
      ),
      child: child,
    );
  }
}
