import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/extensions/navigation_ext.dart';
import 'package:rapsap_ops_app/core/extensions/num_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_loader.dart';
import 'package:rapsap_ops_app/core/widgets/app_scaffold.dart';
import 'package:rapsap_ops_app/core/widgets/page_header.dart';
import 'package:rapsap_ops_app/core/widgets/result_view.dart';
import 'package:rapsap_ops_app/features/dsr/presentation/bloc/dsr_upload_cubit.dart';
import 'package:rapsap_ops_app/features/dsr/presentation/widgets/dsr_check_view.dart';
import 'package:rapsap_ops_app/features/dsr/presentation/widgets/dsr_rejected_view.dart';
import 'package:rapsap_ops_app/features/dsr/presentation/widgets/dsr_saved_view.dart';

/// Upload today's DSR: pick → C21 / C22 → save → C23 → X13.
class DsrUploadPage extends StatefulWidget {
  const new({super.key});

  @override
  State<DsrUploadPage> createState() => _DsrUploadPageState();
}

class _DsrUploadPageState extends State<DsrUploadPage> {
  final GlobalKey _snapshot = GlobalKey();
  late final DsrUploadCubit _cubit = getIt<DsrUploadCubit>();

  static const double _pixelRatio = 2;

  @override
  void initState() {
    super.initState();
    unawaited(_pick());
  }

  Future<void> _pick() async {
    final picked = await _cubit.pick();
    if (!picked && mounted) context.back(fallback: RouteNames.sales);
  }

  Future<Uint8List> _capture() async {
    final boundary =
        _snapshot.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: _pixelRatio);
    final png = await image.toByteData(format: ui.ImageByteFormat.png);
    image.dispose();
    return png!.buffer.asUint8List();
  }

  @override
  void dispose() {
    unawaited(_cubit.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocProvider.value(
      value: _cubit,
      child: BlocBuilder<DsrUploadCubit, DsrUploadState>(
        builder: (context, state) {
          final (title, Widget body) = switch (state.stage) {
            DsrStage.picking || DsrStage.checking => (
              l10n.dsrReading,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(child: AppLoader()),
                  12.hSpace,
                  Text(
                    l10n.dsrReading,
                    style: AppTextStyles.base.s14.secondaryTextColor(),
                  ),
                ],
              ),
            ),
            DsrStage.checked || DsrStage.saving => (
              l10n.dsrCheckTitle,
              DsrCheckView(onChange: _pick),
            ),
            DsrStage.rejected => (
              l10n.dsrRejectedTitle,
              DsrRejectedView(onRetry: _pick),
            ),
            DsrStage.saved || DsrStage.posting => (
              l10n.salesTitle,
              DsrSavedView(
                snapshotKey: _snapshot,
                onPost: () => _cubit.post(_capture),
              ),
            ),
            DsrStage.posted => (l10n.salesTitle, _Posted(state: state)),
          };
          return AppScaffold(
            header: PageHeader(title: title),
            body: body,
          );
        },
      ),
    );
  }
}

class _Posted extends StatelessWidget {
  const new({required this.state});

  final DsrUploadState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final saved = state.saved!;
    return ResultView(
      tone: ResultTone.confirmed,
      badge: l10n.resultConfirmed,
      title: l10n.snapshotSharedTitle,
      message: l10n.dsrPostedBody,
      details: [
        l10n.dsrReportsGroup,
        l10n.listSeparatorJoin(
          saved.date.storeHeaderDate(locale),
          saved.storeName,
        ),
        l10n.dsrSalesBills(saved.sales.rupees(locale), saved.bills),
      ],
      primary: ResultAction(
        label: l10n.dsrBackToSales,
        onPressed: () => context.back(fallback: RouteNames.sales),
      ),
    );
  }
}
