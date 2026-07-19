/// ===============================================================
/// APP BREAKPOINTS
/// ---------------------------------------------------------------
///
/// Responsive breakpoints used throughout the application.
/// ===============================================================

class AppBreakpoints {
  AppBreakpoints._();

  /// Desktop : 1200+
  static const double desktop = 1200;

  /// Mobile : 0 - 767
  static const double mobile = 768;

  /// Tablet : 768 - 1199
  static const double tablet = 1200;

  static bool isMobile(double width) {
    return width < mobile;
  }

  static bool isTablet(double width) {
    return width >= mobile && width < desktop;
  }

  static bool isDesktop(double width) {
    return width >= desktop;
  }
}
