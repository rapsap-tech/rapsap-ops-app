import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/core/widgets/app_svg_icon.dart';
import 'package:rapsap_ops_app/core/widgets/status_chip.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/checklist_task.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/task_display.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/task_navigation.dart';
import 'package:rapsap_ops_app/gen/assets.gen.dart';

/// "Do this now": the open task due soonest.
class DoNowCard extends StatelessWidget {
  const new({required this.task, required this.now, super.key});

  final ChecklistTask task;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    return AppCard(
      thickBorder: true,
      borderColor: AppColors.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.homeDoNow.toUpperCase(),
                  style: AppTextStyles.base.s11.w700.p7.primaryDarkColor(),
                ),
              ),
              StatusChip(
                label: l10n.taskMinutesLeft(minutesLeft(task, now)),
                tone: StatusTone.info,
              ),
            ],
          ),
          11.hSpace,
          Text(
            l10n.taskTitle(task.number, task.title),
            style: AppTextStyles.base.s18.w600.lineHeight(23.4),
          ),
          8.hSpace,
          Text(
            l10n.homeDueAt(
              l10n.sectionName(task.section),
              task.dueAt.storeClock(locale),
            ),
            style: AppTextStyles.base.s13.secondaryTextColor(),
          ),
          11.hSpace,
          AppButton(
            label: l10n.homeOpenCamera,
            icon: AppSvgIcon(
              Assets.icons.camera,
              size: Dimens.iconExtraSmall,
              color: AppColors.onPrimary,
            ),
            onPressed: () => openTask(context, task.id, openCamera: true),
          ),
        ],
      ),
    );
  }
}
