import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class DotInspectionController extends GetxController {
  // Detail View State
  final date = "May 15, 2022".obs; // Mock data matching image

  void beginInspection() {
    Get.toNamed(AppRoutes.DOT_INSPECTION_DETAIL);
  }

  void sendEldOutputFile() {
    Get.toNamed(AppRoutes.ACCESS_CODE);
  }

  void sendLogs() {
    Get.toNamed(AppRoutes.ACCESS_CODE);
  }
}
