import 'package:aipm_app/app/data/app_font_size.dart';
import 'package:aipm_app/app/modules/home/controllers/home_controller.dart';
import 'package:aipm_app/app/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key});

  final controller = Get.find<HomeController>();

  @override
  Size get preferredSize => const Size.fromHeight(85);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      toolbarHeight: 85,
      titleSpacing: 18,
      title: Row(
        children: [
          /// Logo
          Row(
            children: [
              Image.network(
                "https://picsum.photos/70",
                width: 55,
                height: 55,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ALL INDIA",
                    style: AppTextStyles.oswald800(fontSize: AppFontSize.fs24),
                  ),
                  SizedBox(height: 3),
                  Text(
                    "PACKERS & MOVERS",
                    style: AppTextStyles.barlow600(fontSize: AppFontSize.fs18),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(width: 20),

          /// Navigation Items
          Row(
            children: [
              _navItem(
                "Why Choose Us",
                onTap: () {
                  controller.scrollToSection(controller.heroKey);
                },
              ),
              _navItem(
                "About Us",
                onTap: () {
                  controller.scrollToSection(controller.aboutKey);
                },
              ),
              _navItem(
                "Services",
                onTap: () {
                  controller.scrollToSection(controller.servicesKey);
                },
              ),
              _navItem(
                "Service Areas",
                onTap: () {
                  controller.scrollToSection(controller.serviceAreasKey);
                },
              ),
              _navItem(
                "Contact Us",
                onTap: () {
                  controller.scrollToSection(controller.footerKey);
                },
              ),
            ],
          ),

          const Spacer(),

          /// Phone
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Icon(Icons.phone, color: Color(0xff123C8E), size: 24),
          //     SizedBox(width: 10),
          //     Text(
          //       "+91 988 363 2477",
          //       style: AppTextStyles.barlow800(fontSize: AppFontSize.fs19),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget _navItem(String title, {bool hasArrow = false, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(6),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Text(
                title,
                style: AppTextStyles.barlow700(fontSize: AppFontSize.fs15),
              ),
              if (hasArrow) ...[
                const SizedBox(width: 4),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 18,
                  color: Colors.black87,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
