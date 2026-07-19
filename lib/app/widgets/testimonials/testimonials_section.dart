import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../common/section_container.dart';
import '../common/section_title.dart';
import 'testimonial_card.dart';

/// ===============================================================
/// TESTIMONIALS SECTION
/// ---------------------------------------------------------------
/// Displays customer testimonials.
/// ===============================================================

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key, this.sectionKey});

  final GlobalKey? sectionKey;

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      sectionKey: sectionKey,
      backgroundColor: AppColors.background,
      child: Column(
        children: [
          const SectionTitle(
            title: 'AppStrings.testimonials',
            subtitle: 'AppStrings.testimonialsDescription',
          ),

          const SizedBox(height: AppDimensions.sectionSpacing),

          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 3;

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
                childAspectRatio: 1.1,
                children: const [
                  TestimonialCard(
                    name: 'Rahul Sharma',
                    location: 'Kolkata',
                    review:
                        'Excellent packing and moving service. Everything arrived safely and on time.',
                    rating: 5,
                  ),
                  TestimonialCard(
                    name: 'Priya Das',
                    location: 'Siliguri',
                    review:
                        'Professional staff, affordable pricing and hassle-free relocation experience.',
                    rating: 5,
                  ),
                  TestimonialCard(
                    name: 'Amit Roy',
                    location: 'Durgapur',
                    review:
                        'Highly recommended. The entire shifting process was smooth and stress-free.',
                    rating: 5,
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
