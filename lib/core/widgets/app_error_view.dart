import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';

/// Centered message with an optional retry action (error, offline, empty).
class AppMessageView extends StatelessWidget {
  const new({required this.message, this.onRetry, super.key});

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: Dimens.pagePadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: AppTextStyles.base.s15.secondaryTextColor(),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              16.hSpace,
              AppButton(
                label: context.l10n.actionRetry,
                onPressed: onRetry,
                variant: AppButtonVariant.outline,
                expand: false,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
