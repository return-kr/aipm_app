import 'package:aipm_app/app/modules/home/views/about/about_section.dart';
import 'package:aipm_app/app/modules/home/views/custom_appbar.dart';
import 'package:aipm_app/app/modules/home/views/footer/footer_section.dart';
import 'package:aipm_app/app/modules/home/views/hero/hero_section.dart';
import 'package:aipm_app/app/modules/home/views/service_area.dart/service_area_section.dart';
import 'package:aipm_app/app/modules/home/views/services/services_section.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Scrollbar(
        controller: controller.scrollController,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(
            children: [
              HeroSection(),
              AboutSection(),
              ServicesSection(),
              ServiceAreasSection(),
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
