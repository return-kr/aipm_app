import 'package:aipm_app/app/core/constants/app_durations.dart';
import 'package:flutter/material.dart';

/// ===============================================================
/// WIDGET EXTENSION
/// ---------------------------------------------------------------
///
/// Common widget helper extensions.
/// ===============================================================

extension WidgetExtension on Widget {
  //==========================================================================
  // Padding
  //==========================================================================

  Widget paddingAll(double value) {
    return Padding(padding: EdgeInsets.all(value), child: this);
  }

  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  Widget paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      ),
      child: this,
    );
  }

  //==========================================================================
  // Alignment
  //==========================================================================

  Widget center() {
    return Center(child: this);
  }

  Widget align(Alignment alignment) {
    return Align(alignment: alignment, child: this);
  }

  //==========================================================================
  // SizedBox
  //==========================================================================

  Widget sized({double? width, double? height}) {
    return SizedBox(width: width, height: height, child: this);
  }

  Widget expanded({int flex = 1}) {
    return Expanded(flex: flex, child: this);
  }

  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) {
    return Flexible(flex: flex, fit: fit, child: this);
  }

  //==========================================================================
  // Visibility
  //==========================================================================

  Widget visible(bool visible) {
    return Visibility(visible: visible, child: this);
  }

  //==========================================================================
  // Gesture
  //==========================================================================

  Widget onTap(
    VoidCallback? onTap, {
    HitTestBehavior behavior = HitTestBehavior.opaque,
  }) {
    return GestureDetector(behavior: behavior, onTap: onTap, child: this);
  }

  //==========================================================================
  // Animation
  //==========================================================================

  Widget animated({
    Duration duration = AppDurations.normal,
    Curve curve = Curves.easeInOut,
  }) {
    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: curve,
      switchOutCurve: curve,
      child: this,
    );
  }

  //==========================================================================
  // Tooltip
  //==========================================================================

  Widget tooltip(String message) {
    return Tooltip(message: message, child: this);
  }

  //==========================================================================
  // Clip
  //==========================================================================

  Widget clip({
    BorderRadius borderRadius = BorderRadius.zero,
    Clip clipBehavior = Clip.antiAlias,
  }) {
    return ClipRRect(
      borderRadius: borderRadius,
      clipBehavior: clipBehavior,
      child: this,
    );
  }
}

