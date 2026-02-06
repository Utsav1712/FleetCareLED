import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_text_field.dart';
import '../../../global_widgets/custom_text.dart';
import '../controllers/assignment_controller.dart';

class SelectShippingView extends StatelessWidget {
  const SelectShippingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssignmentController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: CustomText(
              "Select Shipping ID(s)",
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            centerTitle: true,
            backgroundColor: AppColors.primary,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 20.sp),
              onPressed: () => Get.back(),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.add, color: Colors.white, size: 20.sp),
                onPressed: controller.navigateToManualShipping,
              )
            ],
          ),
          body: Column(
            children: [
              // 🔍 Search bar
              Padding(
                padding: EdgeInsets.all(4.w),
                child: CustomTextField(
                  hintText: "Search here...",
                  suffixIcon:
                      Icon(Icons.search, color: Colors.grey, size: 20.sp),
                ),
              ),

              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  children: [
                    // Suggested Section
                    _buildSectionHeader("Suggested (1)"),
                    SizedBox(height: 1.h),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)),
                      ),
                      // Suggested item (Hardcoded logic based on controller "Suggested" or first item)
                      // Controller doesn't have explicit "suggested" so using a known one or first
                      child: _shippingTile(
                        id: "SHIP-12045",
                        controller: controller,
                        subtitle: "Last Selected",
                        isFirst: true,
                        isLast: false,
                      ),
                    ),
                    SizedBox(height: 3.h),

                    // Other Shipping IDs Section
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          _buildSectionHeaderBox(
                              "Other Shipping IDs (${controller.shippingIds.length})"),
                          ...controller.shippingIds
                              .asMap()
                              .entries
                              .map((entry) {
                            final index = entry.key;
                            final id = entry.value;
                            return _shippingTile(
                              id: id,
                              controller: controller,
                              isFirst: false,
                              isLast:
                                  index == controller.shippingIds.length - 1,
                              showDivider:
                                  index != controller.shippingIds.length - 1,
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),

              // DONE button
              Padding(
                padding: EdgeInsets.all(4.w),
                child: CustomButton(
                  label: "Done",
                  height: 6.h,
                  width: double.infinity,
                  borderRadius: 30,
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionHeaderBox(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
      decoration: BoxDecoration(
        color: Color(0xFFEBF8FE), // Light blue background
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildSectionHeaderBox(title),
        ],
      ),
    );
  }

  Widget _shippingTile({
    required String id,
    required AssignmentController controller,
    String? subtitle,
    bool isFirst = false,
    bool isLast = false,
    bool showDivider = false,
  }) {
    final bool isSelected = controller.selectedShippingIds.contains(id);

    return Column(
      children: [
        ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.5.h),
          title: Text(
            id,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: isSelected ? AppColors.primary : Colors.black,
            ),
          ),
          subtitle: subtitle != null
              ? Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey, fontSize: 13.5.sp),
                )
              : null,
          trailing: isSelected
              ? Icon(Icons.check_box_outlined,
                  color: AppColors.primary, size: 22.sp)
              : null,
          onTap: () {
            controller.toggleShippingId(id);
          },
        ),
        if (showDivider)
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey.shade200,
            indent: 4.w,
            endIndent: 4.w,
          ),
      ],
    );
  }
}
