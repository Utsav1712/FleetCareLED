import 'package:get/get.dart';

class DotInspectionController extends GetxController {
  void beginInspection() {
    Get.snackbar("Inspection", "Starting Inspection...");
  }

  void sendEldOutputFile() {
    Get.snackbar("ELD Output", "Sending ELD Output File...");
  }

  void sendLogs() {
    Get.snackbar("Logs", "Sending Logs...");
  }
}
