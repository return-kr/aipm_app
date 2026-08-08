import 'package:aipm_app/app/data/app_font_size.dart';
import 'package:aipm_app/app/modules/home/controllers/home_controller.dart';
import 'package:aipm_app/app/theme/app_text_styles.dart';
import 'package:aipm_app/app/widgets/dynamic_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class FooterSection extends StatelessWidget {
  FooterSection({super.key});

  final controller = Get.find<HomeController>();

  Widget _divider() {
    return Container(
      width: 1,
      height: 260,
      margin: const EdgeInsets.symmetric(horizontal: 18),
      color: Colors.white.withValues(alpha: .08),
    );
  }

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
                    color: Colors.white,
                  ),
                ),
                DynamicText(
                  "PACKERS & MOVERS",
                  style: AppTextStyles.barlow600(
                    fontSize: AppFontSize.fs16,
                    color: Color(0xffFDB913),
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 28),

        DynamicText(
          "Your trusted partner for safe, fast\nand reliable moving services\nacross India.",
          style: AppTextStyles.barlow300(
            fontSize: AppFontSize.fs15,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 30),

        Wrap(
          runSpacing: 5,
          // spacing: 5,
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

  Widget _contactUs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DynamicText(
          "Contact Us",
          style: AppTextStyles.oswald700(
            fontSize: AppFontSize.fs19,
            color: Colors.white,
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

  Widget _businessHours() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DynamicText(
          "Business Hours",
          style: AppTextStyles.oswald700(
            fontSize: AppFontSize.fs19,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 5),

        DynamicText(
          "Mon - Sun",
          style: AppTextStyles.barlow300(
            fontSize: AppFontSize.fs15,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 5),

        DynamicText(
          "8:00 AM - 8:00 PM",
          style: AppTextStyles.barlow300(
            fontSize: AppFontSize.fs15,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 28),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xffFDB913),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Icon(Icons.call, size: 28, color: Color(0xff07275B)),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DynamicText(
                    "Call Now",
                    style: AppTextStyles.barlow600(
                      fontSize: AppFontSize.fs16,
                      color: Color(0xff07275B),
                    ),
                  ),
                  SizedBox(height: 4),
                  DynamicText(
                    "+91 988 363 2477",
                    style: AppTextStyles.barlow700(
                      fontSize: AppFontSize.fs20,
                      color: Color(0xff07275B),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _footerList(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DynamicText(
          title,
          style: AppTextStyles.oswald700(
            fontSize: AppFontSize.fs19,
            color: Colors.white,
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
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _contact(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.circle, size: 0),
        Icon(icon, color: const Color(0xffFDB913), size: 18),
        const SizedBox(width: 14),
        Expanded(
          child: DynamicText(
            text,
            style: AppTextStyles.barlow300(
              fontSize: AppFontSize.fs15,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _social(IconData icon, Color color) {
    return Container(
      width: 42,
      height: 42,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Icon(icon, color: Colors.white, size: 22),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.footerKey,
      color: const Color(0xff07275B),
      child: Column(
        children: [
          Padding(
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
          ),

          Container(height: 1, color: Colors.white.withValues(alpha: .08)),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1320),
                child: Row(
                  children: [
                    DynamicText(
                      "© 2024 ALL INDIA PACKERS & MOVERS. All Rights Reserved.",
                      style: AppTextStyles.barlow300(
                        fontSize: AppFontSize.fs12,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    DynamicText(
                      "Designed for Safe & Secure Moving",
                      style: AppTextStyles.barlow300(
                        fontSize: AppFontSize.fs12,
                        color: Colors.white,
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
}
