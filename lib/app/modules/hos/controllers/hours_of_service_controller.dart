import 'package:get/get.dart';
import '../../../services/driver_service.dart';

class HoursOfServiceController extends GetxController {
  final DriverService _driverService = Get.find<DriverService>();

  Rx<DriverProfile?> get currentDriver => _driverService.currentDriver;
  final isLogbook = true.obs;

  void toggleView(bool value) {
    isLogbook.value = value;
  }
}
