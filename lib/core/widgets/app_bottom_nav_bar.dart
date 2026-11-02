import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_svg_icon.dart';
import 'package:rapsap_ops_app/gen/assets.gen.dart';

class AppNavItem {
  const new({required this.icon, required this.label, this.badge = 0});

  final SvgGenImage icon;
  final String label;
  final int badge;
}

class AppBottomNavBar extends StatelessWidget {
  const new({
    required this.items,
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final List<AppNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.bottomNavHeight,
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(
          top: BorderSide(
            color: AppColors.navBorder,
            width: Dimens.borderWidth,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            for (var i = 0; i < items.length; i++)
              Expanded(
                child: _NavButton(
                  item: items[i],
                  selected: i == currentIndex,
                  onTap: () => onTap(i),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const new({required this.item, required this.selected, required this.onTap});

  final AppNavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.primaryDark : AppColors.textSecondary;
    final label = AppTextStyles.base.s12.copyWith(color: color);
    return Semantics(
      selected: selected,
      button: true,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Badge(
              isLabelVisible: item.badge > 0,
              backgroundColor: AppColors.badge,
              label: Text('${item.badge}'),
              textStyle: AppTextStyles.base.s10.w700,
              child: AppSvgIcon(
                item.icon,
                size: Dimens.iconSmall,
                color: color,
              ),
            ),
            4.hSpace,
            Text(item.label, style: selected ? label.w600 : label),
          ],
        ),
      ),
    );
  }
}
