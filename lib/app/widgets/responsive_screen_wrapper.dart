import 'package:flutter/material.dart';

import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveScreenWrapper extends StatelessWidget {
  const ResponsiveScreenWrapper({
    super.key,
    this.mobile,
    this.tablet,
    this.desktop,
    this.child,
    this.appBar,
    this.floatingActionButton,
    this.backgroundColor,
    this.safeArea = true,
  });

  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? child;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final bool safeArea;

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final resolvedChild = _resolveChild(breakpoints);
    final maxWidth = breakpoints.isDesktop
        ? 1400.0
        : breakpoints.isTablet
            ? 900.0
            : double.infinity;
    final horizontalPadding = breakpoints.isMobile ? 16.0 : 24.0;

    final bodyContent = Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 16),
          child: resolvedChild,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      body: safeArea ? SafeArea(child: bodyContent) : bodyContent,
    );
  }

  Widget _resolveChild(ResponsiveBreakpointsData breakpoints) {
    if (breakpoints.isDesktop) {
      return desktop ?? child ?? tablet ?? mobile ?? const SizedBox.shrink();
    }

    if (breakpoints.isTablet) {
      return tablet ?? child ?? desktop ?? mobile ?? const SizedBox.shrink();
    }

    return mobile ?? child ?? tablet ?? desktop ?? const SizedBox.shrink();
  }
}
