import 'package:aipm_app/app/data/app_colors.dart';
import 'package:aipm_app/app/data/app_font_size.dart';
import 'package:aipm_app/app/data/app_images.dart';
import 'package:aipm_app/app/modules/home/controllers/home_controller.dart';
import 'package:aipm_app/app/modules/home/views/about/why_choose_card.dart';
import 'package:aipm_app/app/theme/app_text_styles.dart';
import 'package:aipm_app/app/widgets/call_us_button.dart';
import 'package:aipm_app/app/widgets/dynamic_text.dart';
import 'package:aipm_app/app/widgets/responsive_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';

class AboutSection extends StatelessWidget {
  AboutSection({super.key});

  final controller = Get.find<HomeController>();

  // ================================================================
  // DESKTOP LAYOUT
  // ================================================================

  Widget _desktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// LEFT CONTENT
        Expanded(flex: 4, child: _aboutContent(isDesktop: true)),

        const SizedBox(width: 55),

        /// CENTER IMAGE
        Expanded(flex: 3, child: _aboutImage(height: 620)),

        const SizedBox(width: 55),

        /// WHY CHOOSE US
        Expanded(flex: 3, child: WhyChooseUsCard()),
      ],
    );
  }

  // ================================================================
  // MOBILE / TABLET LAYOUT
  // ================================================================

  Widget _mobileTabletLayout({required bool isMobile}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// ============================================================
        /// ABOUT US
        /// ============================================================
        _aboutContent(isDesktop: false),

        SizedBox(height: isMobile ? 45 : 55),

        /// ============================================================
        /// IMAGE
        /// ============================================================
        _aboutImage(height: isMobile ? 450 : 550),

        SizedBox(height: isMobile ? 45 : 55),

        /// ============================================================
        /// WHY CHOOSE US
        /// ============================================================
        WhyChooseUsCard(),
      ],
    );
  }

  // ================================================================
  // ABOUT CONTENT
  // ================================================================

  Widget _aboutContent({required bool isDesktop}) {
    return Column(
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        /// ABOUT US LABEL
        Row(
          mainAxisAlignment: isDesktop
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            DynamicText(
              "ABOUT US",
              style: AppTextStyles.barlow700(
                fontSize: AppFontSize.fs16,
                color: AppColors.blue,
              ),
            ),

            const SizedBox(width: 12),

            Container(width: 45, height: 2, color: const Color(0xffFDB913)),
          ],
        ),

        const SizedBox(height: 18),

        /// TITLE
        DynamicText(
          "Your Trusted Moving Partner",
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
          style: AppTextStyles.oswald800(
            fontSize: AppFontSize.fs38,
            color: AppColors.deepNavy,
          ),
        ),

        const SizedBox(height: 28),

        /// DESCRIPTION 1
        DynamicText(
          "ALL INDIA PACKERS & MOVERS is a professional relocation company providing reliable packing and moving services throughout India. We specialize in safe transportation of household goods, office equipment, furniture, electronics, and vehicles.",
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
          style: AppTextStyles.barlow500(
            fontSize: AppFontSize.fs18,
            color: AppColors.deepNavy,
          ),
        ),

        const SizedBox(height: 22),

        /// DESCRIPTION 2
        DynamicText(
          "Our experienced team uses quality packing materials and modern handling techniques to ensure your belongings reach their destination safely and on time.",
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
          style: AppTextStyles.barlow500(
            fontSize: AppFontSize.fs18,
            color: AppColors.navyBlue,
          ),
        ),

        const SizedBox(height: 40),

        /// LEARN MORE BUTTON
        Align(
          alignment: isDesktop ? Alignment.centerLeft : Alignment.center,
          child: SizedBox(
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: AppColors.darkBlue,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              onPressed: () {
                final call = CallUsButton();
                call.handleCall(Get.context as BuildContext);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DynamicText(
                    "LEARN MORE ABOUT US",
                    style: AppTextStyles.barlow500(
                      fontSize: AppFontSize.fs16,
                      color: AppColors.white,
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Icon(
                    Icons.arrow_forward,
                    color: AppColors.white,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ================================================================
  // IMAGE
  // ================================================================

  Widget _aboutImage({required double height}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Image.asset(
        AppImages.whyImage,
        width: double.infinity,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      builder: (context, isMobile, isTablet, isDesktop) {
        return Container(
          key: controller.aboutKey,
          width: double.infinity,
          color: AppColors.white,
          padding: EdgeInsets.symmetric(
            vertical: isDesktop ? 90 : 60,
            horizontal: isMobile ? 20 : 35,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1320),
              child: isDesktop
                  ? _desktopLayout()
                  : _mobileTabletLayout(isMobile: isMobile),
            ),
          ),
        );
      },
    );
  }
}
