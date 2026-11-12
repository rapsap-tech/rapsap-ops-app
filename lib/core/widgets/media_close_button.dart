import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';

/// Closes a full-screen photo or video.
class MediaCloseButton extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.close_rounded),
      tooltip: context.l10n.mediaClose,
      iconSize: Dimens.iconMedium,
      color: AppColors.onPrimary,
      style: IconButton.styleFrom(backgroundColor: AppColors.stampBackground),
      constraints: BoxConstraints.tightFor(
        width: Dimens.minTapTarget,
        height: Dimens.minTapTarget,
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
