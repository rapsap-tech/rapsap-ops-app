import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/capture_session.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/bloc/camera_cubit.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/capture_stamp.dart';

/// Centred shutter; the back camera is the only one used.
class CameraControls extends StatefulWidget {
  const new({required this.session, super.key});

  final CaptureSession? session;

  @override
  State<CameraControls> createState() => _CameraControlsState();
}

class _CameraControlsState extends State<CameraControls> {
  /// Server time + time since the token arrived = stamp time.
  final Stopwatch _sinceToken = Stopwatch()..start();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CameraCubit>();
    final ready = context.select<CameraCubit, bool>(
      (c) => c.state.status == CameraStatus.ready,
    );
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimens.paddingLarge),
      child: Center(
        child: Semantics(
          button: true,
          label: context.l10n.cameraTakePhoto,
          child: GestureDetector(
            onTap: ready
                ? () => cubit.capture(() {
                    final session = widget.session;
                    return session == null
                        ? const <String>[]
                        : captureStampLines(session, _sinceToken.elapsed);
                  })
                : null,
            child: _Shutter(enabled: ready),
          ),
        ),
      ),
    );
  }
}

class _Shutter extends StatelessWidget {
  const new({required this.enabled});

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final color = enabled ? AppColors.onPrimary : AppColors.disabled;
    return Container(
      width: Dimens.shutterSize,
      height: Dimens.shutterSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: Dimens.shutterBorder),
      ),
      child: Container(
        width: Dimens.shutterInnerSize,
        height: Dimens.shutterInnerSize,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}
