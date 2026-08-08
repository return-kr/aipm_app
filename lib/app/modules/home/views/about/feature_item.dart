import 'package:aipm_app/app/data/app_font_size.dart';
import 'package:aipm_app/app/theme/app_text_styles.dart';
import 'package:aipm_app/app/widgets/dynamic_text.dart';
import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 34,
          width: 34,
          decoration: const BoxDecoration(
            color: Color(0xffFDB913),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, color: Colors.black, size: 20),
        ),
        const SizedBox(width: 12),
        DynamicText(
          title,
          style: AppTextStyles.barlow600(
            fontSize: AppFontSize.fs18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
