import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/filter_chip_button.dart';
import 'package:rapsap_ops_app/features/team/domain/entities/team_member.dart';

/// Multi-select job role chips.
class RolePicker extends StatelessWidget {
  const new({
    required this.roles,
    required this.selected,
    required this.onToggle,
    super.key,
  });

  final List<JobRole> roles;
  final Set<String> selected;
  final ValueChanged<String> onToggle;

  @override
  Widget build(BuildContext context) => Wrap(
    spacing: Dimens.paddingSmall,
    runSpacing: Dimens.paddingSmall,
    children: [
      for (final role in roles)
        FilterChipButton(
          label: role.name,
          selected: selected.contains(role.id),
          onTap: () => onToggle(role.id),
        ),
    ],
  );
}
