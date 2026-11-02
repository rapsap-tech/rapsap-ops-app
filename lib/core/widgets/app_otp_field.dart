import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';

/// Six OTP boxes that fill the row width.
class AppOtpField extends StatelessWidget {
  const new({
    required this.controller,
    required this.onChanged,
    required this.onCompleted,
    required this.semanticLabel,
    this.enabled = true,
    this.hasError = false,
    super.key,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onCompleted;
  final String semanticLabel;
  final bool enabled;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const gaps = AppConstants.otpLength - 1;
        final gap = Dimens.paddingSmall;
        final width =
            (constraints.maxWidth - gap * gaps) / AppConstants.otpLength;
        final base = _theme(width, AppColors.border);
        return Semantics(
          label: semanticLabel,
          child: Pinput(
            length: AppConstants.otpLength,
            controller: controller,
            enabled: enabled,
            autofocus: true,
            forceErrorState: hasError,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            separatorBuilder: (_) => SizedBox(width: gap),
            defaultPinTheme: base,
            focusedPinTheme: _theme(width, AppColors.primary, thick: true),
            errorPinTheme: _theme(width, AppColors.error),
            onChanged: onChanged,
            onCompleted: onCompleted,
          ),
        );
      },
    );
  }

  PinTheme _theme(double width, Color border, {bool thick = false}) => PinTheme(
    width: width,
    height: Dimens.otpBoxHeight,
    textStyle: AppTextStyles.base.s22.w600,
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(Dimens.radius12),
      border: Border.all(
        color: border,
        width: thick ? Dimens.borderWidthThick : Dimens.borderWidth,
      ),
    ),
  );
}
