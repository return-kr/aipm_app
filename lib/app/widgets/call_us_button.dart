import 'package:aipm_app/app/data/app_colors.dart';
import 'package:aipm_app/app/data/app_font_size.dart';
import 'package:aipm_app/app/theme/app_text_styles.dart';
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
          backgroundColor: AppColors.white,
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
                      color: AppColors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.phone,
                      size: 32,
                      color: AppColors.deepNavy,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ==================================================
                  // TITLE
                  // ==================================================
                  Text(
                    "Call Us",
                    style: AppTextStyles.oswald800(
                      fontSize: AppFontSize.fs26,
                      color: AppColors.deepNavy,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Scan the QR code with your mobile",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.barlow500(
                      fontSize: AppFontSize.fs16,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ==================================================
                  // PHONE NUMBER
                  // ==================================================
                  Text(
                    phoneNumber,
                    style: AppTextStyles.oswald800(
                      fontSize: AppFontSize.fs26,
                      color: AppColors.deepNavy,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // ==================================================
                  // QR CODE
                  // ==================================================
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: QrImageView(
                      data: 'tel:$_cleanNumber',
                      version: QrVersions.auto,
                      size: 200,
                      backgroundColor: AppColors.white,
                      errorCorrectionLevel: QrErrorCorrectLevel.M,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "Scan this code to open the phone dialer",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.barlow500(
                      fontSize: AppFontSize.fs16,
                      color: Colors.grey,
                    ),
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
                        backgroundColor: AppColors.navyBlue,
                        foregroundColor: AppColors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "CLOSE",
                        style: AppTextStyles.barlow500(
                          fontSize: AppFontSize.fs16,
                          color: AppColors.white,
                        ),
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
