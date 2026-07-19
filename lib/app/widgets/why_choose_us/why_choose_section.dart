import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/constants/app_strings.dart';
import 'package:aipm_app/app/core/theme/app_colors.dart';
import 'package:aipm_app/app/widgets/why_choose_us/why_choose_casrd.dart';
import 'package:flutter/material.dart';
import '../common/section_container.dart';
import '../common/section_title.dart';

/// ===============================================================
/// WHY CHOOSE SECTION
/// ---------------------------------------------------------------
/// Displays the reasons to choose our Packers & Movers service.
/// ===============================================================

class WhyChooseSection extends StatelessWidget {
  const WhyChooseSection({super.key, this.sectionKey});

  final GlobalKey? sectionKey;

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      sectionKey: sectionKey,
      backgroundColor: AppColors.background,
      child: Column(
        children: [
          const SectionTitle(
            title: AppStrings.whyChooseUs,
            subtitle: 'AppStrings.whyChooseDescription',
          ),

          const SizedBox(height: AppDimensions.sectionSpacing),

          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 4;

              if (constraints.maxWidth < 700) {
                crossAxisCount = 1;
              } else if (constraints.maxWidth < 1100) {
                crossAxisCount = 2;
              }

              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: AppDimensions.spacing24,
                mainAxisSpacing: AppDimensions.spacing24,
                childAspectRatio: 1.15,
                children: [
                  WhyChooseCard(
                    icon: Icons.verified,
                    title: 'AppStrings.trustedService',
                    description: 'AppStrings.trustedServiceDescription',
                  ),
                  WhyChooseCard(
                    icon: Icons.local_shipping,
                    title: 'AppStrings.safeTransportation',
                    description: 'AppStrings.safeTransportationDescription',
                  ),
                  WhyChooseCard(
                    icon: Icons.support_agent,
                    title: 'AppStrings.support247',
                    description: 'AppStrings.support247Description',
                  ),
                  WhyChooseCard(
                    icon: Icons.attach_money,
                    title: 'AppStrings.affordablePricing',
                    description: 'AppStrings.affordablePricingDescription',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
