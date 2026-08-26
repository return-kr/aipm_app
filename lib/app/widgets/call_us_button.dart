import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CallUsButton extends StatelessWidget {
  const CallUsButton({
    super.key,
    this.phoneNumber = "+91 988 363 2477",
    this.isTransparent = false,
  });

  final String phoneNumber;
  final bool isTransparent;

  /// Removes spaces and other formatting from the phone number.
  String get _cleanNumber {
    return phoneNumber.replaceAll(RegExp(r'[^0-9+]'), '');
  }

  /// Creates the tel URI.
  Uri get _phoneUri {
    return Uri(scheme: 'tel', path: _cleanNumber);
  }

  Future<void> handleCall(BuildContext context) async {
    final screenWidth = MediaQuery.sizeOf(context).width;

    // ============================================================
    // MOBILE / TABLET
    // ============================================================
    //
    // On mobile/tablet:
    // Directly open the phone dialer.
    //
    if (screenWidth < 1024) {
      if (await canLaunchUrl(_phoneUri)) {
        await launchUrl(_phoneUri, mode: LaunchMode.externalApplication);
      }

      return;
    }

    // ============================================================
    // DESKTOP WEB
    // ============================================================
    //
    // Desktop doesn't have a reliable way to transfer the number
    // directly to the user's phone.
    //
    // So show a QR code containing:
    //
    // tel:+919883632477
    //
    // When scanned using a mobile phone, the phone can open
    // its dialer directly.
    //
    _showDesktopCallDialog(context);
  }

  void _showDesktopCallDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ==================================================
                  // PHONE ICON
                  // ==================================================
                  Container(
                    width: 65,
                    height: 65,
                    decoration: const BoxDecoration(
                      color: Color(0xffFDB913),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.phone,
                      size: 32,
                      color: Color(0xff07275B),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ==================================================
                  // TITLE
                  // ==================================================
                  const Text(
                    "Call Us",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff07275B),
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Scan the QR code with your mobile",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),

                  const SizedBox(height: 24),

                  // ==================================================
                  // PHONE NUMBER
                  // ==================================================
                  Text(
                    phoneNumber,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff07275B),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // ==================================================
                  // QR CODE
                  // ==================================================
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: QrImageView(
                      data: 'tel:$_cleanNumber',
                      version: QrVersions.auto,
                      size: 200,
                      backgroundColor: Colors.white,
                      errorCorrectionLevel: QrErrorCorrectLevel.M,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Scan this code to open the phone dialer",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),

                  const SizedBox(height: 25),

                  // ==================================================
                  // CLOSE BUTTON
                  // ==================================================
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff07275B),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "CLOSE",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => handleCall(context),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        width: double.infinity,
        decoration: BoxDecoration(
          color: !isTransparent ? const Color(0xffFDB913) : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          border: isTransparent
              ? Border.all(color: const Color(0xffFDB913), width: 1.5)
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.call, size: 28, color: Color(0xff07275B)),

            const SizedBox(width: 14),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Call Now",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff07275B),
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  phoneNumber,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff07275B),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
