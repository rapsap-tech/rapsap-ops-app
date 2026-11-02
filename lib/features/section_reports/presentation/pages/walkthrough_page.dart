import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/widgets/app_loader.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/closing_form.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/bloc/closing_cubit.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/bloc/walkthrough_cubit.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/widgets/walkthrough_recorder.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/widgets/walkthrough_review.dart';

/// C15 · Store walkthrough (#46): record up to 45 s → X9 review → send.
class WalkthroughPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            final cubit = getIt<WalkthroughCubit>();
            unawaited(cubit.start());
            return cubit;
          },
        ),
        // Only for the #46 task id and due time.
        BlocProvider(create: (_) => getIt<ClosingCubit>()),
      ],
      child: BlocListener<WalkthroughCubit, WalkthroughState>(
        listenWhen: (p, n) =>
            p.status != n.status && n.status == WalkStatus.sent,
        listener: (context, _) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(context.l10n.walkthroughSent)));
          context.pop();
        },
        child: const _View(),
      ),
    );
  }
}

class _View extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final status = context.select<WalkthroughCubit, WalkStatus>(
      (c) => c.state.status,
    );
    final form = context.select<ClosingCubit, ClosingForm?>(
      (c) => c.state.form,
    );
    final load = context.select<ClosingCubit, LoadStatus>((c) => c.state.load);
    if (form == null) {
      return Scaffold(
        backgroundColor: AppColors.cameraBackground,
        body: Center(
          child: load == LoadStatus.failure
              ? Text(context.l10n.errorUnknown)
              : const AppLoader(color: AppColors.onPrimary),
        ),
      );
    }
    final reviewing =
        status == WalkStatus.review ||
        status == WalkStatus.sending ||
        status == WalkStatus.sent;
    return reviewing
        ? WalkthroughReview(form: form)
        : WalkthroughRecorder(form: form);
  }
}
