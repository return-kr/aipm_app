import 'package:aipm_app/app/core/constants/app_durations.dart';
import 'package:flutter/material.dart';

/// ===============================================================
/// HOVER SCALE
/// ---------------------------------------------------------------
/// Reusable widget that applies a smooth scale animation when the
/// mouse pointer hovers over its child.
/// ===============================================================

class HoverScale extends StatefulWidget {
  const HoverScale({
    super.key,
    required this.child,
    this.scale = 1.03,
    this.duration = AppDurations.medium,
    this.curve = Curves.easeInOut,
    this.onTap,
    this.cursor = SystemMouseCursors.click,
  });

  final Widget child;
  final MouseCursor cursor;
  final Curve curve;
  final Duration duration;
  final VoidCallback? onTap;
  final double scale;

  @override
  State<HoverScale> createState() => _HoverScaleState();
}

class _HoverScaleState extends State<HoverScale> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.cursor,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isHovered ? widget.scale : 1.0,
          duration: widget.duration,
          curve: widget.curve,
          child: widget.child,
        ),
      ),
    );
  }
}
