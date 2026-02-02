import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final nameController = TextEditingController();
  final driverNumberController = TextEditingController();
  final truckNumberController = TextEditingController();
  final aadharController = TextEditingController();
  final licenseController = TextEditingController();
  final truckRcController = TextEditingController();

  final profileImage = "".obs; // URL or path

  @override
  void onInit() {
    super.onInit();
    // Mock Data - In real app, fetch from API/Repository
    nameController.text = "John Doe";
    driverNumberController.text = "9876543210";
    truckNumberController.text = "GJ-01-XX-1234";
    aadharController.text = "1234 5678 9101";
    licenseController.text = "GJ1234567890123";
    truckRcController.text = "RC987654321";
  }

  @override
  void onClose() {
    nameController.dispose();
    driverNumberController.dispose();
    truckNumberController.dispose();
    aadharController.dispose();
    licenseController.dispose();
    truckRcController.dispose();
    super.onClose();
  }

  void pickImage() {
    // Implement image picker logic
    Get.snackbar("Image Picker", "Feature to pick image coming soon!");
  }

  void saveProfile() {
    // Implement save logic api call
    if (nameController.text.isEmpty) {
      Get.snackbar("Error", "Please enter driver name");
      return;
    }

    Get.back();
    Get.snackbar("Success", "Profile Updated Successfully");
  }
}
