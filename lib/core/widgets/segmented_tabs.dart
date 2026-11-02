import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';

/// Equal-width text tabs with an underline on the selected one.
class SegmentedTabs extends StatelessWidget {
  const new({
    required this.labels,
    required this.selected,
    required this.onSelected,
    super.key,
  });

  final List<String> labels;
  final int selected;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < labels.length; i++)
          Expanded(
            child: Semantics(
              selected: i == selected,
              button: true,
              child: InkWell(
                onTap: () => onSelected(i),
                child: Container(
                  constraints: BoxConstraints(minHeight: Dimens.minTapTarget),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: i == selected
                            ? AppColors.primary
                            : AppColors.transparentBorder,
                        width: Dimens.borderWidthThick,
                      ),
                    ),
                  ),
                  child: Text(
                    labels[i],
                    style: i == selected
                        ? AppTextStyles.base.s14.w600.primaryDarkColor()
                        : AppTextStyles.base.s14.secondaryTextColor(),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
