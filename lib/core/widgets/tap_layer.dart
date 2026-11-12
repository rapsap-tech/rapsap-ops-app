import 'package:flutter/widgets.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';

/// Painted, so on web it sits above an <img> or <video> element and gets
/// the taps.
class TapLayer extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(color: AppColors.videoTapLayer);
  }
}
