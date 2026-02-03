import 'package:get/get.dart';
import '../controllers/driver_switching_controller.dart';

class DriverSwitchingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverSwitchingController>(
      () => DriverSwitchingController(),
    );
  }
}
