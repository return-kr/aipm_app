import 'package:flutter/material.dart';

class DynamicText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool softWrap;
  final String? semanticsLabel;
  final Locale? locale;
  final TextDirection? textDirection;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;

  const DynamicText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap = true,
    this.semanticsLabel,
    this.locale,
    this.textDirection,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
  });

  static const double _designWidth = 1440.0;

  static const double _minScale = 0.70;
  static const double _maxScale = 1.15;

  double _getScale(double width) {
    final scale = width / _designWidth;

    return scale.clamp(_minScale, _maxScale);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.sizeOf(context).width;

        final scale = _getScale(screenWidth);

        final originalFontSize = style?.fontSize;

        final scaledFontSize = originalFontSize != null
            ? originalFontSize * scale
            : null;

        final dynamicStyle = style?.copyWith(fontSize: scaledFontSize);

        return Text(
          text,
          style: dynamicStyle,
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
          softWrap: softWrap,
          semanticsLabel: semanticsLabel,
          locale: locale,
          textDirection: textDirection,
          strutStyle: strutStyle,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
        );
      },
    );
  }
}
