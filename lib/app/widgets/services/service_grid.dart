import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/data/models/service_model.dart';
import 'package:flutter/material.dart';
import 'service_card.dart';

/// ===============================================================
/// SERVICE GRID
/// ---------------------------------------------------------------
/// Responsive grid for displaying service cards.
/// ===============================================================

class ServiceGrid extends StatelessWidget {
  const ServiceGrid({super.key, required this.services});

  final List<ServiceModel> services;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 3;

        if (constraints.maxWidth < 700) {
          crossAxisCount = 1;
        } else if (constraints.maxWidth < 1100) {
          crossAxisCount = 2;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: services.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: AppDimensions.spacing24,
            mainAxisSpacing: AppDimensions.spacing24,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            return ServiceCard(service: services[index]);
          },
        );
      },
    );
  }
}
