import 'package:get/get.dart';
import '../controllers/hours_of_service_controller.dart';

class HoursOfServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HoursOfServiceController>(
      () => HoursOfServiceController(),
    );
  }
}
