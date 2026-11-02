import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';

class AppTheme {
  new _();

  static ThemeData get light {
    final base = AppTextStyles.base;
    return ThemeData(
      useMaterial3: true,
      fontFamily: base.fontFamily,
      fontFamilyFallback: base.fontFamilyFallback,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        surface: AppColors.surface,
        onSurface: AppColors.textPrimary,
        error: AppColors.error,
        outline: AppColors.border,
      ),
      dividerColor: AppColors.divider,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: base.s16.w600,
      ),
      inputDecorationTheme: _inputTheme(base),
      elevatedButtonTheme: ElevatedButtonThemeData(style: _buttonStyle(base)),
    );
  }

  static InputDecorationTheme _inputTheme(TextStyle base) {
    OutlineInputBorder border(Color color) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimens.radius12),
      borderSide: BorderSide(color: color, width: Dimens.borderWidth),
    );
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      contentPadding: EdgeInsets.all(Dimens.paddingMedium),
      hintStyle: base.s15.secondaryTextColor(),
      errorStyle: base.s12.errorColor(),
      border: border(AppColors.border),
      enabledBorder: border(AppColors.border),
      focusedBorder: border(AppColors.primary),
      errorBorder: border(AppColors.error),
      focusedErrorBorder: border(AppColors.error),
    );
  }

  static ButtonStyle _buttonStyle(TextStyle base) => ButtonStyle(
    minimumSize: WidgetStatePropertyAll(Size.fromHeight(Dimens.buttonHeight)),
    elevation: const WidgetStatePropertyAll(0),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.radiusPill),
      ),
    ),
    textStyle: WidgetStatePropertyAll(base.s16.w600),
    foregroundColor: const WidgetStatePropertyAll(AppColors.onPrimary),
    backgroundColor: WidgetStateProperty.resolveWith(
      (states) => states.contains(WidgetState.disabled)
          ? AppColors.disabled
          : AppColors.primary,
    ),
  );
}
