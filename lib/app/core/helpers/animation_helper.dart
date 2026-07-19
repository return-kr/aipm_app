import 'package:flutter/material.dart';

import '../constants/app_durations.dart';

/// ===============================================================
/// ANIMATION HELPER
/// ---------------------------------------------------------------
///
/// Reusable animation widgets used throughout the application.
/// ===============================================================

class AnimationHelper {
  AnimationHelper._();

  /// Fade animation.
  static Widget fade({
    required Widget child,
    Duration duration = AppDurations.normal,
    Curve curve = Curves.easeInOut,
    double opacity = 1,
  }) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: duration,
      curve: curve,
      child: child,
    );
  }

  /// Scale animation.
  static Widget scale({
    required Widget child,
    Duration duration = AppDurations.normal,
    Curve curve = Curves.easeInOut,
    double scale = 1,
    Alignment alignment = Alignment.center,
  }) {
    return AnimatedScale(
      scale: scale,
      duration: duration,
      curve: curve,
      alignment: alignment,
      child: child,
    );
  }

  /// Slide animation.
  static Widget slide({
    required Widget child,
    Duration duration = AppDurations.normal,
    Curve curve = Curves.easeInOut,
    Offset offset = Offset.zero,
  }) {
    return AnimatedSlide(
      offset: offset,
      duration: duration,
      curve: curve,
      child: child,
    );
  }

  /// Rotation animation.
  static Widget rotate({
    required Widget child,
    Duration duration = AppDurations.normal,
    Curve curve = Curves.easeInOut,
    double turns = 0,
  }) {
    return AnimatedRotation(
      turns: turns,
      duration: duration,
      curve: curve,
      child: child,
    );
  }

  /// Size animation.
  static Widget size({
    required Widget child,
    Duration duration = AppDurations.normal,
    Curve curve = Curves.easeInOut,
    Alignment alignment = Alignment.center,
  }) {
    return AnimatedSize(
      duration: duration,
      curve: curve,
      alignment: alignment,
      child: child,
    );
  }

  /// Container animation.
  static Widget container({
    required Widget child,
    Duration duration = AppDurations.normal,
    Curve curve = Curves.easeInOut,
    double? width,
    double? height,
    Color? color,
    Decoration? decoration,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    AlignmentGeometry? alignment,
    Matrix4? transform,
  }) {
    return AnimatedContainer(
      duration: duration,
      curve: curve,
      width: width,
      height: height,
      color: color,
      decoration: decoration,
      padding: padding,
      margin: margin,
      alignment: alignment,
      transform: transform,
      child: child,
    );
  }

  /// Animated switch between widgets.
  static Widget switcher({
    required Widget child,
    Duration duration = AppDurations.normal,
    Curve switchInCurve = Curves.easeIn,
    Curve switchOutCurve = Curves.easeOut,
  }) {
    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: switchInCurve,
      switchOutCurve: switchOutCurve,
      child: child,
    );
  }
}
