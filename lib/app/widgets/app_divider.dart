import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// ===============================================================
/// APP DIVIDER
/// ---------------------------------------------------------------
/// Reusable divider widget.
/// ===============================================================

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.height = AppDimensions.spacing32,
    this.thickness = 1,
    this.indent = 0,
    this.endIndent = 0,
    this.color = AppColors.border,
  });

  final Color color;
  final double endIndent;
  final double height;
  final double indent;
  final double thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: color,
    );
  }
}
