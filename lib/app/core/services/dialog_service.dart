import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_durations.dart';

/// ===============================================================
/// DIALOG SERVICE
/// ---------------------------------------------------------------
///
/// Centralized service for dialogs, bottom sheets and snackbars.
///
/// Register:
/// Get.put(DialogService());
///
/// Usage:
/// final dialogService = Get.find`&lt;`DialogService`&gt;`();
/// ===============================================================

class DialogService extends GetxService {
  ///==============================================================
  /// Loading Dialog
  ///==============================================================

  Future<void> showLoading({
    String message = 'Please wait...',
    bool barrierDismissible = false,
  }) {
    return Get.dialog(
      PopScope(
        canPop: barrierDismissible,
        child: Dialog(
          elevation: 0,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 28,
                  height: 28,
                  child: CircularProgressIndicator(strokeWidth: 3),
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: Text(
                    message,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: barrierDismissible,
      transitionDuration: AppDurations.dialogAnimation,
    );
  }

  ///==============================================================
  /// Close Dialog
  ///==============================================================

  void close() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }

  ///==============================================================
  /// Alert Dialog
  ///==============================================================

  Future<bool?> showAlert({
    required String title,
    required String message,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
    bool showCancelButton = false,
  }) {
    return Get.dialog<bool>(
      AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          if (showCancelButton)
            TextButton(
              onPressed: () => Get.back(result: false),
              child: Text(cancelText),
            ),
          FilledButton(
            onPressed: () => Get.back(result: true),
            child: Text(confirmText),
          ),
        ],
      ),
      transitionDuration: AppDurations.dialogAnimation,
    );
  }

  ///==============================================================
  /// Bottom Sheet
  ///==============================================================

  Future<T?> showBottomSheet<T>({
    required Widget child,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return Get.bottomSheet<T>(
      child,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }

  ///==============================================================
  /// Snackbar
  ///==============================================================

  void showSnackbar({
    required String title,
    required String message,
    SnackPosition position = SnackPosition.BOTTOM,
    Color backgroundColor = Colors.black87,
    Color textColor = Colors.white,
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: position,
      backgroundColor: backgroundColor,
      colorText: textColor,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: duration,
    );
  }

  ///==============================================================
  /// Success Snackbar
  ///==============================================================

  void showSuccess(String message) {
    showSnackbar(
      title: 'Success',
      message: message,
      backgroundColor: Colors.green,
    );
  }

  ///==============================================================
  /// Error Snackbar
  ///==============================================================

  void showError(String message) {
    showSnackbar(title: 'Error', message: message, backgroundColor: Colors.red);
  }

  ///==============================================================
  /// Info Snackbar
  ///==============================================================

  void showInfo(String message) {
    showSnackbar(title: 'Info', message: message, backgroundColor: Colors.blue);
  }
}
