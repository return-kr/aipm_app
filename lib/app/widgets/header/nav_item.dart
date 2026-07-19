import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// ===============================================================
/// NAV ITEM
/// ---------------------------------------------------------------
/// Reusable navigation item used in the desktop header.
/// ===============================================================

class NavItem extends StatefulWidget {
  const NavItem({
    super.key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final String title;

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color textColor = widget.isSelected
        ? AppColors.primary
        : (_isHovered ? AppColors.primary : AppColors.textPrimary);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDimensions.radius8),
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacing12,
            vertical: AppDimensions.spacing10,
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              color: textColor,
              fontSize: 15,
              fontWeight: widget.isSelected ? FontWeight.w700 : FontWeight.w600,
            ),
            child: Text(widget.title),
          ),
        ),
      ),
    );
  }
}
