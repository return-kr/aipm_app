import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();

  final GlobalKey heroKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey whyChooseKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey serviceAreasKey = GlobalKey();
  final GlobalKey footerKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;

    if (context == null) return;

    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      alignment: 0.0,
    );
  }
}
