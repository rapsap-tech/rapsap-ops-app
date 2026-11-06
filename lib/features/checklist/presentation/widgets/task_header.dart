import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/navigation_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_svg_icon.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/task_detail.dart';
import 'package:rapsap_ops_app/gen/assets.gen.dart';

/// Back arrow + "Trading · #22".
class TaskHeader extends StatelessWidget {
  const new({required this.detail, super.key});

  final TaskDetail? detail;

  @override
  Widget build(BuildContext context) {
    final task = detail?.task;
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
          IconButton(
            tooltip: context.l10n.actionBack,
            onPressed: () => context.back(fallback: RouteNames.checklist),
            icon: AppSvgIcon(
              Assets.icons.back,
              size: Dimens.iconMedium,
              color: AppColors.textPrimary,
            ),
          ),
          if (task != null)
            Expanded(
              child: Text(
                context.l10n.taskHeader(
                  context.l10n.sectionName(task.section),
                  task.number,
                ),
                style: AppTextStyles.base.s22.w700.l1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
        ],
      ),
    );
  }
}
