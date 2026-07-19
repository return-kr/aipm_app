import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/constants/app_strings.dart';
import 'package:aipm_app/app/core/services/scroll_service.dart';
import 'package:aipm_app/app/core/theme/app_colors.dart';
import 'package:aipm_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/app_logo.dart';
import '../common/primary_button.dart';

/// ===============================================================
/// DESKTOP HEADER
/// ---------------------------------------------------------------
/// Top navigation bar for desktop devices.
/// ===============================================================

class DesktopHeader extends GetView<HomeController> {
  const DesktopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollService = Get.find<ScrollService>();

    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacing32),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Color(0x14000000),
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const AppLogo(),

          const Spacer(),

          Obx(
            () => Row(
              children: List.generate(controller.navItems.length, (index) {
                final item = controller.navItems[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.spacing12,
                  ),
                  child: TextButton(
                    onPressed: () {
                      scrollService.scrollTo(item.sectionKey);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primary,
                    ),
                    child: Text(
                      item.title,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                );
              }),
            ),
          ),

          const SizedBox(width: AppDimensions.spacing24),

          PrimaryButton(
            text: AppStrings.getQuote,
            onPressed: controller.scrollToQuoteSection,
          ),
        ],
      ),
    );
  }
}
