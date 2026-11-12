import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';

/// A photo from the server, grey while it loads and marked when it can't.
class AppNetworkImage extends StatelessWidget {
  const new(
    this.url, {
    required this.semanticLabel,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.background = AppColors.photoPlaceholder,
    super.key,
  });

  final String url;
  final String semanticLabel;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: background,
      child: Image.network(
        url,
        // Blob storage has no CORS; the PWA shows an <img>.
        webHtmlElementStrategy: WebHtmlElementStrategy.fallback,
        width: width,
        height: height,
        fit: fit,
        semanticLabel: semanticLabel,
        errorBuilder: (_, _, _) => SizedBox(
          width: width,
          height: height,
          child: Icon(
            Icons.broken_image_outlined,
            size: Dimens.iconMedium,
            color: AppColors.hint,
          ),
        ),
      ),
    );
  }
}
