import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_loader.dart';

enum AppButtonVariant { primary, secondary, outline, danger }

/// While [isLoading] it shows a spinner and ignores taps; a null [onPressed]
/// renders the disabled (grey) style. Pill-shaped unless [squared].
class AppButton extends StatelessWidget {
  const new({
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
    this.expand = true,
    this.squared = false,
    this.icon,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final bool expand;
  final bool squared;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final (background, foreground, border) = switch (variant) {
      AppButtonVariant.primary => (
        AppColors.primary,
        AppColors.onPrimary,
        null,
      ),
      AppButtonVariant.secondary => (
        AppColors.secondaryButton,
        AppColors.secondaryButtonText,
        null,
      ),
      AppButtonVariant.outline => (
        AppColors.surface,
        AppColors.primary,
        AppColors.primary,
      ),
      AppButtonVariant.danger => (AppColors.error, AppColors.onPrimary, null),
    };
    final radius = squared ? Dimens.radius14 : Dimens.radiusPill;
    final button = ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        foregroundColor: foreground,
        disabledBackgroundColor: isLoading ? background : AppColors.disabled,
        disabledForegroundColor: AppColors.onPrimary,
        minimumSize: Size(
          Dimens.minTapTarget,
          expand ? Dimens.buttonHeight : Dimens.minTapTarget,
        ),
        padding: EdgeInsets.symmetric(horizontal: Dimens.paddingLarge),
        textStyle:
            (expand ? AppTextStyles.base.s16.w600 : AppTextStyles.base.s14.w700)
                .l1,
        side: border == null || onPressed == null
            ? null
            : BorderSide(color: border, width: Dimens.borderWidth),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        elevation: 0,
      ),
      child: isLoading
          ? AppLoader(color: foreground)
          : _Content(label: label, icon: icon),
    );
    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }
}

class _Content extends StatelessWidget {
  const new({required this.label, this.icon});

  final String label;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final text = Text(
      label,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    );
    if (icon == null) return text;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ?icon,
        8.wSpace,
        Flexible(child: text),
      ],
    );
  }
}
