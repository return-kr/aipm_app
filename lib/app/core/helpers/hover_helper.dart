import 'package:flutter/material.dart';

import '../constants/app_durations.dart';

/// ===============================================================
/// HOVER HELPER
/// ---------------------------------------------------------------
///
/// A reusable widget that provides hover interactions for
/// Flutter Web/Desktop.
///
/// Features:
/// • Mouse cursor
/// • Hover detection
/// • Optional scale animation
/// • Optional translation animation
/// • Hover callback
/// ===============================================================

class HoverHelper extends StatefulWidget {
  const HoverHelper({
    super.key,
    required this.child,
    this.onTap,
    this.onHover,
    this.scale = 1.02,
    this.translateY = -4,
    this.duration = AppDurations.fast,
    this.curve = Curves.easeInOut,
    this.cursor = SystemMouseCursors.click,
    this.enableScale = true,
    this.enableTranslation = true,
  });

  final Widget child;
  final MouseCursor cursor;
  final Curve curve;
  final Duration duration;
  final bool enableScale;
  final bool enableTranslation;
  final ValueChanged<bool>? onHover;
  final VoidCallback? onTap;
  final double scale;
  final double translateY;

  @override
  State<HoverHelper> createState() => _HoverHelperState();
}

class _HoverHelperState extends State<HoverHelper> {
  bool _isHovered = false;

  void _updateHover(bool value) {
    if (_isHovered == value) return;

    setState(() {
      _isHovered = value;
    });

    widget.onHover?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.cursor,
      onEnter: (_) => _updateHover(true),
      onExit: (_) => _updateHover(false),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: widget.duration,
          curve: widget.curve,
          transform: Matrix4.identity()
            ..translate(
              0.0,
              _isHovered && widget.enableTranslation ? widget.translateY : 0.0,
            )
            ..scale(_isHovered && widget.enableScale ? widget.scale : 1.0),
          child: widget.child,
        ),
      ),
    );
  }
}
