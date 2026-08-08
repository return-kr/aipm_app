import 'package:aipm_app/app/data/app_font_size.dart';
import 'package:aipm_app/app/modules/home/controllers/home_controller.dart';
import 'package:aipm_app/app/modules/home/views/about/why_choose_card.dart';
import 'package:aipm_app/app/theme/app_text_styles.dart';
import 'package:aipm_app/app/widgets/dynamic_text.dart';
import 'package:aipm_app/app/widgets/responsive_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class AboutSection extends StatelessWidget {
  AboutSection({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      builder: (context, isMobile, isTablet, isDesktop) {
        return Container(
          key: controller.aboutKey,
          width: double.infinity,
          color: Colors.white,
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
        const Expanded(flex: 3, child: WhyChooseUsCard()),
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
        const WhyChooseUsCard(),
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
                color: Colors.blue.shade800,
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
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 28),

        /// DESCRIPTION 1
        DynamicText(
          "ALL INDIA PACKERS & MOVERS is a professional relocation company providing reliable packing and moving services throughout India. We specialize in safe transportation of household goods, office equipment, furniture, electronics, and vehicles.",
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
          style: AppTextStyles.barlow500(
            fontSize: AppFontSize.fs18,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 22),

        /// DESCRIPTION 2
        DynamicText(
          "Our experienced team uses quality packing materials and modern handling techniques to ensure your belongings reach their destination safely and on time.",
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
          style: AppTextStyles.barlow500(
            fontSize: AppFontSize.fs18,
            color: Colors.grey.shade800,
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
                backgroundColor: const Color(0xff062D6D),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DynamicText(
                    "LEARN MORE ABOUT US",
                    style: AppTextStyles.barlow500(
                      fontSize: AppFontSize.fs16,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
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
      child: Image.network(
        "https://picsum.photos/500/700",
        width: double.infinity,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
