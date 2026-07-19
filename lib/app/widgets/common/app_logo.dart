import 'package:aipm_app/app/core/constants/app_assets.dart';
import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

/// ===============================================================
/// APP LOGO
/// ---------------------------------------------------------------
/// Reusable application logo widget.
/// Supports image logo with optional app name.
/// ===============================================================

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.height = 56,
    this.width,
    this.showTitle = true,
    this.titleStyle,
    this.fit = BoxFit.contain,
  });

  final BoxFit fit;
  final double height;
  final bool showTitle;
  final TextStyle? titleStyle;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AppAssets.logo,
          height: height,
          width: width,
          fit: fit,
          errorBuilder: (_, _, _) => SizedBox(
            height: height,
            width: height,
            child: const Icon(Icons.local_shipping),
          ),
        ),
        if (showTitle) ...[
          const SizedBox(width: AppDimensions.spacing12),
          Text(
            AppStrings.appName,
            style:
                titleStyle ??
                theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ],
    );
  }
}
