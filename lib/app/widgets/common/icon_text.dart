import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// ===============================================================
/// ICON TEXT
/// ---------------------------------------------------------------
/// Reusable widget to display an icon with text.
/// ===============================================================

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.icon,
    required this.text,
    this.iconColor = AppColors.primary,
    this.textStyle,
    this.iconSize = 20,
    this.spacing = 12,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final CrossAxisAlignment crossAxisAlignment;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final double spacing;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Icon(icon, size: iconSize, color: iconColor),
        SizedBox(width: spacing),
        Expanded(
          child: Text(
            text,
            style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
