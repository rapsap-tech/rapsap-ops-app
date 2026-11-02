import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';

enum ResultTone { confirmed, actionNeeded }

class ResultAction {
  const new({
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
}

/// The "X" outcome screens: status badge, title, message, detail lines and
/// up to two actions.
class ResultView extends StatelessWidget {
  const new({
    required this.tone,
    required this.badge,
    required this.title,
    required this.message,
    required this.details,
    this.primary,
    this.secondary,
    super.key,
  });

  final ResultTone tone;
  final String badge;
  final String title;
  final String message;
  final List<String> details;
  final ResultAction? primary;
  final ResultAction? secondary;

  @override
  Widget build(BuildContext context) {
    final body = AppTextStyles.base;
    return ColoredBox(
      color: AppColors.resultBackground,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(Dimens.space20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Badge(tone: tone, label: badge),
                  20.hSpace,
                  Text(
                    title,
                    style: body.s28.w700.copyWith(color: AppColors.resultTitle),
                  ),
                  20.hSpace,
                  Text(
                    message,
                    style: body.s16.copyWith(color: AppColors.resultBody),
                  ),
                  if (details.isNotEmpty) ...[20.hSpace, _Details(details)],
                ],
              ),
            ),
          ),
          _Actions(primary: primary, secondary: secondary),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const new({required this.tone, required this.label});

  final ResultTone tone;
  final String label;

  @override
  Widget build(BuildContext context) {
    final (background, foreground) = switch (tone) {
      ResultTone.confirmed => (AppColors.successChip, AppColors.successText),
      ResultTone.actionNeeded => (
        AppColors.warningSurface,
        AppColors.warningText,
      ),
    };
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(Dimens.space14),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(Dimens.radius12),
      ),
      child: Text(
        label.toUpperCase(),
        style: AppTextStyles.base.s12.w700.copyWith(color: foreground),
      ),
    );
  }
}

class _Details extends StatelessWidget {
  const new(this.lines);

  final List<String> lines;

  @override
  Widget build(BuildContext context) {
    final style = AppTextStyles.base.s15.copyWith(color: AppColors.resultTitle);
    return AppCard(
      borderColor: AppColors.resultCardBorder,
      padding: EdgeInsets.all(Dimens.space18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < lines.length; i++) ...[
            if (i > 0) 18.hSpace,
            Text(lines[i], style: style),
          ],
        ],
      ),
    );
  }
}

class _Actions extends StatelessWidget {
  const new({this.primary, this.secondary});

  final ResultAction? primary;
  final ResultAction? secondary;

  @override
  Widget build(BuildContext context) {
    final primary = this.primary;
    final secondary = this.secondary;
    return Padding(
      padding: EdgeInsets.all(Dimens.space20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (primary != null)
            AppButton(
              label: primary.label,
              onPressed: primary.onPressed,
              isLoading: primary.isLoading,
              squared: true,
            ),
          if (primary != null && secondary != null) 12.hSpace,
          if (secondary != null)
            AppButton(
              label: secondary.label,
              onPressed: secondary.onPressed,
              isLoading: secondary.isLoading,
              variant: AppButtonVariant.secondary,
              squared: true,
            ),
        ],
      ),
    );
  }
}
