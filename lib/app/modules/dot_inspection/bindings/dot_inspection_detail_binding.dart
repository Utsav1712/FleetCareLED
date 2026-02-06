import 'package:get/get.dart';
import '../controllers/dot_inspection_detail_controller.dart';

class DotInspectionDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DotInspectionDetailController>(
      () => DotInspectionDetailController(),
    );
  }
}
