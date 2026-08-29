import 'package:aipm_app/app/data/app_colors.dart';
import 'package:aipm_app/app/data/app_font_size.dart';
import 'package:aipm_app/app/modules/home/controllers/home_controller.dart';
import 'package:aipm_app/app/theme/app_text_styles.dart';
import 'package:aipm_app/app/widgets/dynamic_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';

class QuoteForm extends StatelessWidget {
  QuoteForm({super.key, required this.isDesktop});

  final bool isDesktop;
  final controller = Get.find<HomeController>();

  Widget _input({
    required IconData icon,
    required String label,
    required String hint,
    IconData? suffix,
    TextEditingController? controller,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
            color: const Color(0xffF5F7FB),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: const Color(0xff5D6B82), size: 22),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DynamicText(
                label,
                style: AppTextStyles.barlow700(
                  fontSize: AppFontSize.fs16,
                  color: AppColors.deepNavy,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 46,
                child: TextField(
                  controller: controller,
                  style: AppTextStyles.barlow600(
                    fontSize: AppFontSize.fs18,
                    color: AppColors.deepNavy,
                  ),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: AppTextStyles.barlow500(
                      fontSize: AppFontSize.fs16,
                      color: Colors.grey.shade500,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    filled: true,
                    fillColor: AppColors.white,
                    suffixIcon: suffix != null
                        ? Icon(suffix, size: 18, color: AppColors.darkBlue)
                        : null,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: AppColors.blue, width: 1.5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Header
        Container(
          height: 85,
          padding: const EdgeInsets.symmetric(horizontal: 28),
          decoration: const BoxDecoration(
            color: AppColors.navyBlue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
          ),
          child: Row(
            children: [
              Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  color: AppColors.orange.withValues(alpha: .15),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.orange, width: 2),
                ),
                child: const Icon(
                  Icons.local_shipping,
                  color: AppColors.orange,
                  size: 28,
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: DynamicText(
                  "Get a Free Moving Quote",
                  style: AppTextStyles.oswald500(
                    fontSize: AppFontSize.fs30,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),

        /// Scrollable Body
        isDesktop
            ? Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _input(
                        icon: Icons.person_outline,
                        label: "Name",
                        hint: "Your Name",
                        controller: controller.nameController,
                      ),

                      const SizedBox(height: 18),

                      _input(
                        icon: Icons.call_outlined,
                        label: "Phone Number",
                        hint: "Your Phone Number",
                        controller: controller.phoneController,
                      ),

                      const SizedBox(height: 18),

                      _input(
                        icon: Icons.location_on_outlined,
                        label: "Pickup Location",
                        hint: "From (City/Address)",
                        controller: controller.fromController,
                      ),

                      const SizedBox(height: 18),

                      _input(
                        icon: Icons.location_on_outlined,
                        label: "Destination Location",
                        hint: "To (City/Address)",
                        controller: controller.toController,
                      ),

                      const SizedBox(height: 18),

                      _input(
                        icon: Icons.calendar_month_outlined,
                        label: "Moving Date",
                        hint: "Select Moving Date",
                        suffix: Icons.calendar_today_outlined,
                        controller: controller.dateController,
                      ),

                      const SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,
                        height: 58,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.sendQuoteEmail().then((success) {
                              if (success) {
                                ScaffoldMessenger.of(
                                  Get.context as BuildContext,
                                ).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Quote request sent successfully!',
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(
                                  Get.context as BuildContext,
                                ).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Failed to send quote request.',
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: AppColors.orange,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: DynamicText(
                            "SUBMIT REQUEST",
                            style: AppTextStyles.barlow700(
                              fontSize: AppFontSize.fs18,
                              color: AppColors.deepNavy,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(
                  left: 14.0,
                  right: 14.0,
                  top: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _input(
                      icon: Icons.person_outline,
                      label: "Name",
                      hint: "Your Name",
                      controller: controller.nameController,
                    ),

                    const SizedBox(height: 18),

                    _input(
                      icon: Icons.call_outlined,
                      label: "Phone Number",
                      hint: "Your Phone Number",
                      controller: controller.phoneController,
                    ),

                    const SizedBox(height: 18),

                    _input(
                      icon: Icons.location_on_outlined,
                      label: "Pickup Location",
                      hint: "From (City/Address)",
                      controller: controller.fromController,
                    ),

                    const SizedBox(height: 18),

                    _input(
                      icon: Icons.location_on_outlined,
                      label: "Destination Location",
                      hint: "To (City/Address)",
                      controller: controller.toController,
                    ),

                    const SizedBox(height: 18),

                    _input(
                      icon: Icons.calendar_month_outlined,
                      label: "Moving Date",
                      hint: "Select Moving Date",
                      suffix: Icons.calendar_today_outlined,
                      controller: controller.dateController,
                    ),

                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      height: 58,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.sendQuoteEmail().then((success) {
                            if (success) {
                              ScaffoldMessenger.of(
                                Get.context as BuildContext,
                              ).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Quote request sent successfully!',
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(
                                Get.context as BuildContext,
                              ).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Failed to send quote request.',
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppColors.orange,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: DynamicText(
                          "SUBMIT REQUEST",
                          style: AppTextStyles.barlow700(
                            fontSize: AppFontSize.fs18,
                            color: AppColors.deepNavy,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
