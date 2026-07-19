import 'package:url_launcher/url_launcher.dart';

/// ===============================================================
/// LAUNCH HELPER
/// ---------------------------------------------------------------
///
/// Utility methods for launching URLs, phone calls, emails,
/// WhatsApp, and maps.
/// ===============================================================

class LaunchHelper {
  LaunchHelper._();

  //==========================================================================
  // Generic URL
  //==========================================================================

  static Future<bool> launchUrlString(
    String url, {
    LaunchMode mode = LaunchMode.platformDefault,
  }) async {
    final uri = Uri.parse(url);

    if (!await canLaunchUrl(uri)) {
      return false;
    }

    return launchUrl(uri, mode: mode);
  }

  //==========================================================================
  // Website
  //==========================================================================

  static Future<bool> openWebsite(String url) {
    return launchUrlString(url, mode: LaunchMode.externalApplication);
  }

  //==========================================================================
  // Phone Call
  //==========================================================================

  static Future<bool> call(String phoneNumber) {
    return launchUrlString('tel:$phoneNumber');
  }

  //==========================================================================
  // SMS
  //==========================================================================

  static Future<bool> sms(String phoneNumber) {
    return launchUrlString('sms:$phoneNumber');
  }

  //==========================================================================
  // Email
  //==========================================================================

  static Future<bool> email({
    required String email,
    String? subject,
    String? body,
  }) {
    final uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        if (subject != null) 'subject': subject,
        if (body != null) 'body': body,
      },
    );

    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  //==========================================================================
  // WhatsApp
  //==========================================================================

  static Future<bool> whatsapp({required String phoneNumber, String? message}) {
    final encodedMessage = Uri.encodeComponent(message ?? '');

    return launchUrlString(
      'https://wa.me/$phoneNumber?text=$encodedMessage',
      mode: LaunchMode.externalApplication,
    );
  }

  //==========================================================================
  // Google Maps
  //==========================================================================

  static Future<bool> openMap(String address) {
    final encodedAddress = Uri.encodeComponent(address);

    return launchUrlString(
      'https://www.google.com/maps/search/?api=1&query=$encodedAddress',
      mode: LaunchMode.externalApplication,
    );
  }
}
