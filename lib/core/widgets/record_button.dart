import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';

/// Red record shutter: a circle when idle, a rounded square while recording.
class RecordButton extends StatelessWidget {
  const new({required this.recording, this.enabled = true, super.key});

  final bool recording;
  final bool enabled;

  @override
  Widget build(BuildContext context) => Container(
    width: Dimens.shutterSize,
    height: Dimens.shutterSize,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: enabled ? AppColors.onPrimary : AppColors.disabled,
        width: Dimens.shutterBorder,
      ),
    ),
    child: Container(
      width: recording ? Dimens.iconMedium : Dimens.shutterInnerSize,
      height: recording ? Dimens.iconMedium : Dimens.shutterInnerSize,
      decoration: BoxDecoration(
        color: enabled ? AppColors.error : AppColors.disabled,
        shape: recording ? BoxShape.rectangle : BoxShape.circle,
        borderRadius: recording ? BorderRadius.circular(Dimens.radius6) : null,
      ),
    ),
  );
}
