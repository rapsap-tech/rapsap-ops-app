import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/app_error_view.dart';
import 'package:rapsap_ops_app/core/widgets/app_loader.dart';
import 'package:rapsap_ops_app/core/widgets/app_scaffold.dart';
import 'package:rapsap_ops_app/core/widgets/filter_chip_button.dart';
import 'package:rapsap_ops_app/core/widgets/info_rows_card.dart';
import 'package:rapsap_ops_app/core/widgets/message_banner.dart';
import 'package:rapsap_ops_app/core/widgets/page_header.dart';
import 'package:rapsap_ops_app/core/widgets/status_chip.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/pages/camera_page.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/closing_form.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/bloc/closing_cubit.dart';

/// C16 · Closing report (#47).
class ClosingReportPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ClosingCubit>(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<ClosingCubit, ClosingState>(
            listenWhen: (p, n) =>
                p.status != n.status && n.status == ClosingStatus.cameraReady,
            listener: _openCamera,
          ),
          BlocListener<ClosingCubit, ClosingState>(
            listenWhen: (p, n) =>
                p.status != n.status && n.status == ClosingStatus.sent,
            listener: (context, _) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(context.l10n.closingSent)));
              context.pop();
            },
          ),
        ],
        child: const _View(),
      ),
    );
  }

  Future<void> _openCamera(BuildContext context, ClosingState state) async {
    final cubit = context.read<ClosingCubit>();
    final photo = await context.pushNamed<Uint8List>(
      RouteNames.closingCamera,
      extra: CameraPageArgs(
        title: context.l10n.closingShutter,
        session: state.session,
      ),
    );
    if (!cubit.isClosed) cubit.photoTaken(photo ?? state.photo);
  }
}

class _View extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<ClosingCubit>().state;
    final form = state.form;
    return AppScaffold(
      header: PageHeader(title: l10n.reportClosing),
      body: switch (state.load) {
        LoadStatus.loading => const Center(child: AppLoader()),
        LoadStatus.failure => AppMessageView(
          message: state.failure?.message(l10n) ?? l10n.errorUnknown,
          onRetry: context.read<ClosingCubit>().load,
        ),
        LoadStatus.success => _Form(form: form!),
      },
      footer: form == null
          ? null
          : AppButton(
              label: state.photo == null
                  ? l10n.taskTakePhotoFirst
                  : l10n.taskSubmit,
              isLoading: state.status == ClosingStatus.sending,
              onPressed: state.canSubmit
                  ? context.read<ClosingCubit>().submit
                  : null,
            ),
    );
  }
}

class _Form extends StatelessWidget {
  const new({required this.form});

  final ClosingForm form;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final state = context.watch<ClosingCubit>().state;
    final cubit = context.read<ClosingCubit>();
    final now = DateTime.now();
    final early = now.isBefore(form.earlyBefore);
    final photo = state.photo;
    final failure = state.failure;
    return ListView(
      padding: Dimens.pagePadding,
      children: [
        Text(
          l10n.closingSubtitle(form.dueAt.storeClock(locale)),
          style: AppTextStyles.base.s13.secondaryTextColor(),
        ),
        16.hSpace,
        InfoRowsCard(rows: [(l10n.closingTime, now.storeClock(locale))]),
        6.hSpace,
        Text(
          l10n.closingTimeHelp,
          style: AppTextStyles.base.s12.secondaryTextColor(),
        ),
        if (early) ...[
          8.hSpace,
          StatusChip(
            label: l10n.closingEarly(form.earlyBefore.storeClock(locale)),
            tone: StatusTone.error,
          ),
        ],
        20.hSpace,
        Text(l10n.closingWho, style: AppTextStyles.base.s14.w600),
        8.hSpace,
        Wrap(
          spacing: Dimens.paddingSmall,
          runSpacing: Dimens.paddingSmall,
          children: [
            for (final s in form.staff)
              FilterChipButton(
                label: s.name,
                selected: state.closedBy.contains(s.id),
                onTap: () => cubit.toggle(s.id),
              ),
          ],
        ),
        20.hSpace,
        Text(l10n.closingShutter, style: AppTextStyles.base.s14.w600),
        8.hSpace,
        if (photo == null)
          AppButton(
            label: l10n.taskTapToOpenCamera,
            variant: AppButtonVariant.outline,
            isLoading: state.status == ClosingStatus.preparingCamera,
            onPressed: cubit.openCamera,
          )
        else
          GestureDetector(
            onTap: cubit.openCamera,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimens.radius12),
              child: Image.memory(
                photo,
                height: Dimens.photoPreviewHeight,
                width: double.infinity,
                fit: BoxFit.cover,
                semanticLabel: l10n.closingShutter,
              ),
            ),
          ),
        12.hSpace,
        Text(
          l10n.closingFlagNote(form.earlyBefore.storeClock(locale)),
          style: AppTextStyles.base.s12.secondaryTextColor(),
        ),
        if (failure != null) ...[
          16.hSpace,
          MessageBanner(failure.message(l10n)),
        ],
      ],
    );
  }
}
