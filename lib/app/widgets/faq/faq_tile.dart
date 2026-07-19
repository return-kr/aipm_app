import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// ===============================================================
/// FAQ TILE
/// ---------------------------------------------------------------
/// Expandable FAQ item.
/// ===============================================================

class FaqTile extends StatelessWidget {
  const FaqTile({
    super.key,
    required this.question,
    required this.answer,
    this.initiallyExpanded = false,
  });

  final String question;
  final String answer;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacing16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radius12),
        side: BorderSide(color: AppColors.border),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          tilePadding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacing20,
            vertical: AppDimensions.spacing4,
          ),
          childrenPadding: const EdgeInsets.fromLTRB(
            AppDimensions.spacing20,
            0,
            AppDimensions.spacing20,
            AppDimensions.spacing20,
          ),
          iconColor: AppColors.primary,
          collapsedIconColor: AppColors.textSecondary,
          title: Text(
            question,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          children: [
            Text(
              answer,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                height: 1.7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
