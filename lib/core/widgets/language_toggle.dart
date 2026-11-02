import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/bloc/locale_cubit.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';

/// EN | अ switch. "अ" opens a menu for Marathi or Hindi.
class LanguageToggle extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final code = context.select<LocaleCubit, String>(
      (c) => c.state.languageCode,
    );
    final isEnglish = code == AppConstants.defaultLanguageCode;
    return Container(
      height: Dimens.toggleHeight,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border, width: Dimens.borderWidth),
        borderRadius: BorderRadius.circular(Dimens.radius6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Segment(
            label: context.l10n.languageEnglishShort,
            semantics: context.l10n.languageEnglish,
            selected: isEnglish,
            onTap: () => context.read<LocaleCubit>().setLanguage(
              AppConstants.defaultLanguageCode,
            ),
          ),
          _DevanagariMenu(selected: !isEnglish),
        ],
      ),
    );
  }
}

class _DevanagariMenu extends StatelessWidget {
  const new({required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PopupMenuButton<String>(
      tooltip: l10n.languagePick,
      onSelected: context.read<LocaleCubit>().setLanguage,
      itemBuilder: (_) => [
        PopupMenuItem(
          value: AppConstants.marathiCode,
          child: Text(l10n.languageMarathi),
        ),
        PopupMenuItem(
          value: AppConstants.hindiCode,
          child: Text(l10n.languageHindi),
        ),
      ],
      child: _Segment(
        label: l10n.languageDevanagariShort,
        semantics: l10n.languagePick,
        selected: selected,
      ),
    );
  }
}

class _Segment extends StatelessWidget {
  const new({
    required this.label,
    required this.semantics,
    required this.selected,
    this.onTap,
  });

  final String label;
  final String semantics;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final style = AppTextStyles.base.s14.w700;
    final segment = Container(
      width: Dimens.toggleItemWidth,
      alignment: Alignment.center,
      color: selected ? AppColors.primary : AppColors.surface,
      child: Text(label, style: selected ? style.whiteColor() : style),
    );
    return Semantics(
      button: true,
      selected: selected,
      label: semantics,
      excludeSemantics: true,
      child: onTap == null ? segment : InkWell(onTap: onTap, child: segment),
    );
  }
}
