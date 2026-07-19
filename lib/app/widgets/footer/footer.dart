import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/constants/app_icons.dart';
import 'package:aipm_app/app/core/constants/app_strings.dart';
import 'package:aipm_app/app/core/theme/app_colors.dart';
import 'package:aipm_app/app/core/utils/launcher.dart';
import 'package:aipm_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/app_logo.dart';
import '../common/icon_text.dart';
import '../common/social_button.dart';
import '../common/section_container.dart';
import 'footer_column.dart';

/// ===============================================================
/// FOOTER
/// ---------------------------------------------------------------
/// Website footer.
/// ===============================================================

class Footer extends GetView<HomeController> {
  const Footer({super.key, this.sectionKey});

  final GlobalKey? sectionKey;

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      sectionKey: sectionKey,
      backgroundColor: AppColors.primary,
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.sectionSpacing,
      ),
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 900;

              if (isMobile) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _companyInfo(),
                    const SizedBox(height: AppDimensions.spacing32),
                    _contactInfo(),
                    const SizedBox(height: AppDimensions.spacing32),
                    _socialSection(),
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: _companyInfo()),
                  const SizedBox(width: AppDimensions.spacing40),
                  Expanded(flex: 2, child: _contactInfo()),
                  const SizedBox(width: AppDimensions.spacing40),
                  Expanded(flex: 2, child: _socialSection()),
                ],
              );
            },
          ),

          const SizedBox(height: AppDimensions.sectionSpacing),

          const Divider(color: Colors.white24),

          const SizedBox(height: AppDimensions.spacing16),

          Text(
            AppStrings.copyright,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _companyInfo() {
    return FooterColumn(
      title: AppStrings.appName,
      children: [
        const AppLogo(showTitle: false, height: 60),
        const Text(AppStrings.aboutDescription),
      ],
    );
  }

  Widget _contactInfo() {
    return FooterColumn(
      title: AppStrings.contactUs,
      children: [
        GestureDetector(
          onTap: () => Launcher.call(AppStrings.phoneNumber),
          child: IconText(
            icon: AppIcons.phone,
            text: AppStrings.phoneNumber,
            iconColor: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: () => Launcher.email(email: AppStrings.emailAddress),
          child: IconText(
            icon: AppIcons.email,
            text: AppStrings.emailAddress,
            iconColor: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: () => Launcher.map(AppStrings.officeAddress),
          child: IconText(
            icon: AppIcons.location,
            text: AppStrings.officeAddress,
            iconColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _socialSection() {
    return FooterColumn(
      title: 'AppStrings.followUs',
      children: [
        Row(
          children: [
            SocialButton(
              icon: AppIcons.facebook,
              onTap: () => Launcher.website(AppStrings.facebookUrl),
            ),
            const SizedBox(width: AppDimensions.spacing12),
            SocialButton(
              icon: AppIcons.instagram,
              onTap: () => Launcher.website(AppStrings.instagramUrl),
            ),
            const SizedBox(width: AppDimensions.spacing12),
            SocialButton(
              icon: AppIcons.xTwitter,
              onTap: () => Launcher.website(AppStrings.twitterUrl),
            ),
            const SizedBox(width: AppDimensions.spacing12),
            SocialButton(
              icon: AppIcons.whatsapp,
              onTap: () => Launcher.whatsapp(AppStrings.phoneNumber),
            ),
          ],
        ),
      ],
    );
  }
}
