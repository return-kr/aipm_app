import 'package:aipm_app/app/data/app_colors.dart';
import 'package:aipm_app/app/data/app_font_size.dart';
import 'package:aipm_app/app/data/city_model.dart';
import 'package:aipm_app/app/modules/home/controllers/home_controller.dart';
import 'package:aipm_app/app/modules/home/views/service_area.dart/city_card.dart';
import 'package:aipm_app/app/theme/app_text_styles.dart';
import 'package:aipm_app/app/widgets/call_us_button.dart';
import 'package:aipm_app/app/widgets/dynamic_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class ServiceAreasSection extends StatelessWidget {
  ServiceAreasSection({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.serviceAreasKey,
      width: double.infinity,
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1320),
          child: Column(
            children: [
              DynamicText(
                "SERVICE AREAS",
                style: AppTextStyles.barlow700(
                  fontSize: AppFontSize.fs16,
                  color: AppColors.blue,
                ),
              ),

              const SizedBox(height: 10),

              DynamicText(
                "Packers and Movers Services Available In",
                textAlign: TextAlign.center,
                style: AppTextStyles.oswald800(
                  fontSize: AppFontSize.fs38,
                  color: AppColors.deepNavy,
                ),
              ),

              const SizedBox(height: 45),

              Wrap(
                spacing: 18,
                runSpacing: 22,
                alignment: WrapAlignment.center,
                children: cities
                    .map(
                      (city) =>
                          SizedBox(width: 190, child: CityCard(city: city)),
                    )
                    .toList(),
              ),

              const SizedBox(height: 40),

              OutlinedButton(
                onPressed: () {
                  final call = CallUsButton();
                  call.handleCall(context);
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 18,
                  ),
                  side: const BorderSide(color: Color(0xff0B4AA2), width: 1.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DynamicText(
                      "AND MANY MORE CITIES ACROSS INDIA",
                      style: AppTextStyles.barlow700(
                        fontSize: AppFontSize.fs16,
                        color: AppColors.deepNavy,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_forward,
                      size: 18,
                      color: AppColors.darkBlue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
