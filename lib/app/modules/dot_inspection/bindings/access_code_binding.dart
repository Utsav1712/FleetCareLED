import 'package:get/get.dart';
import '../controllers/access_code_controller.dart';

class AccessCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccessCodeController>(
      () => AccessCodeController(),
    );
  }
}
