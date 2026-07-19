import 'package:aipm_app/app/core/constants/app_durations.dart';
import 'package:flutter/material.dart';

/// ===============================================================
/// FADE IN
/// ---------------------------------------------------------------
/// Reusable fade-in animation widget.
/// ===============================================================

class FadeIn extends StatefulWidget {
  const FadeIn({
    super.key,
    required this.child,
    this.duration = AppDurations.medium,
    this.delay = Duration.zero,
    this.curve = Curves.easeInOut,
  });

  final Widget child;
  final Duration duration;
  final Duration delay;
  final Curve curve;

  @override
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(widget.delay, () {
      if (!mounted) return;

      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1 : 0,
      duration: widget.duration,
      curve: widget.curve,
      child: widget.child,
    );
  }
}
