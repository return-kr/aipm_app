import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/constants/app_durations.dart';
import 'package:aipm_app/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// ===============================================================
/// PRIMARY BUTTON
/// ---------------------------------------------------------------
/// Reusable primary button used throughout the application.
/// ===============================================================

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.width,
    this.height = 52,
    this.isLoading = false,
    this.enabled = true,
  });

  final bool enabled;
  final double height;
  final IconData? icon;
  final bool isLoading;
  final VoidCallback? onPressed;
  final String text;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final bool canPress = enabled && !isLoading && onPressed != null;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: canPress ? onPressed : null,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.primary.withOpacity(0.5),
          disabledForegroundColor: Colors.white70,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacing24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radius12),
          ),
          animationDuration: AppDurations.medium,
        ),
        child: AnimatedSwitcher(
          duration: AppDurations.medium,
          child: isLoading
              ? const SizedBox(
                  key: ValueKey('loading'),
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.white,
                  ),
                )
              : Row(
                  key: const ValueKey('content'),
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) ...[
                      Icon(icon, size: 20),
                      const SizedBox(width: AppDimensions.spacing8),
                    ],
                    Text(
                      text,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
