import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';

/// Card of label → value rows separated by dividers.
class InfoRowsCard extends StatelessWidget {
  const new({required this.rows, super.key});

  final List<(String, String)> rows;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.symmetric(horizontal: Dimens.paddingMedium),
      child: Column(
        children: [
          for (var i = 0; i < rows.length; i++) ...[
            if (i > 0)
              Divider(height: Dimens.borderWidth, color: AppColors.divider),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Dimens.space12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      rows[i].$1,
                      style: AppTextStyles.base.s13.secondaryTextColor(),
                    ),
                  ),
                  12.wSpace,
                  Expanded(
                    flex: 2,
                    child: Text(
                      rows[i].$2,
                      textAlign: TextAlign.end,
                      style: AppTextStyles.base.s14.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
