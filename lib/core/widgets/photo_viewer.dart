import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_network_image.dart';
import 'package:rapsap_ops_app/core/widgets/media_close_button.dart';

/// A photo full screen, pinch to zoom, with a close button.
class PhotoViewer extends StatelessWidget {
  const new network(String this.url, {required this.semanticLabel, super.key})
    : bytes = null;

  const new memory(
    Uint8List this.bytes, {
    required this.semanticLabel,
    super.key,
  }) : url = null;

  final String? url;
  final Uint8List? bytes;
  final String semanticLabel;

  Future<void> open(BuildContext context) => Navigator.of(
    context,
    rootNavigator: true,
  ).push<void>(MaterialPageRoute(fullscreenDialog: true, builder: (_) => this));

  @override
  Widget build(BuildContext context) {
    final photo = switch ((url, bytes)) {
      (final String url, _) => AppNetworkImage(
        url,
        semanticLabel: semanticLabel,
        fit: BoxFit.contain,
        background: AppColors.cameraBackground,
      ),
      (_, final Uint8List bytes) => Image.memory(
        bytes,
        fit: BoxFit.contain,
        semanticLabel: semanticLabel,
      ),
      _ => const SizedBox.shrink(),
    };
    return Scaffold(
      backgroundColor: AppColors.cameraBackground,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: InteractiveViewer(child: Center(child: photo)),
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
