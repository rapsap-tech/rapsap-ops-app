import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/core/widgets/status_chip.dart';

/// One checklist row: time · title + subtitle · status chip.
class TaskTile extends StatelessWidget {
  const new({
    required this.time,
    required this.title,
    required this.subtitle,
    required this.chipLabel,
    required this.tone,
    this.onTap,
    super.key,
  });

  final String time;
  final String title;
  final String subtitle;
  final String chipLabel;
  final StatusTone tone;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final (background, border) = switch (tone) {
      StatusTone.success => (AppColors.successSurface, AppColors.success),
      StatusTone.error => (AppColors.errorSurface, AppColors.error),
      StatusTone.info => (AppColors.surface, AppColors.primary),
      StatusTone.neutral => (AppColors.surface, AppColors.border),
    };
    final card = AppCard(
      color: background,
      borderColor: border,
      thickBorder: tone == StatusTone.info,
      radius: Dimens.radius14,
      padding: Dimens.tilePadding,
      child: Row(
        children: [
          SizedBox(
            width: Dimens.taskTimeWidth,
            child: Text(time, style: AppTextStyles.base.s13.w700),
          ),
          12.wSpace,
          Expanded(
            child: _Texts(title: title, subtitle: subtitle),
          ),
          12.wSpace,
          StatusChip(label: chipLabel, tone: tone),
        ],
      ),
    );
    if (onTap == null) return card;
    return Semantics(
      button: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Dimens.radius14),
        child: card,
      ),
    );
  }
}

class _Texts extends StatelessWidget {
  const new({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.base.s14.w600.lineHeight(18.9)),
        4.hSpace,
        Text(subtitle, style: AppTextStyles.base.s11.secondaryTextColor()),
      ],
    );
  }
}
