import 'package:aipm_app/app/data/app_colors.dart';
import 'package:aipm_app/app/data/app_font_size.dart';
import 'package:aipm_app/app/modules/home/controllers/home_controller.dart';
import 'package:aipm_app/app/theme/app_text_styles.dart';
import 'package:aipm_app/app/widgets/dynamic_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class WhyChooseUsCard extends StatelessWidget {
  WhyChooseUsCard({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final items = [
      "Experienced Moving Professionals",
      "Secure Packing Materials",
      "Affordable and Transparent Pricing",
      "Timely Pickup and Delivery",
      "Door-to-Door Service",
      "Customer-Focused Support",
      "Local and Long-Distance Relocation",
    ];

    return Container(
      key: controller.whyChooseKey,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: .12),
            blurRadius: 25,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DynamicText(
            "Why Choose Us?",
            style: AppTextStyles.oswald800(
              fontSize: AppFontSize.fs38,
              color: AppColors.deepNavy,
            ),
          ),

          const SizedBox(height: 30),

          ...items.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: const BoxDecoration(
                      color: AppColors.darkBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.workspace_premium,
                      size: 20,
                      color: AppColors.orange,
                    ),
                  ),

                  const SizedBox(width: 18),

                  Expanded(
                    child: DynamicText(
                      e,
                      style: AppTextStyles.barlow500(
                        fontSize: AppFontSize.fs18,
                        color: AppColors.navyBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
