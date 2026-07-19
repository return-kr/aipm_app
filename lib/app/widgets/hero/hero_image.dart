import 'package:aipm_app/app/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

/// ===============================================================
/// HERO IMAGE
/// ---------------------------------------------------------------
/// Right side illustration for the Hero section.
/// ===============================================================

class HeroImage extends StatelessWidget {
  const HeroImage({
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
  });

  final BoxFit fit;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppAssets.hero,
        height: height,
        width: width,
        fit: fit,
        errorBuilder: (_, _, _) {
          return const Icon(Icons.local_shipping, size: 180);
        },
      ),
    );
  }
}
