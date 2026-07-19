import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/theme/app_colors.dart';
import 'package:aipm_app/app/modules/home/controllers/home_controller.dart';
import 'package:aipm_app/app/widgets/about/about_section.dart';
import 'package:aipm_app/app/widgets/app_scaffold.dart';
import 'package:aipm_app/app/widgets/faq/faq_section.dart';
import 'package:aipm_app/app/widgets/footer/footer.dart';
import 'package:aipm_app/app/widgets/header/desktop_header.dart';
import 'package:aipm_app/app/widgets/header/mobile_header.dart';
import 'package:aipm_app/app/widgets/hero/hero_section.dart';
import 'package:aipm_app/app/widgets/hero/quote_form.dart';
import 'package:aipm_app/app/widgets/loading_widget.dart';
import 'package:aipm_app/app/widgets/service_areas/cities_section.dart';
import 'package:aipm_app/app/widgets/services/services_section.dart';
import 'package:aipm_app/app/widgets/testimonials/testimonials_section.dart';
import 'package:aipm_app/app/widgets/why_choose_us/why_choose_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// ===============================================================
/// HOME VIEW
/// ---------------------------------------------------------------
/// Landing page for ALL INDIA PACKERS & MOVERS.
/// ===============================================================

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 768;

    return AppScaffold(
      backgroundColor: AppColors.background,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const LoadingWidget();
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (isMobile) const MobileHeader() else const DesktopHeader(),

              Container(key: controller.heroKey, child: const HeroSection()),

              const SizedBox(height: AppDimensions.spacing64),

              Container(
                key: controller.quoteSectionKey,
                child: const QuoteForm(),
              ),

              const SizedBox(height: AppDimensions.spacing80),

              Container(
                key: controller.aboutSectionKey,
                child: const AboutSection(),
              ),

              const SizedBox(height: AppDimensions.spacing80),

              Container(
                key: controller.whyChooseSectionKey,
                child: const WhyChooseSection(),
              ),

              const SizedBox(height: AppDimensions.spacing80),

              Container(
                key: controller.servicesSectionKey,
                child: const ServicesSection(),
              ),

              const SizedBox(height: AppDimensions.spacing80),

              Container(
                key: controller.citiesSectionKey,
                child: const CitiesSection(),
              ),

              const SizedBox(height: AppDimensions.spacing80),

              Container(
                key: controller.testimonialsSectionKey,
                child: const TestimonialsSection(),
              ),

              const SizedBox(height: AppDimensions.spacing80),

              Container(
                key: controller.faqSectionKey,
                child: const FaqSection(),
              ),

              const SizedBox(height: AppDimensions.spacing80),

              Container(
                key: controller.contactSectionKey,
                child: const Footer(),
              ),
            ],
          ),
        );
      }),
    );
  }
}
