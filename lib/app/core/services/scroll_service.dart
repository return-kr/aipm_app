import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_durations.dart';

/// ===============================================================
/// SCROLL SERVICE
/// ---------------------------------------------------------------
///
/// Centralized scroll management for the application.
///
/// Register:
/// Get.put(ScrollService());
///
/// Usage:
/// final scrollService = Get.find<ScrollService>();
/// ===============================================================

class ScrollService extends GetxService {
  final aboutKey = GlobalKey();
  final contactKey = GlobalKey();
  final homeKey = GlobalKey();
  final ScrollController scrollController = ScrollController();
  final serviceAreasKey = GlobalKey();
  final servicesKey = GlobalKey();
  final whyChooseUsKey = GlobalKey();

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> scrollTo(
    GlobalKey key, {
    Duration duration = AppDurations.scrollAnimation,
    Curve curve = Curves.easeInOut,
  }) async {
    final context = key.currentContext;

    if (context == null) return;

    await Scrollable.ensureVisible(
      context,
      duration: duration,
      curve: curve,
      alignment: 0,
    );
  }

  Future<void> scrollToTop({
    Duration duration = AppDurations.scrollAnimation,
    Curve curve = Curves.easeInOut,
  }) async {
    if (!scrollController.hasClients) return;

    await scrollController.animateTo(0, duration: duration, curve: curve);
  }

  Future<void> scrollToBottom({
    Duration duration = AppDurations.scrollAnimation,
    Curve curve = Curves.easeInOut,
  }) async {
    if (!scrollController.hasClients) return;

    await scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: duration,
      curve: curve,
    );
  }
}
