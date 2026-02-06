import 'package:get/get.dart';
import '../../edit_profile/controllers/edit_profile_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<EditProfileController>(
      () => EditProfileController(),
    );
  }
}
