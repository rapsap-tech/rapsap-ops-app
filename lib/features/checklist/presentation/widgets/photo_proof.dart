import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_svg_icon.dart';
import 'package:rapsap_ops_app/core/widgets/media_preview.dart';
import 'package:rapsap_ops_app/core/widgets/video_box.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/bloc/task_cubit.dart';
import 'package:rapsap_ops_app/gen/assets.gen.dart';

/// "Photo or video proof*": a tap-to-open-camera box, or the capture + Retake.
class PhotoProof extends StatelessWidget {
  const new({required this.hint, super.key});

  final String hint;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final media = context.select<TaskCubit, MediaFile?>((c) => c.state.media);
    final cubit = context.read<TaskCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                l10n.taskPhotoProof,
                style: AppTextStyles.base.s14.w600,
              ),
            ),
            if (media != null)
              TextButton(
                onPressed: cubit.openCamera,
                child: Text(
                  l10n.taskRetake,
                  style: AppTextStyles.base.s14.w600
                      .primaryDarkColor()
                      .underline,
                ),
              ),
          ],
        ),
        8.hSpace,
        if (media == null)
          _EmptyBox(hint: hint, onTap: cubit.openCamera)
        else
          MediaPreview(media: media, semanticLabel: l10n.taskYourPhoto),
      ],
    );
  }
}

class _EmptyBox extends StatelessWidget {
  const new({required this.hint, required this.onTap});

  final String hint;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final preparing = context.select<TaskCubit, bool>((c) => c.state.isBusy);
    return Semantics(
      button: true,
      label: context.l10n.taskTapToOpenCamera,
      child: Material(
        color: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.radius12),
          side: BorderSide(color: AppColors.border, width: Dimens.borderWidth),
        ),
        child: InkWell(
          onTap: preparing ? null : onTap,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.radius12),
          ),
          child: SizedBox(
            height: Dimens.photoBoxHeight,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppSvgIcon(
                  Assets.icons.photoAdd,
                  size: Dimens.photoIconSize,
                  color: AppColors.hint,
                ),
                6.hSpace,
                Text(
                  context.l10n.taskTapToOpenCamera,
                  style: AppTextStyles.base.s13.w600.primaryDarkColor(),
                ),
                6.hSpace,
                Text(
                  hint,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.base.s13.copyWith(color: AppColors.hint),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// A proof photo or video already on the server, or a neutral placeholder
/// when there is none.
class StoredPhoto extends StatelessWidget {
  const new({required this.url, this.videoUrl, super.key});

  final String? url;
  final String? videoUrl;

  @override
  Widget build(BuildContext context) {
    final placeholder = Container(
      height: Dimens.photoPreviewHeight,
      width: double.infinity,
      color: AppColors.photoPlaceholder,
    );
    final url = this.url;
    final videoUrl = this.videoUrl;
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.radius12),
      child: videoUrl != null
          ? VideoBox.network(videoUrl, height: Dimens.photoPreviewHeight)
          : url == null
          ? placeholder
          : Image.network(
              url,
              height: Dimens.photoPreviewHeight,
              width: double.infinity,
              fit: BoxFit.cover,
              semanticLabel: context.l10n.taskYourPhoto,
              errorBuilder: (_, _, _) => placeholder,
            ),
    );
  }
}
