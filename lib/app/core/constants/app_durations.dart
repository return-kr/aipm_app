import 'package:flutter/material.dart';

/// ===============================================================
/// APP DURATIONS
/// ---------------------------------------------------------------
///
/// Centralized animation durations and curves used throughout
/// the application.
/// ===============================================================

class AppDurations {
  AppDurations._();

  static const Duration bottomSheetAnimation = Duration(milliseconds: 300);
  static const Curve bounceOut = Curves.bounceOut;
  static const Duration cardAnimation = Duration(milliseconds: 300);
  static const Curve decelerate = Curves.decelerate;
  //==========================================================================
  // Curves
  //==========================================================================

  static const Curve defaultCurve = Curves.easeInOut;

  static const Duration dialogAnimation = Duration(milliseconds: 250);
  static const Curve easeIn = Curves.easeIn;
  static const Curve easeInOut = Curves.easeInOut;
  static const Curve easeInOutCubic = Curves.easeInOutCubic;
  static const Curve easeOut = Curves.easeOut;
  static const Curve elasticOut = Curves.elasticOut;
  static const Duration extraFast = Duration(milliseconds: 100);
  static const Duration extraSlow = Duration(milliseconds: 700);
  static const Duration fadeAnimation = Duration(milliseconds: 400);
  static const Duration fast = Duration(milliseconds: 200);
  static const Curve fastOutSlowIn = Curves.fastOutSlowIn;
  static const Duration heroButtonAnimation = Duration(milliseconds: 500);
  //==========================================================================
  // Hero Section
  //==========================================================================

  static const Duration heroContentAnimation = Duration(milliseconds: 700);

  static const Duration heroImageAnimation = Duration(milliseconds: 900);
  //==========================================================================
  // Cards
  //==========================================================================

  static const Duration hoverAnimation = Duration(milliseconds: 200);

  //==========================================================================
  // Durations
  //==========================================================================

  static const Duration instant = Duration(milliseconds: 0);

  static const Duration medium = Duration(milliseconds: 400);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration pageTransition = Duration(milliseconds: 350);
  static const Duration scaleAnimation = Duration(milliseconds: 180);
  //==========================================================================
  // Scroll
  //==========================================================================

  static const Duration scrollAnimation = Duration(milliseconds: 700);

  static const Duration scrollToTop = Duration(milliseconds: 600);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration snackBarDuration = Duration(seconds: 3);
  static const Duration splashDuration = Duration(seconds: 2);
}
