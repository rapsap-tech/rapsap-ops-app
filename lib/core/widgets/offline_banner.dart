import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/bloc/connectivity_cubit.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';

class OfflineBanner extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final offline = context.select<ConnectivityCubit, bool>(
      (c) => c.state == ConnectivityStatus.offline,
    );
    if (!offline) return const SizedBox.shrink();
    return Semantics(
      liveRegion: true,
      child: Container(
        width: double.infinity,
        color: AppColors.errorSurface,
        padding: Dimens.bannerPadding,
        child: Text(
          context.l10n.offlineBanner,
          style: AppTextStyles.base.s13.w600.errorColor(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
