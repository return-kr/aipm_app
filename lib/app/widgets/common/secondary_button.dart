import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/constants/app_durations.dart';
import 'package:aipm_app/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// ===============================================================
/// SECONDARY BUTTON
/// ---------------------------------------------------------------
/// Reusable outlined button used throughout the application.
/// ===============================================================

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.width,
    this.height = 52,
    this.enabled = true,
  });

  final bool enabled;
  final double height;
  final IconData? icon;
  final VoidCallback? onPressed;
  final String text;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final bool canPress = enabled && onPressed != null;

    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: canPress ? onPressed : null,
        style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: AppColors.primary,
          side: BorderSide(
            color: canPress
                ? AppColors.primary
                : AppColors.primary.withOpacity(0.4),
            width: 1.5,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacing24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radius12),
          ),
          animationDuration: AppDurations.medium,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20),
              const SizedBox(width: AppDimensions.spacing8),
            ],
            Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
