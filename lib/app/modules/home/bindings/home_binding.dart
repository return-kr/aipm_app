import 'package:aipm_app/app/data/repository/home_repository.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

/// ===============================================================
/// HOME BINDING
/// ---------------------------------------------------------------
/// Registers dependencies required for the Home module.
/// ===============================================================

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepository>(
      () => HomeRepository(),
      fenix: true,
    );

    Get.lazyPut<HomeController>(
      () => HomeController(
        repository: Get.find<HomeRepository>(),
      ),
      fenix: true,
    );
  }
}