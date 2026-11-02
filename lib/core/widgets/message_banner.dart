import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';

/// Inline red notice used for form-level errors (e.g. no login, wrong OTP).
class MessageBanner extends StatelessWidget {
  const new(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      liveRegion: true,
      child: Container(
        width: double.infinity,
        padding: Dimens.bannerPadding,
        decoration: BoxDecoration(
          color: AppColors.errorSurface,
          borderRadius: BorderRadius.circular(Dimens.radius12),
        ),
        child: Text(
          message,
          style: AppTextStyles.base.s13
              .lineHeight(18.85)
              .copyWith(color: AppColors.errorTextDark),
        ),
      ),
    );
  }
}
