import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../../../services/driver_service.dart';

class DriverSwitchingController extends GetxController {
  final DriverService _driverService = Get.find<DriverService>();

  RxList<DriverProfile> get drivers => _driverService.drivers;
  Rx<DriverProfile?> get currentDriver => _driverService.currentDriver;
  Rx<DriverProfile?> get coDriver => _driverService.coDriver;

  void switchDriver() {
    _driverService.switchDriver();
  }

  void editDriver(int id) {
    final driver = drivers.firstWhere((d) => d.id == id);
    Get.toNamed(AppRoutes.EDIT_PROFILE,
        arguments: {'name': driver.name, 'image': driver.image});
  }
}
