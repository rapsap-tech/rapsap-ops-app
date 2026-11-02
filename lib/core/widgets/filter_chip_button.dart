import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';

/// Pill filter ("All 9", "Needs review 6").
class FilterChipButton extends StatelessWidget {
  const new({
    required this.label,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final style = AppTextStyles.base.s13.w500;
    return Semantics(
      button: true,
      selected: selected,
      child: Material(
        color: selected ? AppColors.primary : AppColors.surface,
        shape: StadiumBorder(
          side: BorderSide(
            color: selected ? AppColors.primary : AppColors.border,
            width: Dimens.borderWidth,
          ),
        ),
        child: InkWell(
          customBorder: const StadiumBorder(),
          onTap: onTap,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: Dimens.minTapTarget),
            child: Padding(
              padding: Dimens.filterChipPadding,
              child: Center(
                widthFactor: 1,
                child: Text(
                  label,
                  style: selected ? style.whiteColor() : style,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
