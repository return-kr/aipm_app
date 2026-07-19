import 'package:get/get.dart';

/// ===============================================================
/// NAVIGATION SERVICE
/// ---------------------------------------------------------------
///
/// Centralized navigation service using GetX.
///
/// Register:
/// Get.put(NavigationService());
///
/// Usage:
/// final navigation = Get.find<NavigationService>();
/// navigation.to('/home');
/// ===============================================================

class NavigationService extends GetxService {
  NavigationService();

  /// Navigate to a named route.
  Future<T?>? to<T>(
    String route, {
    dynamic arguments,
    Map<String, String>? parameters,
  }) {
    return Get.toNamed<T>(route, arguments: arguments, parameters: parameters);
  }

  /// Replace current route.
  Future<T?>? off<T>(
    String route, {
    dynamic arguments,
    Map<String, String>? parameters,
  }) {
    return Get.offNamed<T>(route, arguments: arguments, parameters: parameters);
  }

  /// Remove all previous routes and navigate.
  Future<T?>? offAll<T>(
    String route, {
    dynamic arguments,
    Map<String, String>? parameters,
  }) {
    return Get.offAllNamed<T>(
      route,
      arguments: arguments,
      parameters: parameters,
    );
  }

  /// Go back.
  void back<T>({T? result}) {
    if (Get.isOverlaysOpen) {
      Get.back<T>(result: result);
      return;
    }

    if (Get.key.currentState?.canPop() ?? false) {
      Get.back<T>(result: result);
    }
  }

  /// Close dialog, bottom sheet or snackbar if open.
  void closeOverlay<T>({T? result}) {
    if (Get.isDialogOpen == true ||
        Get.isBottomSheetOpen == true ||
        Get.isSnackbarOpen) {
      Get.back<T>(result: result);
    }
  }
}
