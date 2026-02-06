import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../edit_profile/controllers/edit_profile_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );
    Get.lazyPut<EditProfileController>(
      () => EditProfileController(),
      fenix: true,
    );
  }
}
