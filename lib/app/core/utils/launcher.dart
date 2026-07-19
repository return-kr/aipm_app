import '../helpers/launch_helper.dart';

/// ===============================================================
/// LAUNCHER
/// ---------------------------------------------------------------
///
/// Convenience wrapper around [LaunchHelper].
/// Keeps the rest of the application clean.
///
/// Example:
///
/// await Launcher.call('+919876543210');
/// await Launcher.whatsapp(
///   '+919876543210',
///   message: 'Hello',
/// );
/// ===============================================================

class Launcher {
  Launcher._();

  //==========================================================================
  // Website
  //==========================================================================

  static Future<bool> website(String url) {
    return LaunchHelper.openWebsite(url);
  }

  //==========================================================================
  // Phone
  //==========================================================================

  static Future<bool> call(String phoneNumber) {
    return LaunchHelper.call(phoneNumber);
  }

  //==========================================================================
  // SMS
  //==========================================================================

  static Future<bool> sms(String phoneNumber) {
    return LaunchHelper.sms(phoneNumber);
  }

  //==========================================================================
  // Email
  //==========================================================================

  static Future<bool> email({
    required String email,
    String? subject,
    String? body,
  }) {
    return LaunchHelper.email(email: email, subject: subject, body: body);
  }

  //==========================================================================
  // WhatsApp
  //==========================================================================

  static Future<bool> whatsapp(String phoneNumber, {String? message}) {
    return LaunchHelper.whatsapp(phoneNumber: phoneNumber, message: message);
  }

  //==========================================================================
  // Google Maps
  //==========================================================================

  static Future<bool> map(String address) {
    return LaunchHelper.openMap(address);
  }

  //==========================================================================
  // Generic URL
  //==========================================================================

  static Future<bool> url(String url) {
    return LaunchHelper.launchUrlString(url);
  }
}
