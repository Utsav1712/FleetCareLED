import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_text.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackground,
          appBar: AppBar(
            title: CustomText("Settings",
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600),
            backgroundColor: AppColors.primary,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, size: 21.sp),
              onPressed: () => Get.back(),
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(4.w),
            child: Column(
              children: [
                _buildSettingsTile(
                  icon: Icons.help_outline,
                  title: "Help",
                  subtitle: "Official documents & guides",
                  onTap: () => _showHelpDialog(context, controller),
                ),
                _buildSettingsTile(
                  icon: Icons.timer,
                  title: "HOS Exemptions",
                  subtitle: "USA & Canada exemptions",
                  onTap: () => _showExemptionsDialog(context, controller),
                ),
                _buildSettingsTile(
                  icon: Icons.build,
                  title: "OBD Troubleshooting",
                  subtitle: "Diagnostics & Connection",
                  onTap: () => _showObdDialog(context, controller),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSettingsTile(
      {required IconData icon,
      required String title,
      required String subtitle,
      required VoidCallback onTap}) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 2.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.sp)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.lightBlueBg,
          child: Icon(icon, color: AppColors.primary),
        ),
        title: CustomText(title, fontWeight: FontWeight.bold, fontSize: 16.sp),
        subtitle: CustomText(subtitle, color: Colors.grey, fontSize: 14.sp),
        trailing: Icon(Icons.chevron_right, size: 20.sp),
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      ),
    );
  }

  // 📄 Help Dialog
  void _showHelpDialog(BuildContext context, SettingsController controller) {
    Get.defaultDialog(
      title: "Official Documents",
      content: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
            title: const Text("User Manual (USA)"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
            title: const Text("User Manual (Canada)"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.description, color: Colors.blue),
            title: const Text("DOT Reference Card"),
            onTap: () {},
          ),
        ],
      ),
      confirm:
          TextButton(onPressed: () => Get.back(), child: const Text("Close")),
    );
  }

  // 🚛 Exemptions Dialog
  void _showExemptionsDialog(
      BuildContext context, SettingsController controller) {
    Get.defaultDialog(
      title: "HOS Exemptions",
      content: SizedBox(
        width: 80.w,
        height: 50.h,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText("USA Exemptions",
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: AppColors.primary),
              Obx(() => SwitchListTile(
                    title: const Text("16 Hour Short Haul"),
                    value: controller.is16HourShortHaulEnabled.value,
                    onChanged: controller.toggle16HourShortHaul,
                  )),
              Obx(() => SwitchListTile(
                    title: const Text("Adverse Driving"),
                    value: controller.isAdverseDrivingUSAEnabled.value,
                    onChanged: controller.toggleAdverseDrivingUSA,
                  )),
              Obx(() => SwitchListTile(
                    title: const Text("Agriculture"),
                    value: controller.isAgricultureEnabled.value,
                    onChanged: controller.toggleAgriculture,
                  )),
              const Divider(),
              CustomText("Canada Exemptions",
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: AppColors.primary),
              Obx(() => SwitchListTile(
                    title: const Text("Adverse Driving Condition"),
                    value: controller.isAdverseDrivingCanadaEnabled.value,
                    onChanged: controller.toggleAdverseDrivingCanada,
                  )),
              Obx(() => SwitchListTile(
                    title: const Text("Deferral of Daily Off-Duty"),
                    value: controller.isDeferralOffDutyEnabled.value,
                    onChanged: controller.toggleDeferralOffDuty,
                  )),
            ],
          ),
        ),
      ),
      confirm:
          TextButton(onPressed: () => Get.back(), child: const Text("Close")),
    );
  }

  // 🔌 OBD Dialog
  void _showObdDialog(BuildContext context, SettingsController controller) {
    Get.defaultDialog(
      title: "OBD Troubleshooting",
      content: SizedBox(
        width: 80.w,
        height: 40.h,
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: controller.scanForObd,
              icon: const Icon(Icons.bluetooth_searching),
              label: const Text("Scan for Devices"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white),
            ),
            SizedBox(height: 2.h),
            Expanded(
              child: Obx(() {
                if (controller.isScanningObd.value)
                  return const Center(child: CircularProgressIndicator());
                if (controller.availableObdDevices.isEmpty)
                  return const Center(child: Text("No devices found"));
                return ListView.builder(
                  itemCount: controller.availableObdDevices.length,
                  itemBuilder: (ctx, i) {
                    final device = controller.availableObdDevices[i];
                    return ListTile(
                      leading: const Icon(Icons.directions_car),
                      title: Text(device),
                      trailing: ElevatedButton(
                        onPressed: () => controller.connectToObd(device),
                        child: const Text("Connect"),
                      ),
                    );
                  },
                );
              }),
            ),
            const Divider(),
            Obx(() => Text(
                "Status: ${controller.connectedObdDevice.value.isEmpty ? 'Disconnected' : 'Connected to ${controller.connectedObdDevice.value}'}")),
          ],
        ),
      ),
      confirm:
          TextButton(onPressed: () => Get.back(), child: const Text("Close")),
    );
  }
}
