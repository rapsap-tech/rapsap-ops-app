import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';

/// Labelled text input with inline validation.
class AppTextField extends StatelessWidget {
  const new({
    required this.label,
    required this.onChanged,
    this.hint,
    this.validator,
    this.maxLength,
    this.maxLines = 1,
    this.enabled = true,
    this.keyboardType,
    this.inputFormatters,
    this.initialValue,
    super.key,
  });

  final String label;
  final ValueChanged<String> onChanged;
  final String? hint;
  final FormFieldValidator<String>? validator;
  final int? maxLength;
  final int maxLines;
  final bool enabled;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.base.s14.w600),
        8.hSpace,
        TextFormField(
          initialValue: initialValue,
          enabled: enabled,
          style: AppTextStyles.base.s15,
          maxLines: maxLines,
          minLines: 1,
          maxLength: maxLength,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(hintText: hint, counterText: ''),
          validator: validator,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
