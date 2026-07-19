import 'package:aipm_app/app/core/constants/app_durations.dart';
import 'package:aipm_app/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// ===============================================================
/// SOCIAL BUTTON
/// ---------------------------------------------------------------
/// Circular icon button used for social media links.
/// ===============================================================

class SocialButton extends StatefulWidget {
  const SocialButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.tooltip,
    this.size = 46,
    this.iconSize = 22,
    this.backgroundColor = AppColors.primary,
    this.iconColor = Colors.white,
  });

  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final VoidCallback onTap;
  final double size;
  final String? tooltip;

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    Widget button = MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          duration: AppDurations.fast,
          scale: _isHovered ? 1.08 : 1,
          child: AnimatedContainer(
            duration: AppDurations.fast,
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              shape: BoxShape.circle,
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: widget.backgroundColor.withOpacity(0.25),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Icon(
              widget.icon,
              size: widget.iconSize,
              color: widget.iconColor,
            ),
          ),
        ),
      ),
    );

    if (widget.tooltip == null) {
      return button;
    }

    return Tooltip(message: widget.tooltip!, child: button);
  }
}
