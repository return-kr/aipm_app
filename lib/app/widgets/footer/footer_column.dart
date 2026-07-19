import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// ===============================================================
/// FOOTER COLUMN
/// ---------------------------------------------------------------
/// Reusable footer column with a title and list of widgets.
/// ===============================================================

class FooterColumn extends StatelessWidget {
  const FooterColumn({super.key, required this.title, required this.children});

  final List<Widget> children;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: AppDimensions.spacing20),

        ...children.map(
          (child) => Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.spacing12),
            child: DefaultTextStyle(
              style: theme.textTheme.bodyMedium!.copyWith(
                color: AppColors.textLight,
                height: 1.6,
              ),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
