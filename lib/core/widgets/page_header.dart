import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_svg_icon.dart';
import 'package:rapsap_ops_app/gen/assets.gen.dart';

/// Back arrow + title (+ optional subtitle and trailing action).
class PageHeader extends StatelessWidget {
  const new({required this.title, this.subtitle, this.trailing, super.key});

  final String title;
  final String? subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final subtitle = this.subtitle;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.paddingSmall,
        vertical: Dimens.paddingExtraSmall,
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
          if (Navigator.canPop(context))
            IconButton(
              tooltip: context.l10n.actionBack,
              onPressed: () => Navigator.pop(context),
              icon: AppSvgIcon(
                Assets.icons.back,
                size: Dimens.iconMedium,
                color: AppColors.textPrimary,
              ),
            )
          else
            8.wSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.base.s22.w700.l1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle != null)
                  Text(
                    subtitle,
                    style: AppTextStyles.base.s13.secondaryTextColor(),
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }
}
