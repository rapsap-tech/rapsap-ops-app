import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';

/// Round initials avatar ("SP" for Santosh Pawar).
class AppAvatar extends StatelessWidget {
  const new({required this.name, this.size, super.key});

  final String name;
  final double? size;

  static String initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty);
    return parts.take(2).map((p) => p.characters.first.toUpperCase()).join();
  }

  @override
  Widget build(BuildContext context) {
    final side = size ?? Dimens.avatarSize;
    return Container(
      width: side,
      height: side,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.iconTile,
        shape: BoxShape.circle,
      ),
      child: Text(
        initials(name),
        style: AppTextStyles.base.s15.w700.primaryDarkColor(),
        semanticsLabel: name,
      ),
    );
  }
}
