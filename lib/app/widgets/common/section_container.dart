import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/responsive/responsive_wrapper.dart';
import 'package:flutter/material.dart';

/// ===============================================================
/// SECTION CONTAINER
/// ---------------------------------------------------------------
/// Standard wrapper used by every section on the Home page.
///
/// Features:
/// • Responsive horizontal padding
/// • Optional max width
/// • Configurable vertical spacing
/// • Background color
/// • Background decoration
/// • Section key support (for scrolling)
/// ===============================================================

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.child,
    this.sectionKey,
    this.backgroundColor,
    this.decoration,
    this.padding,
    this.margin,
    this.maxWidth = AppDimensions.maxContentWidth,
  });

  final Color? backgroundColor;
  final Widget child;
  final Decoration? decoration;
  final EdgeInsetsGeometry? margin;
  final double maxWidth;
  final EdgeInsetsGeometry? padding;
  final GlobalKey? sectionKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sectionKey,
      width: double.infinity,
      margin: margin,
      decoration: decoration,
      color: decoration == null ? backgroundColor : null,
      child: Padding(
        padding:
            padding ??
            const EdgeInsets.symmetric(vertical: AppDimensions.sectionSpacing),
        child: ResponsiveWrapper(maxWidth: maxWidth, child: child),
      ),
    );
  }
}
