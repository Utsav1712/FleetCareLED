import 'package:get/get.dart';

class DashboardController extends GetxController {
  var currentIndex = 0.obs;

  final List<String> titles = [
    "Home Screen",
    "Inbox",
    "Messages",
    "Edit Driver Profile"
  ];

  void changeTab(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
