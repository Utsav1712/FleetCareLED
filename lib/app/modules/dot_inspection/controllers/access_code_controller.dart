import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class AccessCodeController extends GetxController {
  final code = "".obs;
  final isConfirming = false.obs; // false = Set Mode, true = Confirm Mode
  String _firstCode = "";

  void onKeyTap(String value) {
    if (code.value.length < 4) {
      code.value += value;
      if (code.value.length == 4) {
        _handleCodeCompletion();
      }
    }
  }

  void onBackspace() {
    if (code.value.isNotEmpty) {
      code.value = code.value.substring(0, code.value.length - 1);
    }
  }

  void _handleCodeCompletion() {
    if (!isConfirming.value) {
      // Set Mode Completed
      _firstCode = code.value;
      // Small delay for UX
      Future.delayed(const Duration(milliseconds: 300), () {
        code.value = "";
        isConfirming.value = true;
      });
    } else {
      // Confirm Mode Completed
      if (code.value == _firstCode) {
        // Success
        Get.offNamed(AppRoutes.DOT_INSPECTION_DETAIL);
      } else {
        // Mismatch
        Get.snackbar("Error", "Codes do not match. Please try again.");
        code.value = "";
        // Optional: Go back to 'Set' mode or just retry confirm?
        // Usually better to let them retry confirm or give option to reset start.
        // For now, let's reset to start if they fail, or just clear confirm.
        // Let's clear and stay in confirm for now, or reset whole flow?
        // Simple approach: Clear current code, stay in confirm.
      }
    }
  }

  void onSkip() {
    Get.offNamed(AppRoutes.DOT_INSPECTION_DETAIL);
  }
}
