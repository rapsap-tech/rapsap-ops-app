import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/capture_session.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/capture_stamp.dart';

/// Preview of the stamp that will be burnt into the photo, ticking each second.
class LiveStamp extends StatefulWidget {
  const new({required this.session, super.key});

  final CaptureSession session;

  @override
  State<LiveStamp> createState() => _LiveStampState();
}

class _LiveStampState extends State<LiveStamp> {
  final Stopwatch _elapsed = Stopwatch()..start();
  late final Stream<int> _ticks = Stream.periodic(
    const Duration(seconds: 1),
    (i) => i,
  );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _ticks,
      builder: (context, _) => Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimens.paddingSmall,
          vertical: Dimens.paddingExtraSmall,
        ),
        decoration: BoxDecoration(
          color: AppColors.stampBackground,
          borderRadius: BorderRadius.circular(Dimens.radius6),
        ),
        child: Text(
          captureStampLines(widget.session, _elapsed.elapsed).join('\n'),
          style: AppTextStyles.base.s11.whiteColor(),
        ),
      ),
    );
  }
}
