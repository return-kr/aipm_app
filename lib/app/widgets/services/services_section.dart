import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/constants/app_strings.dart';
import 'package:aipm_app/app/core/theme/app_colors.dart';
import 'package:aipm_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/section_container.dart';
import '../common/section_title.dart';
import 'service_card.dart';

/// ===============================================================
/// SERVICES SECTION
/// ---------------------------------------------------------------
/// Displays all available Packers & Movers services.
/// ===============================================================

class ServicesSection extends GetView<HomeController> {
  const ServicesSection({super.key, this.sectionKey});

  final GlobalKey? sectionKey;

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      sectionKey: sectionKey,
      backgroundColor: AppColors.background,
      child: Column(
        children: [
          const SectionTitle(
            title: AppStrings.ourServices,
            subtitle: 'AppStrings.servicesDescription',
          ),

          const SizedBox(height: AppDimensions.sectionSpacing),

          Obx(
            () => LayoutBuilder(
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
                  itemCount: controller.services.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: AppDimensions.spacing24,
                    mainAxisSpacing: AppDimensions.spacing24,
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (_, index) {
                    return ServiceCard(service: controller.services[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
