import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/gen/fonts.gen.dart';

class AppTextStyles {
  new _();

  /// Bundled fonts (offline-safe for the PWA). DM Sans has no Devanagari
  /// glyphs, so Marathi/Hindi fall back to Noto Sans Devanagari.
  static TextStyle get base => TextStyle(
    fontFamily: FontFamily.dMSans,
    fontFamilyFallback: _fallback,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  /// Condensed figures used for counters (e.g. "2 of 9").
  static TextStyle get numeric => base.copyWith(
    fontFamily: FontFamily.barlowCondensed,
    fontWeight: FontWeight.w600,
  );

  static const List<String> _fallback = [FontFamily.notoSansDevanagari];
}

extension AppFontWeight on TextStyle {
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);
}

extension AppFontSize on TextStyle {
  TextStyle get s10 => copyWith(fontSize: 10.sp);
  TextStyle get s11 => copyWith(fontSize: 11.sp);
  TextStyle get s12 => copyWith(fontSize: 12.sp);
  TextStyle get s13 => copyWith(fontSize: 13.sp);
  TextStyle get s14 => copyWith(fontSize: 14.sp);
  TextStyle get s15 => copyWith(fontSize: 15.sp);
  TextStyle get s16 => copyWith(fontSize: 16.sp);
  TextStyle get s18 => copyWith(fontSize: 18.sp);
  TextStyle get s19 => copyWith(fontSize: 19.sp);
  TextStyle get s20 => copyWith(fontSize: 20.sp);
  TextStyle get s22 => copyWith(fontSize: 22.sp);
  TextStyle get s24 => copyWith(fontSize: 24.sp);
  TextStyle get s28 => copyWith(fontSize: 28.sp);
  TextStyle get s30 => copyWith(fontSize: 30.sp);
  TextStyle get s44 => copyWith(fontSize: 44.sp);
}

/// Figma letter spacing as a percentage of font size (e.g. -5% → l5).
extension AppLetterSpacing on TextStyle {
  TextStyle get l1 => _tracking(-0.01);
  TextStyle get l5 => _tracking(-0.05);
  TextStyle get p1 => _tracking(0.01);
  TextStyle get p7 => _tracking(0.07);

  TextStyle _tracking(double factor) =>
      copyWith(letterSpacing: (fontSize ?? 16.sp) * factor);
}

extension AppLineHeight on TextStyle {
  TextStyle lineHeight(double px) =>
      copyWith(height: px.sp / (fontSize ?? 16.sp));
}

extension AppFontColor on TextStyle {
  TextStyle whiteColor({double opacity = 1}) =>
      _color(AppColors.onPrimary, opacity);
  TextStyle titleColor({double opacity = 1}) =>
      _color(AppColors.textTitle, opacity);
  TextStyle primaryTextColor({double opacity = 1}) =>
      _color(AppColors.textPrimary, opacity);
  TextStyle secondaryTextColor({double opacity = 1}) =>
      _color(AppColors.textSecondary, opacity);
  TextStyle tertiaryTextColor({double opacity = 1}) =>
      _color(AppColors.textTertiary, opacity);
  TextStyle primaryColor({double opacity = 1}) =>
      _color(AppColors.primary, opacity);
  TextStyle primaryDarkColor({double opacity = 1}) =>
      _color(AppColors.primaryDark, opacity);
  TextStyle successColor({double opacity = 1}) =>
      _color(AppColors.successText, opacity);
  TextStyle errorColor({double opacity = 1}) =>
      _color(AppColors.errorText, opacity);

  TextStyle _color(Color color, double opacity) =>
      copyWith(color: color.withValues(alpha: opacity));
}

extension AppFontStyle on TextStyle {
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
}

extension AppFontDecoration on TextStyle {
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);
  TextStyle get noneDecoration => copyWith(decoration: TextDecoration.none);
}
