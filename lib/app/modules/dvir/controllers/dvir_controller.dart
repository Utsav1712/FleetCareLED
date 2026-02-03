import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DvirController extends GetxController {
  // Form Controllers
  final vehicleController = TextEditingController(text: "25");
  final vinController = TextEditingController(text: "1XKWDFSFVVB45D1X152");
  final locationController = TextEditingController(text: "Double D Yard");
  final licensePlateController = TextEditingController(text: "129655");
  final odometerController = TextEditingController(text: "786971");

  // State Variables
  final inspectionType = "Pre-Trip".obs; // Pre-Trip or Post-Trip
  final selectedDefectLocation = 0.obs; // 0: Drive Side, 1: Front, etc.

  // Mock Defects Data
  final defects = <DefectItem>[
    DefectItem(
        name: "Belts Hoses", description: "Belts Hoses", isResolved: true),
    DefectItem(
        name: "Belts Hoses", description: "Belts Hoses", isResolved: false),
  ].obs;

  @override
  void onClose() {
    vehicleController.dispose();
    vinController.dispose();
    locationController.dispose();
    licensePlateController.dispose();
    odometerController.dispose();
    super.onClose();
  }

  void setInspectionType(String type) {
    inspectionType.value = type;
  }

  void toggleDefectSelection(int index) {
    // Logic for selecting a defect if needed
  }

  void addDefects() {
    Get.snackbar("Add Defects", "Feature coming soon");
  }

  void submitDvir() {
    Get.snackbar("Success", "DVIR Created Successfully");
  }
}

class DefectItem {
  final String name;
  final String description;
  final bool isResolved;

  DefectItem({
    required this.name,
    required this.description,
    required this.isResolved,
  });
}
