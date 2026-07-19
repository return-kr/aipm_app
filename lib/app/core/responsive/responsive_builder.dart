import 'package:flutter/material.dart';

import 'app_breakpoints.dart';

/// ===============================================================
/// RESPONSIVE BUILDER
/// ---------------------------------------------------------------
///
/// Builds a widget based on the current screen width.
///
/// Example:
///
/// ResponsiveBuilder(
///   mobile: MobileHome(),
///   tablet: TabletHome(),
///   desktop: DesktopHome(),
/// )
/// ===============================================================

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  final Widget desktop;
  final Widget mobile;
  final Widget tablet;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (AppBreakpoints.isDesktop(width)) {
      return desktop;
    }

    if (AppBreakpoints.isTablet(width)) {
      return tablet;
    }

    return mobile;
  }
}
