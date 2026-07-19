/// ===============================================================
/// VALIDATORS
/// ---------------------------------------------------------------
///
/// Common form validators used throughout the application.
/// ===============================================================

class Validators {
  Validators._();

  //==========================================================================
  // Name
  //==========================================================================

  static String? validateName(String? value) {
    final text = value?.trim() ?? '';

    if (text.isEmpty) {
      return 'Please enter your name';
    }

    if (text.length < 3) {
      return 'Name must be at least 3 characters';
    }

    return null;
  }

  //==========================================================================
  // Phone Number
  //==========================================================================

  static String? validatePhone(String? value) {
    final text = value?.trim() ?? '';

    if (text.isEmpty) {
      return 'Please enter your phone number';
    }

    if (!RegExp(r'^[6-9]\d{9}$').hasMatch(text)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  //==========================================================================
  // Email
  //==========================================================================

  static String? validateEmail(String? value) {
    final text = value?.trim() ?? '';

    if (text.isEmpty) {
      return 'Please enter your email';
    }

    if (!RegExp(r'^[\w\-.]+@([\w\-]+\.)+[\w\-]{2,4}$').hasMatch(text)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  //==========================================================================
  // Required Field
  //==========================================================================

  static String? validateRequired(
    String? value, {
    String fieldName = 'This field',
  }) {
    if ((value ?? '').trim().isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }

  //==========================================================================
  // Pickup Location
  //==========================================================================

  static String? validatePickupLocation(String? value) {
    final text = value?.trim() ?? '';

    if (text.isEmpty) {
      return 'Please enter pickup location';
    }

    return null;
  }

  //==========================================================================
  // Destination Location
  //==========================================================================

  static String? validateDestinationLocation(String? value) {
    final text = value?.trim() ?? '';

    if (text.isEmpty) {
      return 'Please enter destination location';
    }

    return null;
  }

  //==========================================================================
  // Moving Date
  //==========================================================================

  static String? validateMovingDate(String? value) {
    final text = value?.trim() ?? '';

    if (text.isEmpty) {
      return 'Please select moving date';
    }

    return null;
  }

  //==========================================================================
  // Message
  //==========================================================================

  static String? validateMessage(String? value) {
    final text = value?.trim() ?? '';

    if (text.isEmpty) {
      return 'Please enter your message';
    }

    if (text.length < 10) {
      return 'Message must be at least 10 characters';
    }

    return null;
  }
}
