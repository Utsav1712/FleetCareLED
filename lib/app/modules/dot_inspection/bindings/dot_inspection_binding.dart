import 'package:fleetcare_eld/app/modules/dot_inspection/controllers/dot_inspection_controller.dart';
import 'package:get/get.dart';

class DotInspectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DotInspectionController>(
      () => DotInspectionController(),
    );
  }
}
