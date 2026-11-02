import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';

/// "rapsap." wordmark; [large] is the sign-in size, otherwise the header size.
class BrandLogo extends StatelessWidget {
  const new({super.key, this.large = false});

  final bool large;

  @override
  Widget build(BuildContext context) {
    final base = AppTextStyles.base.w800.titleColor();
    final style = large
        ? base.s44.l5.lineHeight(44)
        : base.s28.l5.lineHeight(28);
    return Text.rich(
      TextSpan(
        text: AppConstants.appName,
        children: [
          TextSpan(text: AppConstants.appNameDot, style: style.primaryColor()),
        ],
      ),
      style: style,
      semanticsLabel: AppConstants.appName,
    );
  }
}
