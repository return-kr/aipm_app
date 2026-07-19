import 'package:flutter/material.dart';

import '../constants/app_durations.dart';

/// ===============================================================
/// SCROLL HELPER
/// ---------------------------------------------------------------
///
/// Utility methods for scrolling.
/// ===============================================================

class ScrollHelper {
  ScrollHelper._();

  /// Animate to a specific section using its [GlobalKey].
  static Future<void> scrollToSection({
    required GlobalKey key,
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

  /// Animate to the top of the page.
  static Future<void> scrollToTop(
    ScrollController controller, {
    Duration duration = AppDurations.scrollAnimation,
    Curve curve = Curves.easeInOut,
  }) async {
    if (!controller.hasClients) return;

    await controller.animateTo(
      controller.position.minScrollExtent,
      duration: duration,
      curve: curve,
    );
  }

  /// Animate to the bottom of the page.
  static Future<void> scrollToBottom(
    ScrollController controller, {
    Duration duration = AppDurations.scrollAnimation,
    Curve curve = Curves.easeInOut,
  }) async {
    if (!controller.hasClients) return;

    await controller.animateTo(
      controller.position.maxScrollExtent,
      duration: duration,
      curve: curve,
    );
  }

  /// Animate to a specific scroll offset.
  static Future<void> scrollToOffset(
    ScrollController controller,
    double offset, {
    Duration duration = AppDurations.scrollAnimation,
    Curve curve = Curves.easeInOut,
  }) async {
    if (!controller.hasClients) return;

    await controller.animateTo(
      offset.clamp(
        controller.position.minScrollExtent,
        controller.position.maxScrollExtent,
      ),
      duration: duration,
      curve: curve,
    );
  }
}
