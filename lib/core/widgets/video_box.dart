import 'dart:async';

import 'package:camera/camera.dart' show XFile;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/services/media/video_preview.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';
import 'package:rapsap_ops_app/core/widgets/app_loader.dart';
import 'package:video_player/video_player.dart';

/// First frame of a just-recorded clip or one already on the server. Tapping
/// it plays the video full screen, so only one video ever plays at a time.
/// Without a [height] it keeps the clip's own aspect ratio.
class VideoBox extends StatefulWidget {
  const new local(this.source, {this.height, this.width, super.key})
    : isLocal = true;

  const new network(this.source, {this.height, this.width, super.key})
    : isLocal = false;

  /// Local path (blob URL on web) or server URL.
  final String source;
  final bool isLocal;
  final double? height;
  final double? width;

  @override
  State<VideoBox> createState() => _VideoBoxState();
}

class _VideoBoxState extends State<VideoBox> {
  late final VideoPlayerController _preview = _createPlayer(widget);
  bool _failed = false;

  @override
  void initState() {
    super.initState();
    unawaited(
      _preview.initialize().then(
        (_) => mounted ? setState(() {}) : null,
        onError: (Object error) {
          appLogger.w('Video load failed', error: error.runtimeType);
          if (mounted) setState(() => _failed = true);
        },
      ),
    );
  }

  void _openFullscreen() {
    Navigator.of(
      context,
      rootNavigator: true,
    ).push<void>(MaterialPageRoute(builder: (_) => _FullscreenVideo(widget)));
  }

  @override
  void dispose() {
    unawaited(_preview.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = widget.height;
    final width = widget.width ?? double.infinity;
    if (_failed || !_preview.value.isInitialized) {
      return _VideoPlaceholder(
        failed: _failed,
        height: height ?? Dimens.photoPreviewHeight,
        width: width,
      );
    }
    final picture = VideoPlayer(_preview);
    final video = height == null
        ? AspectRatio(aspectRatio: _preview.value.aspectRatio, child: picture)
        : SizedBox(
            height: height,
            width: width,
            child: FittedBox(
              fit: BoxFit.cover,
              clipBehavior: Clip.hardEdge,
              child: SizedBox.fromSize(
                size: _preview.value.size,
                child: picture,
              ),
            ),
          );
    return Semantics(
      button: true,
      label: context.l10n.videoPlayButton,
      child: GestureDetector(
        onTap: _openFullscreen,
        child: Stack(
          alignment: Alignment.center,
          children: [
            video,
            const Positioned.fill(child: _TapLayer()),
            Icon(
              Icons.play_circle_fill_rounded,
              size: Dimens.photoIconSize,
              color: AppColors.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}

VideoPlayerController _createPlayer(VideoBox video) => video.isLocal
    ? videoPreviewController(XFile(video.source))
    : VideoPlayerController.networkUrl(Uri.parse(video.source));

class _VideoPlaceholder extends StatelessWidget {
  const new({required this.failed, this.height, this.width});

  final bool failed;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      color: failed ? AppColors.photoPlaceholder : AppColors.cameraBackground,
      child: failed ? null : const AppLoader(color: AppColors.onPrimary),
    );
  }
}

/// Painted, so on web it sits above the <video> element and gets the taps.
class _TapLayer extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(color: AppColors.videoTapLayer);
  }
}

class _FullscreenVideo extends StatefulWidget {
  const new(this.video);

  final VideoBox video;

  @override
  State<_FullscreenVideo> createState() => _FullscreenVideoState();
}

class _FullscreenVideoState extends State<_FullscreenVideo> {
  late final VideoPlayerController _player = _createPlayer(widget.video);
  bool _failed = false;

  @override
  void initState() {
    super.initState();
    unawaited(
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky),
    );
    unawaited(_initializeAndPlay());
  }

  Future<void> _initializeAndPlay() async {
    try {
      await _player.initialize();
    } on Object catch (error) {
      appLogger.w('Video load failed', error: error.runtimeType);
      if (mounted) setState(() => _failed = true);
      return;
    }
    if (!mounted) return;
    setState(() {});
    await _player.play();
  }

  @override
  void dispose() {
    unawaited(SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge));
    unawaited(_player.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ready = _player.value.isInitialized;
    return Scaffold(
      backgroundColor: AppColors.cameraBackground,
      body: SafeArea(
        child: Center(
          child: ready
              ? AspectRatio(
                  aspectRatio: _player.value.aspectRatio,
                  child: _FullscreenControls(_player),
                )
              : _VideoPlaceholder(failed: _failed),
        ),
      ),
    );
  }
}

class _FullscreenControls extends StatelessWidget {
  const new(this.player);

  final VideoPlayerController player;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ValueListenableBuilder<VideoPlayerValue>(
      valueListenable: player,
      child: VideoPlayer(player),
      builder: (context, value, video) {
        final playing = value.isPlaying;
        final muted = value.volume == 0;
        void togglePlay() =>
            unawaited(playing ? player.pause() : player.play());
        return Stack(
          alignment: Alignment.center,
          children: [
            ?video,
            Positioned.fill(
              child: Semantics(
                button: true,
                label: l10n.videoPlay,
                child: GestureDetector(
                  onTap: togglePlay,
                  child: const _TapLayer(),
                ),
              ),
            ),
            if (!playing)
              IgnorePointer(
                child: Icon(
                  Icons.play_circle_fill_rounded,
                  size: Dimens.photoIconSize,
                  color: AppColors.onPrimary,
                ),
              ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: ColoredBox(
                color: AppColors.stampBackground,
                child: Row(
                  children: [
                    _ControlButton(
                      icon: playing
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                      tooltip: playing ? l10n.videoPause : l10n.videoPlayButton,
                      onPressed: togglePlay,
                    ),
                    const Spacer(),
                    _ControlButton(
                      icon: muted
                          ? Icons.volume_off_rounded
                          : Icons.volume_up_rounded,
                      tooltip: muted ? l10n.videoUnmute : l10n.videoMute,
                      onPressed: () =>
                          unawaited(player.setVolume(muted ? 1 : 0)),
                    ),
                    _ControlButton(
                      icon: Icons.fullscreen_exit_rounded,
                      tooltip: l10n.videoExitFullscreen,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ControlButton extends StatelessWidget {
  const new({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      tooltip: tooltip,
      iconSize: Dimens.iconMedium,
      color: AppColors.onPrimary,
      constraints: BoxConstraints.tightFor(
        width: Dimens.minTapTarget,
        height: Dimens.minTapTarget,
      ),
      onPressed: onPressed,
    );
  }
}
