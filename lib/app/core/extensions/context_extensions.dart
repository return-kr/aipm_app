import 'package:flutter/material.dart';

import '../responsive/app_breakpoints.dart';

/// ===============================================================
/// CONTEXT EXTENSION
/// ---------------------------------------------------------------
///
/// Common BuildContext extensions used throughout the application.
/// ===============================================================

extension ContextExtension on BuildContext {
  //==========================================================================
  // Screen Size
  //==========================================================================

  Size get screenSize => MediaQuery.sizeOf(this);

  double get screenWidth => screenSize.width;

  double get screenHeight => screenSize.height;

  //==========================================================================
  // Responsive
  //==========================================================================

  bool get isMobile => AppBreakpoints.isMobile(screenWidth);

  bool get isTablet => AppBreakpoints.isTablet(screenWidth);

  bool get isDesktop => AppBreakpoints.isDesktop(screenWidth);

  //==========================================================================
  // Theme
  //==========================================================================

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;

  //==========================================================================
  // Media Query
  //==========================================================================

  EdgeInsets get viewPadding => MediaQuery.paddingOf(this);

  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  double get statusBarHeight => viewPadding.top;

  double get bottomInset => viewInsets.bottom;

  //==========================================================================
  // Keyboard
  //==========================================================================

  bool get isKeyboardVisible => bottomInset > 0;

  //==========================================================================
  // Focus
  //==========================================================================

  void unfocus() {
    FocusScope.of(this).unfocus();
  }
}
