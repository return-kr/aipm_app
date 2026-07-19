import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/theme/app_colors.dart';
import 'package:aipm_app/app/core/theme/app_shadows.dart';
import 'package:aipm_app/app/data/models/service_model.dart';
import 'package:flutter/material.dart';

/// ===============================================================
/// SERVICE CARD
/// ---------------------------------------------------------------
/// Reusable card for displaying a service.
/// ===============================================================

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.service});

  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radius16),
        boxShadow: AppShadows.card,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              service.image,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: AppColors.primary.withOpacity(0.08),
                child: Icon(service.icon, size: 60, color: AppColors.primary),
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.spacing20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  const SizedBox(height: AppDimensions.spacing12),

                  Text(
                    service.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.6,
                    ),
                  ),

                  const Spacer(),

                  ...service.features
                      .take(3)
                      .map(
                        (feature) => Padding(
                          padding: const EdgeInsets.only(
                            bottom: AppDimensions.spacing8,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.check_circle,
                                size: 18,
                                color: AppColors.primary,
                              ),
                              const SizedBox(width: AppDimensions.spacing8),
                              Expanded(
                                child: Text(
                                  feature,
                                  style: theme.textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
