import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../common/section_container.dart';
import '../common/section_title.dart';
import 'faq_tile.dart';

/// ===============================================================
/// FAQ SECTION
/// ---------------------------------------------------------------
/// Frequently Asked Questions section.
/// ===============================================================

class FaqSection extends StatelessWidget {
  const FaqSection({super.key, this.sectionKey});

  final GlobalKey? sectionKey;

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      sectionKey: sectionKey,
      backgroundColor: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'AppStrings.faq',
            subtitle: 'AppStrings.faqDescription',
          ),

          const SizedBox(height: AppDimensions.sectionSpacing),

          const FaqTile(
            question: 'AppStrings.faqQuestion1',
            answer: 'AppStrings.faqAnswer1',
            initiallyExpanded: true,
          ),

          const FaqTile(
            question: 'AppStrings.faqQuestion2',
            answer: 'AppStrings.faqAnswer2',
          ),

          const FaqTile(
            question: 'AppStrings.faqQuestion3',
            answer: 'AppStrings.faqAnswer3',
          ),

          const FaqTile(
            question: 'AppStrings.faqQuestion4',
            answer: 'AppStrings.faqAnswer4',
          ),

          const FaqTile(
            question: 'AppStrings.faqQuestion5',
            answer: 'AppStrings.faqAnswer5',
          ),
        ],
      ),
    );
  }
}
