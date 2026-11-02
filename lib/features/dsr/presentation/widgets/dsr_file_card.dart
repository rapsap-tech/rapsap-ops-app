import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';

/// "XLSX · DSR_Walk_19Oct.xlsx · 212 KB · read just now".
class DsrFileCard extends StatelessWidget {
  const new({
    required this.name,
    required this.size,
    required this.note,
    this.onChange,
    super.key,
  });

  final String name;
  final int size;
  final String note;
  final VoidCallback? onChange;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final kb = (size / AppConstants.bytesPerKb).round();
    final onChange = this.onChange;
    return AppCard(
      child: Row(
        children: [
          Container(
            padding: Dimens.chipPadding,
            decoration: BoxDecoration(
              color: AppColors.successChip,
              borderRadius: BorderRadius.circular(Dimens.radius6),
            ),
            child: Text(
              l10n.dsrXlsx,
              style: AppTextStyles.base.s11.w700.successColor(),
            ),
          ),
          12.wSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyles.base.s14.w600,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  l10n.dsrFileMeta(kb, note),
                  style: AppTextStyles.base.s12.secondaryTextColor(),
                ),
              ],
            ),
          ),
          if (onChange != null)
            TextButton(onPressed: onChange, child: Text(l10n.dsrChange)),
        ],
      ),
    );
  }
}
