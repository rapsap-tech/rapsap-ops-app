import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_loader.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/capture_session.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/bloc/camera_cubit.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/camera_controls.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/camera_top_bar.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/live_stamp.dart';

class CameraPageArgs {
  const new({required this.title, this.session});

  /// Task capture stamp; null for chat photos (no stamp).
  final CaptureSession? session;
  final String title;
}

/// B4 · In-app camera (camera only, no gallery). Pops with the stamped,
/// compressed photo bytes.
class CameraPage extends StatelessWidget {
  const new({required this.title, this.session, super.key});

  final CaptureSession? session;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = getIt<CameraCubit>();
        unawaited(cubit.start());
        return cubit;
      },
      child: BlocListener<CameraCubit, CameraState>(
        listenWhen: (_, next) => next.status == CameraStatus.captured,
        listener: (context, state) => context.pop(state.photo),
        child: Scaffold(
          backgroundColor: AppColors.cameraBackground,
          body: SafeArea(
            child: Column(
              children: [
                CameraTopBar(title: title),
                Expanded(child: _Viewfinder(session: session)),
                CameraControls(session: session),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Viewfinder extends StatelessWidget {
  const new({required this.session});

  final CaptureSession? session;

  @override
  Widget build(BuildContext context) {
    final status = context.select<CameraCubit, CameraStatus>(
      (c) => c.state.status,
    );
    final camera = context.read<CameraCubit>().camera;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.space12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimens.radius20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            switch (status) {
              CameraStatus.starting => const Center(child: AppLoader()),
              CameraStatus.denied => _Message(context.l10n.cameraDenied),
              CameraStatus.unavailable => _Message(
                context.l10n.cameraUnavailable,
              ),
              CameraStatus.ready ||
              CameraStatus.processing ||
              CameraStatus.captured => FittedBox(
                fit: BoxFit.cover,
                clipBehavior: Clip.hardEdge,
                child: SizedBox.fromSize(
                  size: MediaQuery.sizeOf(context),
                  child: camera.preview(),
                ),
              ),
            },
            const FractionallySizedBox(
              widthFactor: 0.72,
              heightFactor: 0.56,
              child: _FrameGuide(),
            ),
            if (session case final session?)
              Positioned(
                left: Dimens.space14,
                bottom: Dimens.space14,
                child: LiveStamp(session: session),
              ),
            if (status == CameraStatus.processing)
              const ColoredBox(
                color: AppColors.stampBackground,
                child: Center(child: AppLoader(color: AppColors.onPrimary)),
              ),
          ],
        ),
      ),
    );
  }
}

class _FrameGuide extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) => Center(
    child: DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.radius14),
        border: Border.all(
          color: AppColors.cameraFrame,
          width: Dimens.borderWidthThick,
        ),
      ),
      child: const SizedBox.expand(),
    ),
  );
}

class _Message extends StatelessWidget {
  const new(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: Dimens.pagePadding,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyles.base.s15.whiteColor(),
      ),
    ),
  );
}
