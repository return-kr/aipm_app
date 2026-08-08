import 'package:aipm_app/app/data/app_font_size.dart';
import 'package:aipm_app/app/modules/home/controllers/home_controller.dart';
import 'package:aipm_app/app/modules/home/views/about/why_choose_card.dart';
import 'package:aipm_app/app/theme/app_text_styles.dart';
import 'package:aipm_app/app/widgets/dynamic_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class AboutSection extends StatelessWidget {
  AboutSection({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.aboutKey,
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 20),
      child: Center(
        child: SizedBox(
          width: 1320,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// LEFT CONTENT
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        DynamicText(
                          "ABOUT US",
                          style: AppTextStyles.barlow700(
                            fontSize: AppFontSize.fs16,
                            color: Colors.blue.shade800,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 45,
                          height: 2,
                          color: const Color(0xffFDB913),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    DynamicText(
                      "Your Trusted Moving Partner",
                      style: AppTextStyles.oswald800(
                        fontSize: AppFontSize.fs38,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 28),

                    DynamicText(
                      "ALL INDIA PACKERS & MOVERS is a professional relocation company providing reliable packing and moving services throughout India. We specialize in safe transportation of household goods, office equipment, furniture, electronics, and vehicles.",
                      style: AppTextStyles.barlow500(
                        fontSize: AppFontSize.fs18,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 22),

                    DynamicText(
                      "Our experienced team uses quality packing materials and modern handling techniques to ensure your belongings reach their destination safely and on time.",
                      style: AppTextStyles.barlow500(
                        fontSize: AppFontSize.fs18,
                        color: Colors.grey.shade800,
                      ),
                    ),

                    const SizedBox(height: 40),

                    SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xff062D6D),
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DynamicText(
                              "LEARN MORE ABOUT US",
                              style: AppTextStyles.barlow500(
                                fontSize: AppFontSize.fs16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 12),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 55),

              /// CENTER IMAGE
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(
                    "https://picsum.photos/500/700",
                    height: 620,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(width: 55),

              /// WHY CHOOSE US
              const Expanded(flex: 3, child: WhyChooseUsCard()),
            ],
          ),
        ),
      ),
    );
  }
}
