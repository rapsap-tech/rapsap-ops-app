import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Getters (not fields) so values follow window resizes and rotation.
class Dimens {
  new _();

  static double get paddingExtraSmall => 4.w;
  static double get paddingSmall => 8.w;
  static double get paddingMedium => 16.w;
  static double get paddingLarge => 24.w;
  static double get paddingExtraLarge => 32.w;

  static double get space2 => 2.h;
  static double get space6 => 6.h;
  static double get space10 => 10.w;
  static double get space12 => 12.w;
  static double get space13 => 13.w;
  static double get space14 => 14.w;
  static double get space15 => 15.w;

  static double get radius6 => 6.r;
  static double get radius12 => 12.r;
  static double get radius14 => 14.r;
  static double get radius16 => 16.r;
  static double get radiusPill => 999.r;

  static double get borderWidth => 1.r;
  static double get borderWidthThick => 2.r;
  static double get iconExtraSmall => 20.r;
  static double get iconSmall => 22.r;
  static double get iconTileSize => 44.r;
  static double get iconButtonSize => 44.r;
  static double get otpBoxHeight => 56.h;
  static double get countryCodeWidth => 72.w;
  static double get avatarSize => 48.r;
  static double get chartHeight => 140.h;
  static double get chartStroke => 2.r;
  static double get chartDash => 5.r;
  static double get unreadDot => 4.r;
  static double get bubbleMaxWidthFactor => 0.8;
  static double get chatPhotoWidth => 200.w;
  static double get chatPhotoHeight => 120.h;
  static double get avatarLarge => 64.r;
  static double get drawerWidth => 300.w;
  static double get photoBoxHeight => 222.h;
  static double get photoPreviewHeight => 250.h;
  static double get photoIconSize => 48.r;
  static double get shutterSize => 78.r;
  static double get shutterInnerSize => 60.r;
  static double get shutterBorder => 4.r;
  static double get radius20 => 20.r;
  static double get space18 => 18.w;
  static double get space20 => 20.w;
  static double get logoAreaHeight => 300.h;
  static double get progressHeight => 10.h;
  static double get toggleHeight => 32.h;
  static double get toggleItemWidth => 42.w;
  static double get taskTimeWidth => 42.w;
  static double get badgeMinSize => 16.r;
  static double get loaderSize => 20.r;
  static double get loaderStroke => 2.r;
  static double get iconMedium => 26.r;
  static double get minTapTarget => 48.r;
  static double get buttonHeight => 54.h;
  static double get inputHeight => 54.h;
  static double get bottomNavHeight => 72.h;

  static EdgeInsets get pagePadding => EdgeInsets.all(paddingMedium);
  static EdgeInsets get footerPadding => EdgeInsets.fromLTRB(
    paddingMedium,
    paddingMedium,
    paddingMedium,
    paddingLarge,
  );
  static EdgeInsets get chipPadding =>
      EdgeInsets.symmetric(horizontal: space10, vertical: paddingExtraSmall);
  static EdgeInsets get filterChipPadding =>
      EdgeInsets.symmetric(horizontal: space14, vertical: paddingSmall);
  static EdgeInsets get tilePadding =>
      EdgeInsets.symmetric(horizontal: space15, vertical: space13);
  static EdgeInsets get bannerPadding =>
      EdgeInsets.symmetric(horizontal: space14, vertical: space12);
  static EdgeInsets get cardPadding => EdgeInsets.all(paddingMedium);
  static EdgeInsets get buttonPadding =>
      EdgeInsets.symmetric(horizontal: paddingLarge, vertical: paddingMedium);
}

extension SpaceX on num {
  Widget get hSpace => SizedBox(height: toDouble().h);
  Widget get wSpace => SizedBox(width: toDouble().w);
}
