import 'package:aipm_app/app/core/constants/app_assets.dart';
import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/constants/app_strings.dart';
import 'package:aipm_app/app/core/responsive/responsive_builder.dart';
import 'package:aipm_app/app/core/theme/app_colors.dart';
import 'package:aipm_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/primary_button.dart';
import '../common/secondary_button.dart';
import '../common/section_container.dart';

/// ===============================================================
/// HERO SECTION
/// ---------------------------------------------------------------
/// Landing section of the Home page.
/// ===============================================================

class HeroSection extends GetView<HomeController> {
  const HeroSection({super.key});

  Widget _buildDesktop() {
    return SizedBox(
      height: 600,
      child: Row(
        children: [
          Expanded(child: _buildContent()),
          const SizedBox(width: AppDimensions.spacing48),
          Expanded(child: Image.asset(AppAssets.hero, fit: BoxFit.contain)),
        ],
      ),
    );
  }

  Widget _buildMobile() {
    return Column(
      children: [
        Image.asset(AppAssets.hero, height: 280, fit: BoxFit.contain),
        const SizedBox(height: AppDimensions.spacing32),
        _buildContent(),
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'AppStrings.heroTitle',
          style: const TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),

        const SizedBox(height: AppDimensions.spacing20),

        Text(
          AppStrings.heroDescription,
          style: const TextStyle(
            fontSize: 18,
            height: 1.7,
            color: AppColors.textSecondary,
          ),
        ),

        const SizedBox(height: AppDimensions.spacing32),

        Wrap(
          spacing: AppDimensions.spacing16,
          runSpacing: AppDimensions.spacing16,
          children: [
            PrimaryButton(
              text: AppStrings.getQuote,
              onPressed: controller.scrollToQuoteSection,
            ),
            SecondaryButton(
              text: AppStrings.contactUs,
              onPressed: controller.scrollToContactSection,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      sectionKey: controller.heroKey,
      backgroundColor: AppColors.background,
      child: ResponsiveBuilder(
        mobile: _buildMobile(),
        tablet: _buildDesktop(),
        desktop: _buildDesktop(),
      ),
    );
  }
}
