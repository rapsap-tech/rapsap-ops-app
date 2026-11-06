import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/navigation_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/widgets/app_scaffold.dart';
import 'package:rapsap_ops_app/core/widgets/brand_header.dart';
import 'package:rapsap_ops_app/core/widgets/result_view.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/review_detail.dart';
import 'package:rapsap_ops_app/features/review/presentation/bloc/review_detail_cubit.dart';

/// X5 · Review complete (verify / unlock).
class ReviewResultView extends StatelessWidget {
  const new({required this.detail, required this.action, super.key});

  final ReviewDetail detail;
  final ReviewAction action;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final item = detail.item;
    final manager = context.select<SessionCubit, String>(
      (c) => c.state.user?.name ?? '',
    );
    final unlocked = action == ReviewAction.unlock;
    return AppScaffold(
      header: BrandHeader(storeName: context.l10n.sectionName(item.section)),
      body: ResultView(
        tone: ResultTone.confirmed,
        badge: l10n.resultConfirmed,
        title: unlocked ? l10n.reviewUnlockedTitle : l10n.reviewVerifiedTitle,
        message: unlocked
            ? l10n.reviewUnlockedBody(item.staffName)
            : l10n.reviewVerifiedBody(item.staffName),
        details: [
          l10n.taskTitle(item.number, item.title),
          if (!unlocked) l10n.reviewVerifiedBy(manager),
          l10n.reviewHistoryKept,
        ],
        primary: ResultAction(
          label: l10n.reviewBackToQueue,
          onPressed: () => context.back(fallback: RouteNames.checklist),
        ),
      ),
    );
  }
}
