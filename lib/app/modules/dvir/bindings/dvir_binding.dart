import 'package:get/get.dart';
import '../controllers/dvir_controller.dart';

class DvirBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DvirController>(
      () => DvirController(),
    );
  }
}
