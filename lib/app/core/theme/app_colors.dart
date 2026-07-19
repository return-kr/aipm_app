import 'package:flutter/material.dart';

/// ===============================================================
/// APP COLORS
/// ---------------------------------------------------------------
///
/// Centralized color palette for the application.
/// ===============================================================

class AppColors {
  AppColors._();

  //==========================================================================
  // Background Colors
  //==========================================================================

  static const Color background = Color(0xFFF8FAFC);

  static const Color backgroundDark = Color(0xFF0F172A);
  static const Color black = Colors.black;
  //==========================================================================
  // Border Colors
  //==========================================================================

  static const Color border = Color(0xFFE2E8F0);

  static const Color borderLight = Color(0xFFF1F5F9);
  //==========================================================================
  // Button Colors
  //==========================================================================

  static const Color buttonPrimary = primary;

  static const Color buttonSecondary = secondary;
  static const Color buttonTextPrimary = Colors.white;
  static const Color buttonTextSecondary = Colors.white;
  //==========================================================================
  // Card Colors
  //==========================================================================

  static const Color card = Colors.white;

  static const Color cardHover = Color(0xFFF8FAFC);
  static const Color divider = Color(0xFFE5E7EB);
  static const Color error = Color(0xFFDC2626);
  //==========================================================================
  // Footer
  //==========================================================================

  static const Color footerBackground = Color(0xFF0F172A);

  static const LinearGradient footerGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
  );

  static const Color footerText = Color(0xFFCBD5E1);
  static const Color glass = Color(0x33FFFFFF);
  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0x0D0D6EFD), Color(0x1A0D6EFD)],
  );

  static const Color iconLight = Colors.white;
  //==========================================================================
  // Icon Colors
  //==========================================================================

  static const Color iconPrimary = primary;

  static const Color iconSecondary = textSecondary;
  static const Color info = Color(0xFF0284C7);
  //==========================================================================
  // Form Colors
  //==========================================================================

  static const Color inputBackground = Colors.white;

  static const Color inputBorder = Color(0xFFD1D5DB);
  static const Color inputFocusedBorder = primary;
  static const Color inputHint = Color(0xFF9CA3AF);
  //==========================================================================
  // Overlay
  //==========================================================================

  static const Color overlay = Color(0x80000000);

  //==========================================================================
  // Brand Colors
  //==========================================================================

  static const Color primary = Color(0xFF0D6EFD);

  static const Color primaryDark = Color(0xFF004FC6);
  //==========================================================================
  // Gradients
  //==========================================================================

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryLight],
  );

  static const Color primaryLight = Color(0xFF5A9BFF);
  static const Color primaryShadow = Color(0x330D6EFD);
  static const Color secondary = Color(0xFFFF9800);
  static const Color secondaryDark = Color(0xFFF57C00);
  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondary, secondaryLight],
  );

  static const Color secondaryLight = Color(0xFFFFB74D);
  //==========================================================================
  // Shadow Colors
  //==========================================================================

  static const Color shadow = Color(0x14000000);

  //==========================================================================
  // Status Colors
  //==========================================================================

  static const Color success = Color(0xFF16A34A);

  static const Color surface = Colors.white;
  static const Color surfaceDark = Color(0xFF1E293B);
  static const Color textLight = Color(0xFF94A3B8);
  //==========================================================================
  // Text Colors
  //==========================================================================

  static const Color textPrimary = Color(0xFF1E293B);

  static const Color textSecondary = Color(0xFF64748B);
  static const Color textWhite = Colors.white;
  //==========================================================================
  // Misc
  //==========================================================================

  static const Color transparent = Colors.transparent;

  static const Color warning = Color(0xFFF59E0B);
  static const Color white = Colors.white;
}
