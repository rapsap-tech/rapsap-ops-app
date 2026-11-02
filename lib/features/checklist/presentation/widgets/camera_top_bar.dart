import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_svg_icon.dart';
import 'package:rapsap_ops_app/gen/assets.gen.dart';

class CameraTopBar extends StatelessWidget {
  const new({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.paddingSmall,
        vertical: Dimens.space14,
      ),
      child: Row(
        children: [
          IconButton(
            tooltip: context.l10n.cameraClose,
            onPressed: context.pop,
            icon: AppSvgIcon(
              Assets.icons.close,
              size: Dimens.iconMedium,
              color: AppColors.onPrimary,
            ),
          ),
          10.wSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.base.s15.w600.whiteColor()),
                2.hSpace,
                Text(
                  context.l10n.cameraOnly,
                  style: AppTextStyles.base.s12.copyWith(
                    color: AppColors.cameraSubtitle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
