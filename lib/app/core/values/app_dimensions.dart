import 'package:flutter/material.dart';

/// Global dimensions used throughout the application.
///
/// Never hardcode spacing, radius or heights.
/// Always use values from this file.
class AppDimensions {
  AppDimensions._();

  //==========================================================================
  // Animation
  //==========================================================================

  static const Duration animationDuration = Duration(milliseconds: 300);

  //==========================================================================
  // Buttons
  //==========================================================================

  static const double buttonHeight = 56;

  static const double buttonRadius = 14;
  static const double cardElevation = 3;
  static const double cardPadding = 24;
  //==========================================================================
  // Cards
  //==========================================================================

  static const double cardRadius = 20;

  //==========================================================================
  // Shadows
  //==========================================================================

  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: .06),
      blurRadius: 20,
      spreadRadius: 1,
      offset: const Offset(0, 8),
    ),
  ];

  static const double desktopHorizontalPadding = 80;
  //==========================================================================
  // Responsive Width
  //==========================================================================

  static const double desktopMaxWidth = 1400;

  //==========================================================================
  // Header
  //==========================================================================

  static const double headerHeight = 82;

  static const double heroImageHeight = 500;
  static const double heroImageWidth = 600;
  static const double iconLG = 28;
  static const double iconMD = 22;
  static const double iconSM = 18;
  static const double iconXL = 40;
  //==========================================================================
  // Icons
  //==========================================================================

  static const double iconXS = 14;

  //==========================================================================
  // Inputs
  //==========================================================================

  static const double inputHeight = 56;

  static const double inputRadius = 14;
  //==========================================================================
  // Logo
  //==========================================================================

  static const double logoHeight = 55;

  static const double mobileHorizontalPadding = 20;
  static const double mobileMaxWidth = 600;
  static const double pageHorizontalPadding = 32;
  static const double radiusLG = 18;
  static const double radiusMD = 12;
  static const double radiusSM = 8;
  static const double radiusXL = 24;
  //==========================================================================
  // Border Radius
  //==========================================================================

  static const double radiusXS = 4;

  static const double radiusXXL = 32;
  static const double sectionBottomPadding = 90;
  //==========================================================================
  // Sections
  //==========================================================================

  static const double sectionSpacing = 100;

  static const double sectionTopPadding = 90;
  //==========================================================================
  // Images
  //==========================================================================

  static const double serviceImageHeight = 220;

  static const Duration slowAnimationDuration = Duration(milliseconds: 600);
  static const double tabletHorizontalPadding = 48;
  static const double tabletMaxWidth = 900;
}
