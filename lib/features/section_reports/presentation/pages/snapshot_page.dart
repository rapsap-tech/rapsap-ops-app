import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/app_error_view.dart';
import 'package:rapsap_ops_app/core/widgets/app_loader.dart';
import 'package:rapsap_ops_app/core/widgets/app_scaffold.dart';
import 'package:rapsap_ops_app/core/widgets/filter_chip_button.dart';
import 'package:rapsap_ops_app/core/widgets/message_banner.dart';
import 'package:rapsap_ops_app/core/widgets/page_header.dart';
import 'package:rapsap_ops_app/core/widgets/result_view.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/report_snapshot.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/bloc/snapshot_cubit.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/widgets/snapshot_card.dart';

/// C19 · Report snapshot → post to chat (→ "Report shared").
class SnapshotPage extends StatefulWidget {
  const new({required this.reportId, super.key});

  final String reportId;

  @override
  State<SnapshotPage> createState() => _SnapshotPageState();
}

class _SnapshotPageState extends State<SnapshotPage> {
  final GlobalKey _card = GlobalKey();

  static const double _pixelRatio = 2;

  Future<Uint8List> _capture() async {
    final boundary =
        _card.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: _pixelRatio);
    final png = await image.toByteData(format: ui.ImageByteFormat.png);
    image.dispose();
    return png!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = getIt<SnapshotCubit>();
        unawaited(cubit.load(widget.reportId));
        return cubit;
      },
      child: BlocBuilder<SnapshotCubit, SnapshotState>(
        builder: (context, state) {
          final snapshot = state.snapshot;
          if (state.posted && snapshot != null) {
            return _Posted(snapshot: snapshot);
          }
          return AppScaffold(
            header: PageHeader(title: context.l10n.sectionReportsTitle),
            body: switch (state.load) {
              LoadStatus.loading => const Center(child: AppLoader()),
              LoadStatus.failure => AppMessageView(
                message:
                    state.failure?.message(context.l10n) ??
                    context.l10n.errorUnknown,
                onRetry: context.read<SnapshotCubit>().reload,
              ),
              LoadStatus.success => _Body(cardKey: _card, onPost: _capture),
            },
          );
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const new({required this.cardKey, required this.onPost});

  final GlobalKey cardKey;
  final Future<Uint8List> Function() onPost;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<SnapshotCubit>().state;
    final cubit = context.read<SnapshotCubit>();
    final snapshot = state.snapshot!;
    final failure = state.failure;
    return ListView(
      padding: Dimens.pagePadding,
      children: [
        RepaintBoundary(
          key: cardKey,
          child: SnapshotCard(snapshot: snapshot),
        ),
        20.hSpace,
        Text(l10n.snapshotPostTo, style: AppTextStyles.base.s14.w600),
        8.hSpace,
        Wrap(
          spacing: Dimens.paddingSmall,
          runSpacing: Dimens.paddingSmall,
          children: [
            for (final t in snapshot.targets)
              FilterChipButton(
                label: t.name,
                selected: state.targets.contains(t.conversationId),
                onTap: () => cubit.toggle(t.conversationId),
              ),
          ],
        ),
        if (failure != null) ...[
          16.hSpace,
          MessageBanner(failure.message(l10n)),
        ],
        24.hSpace,
        AppButton(
          label: l10n.snapshotPost,
          isLoading: state.posting,
          onPressed: state.targets.isEmpty ? null : () => cubit.post(onPost),
        ),
      ],
    );
  }
}

class _Posted extends StatelessWidget {
  const new({required this.snapshot});

  final ReportSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppScaffold(
      header: PageHeader(title: context.l10n.sectionReportsTitle),
      body: ResultView(
        tone: ResultTone.confirmed,
        badge: l10n.resultConfirmed,
        title: l10n.snapshotSharedTitle,
        message: l10n.snapshotSharedBody,
        details: [
          snapshot.title,
          l10n.listSeparatorJoin(
            snapshot.storeName,
            '${snapshot.done} / ${snapshot.total}',
          ),
        ],
        primary: ResultAction(
          label: l10n.reportBackToReports,
          onPressed: context.pop,
        ),
      ),
    );
  }
}
