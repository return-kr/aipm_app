import 'package:flutter/material.dart';

import '../constants/app_dimensions.dart';

/// ===============================================================
/// RESPONSIVE WRAPPER
/// ---------------------------------------------------------------
///
/// Centers the application content and limits its maximum width.
///
/// Usage:
///
/// ResponsiveWrapper(
///   child: Column(
///     children: [
///       ...
///     ],
///   ),
/// )
/// ===============================================================

class ResponsiveWrapper extends StatelessWidget {
  const ResponsiveWrapper({
    super.key,
    required this.child,
    this.maxWidth = AppDimensions.maxContentWidth,
    this.padding,
  });

  final Widget child;
  final double maxWidth;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    EdgeInsetsGeometry resolvedPadding;

    if (padding != null) {
      resolvedPadding = padding!;
    } else if (screenWidth >= AppDimensions.desktopBreakpoint) {
      resolvedPadding = const EdgeInsets.symmetric(
        horizontal: AppDimensions.pageHorizontalPadding,
      );
    } else if (screenWidth >= AppDimensions.tabletBreakpoint) {
      resolvedPadding = const EdgeInsets.symmetric(
        horizontal: AppDimensions.tabletHorizontalPadding,
      );
    } else {
      resolvedPadding = const EdgeInsets.symmetric(
        horizontal: AppDimensions.mobileHorizontalPadding,
      );
    }

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(padding: resolvedPadding, child: child),
      ),
    );
  }
}
