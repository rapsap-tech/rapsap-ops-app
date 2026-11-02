import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/task_detail.dart';

/// "From Rahul (SM) · 9:02 AM — Photo is blurry…".
class SendBackNoteCard extends StatelessWidget {
  const new({required this.note, super.key});

  final SendBackNote note;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  context.l10n.taskFromManager(note.by),
                  style: AppTextStyles.base.s14.w600,
                ),
              ),
              Text(
                note.at.storeClock(locale),
                style: AppTextStyles.base.s12.secondaryTextColor(),
              ),
            ],
          ),
          8.hSpace,
          Text(note.reason, style: AppTextStyles.base.s15),
        ],
      ),
    );
  }
}
