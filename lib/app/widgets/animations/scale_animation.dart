import 'package:aipm_app/app/core/constants/app_durations.dart';
import 'package:flutter/material.dart';

/// ===============================================================
/// SCALE ANIMATION
/// ---------------------------------------------------------------
/// Reusable scale animation widget.
/// ===============================================================

class ScaleAnimation extends StatefulWidget {
  const ScaleAnimation({
    super.key,
    required this.child,
    this.duration = AppDurations.medium,
    this.delay = Duration.zero,
    this.curve = Curves.easeOutBack,
    this.beginScale = 0.9,
    this.endScale = 1.0,
  });

  final double beginScale;
  final Widget child;
  final Curve curve;
  final Duration delay;
  final Duration duration;
  final double endScale;

  @override
  State<ScaleAnimation> createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation> {
  bool _animate = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(widget.delay, () {
      if (!mounted) return;

      setState(() {
        _animate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _animate ? widget.endScale : widget.beginScale,
      duration: widget.duration,
      curve: widget.curve,
      child: AnimatedOpacity(
        opacity: _animate ? 1 : 0,
        duration: widget.duration,
        curve: widget.curve,
        child: widget.child,
      ),
    );
  }
}
