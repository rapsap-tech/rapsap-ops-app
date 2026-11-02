import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/services/install/install_service.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';

/// Manual install instructions for browsers without an install button API.
class InstallSteps extends StatelessWidget {
  const new({required this.mode, super.key});

  final InstallMode mode;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final guide = switch (mode) {
      InstallMode.iosGuide => (
        [
          (Icons.ios_share, l10n.installIosStepShare),
          (Icons.add_box_outlined, l10n.installIosStepAdd),
          (Icons.home_outlined, l10n.installStepOpen),
        ],
        l10n.installIosNote,
      ),
      InstallMode.browserGuide => (
        [
          (Icons.more_vert, l10n.installBrowserStepMenu),
          (Icons.install_mobile, l10n.installBrowserStepAdd),
          (Icons.home_outlined, l10n.installStepOpen),
        ],
        l10n.installBrowserNote,
      ),
      _ => null,
    };
    if (guide == null) return const SizedBox.shrink();
    final (steps, note) = guide;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppCard(
          child: Column(
            children: [
              for (var i = 0; i < steps.length; i++) ...[
                if (i > 0) 16.hSpace,
                _Step(number: i + 1, icon: steps[i].$1, text: steps[i].$2),
              ],
            ],
          ),
        ),
        12.hSpace,
        Text(note, style: AppTextStyles.base.s14.secondaryTextColor()),
      ],
    );
  }
}

class _Step extends StatelessWidget {
  const new({required this.number, required this.icon, required this.text});

  final int number;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$number.', style: AppTextStyles.base.s16.w700),
        12.wSpace,
        Icon(icon, size: Dimens.iconSmall, color: AppColors.primary),
        12.wSpace,
        Expanded(child: Text(text, style: AppTextStyles.base.s15)),
      ],
    );
  }
}
