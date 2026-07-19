import 'package:flutter/material.dart';

import '../constants/app_durations.dart';

/// ===============================================================
/// SCROLL EXTENSION
/// ---------------------------------------------------------------
///
/// Helpful extensions for [ScrollController].
/// ===============================================================

extension ScrollControllerExtension on ScrollController {
  //==========================================================================
  // Scroll Positions
  //==========================================================================

  bool get isAtTop => hasClients && offset <= position.minScrollExtent;

  bool get isAtBottom => hasClients && offset >= position.maxScrollExtent;

  //==========================================================================
  // Animate
  //==========================================================================

  Future<void> animateToTop({
    Duration duration = AppDurations.scrollAnimation,
    Curve curve = Curves.easeInOut,
  }) async {
    if (!hasClients) return;

    await animateTo(position.minScrollExtent, duration: duration, curve: curve);
  }

  Future<void> animateToBottom({
    Duration duration = AppDurations.scrollAnimation,
    Curve curve = Curves.easeInOut,
  }) async {
    if (!hasClients) return;

    await animateTo(position.maxScrollExtent, duration: duration, curve: curve);
  }

  Future<void> animateToOffset(
    double offset, {
    Duration duration = AppDurations.scrollAnimation,
    Curve curve = Curves.easeInOut,
  }) async {
    if (!hasClients) return;

    await animateTo(
      offset.clamp(position.minScrollExtent, position.maxScrollExtent),
      duration: duration,
      curve: curve,
    );
  }

  //==========================================================================
  // Jump
  //==========================================================================

  void jumpToTop() {
    if (!hasClients) return;

    jumpTo(position.minScrollExtent);
  }

  void jumpToBottom() {
    if (!hasClients) return;

    jumpTo(position.maxScrollExtent);
  }
}
