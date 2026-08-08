import 'package:flutter/material.dart';

class ResponsiveWrapper extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    bool isMobile,
    bool isTablet,
    bool isDesktop,
  )
  builder;

  const ResponsiveWrapper({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final isMobile = width < 768;

        final isTablet = width >= 768 && width < 1024;

        final isDesktop = width >= 1024;

        return builder(context, isMobile, isTablet, isDesktop);
      },
    );
  }
}
