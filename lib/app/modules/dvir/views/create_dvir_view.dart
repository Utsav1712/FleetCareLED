import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/custom_text.dart';
import '../controllers/dvir_controller.dart';

class CreateDvirView extends GetView<DvirController> {
  const CreateDvirView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(
          "Create DVIR",
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
            icon: Icon(Icons.edit_outlined, color: Colors.white, size: 20.sp),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Vehicle Info
            _buildTextField("Vehicle", controller.vehicleController),
            SizedBox(height: 2.h),
            _buildTextField("VIN", controller.vinController),
            SizedBox(height: 2.h),
            _buildTextField("Location", controller.locationController),
            SizedBox(height: 3.h),

            // Visual Circles
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCircleItem("Drive Side"),
                _buildCircleItem("Front"),
                _buildCircleItem(
                    "Passenger Side"), // Typo in design 'Passarger'
                _buildCircleItem("Back"),
              ],
            ),
            SizedBox(height: 3.h),

            // Previous Defects
            CustomText(
              "Previous Defects",
              fontWeight: FontWeight.w700,
              fontSize: 17.sp,
              color: Colors.black87,
            ),
            SizedBox(height: 2.h),
            Obx(() => Column(
                  children: controller.defects.map((defect) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: Row(
                        children: [
                          Icon(
                            defect.isResolved
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color:
                                defect.isResolved ? Colors.green : Colors.black,
                            size: 18.sp,
                          ),
                          SizedBox(width: 3.w),
                          Container(
                            height: 5.h,
                            width: 5.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.blue[100]!,
                                    Colors.white,
                                  ],
                                )),
                          ),
                          SizedBox(width: 3.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(defect.name,
                                  fontWeight: FontWeight.bold, fontSize: 16.sp),
                              CustomText(defect.description,
                                  color: Colors.grey, fontSize: 15.sp),
                            ],
                          ),
                          const Spacer(),
                          CustomText(
                            defect.isResolved ? "Resolved" : "UnResolved",
                            color:
                                defect.isResolved ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                )),

            SizedBox(height: 2.h),
            CustomText(
              "Add New vehicle Defects",
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
            SizedBox(height: 1.h),
            CustomText(
              "It is a long established fact that a reader will be distracted by the readable",
              color: Colors.grey,
              fontSize: 15.sp,
            ),
            SizedBox(height: 2.h),
            SizedBox(
              width: double.infinity,
              height: 6.h,
              child: OutlinedButton(
                onPressed: controller.navigateToAddDefect,
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text(
                  "Add Defects",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 3.h),

            // Additional Info
            _buildTextField("License Plate", controller.licensePlateController),
            SizedBox(height: 2.h),
            _buildTextField("Odometer (mi)",
                controller.odometerController), // Typo in design 'Odomeber'

            SizedBox(height: 3.h),
            CustomText(
              "Choose Inspection Type",
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                Expanded(
                  child: Obx(() => _buildInspectionButton("Pre-Trip",
                      controller.inspectionType.value == "Pre-Trip")),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Obx(() => _buildInspectionButton("Post-Trip",
                      controller.inspectionType.value == "Post-Trip")),
                ),
              ],
            ),

            SizedBox(height: 4.h),
            SizedBox(
              width: double.infinity,
              height: 6.h,
              child: ElevatedButton(
                onPressed: controller.submitDvir,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController textCtrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(label,
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
            color: Colors.black87),
        SizedBox(height: 1.h),
        TextFormField(
          controller: textCtrl,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.8.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.05),
          ),
        ),
      ],
    );
  }

  Widget _buildCircleItem(String label) {
    return Column(
      children: [
        Container(
          height: 7.h,
          width: 7.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue[100]!,
                  Colors.white,
                ],
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 4,
                    spreadRadius: 1)
              ]),
        ),
        SizedBox(height: 1.h),
        Text(
          label,
          style: TextStyle(
              fontSize: 13.5.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87),
        ),
      ],
    );
  }

  Widget _buildInspectionButton(String label, bool isSelected) {
    return InkWell(
      onTap: () => controller.setInspectionType(label),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.5.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white,
          border: Border.all(
              color: isSelected ? Colors.black : Colors.grey.withOpacity(0.5),
              width: isSelected ? 1.5 : 1),
          borderRadius: BorderRadius.circular(12.0),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
