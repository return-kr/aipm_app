import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/constants/app_strings.dart';
import 'package:aipm_app/app/core/theme/app_colors.dart';
import 'package:aipm_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/primary_button.dart';
import '../common/secondary_button.dart';

/// ===============================================================
/// HERO CONTENT
/// ---------------------------------------------------------------
/// Left side content of the Hero section.
/// ===============================================================

class HeroContent extends GetView<HomeController> {
  const HeroContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'AppStrings.heroTitle',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),

        const SizedBox(height: AppDimensions.spacing20),

        Text(
          'AppStrings.heroSubtitle',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.textSecondary,
            height: 1.7,
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
}
