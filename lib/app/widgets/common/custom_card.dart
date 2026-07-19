import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/theme/app_colors.dart';
import 'package:aipm_app/app/core/theme/app_shadows.dart';
import 'package:flutter/material.dart';

/// ===============================================================
/// CUSTOM CARD
/// ---------------------------------------------------------------
/// Reusable card widget used throughout the Home module.
/// ===============================================================

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(24),
    this.margin = EdgeInsets.zero,
    this.backgroundColor = Colors.white,
    this.borderRadius = 12,
    this.elevation = true,
    this.border,
  });

  final Color backgroundColor;
  final BoxBorder? border;
  final double borderRadius;
  final Widget child;
  final bool elevation;
  final EdgeInsetsGeometry margin;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final card = Container(
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: border,
        boxShadow: elevation ? AppShadows.card : null,
      ),
      child: Padding(padding: padding, child: child),
    );

    if (onTap == null) return card;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        splashColor: AppColors.primary.withOpacity(0.08),
        highlightColor: Colors.transparent,
        child: card,
      ),
    );
  }
}
