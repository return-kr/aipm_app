import 'package:flutter/material.dart';

/// ===============================================================
/// APP CONSTANTS
/// ---------------------------------------------------------------
///
/// Global constants used throughout the application.
///
/// NOTE:
/// Keep this file clean.
/// Only place project-wide constants here.
///
/// Do NOT add:
/// ❌ Strings
/// ❌ Colors
/// ❌ Assets
/// ❌ TextStyles
/// ❌ Dimensions
///
/// Those belong to their dedicated files.
/// ===============================================================
class AppConstants {
  AppConstants._();

  // =============================================================
  // Animations
  // =============================================================

  static const Duration animationDuration = Duration(milliseconds: 300);

  /// Navbar height.
  static const double appBarHeight = 82;

  // =============================================================
  // Application
  // =============================================================

  static const String appName = 'ALL INDIA PACKERS & MOVERS';

  static const BorderRadius buttonRadius = BorderRadius.all(
    Radius.circular(14),
  );

  static const String callUrl = 'tel:+919883632477';
  // =============================================================
  // Elevation
  // =============================================================

  static const double cardElevation = 3;

  static const BorderRadius cardRadius = BorderRadius.all(Radius.circular(20));
  // =============================================================
  // Service Areas
  // =============================================================

  static const int cityGridCount = 4;

  static const String companyTagline = 'We Move Your Dreams Safely';
  // =============================================================
  // Border Radius
  // =============================================================

  static const BorderRadius defaultBorderRadius = BorderRadius.all(
    Radius.circular(18),
  );

  // =============================================================
  // Scroll
  // =============================================================

  static const Curve defaultScrollCurve = Curves.easeInOutCubic;

  static const String email = 'info@allindiapackersmovers.com';
  // =============================================================
  // Footer
  // =============================================================

  static const double footerHeight = 420;

  // =============================================================
  // Hero Section
  // =============================================================

  static const double heroHeight = 760;

  static const int locationMaxLength = 100;
  // =============================================================
  // Layout
  // =============================================================

  /// Maximum width of website content.
  static const double maxContentWidth = 1400;

  static const int nameMaxLength = 50;
  static const Duration pageTransitionDuration = Duration(milliseconds: 500);
  static const String phoneNumber = '+91 9883632477';
  // =============================================================
  // Form
  // =============================================================

  static const int phoneNumberLength = 10;

  static const double quoteCardWidth = 430;
  static const Duration scrollDuration = Duration(milliseconds: 900);
  /// Standard section spacing.
  static const double sectionSpacing = 100;

  static const double serviceCardHeight = 420;
  // =============================================================
  // Service Cards
  // =============================================================

  static const int serviceGridCount = 3;

  static const Duration slowAnimationDuration = Duration(milliseconds: 600);
  static const String website = 'https://allindiapackersmovers.com';
  // =============================================================
  // Social Links
  // =============================================================

  static const String whatsappUrl = 'https://wa.me/919883632477';
}
