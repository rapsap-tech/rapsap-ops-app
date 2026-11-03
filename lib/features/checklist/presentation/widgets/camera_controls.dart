import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/num_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/record_button.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/capture_session.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/bloc/camera_cubit.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/capture_stamp.dart';

/// Photo / Video switch above a centred shutter; back camera only.
class CameraControls extends StatelessWidget {
  const new({required this.session, super.key});

  final CaptureSession? session;

  @override
  Widget build(BuildContext context) {
    final mode = context.select<CameraCubit, CameraMode>((c) => c.state.mode);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimens.paddingLarge),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _ModeSwitch(),
          12.hSpace,
          if (mode == CameraMode.photo)
            _PhotoShutter(session: session)
          else
            const _VideoShutter(),
        ],
      ),
    );
  }
}

class _ModeSwitch extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.select<CameraCubit, (CameraMode, bool)>(
      (c) => (c.state.mode, c.state.status == CameraStatus.ready),
    );
    final (mode, ready) = state;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ModeButton(
          label: l10n.cameraModePhoto,
          selected: mode == CameraMode.photo,
          enabled: ready,
          mode: CameraMode.photo,
        ),
        _ModeButton(
          label: l10n.cameraModeVideo,
          selected: mode == CameraMode.video,
          enabled: ready,
          mode: CameraMode.video,
        ),
      ],
    );
  }
}

class _ModeButton extends StatelessWidget {
  const new({
    required this.label,
    required this.selected,
    required this.enabled,
    required this.mode,
  });

  final String label;
  final bool selected;
  final bool enabled;
  final CameraMode mode;

  @override
  Widget build(BuildContext context) {
    final style = selected
        ? AppTextStyles.base.s14.w700.whiteColor()
        : AppTextStyles.base.s14.copyWith(color: AppColors.cameraSubtitle);
    return Semantics(
      selected: selected,
      child: TextButton(
        style: TextButton.styleFrom(
          minimumSize: Size.square(Dimens.minTapTarget),
        ),
        onPressed: enabled && !selected
            ? () => context.read<CameraCubit>().setMode(mode)
            : null,
        child: Text(label, style: style),
      ),
    );
  }
}

class _PhotoShutter extends StatefulWidget {
  const new({required this.session});

  final CaptureSession? session;

  @override
  State<_PhotoShutter> createState() => _PhotoShutterState();
}

class _PhotoShutterState extends State<_PhotoShutter> {
  /// Server time + time since the token arrived = stamp time.
  final Stopwatch _sinceToken = Stopwatch()..start();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CameraCubit>();
    final ready = context.select<CameraCubit, bool>(
      (c) => c.state.status == CameraStatus.ready,
    );
    return Semantics(
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
    );
  }
}

class _VideoShutter extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<CameraCubit>();
    final state = context.select<CameraCubit, (CameraStatus, int)>(
      (c) => (c.state.status, c.state.seconds),
    );
    final (status, seconds) = state;
    final recording = status == CameraStatus.recording;
    final ready = status == CameraStatus.ready;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (recording) ...[
          Text(
            l10n.cameraRec(seconds.clock, AppConstants.maxVideoSeconds.clock),
            style: AppTextStyles.base.s15.w700.copyWith(color: AppColors.error),
          ),
          12.hSpace,
        ],
        Semantics(
          button: true,
          label: recording
              ? l10n.cameraStopRecording
              : l10n.cameraStartRecording,
          child: GestureDetector(
            onTap: recording
                ? cubit.stop
                : ready
                ? cubit.record
                : null,
            child: RecordButton(
              recording: recording,
              enabled: recording || ready,
            ),
          ),
        ),
      ],
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
