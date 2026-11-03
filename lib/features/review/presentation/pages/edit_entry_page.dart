import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/extensions/navigation_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/router/route_paths.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/utils/validators.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/app_scaffold.dart';
import 'package:rapsap_ops_app/core/widgets/app_text_field.dart';
import 'package:rapsap_ops_app/core/widgets/filter_chip_button.dart';
import 'package:rapsap_ops_app/core/widgets/media_preview.dart';
import 'package:rapsap_ops_app/core/widgets/message_banner.dart';
import 'package:rapsap_ops_app/core/widgets/page_header.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/pages/camera_page.dart';
import 'package:rapsap_ops_app/features/review/domain/repositories/review_repository.dart';
import 'package:rapsap_ops_app/features/review/presentation/bloc/edit_entry_cubit.dart';

/// C5 · Edit entry: new stamped photo or video + reason; the original stays
/// in history.
class EditEntryPage extends StatelessWidget {
  const new({required this.taskId, super.key});

  final String taskId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EditEntryCubit>(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<EditEntryCubit, EditEntryState>(
            listenWhen: (p, n) =>
                p.status != n.status && n.status == EditStatus.cameraReady,
            listener: _openCamera,
          ),
          BlocListener<EditEntryCubit, EditEntryState>(
            listenWhen: (p, n) =>
                p.status != n.status && n.status == EditStatus.saved,
            listener: (context, _) => context.pop(true),
          ),
        ],
        child: AppScaffold(
          header: PageHeader(title: context.l10n.editTitle),
          body: _Form(taskId: taskId),
          footer: _SaveButton(taskId: taskId),
        ),
      ),
    );
  }

  Future<void> _openCamera(BuildContext context, EditEntryState state) async {
    final cubit = context.read<EditEntryCubit>();
    final media = await context.pushNamedOffHistory<MediaFile>(
      RouteNames.reviewEditCamera,
      pathParameters: {RoutePaths.taskIdParam: taskId},
      extra: CameraPageArgs(
        title: context.l10n.editTitle,
        session: state.session,
      ),
    );
    if (!cubit.isClosed) cubit.mediaTaken(media ?? state.media);
  }
}

class _Form extends StatelessWidget {
  const new({required this.taskId});

  final String taskId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<EditEntryCubit>().state;
    final cubit = context.read<EditEntryCubit>();
    final media = state.media;
    final reasons = {
      EditReason.photoUnclear: l10n.editPhotoUnclear,
      EditReason.wrongPhoto: l10n.editWrongPhoto,
      EditReason.remarkMissing: l10n.editRemarkMissing,
      EditReason.other: l10n.editOther,
    };
    return ListView(
      padding: Dimens.pagePadding,
      children: [
        Text(l10n.editBody, style: AppTextStyles.base.s14.secondaryTextColor()),
        16.hSpace,
        Row(
          children: [
            Expanded(
              child: Text(
                l10n.editNewPhoto,
                style: AppTextStyles.base.s14.w600,
              ),
            ),
            if (media != null)
              TextButton(
                onPressed: () => unawaited(cubit.openCamera(taskId)),
                child: Text(l10n.taskRetake),
              ),
          ],
        ),
        8.hSpace,
        if (media == null)
          AppButton(
            label: l10n.taskTapToOpenCamera,
            variant: AppButtonVariant.outline,
            isLoading: state.status == EditStatus.preparingCamera,
            onPressed: () => unawaited(cubit.openCamera(taskId)),
          )
        else
          MediaPreview(media: media, semanticLabel: l10n.taskYourPhoto),
        20.hSpace,
        Text(l10n.editWhy, style: AppTextStyles.base.s14.w600),
        8.hSpace,
        Wrap(
          spacing: Dimens.paddingSmall,
          runSpacing: Dimens.paddingSmall,
          children: [
            for (final entry in reasons.entries)
              FilterChipButton(
                label: entry.value,
                selected: state.reason == entry.key,
                onTap: () => cubit.reasonPicked(entry.key),
              ),
          ],
        ),
        20.hSpace,
        AppTextField(
          label: l10n.taskRemarks,
          maxLines: 3,
          maxLength: AppConstants.remarksMaxLength,
          validator: (v) => Validators.optionalText(v, l10n),
          onChanged: cubit.remarksChanged,
        ),
      ],
    );
  }
}

class _SaveButton extends StatelessWidget {
  const new({required this.taskId});

  final String taskId;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<EditEntryCubit>().state;
    final failure = state.status == EditStatus.failure ? state.failure : null;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (failure != null) ...[
          MessageBanner(failure.message(context.l10n)),
          12.hSpace,
        ],
        AppButton(
          label: context.l10n.editSave,
          isLoading: state.status == EditStatus.saving,
          onPressed: state.canSave
              ? () => context.read<EditEntryCubit>().save(taskId)
              : null,
        ),
      ],
    );
  }
}
