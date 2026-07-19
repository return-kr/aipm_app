import 'package:flutter/material.dart';

import '../constants/app_dimensions.dart';
import 'app_colors.dart';

/// ===============================================================
/// APP SHADOWS
/// ---------------------------------------------------------------
///
/// Centralized shadow styles used across the application.
/// ===============================================================

class AppShadows {
  AppShadows._();

  //==========================================================================
  // Light
  //==========================================================================

  static const List<BoxShadow> light = [
    BoxShadow(color: AppColors.shadow, blurRadius: 12, offset: Offset(0, 4)),
  ];

  static const List<BoxShadow> medium = [
    BoxShadow(color: AppColors.shadow, blurRadius: 18, offset: Offset(0, 8)),
  ];

  static const List<BoxShadow> heavy = [
    BoxShadow(color: AppColors.shadow, blurRadius: 28, offset: Offset(0, 12)),
  ];

  //==========================================================================
  // Cards
  //==========================================================================

  static const List<BoxShadow> card = [
    BoxShadow(
      color: AppColors.shadow,
      blurRadius: 18,
      spreadRadius: 0,
      offset: Offset(0, 8),
    ),
  ];

  static const List<BoxShadow> cardHover = [
    BoxShadow(
      color: AppColors.shadow,
      blurRadius: 30,
      spreadRadius: 0,
      offset: Offset(0, 14),
    ),
  ];

  //==========================================================================
  // Buttons
  //==========================================================================

  static const List<BoxShadow> button = [
    BoxShadow(
      color: AppColors.primaryShadow,
      blurRadius: 16,
      offset: Offset(0, 8),
    ),
  ];

  static const List<BoxShadow> buttonHover = [
    BoxShadow(
      color: AppColors.primaryShadow,
      blurRadius: 24,
      offset: Offset(0, 12),
    ),
  ];

  //==========================================================================
  // Header
  //==========================================================================

  static const List<BoxShadow> appBar = [
    BoxShadow(color: Color(0x0D000000), blurRadius: 16, offset: Offset(0, 4)),
  ];

  //==========================================================================
  // Dialog
  //==========================================================================

  static const List<BoxShadow> dialog = [
    BoxShadow(color: Color(0x14000000), blurRadius: 32, offset: Offset(0, 16)),
  ];

  //==========================================================================
  // Input
  //==========================================================================

  static const List<BoxShadow> inputFocus = [
    BoxShadow(
      color: AppColors.primaryShadow,
      blurRadius: 12,
      spreadRadius: 1,
      offset: Offset(0, 0),
    ),
  ];

  //==========================================================================
  // Floating
  //==========================================================================

  static const List<BoxShadow> floating = [
    BoxShadow(color: Color(0x1A000000), blurRadius: 24, offset: Offset(0, 10)),
  ];

  //==========================================================================
  // Glass Effect
  //==========================================================================

  static const List<BoxShadow> glass = [
    BoxShadow(color: Color(0x0A000000), blurRadius: 20, offset: Offset(0, 8)),
  ];

  //==========================================================================
  // Circular
  //==========================================================================

  static BoxDecoration circular({
    required Color color,
    List<BoxShadow> shadows = light,
  }) {
    return BoxDecoration(
      color: color,
      shape: BoxShape.circle,
      boxShadow: shadows,
    );
  }

  //==========================================================================
  // Rounded Container
  //==========================================================================

  static BoxDecoration rounded({
    required Color color,
    Border? border,
    List<BoxShadow> shadows = card,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(AppDimensions.radius16),
      border: border,
      boxShadow: shadows,
    );
  }
}
