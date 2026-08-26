import 'package:aipm_app/app/data/app_colors.dart';
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
    /// IMPORTANT:
    /// Do NOT use constraints.maxWidth here.
    ///
    /// The card itself is only one-third of the desktop width,
    /// so using its local width would incorrectly identify it
    /// as mobile.
    final double screenWidth = MediaQuery.sizeOf(context).width;

    final bool isMobile = screenWidth < 768;

    final bool isTablet = screenWidth >= 768 && screenWidth < 1024;

    final bool isDesktop = screenWidth >= 1024;

    if (isDesktop) {
      return _desktopCard();
    }

    return _mobileTabletCard(isMobile: isMobile, isTablet: isTablet);
  }

  // ================================================================
  // DESKTOP
  // CONTENT LEFT + IMAGE RIGHT
  // ================================================================

  Widget _desktopCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.lightSilver),
        boxShadow: [
          BoxShadow(
            color: AppColors.deepNavy.withValues(alpha: .05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// =========================================================
          /// LEFT CONTENT
          /// =========================================================
          Expanded(flex: 5, child: _content()),

          const SizedBox(width: 18),

          /// =========================================================
          /// RIGHT IMAGE
          /// =========================================================
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: AspectRatio(
                aspectRatio: 0.82,
                child: Image.network(service.image, fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================================================================
  // MOBILE + TABLET
  // CONTENT TOP + IMAGE BOTTOM
  // ================================================================

  Widget _mobileTabletCard({required bool isMobile, required bool isTablet}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.lightSilver),
        boxShadow: [
          BoxShadow(
            color: AppColors.deepNavy.withValues(alpha: .05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// =========================================================
          /// CONTENT
          /// =========================================================
          _content(),

          SizedBox(height: isMobile ? 20 : 25),

          /// =========================================================
          /// IMAGE
          /// =========================================================
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: AspectRatio(
              aspectRatio: isMobile ? 16 / 9 : 16 / 7,
              child: Image.network(
                service.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================================================================
  // COMMON CONTENT
  // ================================================================

  Widget _content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// =========================================================
        /// TITLE
        /// =========================================================
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: AppColors.orange,
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

        /// =========================================================
        /// DESCRIPTION
        /// =========================================================
        DynamicText(
          service.description,
          style: AppTextStyles.barlow500(
            fontSize: AppFontSize.fs16,
            color: AppColors.navyBlue,
          ),
        ),

        const SizedBox(height: 20),

        /// =========================================================
        /// INCLUDED
        /// =========================================================
        DynamicText(
          "Included:",
          style: AppTextStyles.barlow800(
            fontSize: AppFontSize.fs18,
            color: AppColors.deepNavy,
          ),
        ),

        const SizedBox(height: 14),

        /// =========================================================
        /// FEATURES
        /// =========================================================
        ...service.features.map(
          (feature) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Icon(Icons.check, color: Color(0xff2E63F3), size: 18),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: DynamicText(
                    feature,
                    style: AppTextStyles.barlow500(
                      fontSize: AppFontSize.fs16,
                      color: AppColors.navyBlue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
