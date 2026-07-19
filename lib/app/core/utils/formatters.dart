import 'package:flutter/services.dart';

/// ===============================================================
/// FORMATTERS
/// ---------------------------------------------------------------
///
/// Common input formatters used throughout the application.
/// ===============================================================

class Formatters {
  Formatters._();

  static final TextInputFormatter decimal = FilteringTextInputFormatter.allow(
    RegExp(r'^\d*\.?\d*'),
  );

  //==========================================================================
  // Numbers
  //==========================================================================

  static final TextInputFormatter digitsOnly =
      FilteringTextInputFormatter.digitsOnly;

  //==========================================================================
  // Email
  //==========================================================================

  /// Prevents spaces in email field.
  static final TextInputFormatter email = FilteringTextInputFormatter.deny(
    RegExp(r"\s"),
  );

  //==========================================================================
  // Name
  //==========================================================================

  /// Allows only alphabets and spaces.
  static final TextInputFormatter name = FilteringTextInputFormatter.allow(
    RegExp(r"[a-zA-Z\s]"),
  );

  //==========================================================================
  // Phone
  //==========================================================================

  /// Allows only digits with maximum length of 10.
  static final List<TextInputFormatter> phone = [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(10),
  ];

  //==========================================================================
  // Characters
  //==========================================================================

  static TextInputFormatter maxLength(int length) {
    return LengthLimitingTextInputFormatter(length);
  }

  static TextInputFormatter allow(RegExp pattern) {
    return FilteringTextInputFormatter.allow(pattern);
  }

  static TextInputFormatter deny(RegExp pattern) {
    return FilteringTextInputFormatter.deny(pattern);
  }
}
