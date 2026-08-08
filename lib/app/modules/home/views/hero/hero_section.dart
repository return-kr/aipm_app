import 'package:aipm_app/app/data/app_font_size.dart';
import 'package:aipm_app/app/modules/home/controllers/home_controller.dart';
import 'package:aipm_app/app/modules/home/views/about/feature_item.dart';
import 'package:aipm_app/app/modules/home/views/hero/quote_form.dart';
import 'package:aipm_app/app/theme/app_text_styles.dart';
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
        return SizedBox(
          key: controller.heroKey,
          height: 760,
          width: double.infinity,
          child: Stack(
            children: [
              /// Background Image
              Positioned.fill(
                child: Image.network(
                  "https://picsum.photos/1920/1080",
                  fit: BoxFit.cover,
                ),
              ),

              /// Dark Overlay
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xff07224D).withValues(alpha: .92),
                        const Color(0xff07224D).withValues(alpha: .75),
                        Colors.black.withValues(alpha: .45),
                        Colors.transparent,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
              ),

              /// Content
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 22,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xffFDB913),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: DynamicText(
                                  "ALL INDIA PACKERS & MOVERS",
                                  style: AppTextStyles.barlow700(
                                    fontSize: AppFontSize.fs18,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 28),

                              DynamicText(
                                "Trusted Packers &\nMovers Across India",
                                style: AppTextStyles.oswald800(
                                  fontSize: AppFontSize.fs44,
                                  color: Colors.white,
                                ),
                              ),

                              const SizedBox(height: 24),

                              SizedBox(
                                width: 650,
                                child: DynamicText(
                                  "Professional household shifting, office relocation, vehicle transportation, packing, unpacking, loading, and unloading services with safe handling and timely delivery.",
                                  style: AppTextStyles.barlow300(
                                    fontSize: AppFontSize.fs24,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 40),

                              Wrap(
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

                              const SizedBox(height: 55),

                              Container(
                                width: 360,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xffFDB913),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                  color: const Color(
                                    0xff0A2A63,
                                  ).withValues(alpha: .55),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: const BoxDecoration(
                                        color: Color(0xffFDB913),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.call, size: 30),
                                    ),

                                    const SizedBox(width: 18),

                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        DynamicText(
                                          "Call Now:",
                                          style: AppTextStyles.barlow400(
                                            fontSize: AppFontSize.fs20,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        DynamicText(
                                          "+91 988 363 2477",
                                          style: AppTextStyles.barlow600(
                                            fontSize: AppFontSize.fs26,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 70),

                        /// RIGHT SIDE
                        Expanded(
                          flex: 4,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: 620,
                              width: 470,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: .25),
                                    blurRadius: 25,
                                    offset: const Offset(0, 15),
                                  ),
                                ],
                              ),

                              /// Replace this with QuoteForm()
                              child: QuoteForm(),
                            ),
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
      },
    );
  }
}
