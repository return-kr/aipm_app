import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/theme/app_colors.dart';
import 'package:aipm_app/app/modules/home/controllers/home_controller.dart';
import 'package:aipm_app/app/widgets/service_areas/city_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/section_container.dart';
import '../common/section_title.dart';

/// ===============================================================
/// CITIES SECTION
/// ---------------------------------------------------------------
/// Displays all cities where services are available.
/// ===============================================================

class CitiesSection extends GetView<HomeController> {
  const CitiesSection({super.key, this.sectionKey});

  final GlobalKey? sectionKey;

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      sectionKey: sectionKey,
      backgroundColor: AppColors.background,
      child: Column(
        children: [
          const SectionTitle(
            title: 'AppStrings.serviceCities',
            subtitle: 'AppStrings.serviceCitiesDescription',
          ),

          const SizedBox(height: AppDimensions.sectionSpacing),

          Obx(
            () => LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = 4;

                if (constraints.maxWidth < 700) {
                  crossAxisCount = 2;
                } else if (constraints.maxWidth < 1100) {
                  crossAxisCount = 3;
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.cities.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: AppDimensions.spacing20,
                    mainAxisSpacing: AppDimensions.spacing20,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    return CityCard(city: controller.cities[index]);
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
