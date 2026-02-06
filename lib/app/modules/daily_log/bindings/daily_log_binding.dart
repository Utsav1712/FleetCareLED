import 'package:get/get.dart';

import '../controllers/daily_log_controller.dart';

class DailyLogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DailyLogController>(
      () => DailyLogController(),
    );
  }
}
