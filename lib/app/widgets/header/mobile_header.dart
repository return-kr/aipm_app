import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/constants/app_strings.dart';
import 'package:aipm_app/app/core/services/scroll_service.dart';
import 'package:aipm_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/app_logo.dart';
import '../common/primary_button.dart';

/// ===============================================================
/// MOBILE HEADER
/// ---------------------------------------------------------------
/// Top navigation bar for mobile and tablet devices.
/// ===============================================================

class MobileHeader extends GetView<HomeController> {
  const MobileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollService = Get.find<ScrollService>();

    return Container(
      height: 70,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacing16),
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
          const AppLogo(height: 42, showTitle: false),

          const Spacer(),

          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Get.bottomSheet(
                SafeArea(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Obx(
                      () => ListView(
                        shrinkWrap: true,
                        children: [
                          const SizedBox(height: 12),
                          ...controller.navItems.map(
                            (item) => ListTile(
                              title: Text(item.title),
                              // leading: Icon(item.icon),
                              onTap: () {
                                Get.back();
                                scrollService.scrollTo(item.sectionKey);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(
                              AppDimensions.spacing16,
                            ),
                            child: PrimaryButton(
                              text: AppStrings.getQuote,
                              onPressed: () {
                                Get.back();
                                controller.scrollToQuoteSection();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                isScrollControlled: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
