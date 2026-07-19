import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/constants/app_strings.dart';
import 'package:aipm_app/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../common/section_container.dart';
import '../common/section_title.dart';

/// ===============================================================
/// ABOUT SECTION
/// ---------------------------------------------------------------
/// About Us section.
/// ===============================================================

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, this.sectionKey});

  final GlobalKey? sectionKey;

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimensions.radius20),
      child: Image.asset(
        'assets/images/about.png',
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          height: 320,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(.08),
            borderRadius: BorderRadius.circular(AppDimensions.radius20),
          ),
          child: const Center(
            child: Icon(
              Icons.local_shipping,
              size: 100,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Text(
      AppStrings.aboutDescription,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        height: 1.8,
        color: AppColors.textSecondary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      sectionKey: sectionKey,
      backgroundColor: Colors.white,
      child: Column(
        children: [
          const SectionTitle(
            title: AppStrings.aboutUs,
            subtitle: AppStrings.aboutDescription,
          ),

          const SizedBox(height: AppDimensions.sectionSpacing),

          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 900;

              if (isMobile) {
                return Column(
                  children: [
                    _buildImage(),
                    const SizedBox(height: AppDimensions.spacing32),
                    _buildContent(context),
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: _buildImage()),
                  const SizedBox(width: AppDimensions.spacing48),
                  Expanded(child: _buildContent(context)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
