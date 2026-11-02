import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_svg_icon.dart';
import 'package:rapsap_ops_app/core/widgets/brand_logo.dart';
import 'package:rapsap_ops_app/core/widgets/language_toggle.dart';
import 'package:rapsap_ops_app/gen/assets.gen.dart';

/// Logo + store name + language switch, shown on the tab pages.
class BrandHeader extends StatelessWidget {
  const new({required this.storeName, this.onMenu, super.key});

  final String storeName;

  /// Opens the side menu; hidden when null.
  final VoidCallback? onMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        Dimens.paddingMedium,
        Dimens.paddingMedium,
        Dimens.paddingMedium,
        Dimens.space15,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.divider,
            width: Dimens.borderWidth,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BrandLogo(),
                6.hSpace,
                Text(
                  storeName,
                  style: AppTextStyles.base.s13.secondaryTextColor(),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const LanguageToggle(),
          if (onMenu != null)
            IconButton(
              tooltip: context.l10n.menuOpen,
              onPressed: onMenu,
              icon: AppSvgIcon(
                Assets.icons.menu,
                size: Dimens.iconMedium,
                color: AppColors.textPrimary,
              ),
            ),
        ],
      ),
    );
  }
}
