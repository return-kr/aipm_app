import 'package:aipm_app/app/core/constants/app_durations.dart';
import 'package:flutter/material.dart';

/// ===============================================================
/// SLIDE UP
/// ---------------------------------------------------------------
/// Reusable slide-up animation widget.
/// ===============================================================

class SlideUp extends StatefulWidget {
  const SlideUp({
    super.key,
    required this.child,
    this.duration = AppDurations.medium,
    this.delay = Duration.zero,
    this.curve = Curves.easeOut,
    this.beginOffset = const Offset(0, 0.15),
  });

  final Widget child;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final Offset beginOffset;

  @override
  State<SlideUp> createState() => _SlideUpState();
}

class _SlideUpState extends State<SlideUp> {
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
    return AnimatedSlide(
      offset: _animate ? Offset.zero : widget.beginOffset,
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
