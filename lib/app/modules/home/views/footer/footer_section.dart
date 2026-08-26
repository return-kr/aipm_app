import 'package:aipm_app/app/data/app_colors.dart';
import 'package:aipm_app/app/data/app_font_size.dart';
import 'package:aipm_app/app/modules/home/controllers/home_controller.dart';
import 'package:aipm_app/app/theme/app_text_styles.dart';
import 'package:aipm_app/app/widgets/call_us_button.dart';
import 'package:aipm_app/app/widgets/dynamic_text.dart';
import 'package:aipm_app/app/widgets/responsive_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class FooterSection extends StatelessWidget {
  FooterSection({super.key});

  final controller = Get.find<HomeController>();

  // ================================================================
  // DIVIDER
  // ================================================================

  Widget _divider() {
    return Container(
      width: 1,
      height: 260,
      margin: const EdgeInsets.symmetric(horizontal: 18),
      color: AppColors.white.withValues(alpha: .08),
    );
  }

  // ================================================================
  // COMPANY INFO
  // ================================================================

  Widget _companyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.network("https://picsum.photos/60", width: 55, height: 55),

            const SizedBox(width: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DynamicText(
                  "ALL INDIA",
                  style: AppTextStyles.oswald800(
                    fontSize: AppFontSize.fs20,
                    color: AppColors.white,
                  ),
                ),

                DynamicText(
                  "PACKERS & MOVERS",
                  style: AppTextStyles.barlow600(
                    fontSize: AppFontSize.fs16,
                    color: AppColors.orange,
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 28),

        DynamicText(
          "Your trusted partner for safe, fast\n"
          "and reliable moving services\n"
          "across India.",
          style: AppTextStyles.barlow300(
            fontSize: AppFontSize.fs15,
            color: AppColors.white,
          ),
        ),

        const SizedBox(height: 30),

        Wrap(
          runSpacing: 5,
          children: [
            _social(Icons.facebook, Colors.blue),
            _social(Icons.camera_alt, Colors.purple),
            _social(Icons.chat, Colors.grey),
            _social(Icons.call, Colors.green),
            _social(Icons.play_arrow, Colors.red),
          ],
        ),
      ],
    );
  }

  // ================================================================
  // SERVICES
  // ================================================================

  Widget _services() {
    return _footerList("Our Services", [
      "Household Shifting",
      "Office Relocation",
      "Vehicle Transportation",
      "Packing & Unpacking",
      "Loading & Unloading",
      "Warehouse & Storage",
    ]);
  }

  // ================================================================
  // CONTACT
  // ================================================================

  Widget _contactUs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DynamicText(
          "Contact Us",
          style: AppTextStyles.oswald700(
            fontSize: AppFontSize.fs19,
            color: AppColors.white,
          ),
        ),

        const SizedBox(height: 12),

        _contact(Icons.call, "+91 988 363 2477"),

        const SizedBox(height: 5),

        _contact(Icons.email_outlined, "info@example.com"),

        const SizedBox(height: 5),

        _contact(Icons.location_on_outlined, "Siliguri, West Bengal, India"),
      ],
    );
  }

  // ================================================================
  // BUSINESS HOURS
  // ================================================================

  Widget _businessHours() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DynamicText(
          "Business Hours",
          style: AppTextStyles.oswald700(
            fontSize: AppFontSize.fs19,
            color: AppColors.white,
          ),
        ),

        const SizedBox(height: 5),

        DynamicText(
          "Mon - Sun",
          style: AppTextStyles.barlow300(
            fontSize: AppFontSize.fs15,
            color: AppColors.white,
          ),
        ),

        const SizedBox(height: 5),

        DynamicText(
          "8:00 AM - 8:00 PM",
          style: AppTextStyles.barlow300(
            fontSize: AppFontSize.fs15,
            color: AppColors.white,
          ),
        ),

        const SizedBox(height: 28),

        _callButton(),
      ],
    );
  }

  // ================================================================
  // CALL BUTTON
  // ================================================================

  Widget _callButton() {
    return CallUsButton();
    // return Container(
    //   width: double.infinity,
    //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    //   decoration: BoxDecoration(
    //     color: const Color(0xffFDB913),
    //     borderRadius: BorderRadius.circular(14),
    //   ),
    //   child: Row(
    //     children: [
    //       const Icon(Icons.call, size: 28, color: Color(0xff07275B)),

    //       const SizedBox(width: 16),

    //       Expanded(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             DynamicText(
    //               "Call Now",
    //               style: AppTextStyles.barlow600(
    //                 fontSize: AppFontSize.fs16,
    //                 color: const Color(0xff07275B),
    //               ),
    //             ),

    //             const SizedBox(height: 4),

    //             DynamicText(
    //               "+91 988 363 2477",
    //               style: AppTextStyles.barlow700(
    //                 fontSize: AppFontSize.fs20,
    //                 color: const Color(0xff07275B),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  // ================================================================
  // FOOTER LIST
  // ================================================================

  Widget _footerList(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DynamicText(
          title,
          style: AppTextStyles.oswald700(
            fontSize: AppFontSize.fs19,
            color: AppColors.white,
          ),
        ),

        const SizedBox(height: 12),

        ...items.map(
          (e) => Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: DynamicText(
              e,
              style: AppTextStyles.barlow300(
                fontSize: AppFontSize.fs15,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ================================================================
  // CONTACT ITEM
  // ================================================================

  Widget _contact(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.orange, size: 18),

        const SizedBox(width: 14),

        Expanded(
          child: DynamicText(
            text,
            style: AppTextStyles.barlow300(
              fontSize: AppFontSize.fs15,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }

  // ================================================================
  // SOCIAL ICON
  // ================================================================

  Widget _social(IconData icon, Color color) {
    return Container(
      width: 42,
      height: 42,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Icon(icon, color: AppColors.white, size: 22),
    );
  }

  // ================================================================
  // DESKTOP FOOTER
  // ================================================================

  Widget _desktopFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1320),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 3, child: _companyInfo()),

              _divider(),

              Expanded(flex: 2, child: _services()),

              _divider(),

              Expanded(flex: 3, child: _contactUs()),

              _divider(),

              Expanded(flex: 3, child: _businessHours()),
            ],
          ),
        ),
      ),
    );
  }

  // ================================================================
  // MOBILE / TABLET FOOTER
  // ================================================================

  Widget _mobileTabletFooter({required bool isMobile}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 35,
        vertical: 35,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ==========================================================
          /// COMPANY INFO
          /// ==========================================================
          _companyInfo(),

          const SizedBox(height: 40),

          /// ==========================================================
          /// SERVICES + CONTACT
          /// ==========================================================
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _services()),

              const SizedBox(width: 25),

              Expanded(child: _contactUs()),
            ],
          ),

          const SizedBox(height: 40),

          /// ==========================================================
          /// BUSINESS HOURS
          /// ==========================================================
          _businessHours(),
        ],
      ),
    );
  }

  // ================================================================
  // COPYRIGHT
  // ================================================================

  Widget _copyright({required bool isMobile}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.white.withValues(alpha: .08)),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1320),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DynamicText(
                      "© 2024 ALL INDIA PACKERS & MOVERS. "
                      "All Rights Reserved.",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.barlow300(
                        fontSize: AppFontSize.fs12,
                        color: AppColors.white,
                      ),
                    ),

                    const SizedBox(height: 8),

                    DynamicText(
                      "Designed for Safe & Secure Moving",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.barlow300(
                        fontSize: AppFontSize.fs12,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    DynamicText(
                      "© 2024 ALL INDIA PACKERS & MOVERS. "
                      "All Rights Reserved.",
                      style: AppTextStyles.barlow300(
                        fontSize: AppFontSize.fs12,
                        color: AppColors.white,
                      ),
                    ),

                    const Spacer(),

                    DynamicText(
                      "Designed for Safe & Secure Moving",
                      style: AppTextStyles.barlow300(
                        fontSize: AppFontSize.fs12,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  // ================================================================
  // BUILD
  // ================================================================

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      builder: (context, isMobile, isTablet, isDesktop) {
        return Container(
          key: controller.footerKey,
          width: double.infinity,
          color: AppColors.darkBlue,
          child: Column(
            children: [
              /// ======================================================
              /// MAIN FOOTER
              /// ======================================================
              if (isDesktop)
                _desktopFooter()
              else
                _mobileTabletFooter(isMobile: isMobile),

              /// ======================================================
              /// COPYRIGHT
              /// ======================================================
              _copyright(isMobile: isMobile),
            ],
          ),
        );
      },
    );
  }
}
