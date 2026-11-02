import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/router/route_paths.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/message_banner.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/review_detail.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/review_item.dart';
import 'package:rapsap_ops_app/features/review/presentation/bloc/review_detail_cubit.dart';

/// Verify / Edit / Send back, or Unlock / Do it myself / Leave missed.
class ReviewActions extends StatelessWidget {
  const new({required this.detail, super.key});

  final ReviewDetail detail;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<ReviewDetailCubit>().state;
    final cubit = context.read<ReviewDetailCubit>();
    final busy = state.running != null;
    final item = detail.item;
    final failure = state.failure;
    Widget button(
      String label,
      ReviewAction action,
      Future<void> Function() onTap, {
      AppButtonVariant variant = AppButtonVariant.primary,
    }) => AppButton(
      label: label,
      variant: variant,
      isLoading: state.running == action,
      onPressed: busy ? null : onTap,
    );
    final buttons = switch (item.kind) {
      ReviewKind.needsReview => [
        button(l10n.reviewVerify, ReviewAction.verify, cubit.verify),
        Row(
          children: [
            Expanded(
              child: AppButton(
                label: l10n.reviewEdit,
                variant: AppButtonVariant.outline,
                onPressed: busy
                    ? null
                    : () => _push(context, RouteNames.reviewEdit),
              ),
            ),
            12.wSpace,
            Expanded(child: _sendBack(context, busy)),
          ],
        ),
      ],
      ReviewKind.missed => [
        button(
          l10n.reviewUnlockFor(item.staffName),
          ReviewAction.unlock,
          cubit.unlock,
        ),
        button(
          l10n.reviewDoItMyself,
          ReviewAction.takeOver,
          cubit.takeOver,
          variant: AppButtonVariant.outline,
        ),
        AppButton(
          label: l10n.reviewLeaveMissed,
          variant: AppButtonVariant.secondary,
          onPressed: busy ? null : () => context.pop(),
        ),
      ],
      ReviewKind.notDone || ReviewKind.openNow => [
        button(l10n.reviewDoItMyself, ReviewAction.takeOver, cubit.takeOver),
        if (item.kind == ReviewKind.notDone) _sendBack(context, busy),
      ],
    };
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (failure != null) ...[
          MessageBanner(failure.message(l10n)),
          12.hSpace,
        ],
        for (var i = 0; i < buttons.length; i++) ...[
          if (i > 0) 12.hSpace,
          buttons[i],
        ],
      ],
    );
  }

  Widget _sendBack(BuildContext context, bool busy) => AppButton(
    label: context.l10n.reviewSendBack,
    variant: AppButtonVariant.danger,
    onPressed: busy ? null : () => _push(context, RouteNames.reviewSendBack),
  );

  /// Opens send back / edit; when it saved, leave this entry too.
  void _push(BuildContext context, String route) {
    unawaited(
      context
          .pushNamed<bool>(
            route,
            pathParameters: {RoutePaths.taskIdParam: detail.item.taskId},
          )
          .then((changed) {
            if ((changed ?? false) && context.mounted) context.pop();
          }),
    );
  }
}
