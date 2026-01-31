import 'package:get/get.dart';

class HoursOfServiceController extends GetxController {
  final isLogbook = true.obs;

  void toggleView(bool value) {
    isLogbook.value = value;
  }
}
