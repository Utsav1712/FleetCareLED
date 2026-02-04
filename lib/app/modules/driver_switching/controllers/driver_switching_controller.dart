import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class DriverSwitchingController extends GetxController {
  final drivers = <DriverProfile>[
    DriverProfile(
        id: 1,
        name: "Meet Patel",
        image: "assets/images/driver_1.png"), // Using generated mock image 1
    DriverProfile(
        id: 2,
        name: "Sagar Sahil",
        image: "assets/images/driver_2.png"), // Using generated mock image 2
    DriverProfile(
        id: 3, name: "Ajay Gediya", image: "assets/images/driver_2.png"),
    DriverProfile(
        id: 4,
        name: "Prince Vadukul",
        image: "assets/images/driver_1.png"), // Reusing for mock
  ].obs;

  final currentDriver = Rx<DriverProfile?>(null);
  final coDriver = Rx<DriverProfile?>(null);

  @override
  void onInit() {
    super.onInit();
    // Initialize with mock data
    currentDriver.value = drivers[3]; // Prince Vadukul
    coDriver.value = drivers[2]; // Ajay Gediya
  }

  void switchDriver() {
    final temp = currentDriver.value;
    currentDriver.value = coDriver.value;
    coDriver.value = temp;
    Get.snackbar("Success", "Drivers Switched Successfully");
  }

  void editDriver(int id) {
    final driver = drivers.firstWhere((d) => d.id == id);
    Get.toNamed(AppRoutes.EDIT_PROFILE,
        arguments: {'name': driver.name, 'image': driver.image});
  }
}

class DriverProfile {
  final int id;
  final String name;
  final String image;

  DriverProfile({required this.id, required this.name, required this.image});
}
