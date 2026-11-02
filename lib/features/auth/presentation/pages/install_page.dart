import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/services/install/install_service.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/app_scaffold.dart';
import 'package:rapsap_ops_app/core/widgets/brand_logo.dart';
import 'package:rapsap_ops_app/features/auth/presentation/bloc/install_cubit.dart';
import 'package:rapsap_ops_app/features/auth/presentation/widgets/install_steps.dart';

/// Phone browsers land here until the PWA is installed.
class InstallPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<InstallCubit>(),
      child: const AppScaffold(body: _Body(), footer: _InstallFooter()),
    );
  }
}

class _Body extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final mode = context.select<InstallCubit, InstallMode>((c) => c.state.mode);
    final installed = mode == InstallMode.installed;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        Dimens.paddingMedium,
        Dimens.paddingExtraLarge,
        Dimens.paddingMedium,
        Dimens.paddingMedium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BrandLogo(),
          16.hSpace,
          Text(
            installed ? l10n.installDoneTitle : l10n.installTitle,
            style: AppTextStyles.base.s24.w700.l1,
          ),
          6.hSpace,
          Text(
            installed ? l10n.installDoneBody : l10n.installBody,
            style: AppTextStyles.base.s14.lineHeight(20.3).secondaryTextColor(),
          ),
          24.hSpace,
          InstallSteps(mode: mode),
        ],
      ),
    );
  }
}

class _InstallFooter extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<InstallCubit>().state;
    if (state.mode != InstallMode.prompt) return const SizedBox.shrink();
    return AppButton(
      label: context.l10n.installNow,
      isLoading: state.prompting,
      onPressed: context.read<InstallCubit>().install,
    );
  }
}
