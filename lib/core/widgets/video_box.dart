import 'dart:async';

import 'package:camera/camera.dart' show XFile;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/services/media/video_playback.dart';
import 'package:rapsap_ops_app/core/services/media/video_preview.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';
import 'package:rapsap_ops_app/core/widgets/app_loader.dart';
import 'package:rapsap_ops_app/core/widgets/media_close_button.dart';
import 'package:rapsap_ops_app/core/widgets/tap_layer.dart';
import 'package:video_player/video_player.dart';

/// First frame of a just-recorded clip or one already on the server. It
/// never plays here: tapping it plays the clip full screen through the one
/// shared [VideoPlayback].
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
    // The play button shows at once: some browsers (iPhone Safari) load no
    // frame until the user plays, so the first frame is only a bonus.
    final ready = !_failed && _preview.value.isInitialized;
    final picture = VideoPlayer(_preview);
    final video = !ready
        ? Container(
            height: height ?? Dimens.photoPreviewHeight,
            width: width,
            color: AppColors.cameraBackground,
          )
        : height == null
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
            const Positioned.fill(child: TapLayer()),
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

/// Full screen while the clip loads, or why it can't play.
class _VideoPlaceholder extends StatelessWidget {
  const new({required this.failed});

  final bool failed;

  @override
  Widget build(BuildContext context) {
    if (!failed) return const AppLoader(color: AppColors.onPrimary);
    return Padding(
      padding: Dimens.pagePadding,
      child: Text(
        context.l10n.videoCantPlay,
        textAlign: TextAlign.center,
        style: AppTextStyles.base.s15.w600.whiteColor(),
      ),
    );
  }
}

class _FullscreenVideo extends StatefulWidget {
  const new(this.video);

  final VideoBox video;

  @override
  State<_FullscreenVideo> createState() => _FullscreenVideoState();
}

class _FullscreenVideoState extends State<_FullscreenVideo> {
  final VideoPlayback _playback = getIt<VideoPlayback>();
  VideoPlayerController? _player;
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
    final VideoPlayerController player;
    try {
      player = await _playback
          .open(() => _createPlayer(widget.video))
          .timeout(AppConstants.videoLoadTimeout);
    } on Object catch (error) {
      appLogger.w('Video load failed', error: error.runtimeType);
      if (mounted) setState(() => _failed = true);
      return;
    }
    if (!mounted) {
      unawaited(_playback.release(player));
      return;
    }
    setState(() => _player = player);
    await player.play();
  }

  @override
  void dispose() {
    unawaited(SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge));
    final player = _player;
    if (player != null) unawaited(_playback.release(player));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final player = _player;
    return Scaffold(
      backgroundColor: AppColors.cameraBackground,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: player == null
                  ? _VideoPlaceholder(failed: _failed)
                  : AspectRatio(
                      aspectRatio: player.value.aspectRatio,
                      child: _FullscreenControls(player),
                    ),
            ),
            Positioned(
              top: Dimens.paddingSmall,
              right: Dimens.paddingSmall,
              child: const MediaCloseButton(),
            ),
          ],
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
                  child: const TapLayer(),
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    VideoProgressIndicator(
                      player,
                      allowScrubbing: true,
                      colors: const VideoProgressColors(
                        playedColor: AppColors.onPrimary,
                      ),
                    ),
                    Row(
                      children: [
                        _ControlButton(
                          icon: playing
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                          tooltip: playing
                              ? l10n.videoPause
                              : l10n.videoPlayButton,
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
                      ],
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
