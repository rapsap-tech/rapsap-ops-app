import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/utils/validators.dart';

/// "+91" box plus a 10-digit mobile number input with inline validation.
class AppPhoneField extends StatelessWidget {
  const new({
    required this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    super.key,
  });

  final ValueChanged<String> onChanged;
  final VoidCallback? onSubmitted;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final style = AppTextStyles.base.s15;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: Dimens.countryCodeWidth,
          height: Dimens.inputHeight,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(Dimens.radius12),
            border: Border.all(
              color: AppColors.border,
              width: Dimens.borderWidth,
            ),
          ),
          child: Text(AppConstants.countryCode, style: style.w600),
        ),
        8.wSpace,
        Expanded(
          child: TextFormField(
            enabled: enabled,
            style: style,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
            autofillHints: const [AutofillHints.telephoneNumberNational],
            autovalidateMode: AutovalidateMode.onUnfocus,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(AppConstants.phoneLength),
            ],
            decoration: InputDecoration(hintText: context.l10n.loginPhoneHint),
            validator: (value) => Validators.phone(value, context.l10n),
            onChanged: onChanged,
            onFieldSubmitted: (_) => onSubmitted?.call(),
          ),
        ),
      ],
    );
  }
}
