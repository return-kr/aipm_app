import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/theme/app_colors.dart';
import 'package:aipm_app/app/core/theme/app_shadows.dart';
import 'package:flutter/material.dart';

/// ===============================================================
/// TESTIMONIAL CARD
/// ---------------------------------------------------------------
/// Reusable customer testimonial card.
/// ===============================================================

class TestimonialCard extends StatelessWidget {
  const TestimonialCard({
    super.key,
    required this.name,
    required this.location,
    required this.review,
    this.rating = 5,
  });

  final String name;
  final String location;
  final String review;
  final int rating;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(AppDimensions.spacing24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radius16),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.format_quote_rounded,
            size: 40,
            color: AppColors.primary,
          ),

          const SizedBox(height: AppDimensions.spacing16),

          Expanded(
            child: Text(
              review,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),
          ),

          const SizedBox(height: AppDimensions.spacing20),

          Row(
            children: List.generate(
              rating,
              (index) => const Padding(
                padding: EdgeInsets.only(right: 2),
                child: Icon(Icons.star, color: Colors.amber, size: 18),
              ),
            ),
          ),

          const SizedBox(height: AppDimensions.spacing16),

          Text(
            name,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: AppDimensions.spacing4),

          Text(
            location,
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
