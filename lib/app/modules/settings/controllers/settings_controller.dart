import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  // HOS Exemptions - USA
  final is16HourShortHaulEnabled = false.obs;
  final isAdverseDrivingUSAEnabled = false.obs;
  final isAgricultureEnabled = false.obs;

  // HOS Exemptions - Canada
  final isAdverseDrivingCanadaEnabled = false.obs;
  final isDeferralOffDutyEnabled = false.obs;

  // Font Options
  final fontSize = 14.0.obs;
  final fontStyle = "Normal".obs;

  // Display & Brightness
  final brightness = 0.5.obs;
  final volume = 0.5.obs;

  // Permissions
  final isLocationEnabled = true.obs;
  final isStorageEnabled = true.obs;
  final isBluetoothEnabled = false.obs;

  // OBD
  final isScanningObd = false.obs;
  final availableObdDevices = <String>[].obs;
  final connectedObdDevice = "".obs;

  @override
  void onInit() {
    super.onInit();
    // Simulate checking permissions or loading saved prefs
  }

  // Toggle Methods
  void toggle16HourShortHaul(bool val) => is16HourShortHaulEnabled.value = val;
  void toggleAdverseDrivingUSA(bool val) =>
      isAdverseDrivingUSAEnabled.value = val;
  void toggleAgriculture(bool val) => isAgricultureEnabled.value = val;

  void toggleAdverseDrivingCanada(bool val) =>
      isAdverseDrivingCanadaEnabled.value = val;
  void toggleDeferralOffDuty(bool val) => isDeferralOffDutyEnabled.value = val;

  // Font Methods
  void changeFontSize(double val) => fontSize.value = val;
  void changeFontStyle(String val) => fontStyle.value = val;

  // Display Methods
  void changeBrightness(double val) => brightness.value = val;
  void changeVolume(double val) => volume.value = val;

  void toggleLocation(bool val) => isLocationEnabled.value = val;
  void toggleStorage(bool val) => isStorageEnabled.value = val;
  void toggleBluetooth(bool val) => isBluetoothEnabled.value = val;

  // OBD Methods
  void scanForObd() async {
    isScanningObd.value = true;
    await Future.delayed(const Duration(seconds: 2)); // Mock scan
    availableObdDevices.assignAll(["OBD-II Device A", "ELM327 Interface"]);
    isScanningObd.value = false;
  }

  void connectToObd(String device) {
    connectedObdDevice.value = device;
    Get.snackbar("OBD Connected", "Connected to $device");
  }
}
