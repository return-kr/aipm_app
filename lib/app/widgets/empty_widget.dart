import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// ===============================================================
/// EMPTY WIDGET
/// ---------------------------------------------------------------
/// Reusable widget displayed when there is no data available.
/// ===============================================================

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    this.title = 'No Data Found',
    this.message = 'Nothing to display at the moment.',
    this.icon = Icons.inbox_outlined,
    this.action,
  });

  final Widget? action;
  final IconData icon;
  final String message;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacing32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 72,
              color: AppColors.textSecondary.withOpacity(0.5),
            ),

            const SizedBox(height: AppDimensions.spacing20),

            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: AppDimensions.spacing12),

            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),

            if (action != null) ...[
              const SizedBox(height: AppDimensions.spacing24),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
