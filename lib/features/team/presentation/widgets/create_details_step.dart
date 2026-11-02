import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/utils/validators.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/app_phone_field.dart';
import 'package:rapsap_ops_app/core/widgets/app_text_field.dart';
import 'package:rapsap_ops_app/core/widgets/info_rows_card.dart';
import 'package:rapsap_ops_app/core/widgets/message_banner.dart';
import 'package:rapsap_ops_app/features/team/presentation/bloc/create_login_cubit.dart';

/// C8 · Mobile number, full name, store.
class CreateDetailsStep extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<CreateLoginCubit>().state;
    final cubit = context.read<CreateLoginCubit>();
    final store = context.select<SessionCubit, String>(
      (c) => c.state.user?.storeName ?? '',
    );
    final valid =
        Validators.isValidPhone(state.phone) &&
        Validators.personName(state.name, l10n) == null;
    return ListView(
      padding: Dimens.pagePadding,
      children: [
        Text(l10n.loginPhoneLabel, style: AppTextStyles.base.s14.w600),
        8.hSpace,
        AppPhoneField(onChanged: cubit.phoneChanged),
        if (state.phoneTaken) ...[8.hSpace, MessageBanner(l10n.teamPhoneTaken)],
        20.hSpace,
        AppTextField(
          label: l10n.teamFullName,
          hint: l10n.teamFullNameHint,
          initialValue: state.name,
          validator: (v) => Validators.personName(v, l10n),
          onChanged: cubit.nameChanged,
        ),
        20.hSpace,
        InfoRowsCard(rows: [(l10n.profileStore, store)]),
        24.hSpace,
        AppButton(
          label: l10n.actionNext,
          onPressed: valid ? () => cubit.goTo(CreateStep.roles) : null,
        ),
      ],
    );
  }
}
