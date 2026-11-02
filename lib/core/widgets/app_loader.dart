import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';

class AppLoader extends StatelessWidget {
  const new({this.color = AppColors.primary, super.key});

  final Color color;

  @override
  Widget build(BuildContext context) => SizedBox.square(
    dimension: Dimens.loaderSize,
    child: CircularProgressIndicator(
      strokeWidth: Dimens.loaderStroke,
      color: color,
    ),
  );
}
