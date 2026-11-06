import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/core/widgets/status_chip.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/manager_dashboard.dart';

/// "Opening · Ready to submit · 12 / 12"; opens section reports.
class SectionProgressTile extends StatelessWidget {
  const new({required this.section, super.key});

  final SectionProgress section;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final (label, tone) = switch (section.status) {
      SectionStatus.inProgress => (l10n.sectionInProgress, StatusTone.neutral),
      SectionStatus.critical => (
        l10n.sectionCritical(section.missed),
        StatusTone.error,
      ),
      SectionStatus.ready => (l10n.sectionReady, StatusTone.info),
      SectionStatus.submitted => (l10n.sectionSubmitted, StatusTone.neutral),
      SectionStatus.approved => (l10n.sectionApproved, StatusTone.success),
      SectionStatus.returned => (l10n.sectionReturned, StatusTone.error),
    };
    return InkWell(
      borderRadius: BorderRadius.circular(Dimens.radius14),
      onTap: EnvConfig.instance.hasSectionReports
          ? () => context.pushNamed(RouteNames.sectionReports)
          : null,
      child: AppCard(
        radius: Dimens.radius14,
        padding: Dimens.tilePadding,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.sectionName(section.name),
                    style: AppTextStyles.base.s15.w600,
                  ),
                  4.hSpace,
                  StatusChip(label: label, tone: tone),
                ],
              ),
            ),
            Text(
              l10n.statDoneValue(section.done, section.total),
              style: AppTextStyles.numeric.s20,
            ),
          ],
        ),
      ),
    );
  }
}
