import 'package:aipm_app/app/data/app_font_size.dart';
import 'package:aipm_app/app/data/service_model.dart';
import 'package:aipm_app/app/theme/app_text_styles.dart';
import 'package:aipm_app/app/widgets/dynamic_text.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.service});

  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xffECECEC)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          /// LEFT CONTENT
          Expanded(
            flex: 5,
            child: Scrollbar(
              thumbVisibility: false,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            color: Color(0xffFDB913),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.local_shipping_outlined,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: DynamicText(
                            service.title,
                            style: AppTextStyles.oswald600(
                              fontSize: AppFontSize.fs22,
                              color: Colors.black87,
                            ).copyWith(letterSpacing: .5),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    DynamicText(
                      service.description,
                      style: AppTextStyles.barlow500(
                        fontSize: AppFontSize.fs16,
                        color: Colors.grey.shade800,
                      ),
                    ),

                    const SizedBox(height: 20),

                    DynamicText(
                      "Included:",
                      style: AppTextStyles.barlow800(
                        fontSize: AppFontSize.fs18,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 14),

                    ...service.features.map(
                      (feature) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 2),
                              child: Icon(
                                Icons.check,
                                color: Color(0xff2E63F3),
                                size: 18,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: DynamicText(
                                feature,
                                style: AppTextStyles.barlow500(
                                  fontSize: AppFontSize.fs16,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(width: 5),

          /// RIGHT IMAGE
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: SizedBox.expand(
                child: Image.network(service.image, fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
