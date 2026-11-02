import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/offline_banner.dart';

/// Page shell: safe area, offline banner on top and an optional sticky
/// [footer] (e.g. the main action button) above the keyboard.
class AppScaffold extends StatelessWidget {
  const new({required this.body, this.header, this.footer, super.key});

  final Widget body;
  final Widget? header;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const OfflineBanner(),
            ?header,
            Expanded(child: body),
            if (footer != null)
              Padding(padding: Dimens.footerPadding, child: footer),
          ],
        ),
      ),
    );
  }
}
