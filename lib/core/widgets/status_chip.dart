import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';

enum StatusTone { success, error, info, neutral }

class StatusChip extends StatelessWidget {
  const new({required this.label, required this.tone, super.key});

  final String label;
  final StatusTone tone;

  @override
  Widget build(BuildContext context) {
    final (background, foreground) = switch (tone) {
      StatusTone.success => (AppColors.successChip, AppColors.successText),
      StatusTone.error => (AppColors.errorSurface, AppColors.errorText),
      StatusTone.info => (AppColors.primaryLight, AppColors.primaryDark),
      StatusTone.neutral => (AppColors.neutralChip, AppColors.textTertiary),
    };
    return Container(
      padding: Dimens.chipPadding,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(Dimens.radiusPill),
      ),
      child: Text(
        label,
        style: AppTextStyles.base.s12.w600.copyWith(color: foreground),
      ),
    );
  }
}
