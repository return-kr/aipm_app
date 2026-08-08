import 'package:aipm_app/app/data/app_font_size.dart';
import 'package:aipm_app/app/data/service_model.dart';
import 'package:aipm_app/app/modules/home/controllers/home_controller.dart';
import 'package:aipm_app/app/modules/home/views/services/service_card.dart';
import 'package:aipm_app/app/theme/app_text_styles.dart';
import 'package:aipm_app/app/widgets/dynamic_text.dart';
import 'package:aipm_app/app/widgets/responsive_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class ServicesSection extends StatelessWidget {
  ServicesSection({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      builder: (context, isMobile, isTablet, isDesktop) {
        return Container(
          key: controller.servicesKey,
          width: double.infinity,
          color: const Color(0xffFAFBFD),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 35,
            vertical: isDesktop ? 80 : 60,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1320),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// ==================================================
                  /// SECTION LABEL
                  /// ==================================================
                  DynamicText(
                    "OUR SERVICES",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.barlow700(
                      fontSize: AppFontSize.fs16,
                      color: Colors.blue.shade800,
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// ==================================================
                  /// SECTION TITLE
                  /// ==================================================
                  DynamicText(
                    "Complete Moving Solutions",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.oswald800(
                      fontSize: AppFontSize.fs38,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 55),

                  /// ==================================================
                  /// DESKTOP
                  /// 3 CARDS PER ROW
                  /// ==================================================
                  if (isDesktop)
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: services.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 22,
                            mainAxisSpacing: 22,
                            childAspectRatio: 1.18,
                          ),
                      itemBuilder: (context, index) {
                        return ServiceCard(service: services[index]);
                      },
                    )
                  /// ==================================================
                  /// MOBILE + TABLET
                  /// ONE CARD BELOW ANOTHER
                  /// ==================================================
                  else
                    Column(
                      children: services.map((service) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 22),
                          child: ServiceCard(service: service),
                        );
                      }).toList(),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
