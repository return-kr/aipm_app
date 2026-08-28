import 'package:aipm_app/app/data/app_colors.dart';
import 'package:aipm_app/app/data/app_font_size.dart';
import 'package:aipm_app/app/data/app_images.dart';
import 'package:aipm_app/app/modules/home/controllers/home_controller.dart';
import 'package:aipm_app/app/modules/home/views/about/feature_item.dart';
import 'package:aipm_app/app/modules/home/views/hero/quote_form.dart';
import 'package:aipm_app/app/theme/app_text_styles.dart';
import 'package:aipm_app/app/widgets/call_us_button.dart';
import 'package:aipm_app/app/widgets/dynamic_text.dart';
import 'package:aipm_app/app/widgets/responsive_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class HeroSection extends StatelessWidget {
  HeroSection({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      builder: (context, isMobile, isTablet, isDesktop) {
        /// ============================================================
        /// DESKTOP
        /// ============================================================

        if (isDesktop) {
          return SizedBox(
            key: controller.heroKey,
            height: 760,
            width: double.infinity,
            child: Stack(
              children: [
                /// Background Image
                Positioned.fill(
                  child: Image.asset(
                    AppImages.heroImage,
                    fit: BoxFit.cover,
                  ),
                ),

                /// Dark Overlay
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.navyBlue.withValues(alpha: .92),
                          AppColors.navyBlue.withValues(alpha: .75),
                          AppColors.deepNavy.withValues(alpha: .45),
                          Colors.transparent,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ),

                /// Desktop Content
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1320),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /// LEFT SIDE
                          Expanded(
                            flex: 6,
                            child: _heroLeftContent(context, isDesktop: true),
                          ),

                          const SizedBox(width: 70),

                          /// RIGHT SIDE - QUOTE FORM
                          Expanded(
                            flex: 4,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: _quoteForm(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        /// ============================================================
        /// MOBILE / TABLET
        /// ============================================================

        return Column(
          key: controller.heroKey,
          children: [
            /// ========================================================
            /// HERO BACKGROUND + LEFT CONTENT
            /// ========================================================
            SizedBox(
              width: double.infinity,
              height: isMobile ? 700 : 720,
              child: Stack(
                children: [
                  /// Background Image
                  Positioned.fill(
                    child: Image.asset(
                      AppImages.heroImage,
                      fit: BoxFit.cover,
                    ),
                  ),

                  /// Dark Overlay
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.navyBlue.withValues(alpha: .92),
                            AppColors.navyBlue.withValues(alpha: .80),
                            AppColors.deepNavy.withValues(alpha: .55),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),

                  /// CENTERED LEFT CONTENT
                  Center(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 20 : 40,
                        vertical: 40,
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: isMobile ? 600 : 750,
                        ),
                        child: _heroLeftContent(context, isDesktop: false),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// ========================================================
            /// QUOTE FORM OUTSIDE STACK
            /// ========================================================
            Container(
              width: double.infinity,
              color: AppColors.white,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 35,
                vertical: 40,
              ),
              child: Center(
                child: _quoteForm(width: isMobile ? double.infinity : 600),
              ),
            ),
          ],
        );
      },
    );
  }

  // ==================================================================
  // LEFT HERO CONTENT
  // ==================================================================

  Widget _heroLeftContent(BuildContext context, {required bool isDesktop}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        /// ============================================================
        /// BADGE
        /// ============================================================
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.orange,
            borderRadius: BorderRadius.circular(30),
          ),
          child: DynamicText(
            "ALL INDIA PACKERS & MOVERS",
            style: AppTextStyles.barlow700(fontSize: AppFontSize.fs18),
          ),
        ),

        const SizedBox(height: 28),

        /// ============================================================
        /// MAIN TITLE
        /// ============================================================
        DynamicText(
          "Trusted Packers &\nMovers Across India",
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
          style: AppTextStyles.oswald800(
            fontSize: AppFontSize.fs44,
            color: AppColors.white,
          ),
        ),

        const SizedBox(height: 24),

        /// ============================================================
        /// DESCRIPTION
        /// ============================================================
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 650),
          child: DynamicText(
            "Professional household shifting, office relocation, vehicle transportation, packing, unpacking, loading, and unloading services with safe handling and timely delivery.",
            textAlign: isDesktop ? TextAlign.left : TextAlign.center,
            style: AppTextStyles.barlow300(
              fontSize: AppFontSize.fs24,
              color: AppColors.white,
            ),
          ),
        ),

        const SizedBox(height: 40),

        /// ============================================================
        /// FEATURES
        /// ============================================================
        Align(
          alignment: isDesktop ? Alignment.centerLeft : Alignment.center,
          child: Wrap(
            alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
            spacing: 30,
            runSpacing: 22,
            children: const [
              FeatureItem("Household Shifting"),
              FeatureItem("Office Relocation"),
              FeatureItem("Vehicle Transportation"),
              FeatureItem("Packing & Unpacking"),
              FeatureItem("Door-to-Door Service"),
              FeatureItem("Affordable Pricing"),
            ],
          ),
        ),

        const SizedBox(height: 55),

        /// ============================================================
        /// CALL NOW
        /// ============================================================
        InkWell(
          onTap: () {
            final call = CallUsButton();
            call.handleCall(context);
          },
          child: Container(
            width: isDesktop ? 360 : double.infinity,
            constraints: const BoxConstraints(maxWidth: 360),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.orange, width: 2),
              borderRadius: BorderRadius.circular(16),
              color: AppColors.navyBlue.withValues(alpha: .35),
            ),
            child: Row(
              mainAxisAlignment: isDesktop
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: AppColors.orange,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.call, size: 30),
                ),

                const SizedBox(width: 18),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DynamicText(
                      "Call Now:",
                      style: AppTextStyles.barlow400(
                        fontSize: AppFontSize.fs20,
                        color: AppColors.white,
                      ),
                    ),

                    const SizedBox(height: 5),

                    DynamicText(
                      "+91 988 363 2477",
                      style: AppTextStyles.barlow600(
                        fontSize: AppFontSize.fs26,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ==================================================================
  // QUOTE FORM
  // ==================================================================

  Widget _quoteForm({double? width}) {
    return Container(
      height: 620,
      width: width ?? 470,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.deepNavy.withValues(alpha: .25),
            blurRadius: 25,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: QuoteForm(),
    );
  }
}
