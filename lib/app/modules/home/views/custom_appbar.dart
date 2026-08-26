import 'package:aipm_app/app/data/app_colors.dart';
import 'package:aipm_app/app/data/app_font_size.dart';
import 'package:aipm_app/app/modules/home/controllers/home_controller.dart';
import 'package:aipm_app/app/theme/app_text_styles.dart';
import 'package:aipm_app/app/widgets/dynamic_text.dart';
import 'package:aipm_app/app/widgets/responsive_wrapper.dart';
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
    return ResponsiveWrapper(
      builder: (context, isMobile, isTablet, isDesktop) {
        return AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          toolbarHeight: 85,
          titleSpacing: isDesktop ? 18 : 12,

          title: Row(
            children: [
              /// =====================================================
              /// LOGO
              /// =====================================================
              Expanded(
                child: Row(
                  children: [
                    Image.network(
                      "https://picsum.photos/70",
                      width: isMobile ? 48 : 55,
                      height: isMobile ? 48 : 55,
                      fit: BoxFit.cover,
                    ),

                    const SizedBox(width: 10),

                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DynamicText(
                            "ALL INDIA",
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.oswald800(
                              fontSize: AppFontSize.fs24,
                              color: AppColors.deepNavy,
                            ),
                          ),

                          const SizedBox(height: 3),

                          DynamicText(
                            "PACKERS & MOVERS",
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.barlow600(
                              fontSize: AppFontSize.fs18,
                              color: AppColors.navyBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// =====================================================
              /// DESKTOP NAVIGATION
              /// =====================================================
              if (isDesktop) ...[
                const SizedBox(width: 20),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _navItem(
                      "Home",
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
                      "Why Choose Us",
                      onTap: () {
                        controller.scrollToSection(controller.whyChooseKey);
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
              ],

              /// =====================================================
              /// MOBILE + TABLET MENU
              /// =====================================================
              if (isMobile || isTablet) ...[
                const SizedBox(width: 12),

                IconButton(
                  tooltip: "Menu",
                  onPressed: () {
                    _openDrawer(context);
                  },
                  icon: const Icon(
                    Icons.menu_rounded,
                    size: 32,
                    color: Color(0xff123C8E),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  // ================================================================
  // DRAWER
  // ================================================================

  void _openDrawer(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Menu",
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.centerRight,
          child: Material(
            color: Colors.white,
            child: SafeArea(
              child: SizedBox(
                width: 320,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// DRAWER HEADER
                    Container(
                      height: 85,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(color: Color(0xffEEEEEE)),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            "https://picsum.photos/70",
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          ),

                          const SizedBox(width: 10),

                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DynamicText(
                                  "ALL INDIA",
                                  style: AppTextStyles.oswald800(
                                    fontSize: AppFontSize.fs20,
                                  ),
                                ),
                                DynamicText(
                                  "PACKERS & MOVERS",
                                  style: AppTextStyles.barlow600(
                                    fontSize: AppFontSize.fs14,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.close_rounded,
                              color: Color(0xff123C8E),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// NAVIGATION ITEMS
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            _drawerItem(
                              context,
                              icon: Icons.home_outlined,
                              title: "Home",
                              onTap: () {
                                controller.scrollToSection(controller.heroKey);
                              },
                            ),

                            _drawerItem(
                              context,
                              icon: Icons.info_outline,
                              title: "About Us",
                              onTap: () {
                                controller.scrollToSection(controller.aboutKey);
                              },
                            ),

                            _drawerItem(
                              context,
                              icon: Icons.question_mark_outlined,
                              title: "Why Choose Us",
                              onTap: () {
                                controller.scrollToSection(
                                  controller.whyChooseKey,
                                );
                              },
                            ),

                            _drawerItem(
                              context,
                              icon: Icons.local_shipping_outlined,
                              title: "Services",
                              onTap: () {
                                controller.scrollToSection(
                                  controller.servicesKey,
                                );
                              },
                            ),

                            _drawerItem(
                              context,
                              icon: Icons.location_on_outlined,
                              title: "Service Areas",
                              onTap: () {
                                controller.scrollToSection(
                                  controller.serviceAreasKey,
                                );
                              },
                            ),

                            _drawerItem(
                              context,
                              icon: Icons.phone_outlined,
                              title: "Contact Us",
                              onTap: () {
                                controller.scrollToSection(
                                  controller.footerKey,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// DRAWER FOOTER
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Color(0xffEEEEEE)),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.phone_outlined,
                            color: Color(0xff123C8E),
                            size: 22,
                          ),

                          const SizedBox(width: 10),

                          DynamicText(
                            "+91 988 363 2477",
                            style: AppTextStyles.barlow700(
                              fontSize: AppFontSize.fs15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: child,
        );
      },
    );
  }

  // ================================================================
  // DESKTOP NAV ITEM
  // ================================================================

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
              DynamicText(
                title,
                style: AppTextStyles.barlow700(fontSize: AppFontSize.fs15),
              ),

              if (hasArrow) ...[
                const SizedBox(width: 4),

                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 18,
                  color: AppColors.deepNavy,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // ================================================================
  // DRAWER ITEM
  // ================================================================

  Widget _drawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();

        Future.delayed(const Duration(milliseconds: 100), onTap);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xff123C8E), size: 24),

            const SizedBox(width: 16),

            Expanded(
              child: DynamicText(
                title,
                style: AppTextStyles.barlow600(fontSize: AppFontSize.fs17),
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
