import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/utils/validators.dart';
import 'package:rapsap_ops_app/core/widgets/app_text_field.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/task_detail.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/bloc/task_cubit.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/photo_proof.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/send_back_note_card.dart';

/// Photo proof + remarks, or the "can't take a photo" reason (CK-10..21).
class TaskCaptureSection extends StatelessWidget {
  const new({required this.detail, super.key});

  final TaskDetail detail;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<TaskCubit>();
    final notDone = context.select<TaskCubit, bool>((c) => c.state.notDoneMode);
    final hasPhoto = context.select<TaskCubit, bool>(
      (c) => c.state.photo != null,
    );
    final sendBack = detail.sendBack;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (sendBack != null) ...[
          SendBackNoteCard(note: sendBack),
          16.hSpace,
          if (!hasPhoto) ...[
            Text(l10n.taskEarlierPhoto, style: AppTextStyles.base.s14.w600),
            8.hSpace,
            StoredPhoto(url: detail.photoUrl),
            16.hSpace,
          ],
        ],
        if (notDone)
          AppTextField(
            label: l10n.taskNotDoneReason,
            hint: l10n.taskNotDoneHint,
            maxLines: 4,
            maxLength: AppConstants.remarksMaxLength,
            validator: (v) => Validators.reason(v, l10n),
            onChanged: cubit.reasonChanged,
          )
        else ...[
          if (sendBack == null || hasPhoto) PhotoProof(hint: detail.photoHint),
          if (hasPhoto) ...[
            16.hSpace,
            AppTextField(
              label: l10n.taskRemarks,
              hint: l10n.taskRemarksHint,
              maxLines: 3,
              maxLength: AppConstants.remarksMaxLength,
              validator: (v) => Validators.optionalText(v, l10n),
              onChanged: cubit.remarksChanged,
            ),
          ],
        ],
        16.hSpace,
        _ModeLink(notDone: notDone),
      ],
    );
  }
}

class _ModeLink extends StatelessWidget {
  const new({required this.notDone});

  final bool notDone;

  @override
  Widget build(BuildContext context) {
    final busy = context.select<TaskCubit, bool>((c) => c.state.isBusy);
    return TextButton(
      onPressed: busy
          ? null
          : () => context.read<TaskCubit>().setNotDoneMode(enabled: !notDone),
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      child: Text(
        notDone
            ? context.l10n.taskUsePhotoInstead
            : context.l10n.taskCantTakePhoto,
        style: AppTextStyles.base.s14.w600.primaryDarkColor().underline,
      ),
    );
  }
}
