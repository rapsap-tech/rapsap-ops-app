import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';

class NotFoundView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: Dimens.pagePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.l10n.pageNotFoundTitle,
                style: AppTextStyles.base.s24.w700,
                textAlign: TextAlign.center,
              ),
              24.hSpace,
              ElevatedButton(
                onPressed: () => context.goNamed(RouteNames.splash),
                child: Text(context.l10n.pageNotFoundAction),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
