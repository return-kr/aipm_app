import 'package:aipm_app/app/core/constants/app_durations.dart';
import 'package:flutter/material.dart';

/// ===============================================================
/// HOVER ANIMATION
/// ---------------------------------------------------------------
/// Reusable hover animation widget for Flutter Web.
/// Adds a subtle lift and scale effect when hovered.
/// ===============================================================

class HoverAnimation extends StatefulWidget {
  const HoverAnimation({
    super.key,
    required this.child,
    this.onTap,
    this.translateY = -6,
    this.scale = 1.02,
    this.duration = AppDurations.fast,
    this.curve = Curves.easeInOut,
    this.cursor = SystemMouseCursors.click,
  });

  final Widget child;
  final MouseCursor cursor;
  final Curve curve;
  final Duration duration;
  final VoidCallback? onTap;
  final double scale;
  final double translateY;

  @override
  State<HoverAnimation> createState() => _HoverAnimationState();
}

class _HoverAnimationState extends State<HoverAnimation> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.cursor,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: widget.duration,
          curve: widget.curve,
          transform: Matrix4.identity()
            ..translate(0.0, _isHovered ? widget.translateY : 0.0)
            ..scale(_isHovered ? widget.scale : 1.0),
          child: widget.child,
        ),
      ),
    );
  }
}
