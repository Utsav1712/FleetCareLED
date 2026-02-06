import 'package:get/get.dart';

class DriverService extends GetxService {
  final drivers = <DriverProfile>[
    DriverProfile(
        id: 1,
        name: "Meet Patel",
        image: "assets/images/driver_1.png"), // Using generated mock image 1
    DriverProfile(
        id: 2,
        name: "Sagar Sahil",
        image: "assets/images/driver_2.png"), // Using generated mock image 2
  ].obs;

  final currentDriver = Rx<DriverProfile?>(null);
  final coDriver = Rx<DriverProfile?>(null);

  @override
  void onInit() {
    super.onInit();
    // Initialize with mock data
    currentDriver.value = drivers[0]; // Meet Patel
    coDriver.value = drivers[1]; // Sagar Sahil
  }

  void switchDriver() {
    final temp = currentDriver.value;
    currentDriver.value = coDriver.value;
    coDriver.value = temp;
    Get.snackbar("Success", "Drivers Switched Successfully");
  }
}

class DriverProfile {
  final int id;
  final String name;
  final String image;

  DriverProfile({required this.id, required this.name, required this.image});
}
