import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../global_widgets/custom_text.dart';
import '../controllers/daily_log_controller.dart';
import '../../../core/values/app_colors.dart';
import '../widgets/hos_daily_graph.dart';
import 'trailer_view.dart';
import 'shipping_id_view.dart';

class DailyLogView extends StatelessWidget {
  const DailyLogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DailyLogController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackground,
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            title: CustomText(
              "Daily Log",
              color: Colors.white,
              fontSize: 19.sp, // Increased
              fontWeight: FontWeight.w600,
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, size: 21.sp),
              onPressed: () => Get.back(),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 3.w),
                child: Icon(Icons.edit_note, size: 22.sp),
              )
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(4.w),
            child: Column(
              children: [
                // 📅 Date Header
                Container(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.chevron_left, size: 22.sp),
                      ),
                      CustomText(
                        "Sunday, Oct 19th, 2025",
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp, // Increased
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.chevron_right, size: 22.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),

                // 📊 Graph
                const HosDailyGraph(),
                SizedBox(height: 2.h),

                // 📝 Forms Section
                _buildSectionCard("Forms", [
                  _buildNavItem("Trailer",
                      onTap: () => Get.to(() => const TrailerView())),
                  const Divider(),
                  _buildNavItem("Shipping IDs",
                      onTap: () => Get.to(() => const ShippingIdView())),
                ]),
                SizedBox(height: 2.h),

                // 📋 Logs Section
                Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(
                            "Logs",
                            fontSize: 17.sp, // Matched section headers
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(height: 1.5.h),
                      Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          color: AppColors.lightBlueBg,
                          borderRadius: BorderRadius.circular(12.sp),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(2.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: const LinearGradient(
                                  colors: [Colors.white, Color(0xFFB3E5FC)],
                                ),
                              ),
                              child: Icon(Icons.power_settings_new,
                                  color: AppColors.primary, size: 20.sp),
                            ),
                            SizedBox(width: 3.w),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CustomText("Off Duty",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp),
                                    SizedBox(width: 2.w),
                                    CustomText("12:00 AM - 5h 3m",
                                        color: AppColors.primary,
                                        fontSize: 14.sp),
                                  ],
                                ),
                                SizedBox(height: 0.5.h),
                                CustomText("No Location",
                                    color: AppColors.textSecondary,
                                    fontSize: 14.sp),
                              ],
                            )),
                            Icon(Icons.edit_outlined,
                                color: AppColors.primary, size: 20.sp),
                          ],
                        ),
                      ),
                      SizedBox(height: 1.h),
                      const Divider(),
                      _buildNavItem("Add Remark"),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),

                // 🛡️ Exemptions
                _buildSectionCard("Exemptions", [
                  _buildNavItem("Adverse Driving (USA)"),
                ]),
                SizedBox(height: 2.h),

                // ➕ More Section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText("More",
                          fontSize: 17.sp, fontWeight: FontWeight.bold),
                      SizedBox(height: 2.h),
                      CustomText("Ruleset",
                          fontWeight: FontWeight.bold, fontSize: 16.sp),
                      SizedBox(height: 0.5.h),
                      CustomText("USA 70 hour / 8 day",
                          color: AppColors.textSecondary, fontSize: 15.sp),
                      SizedBox(height: 1.h),
                      const Divider(),
                      SizedBox(height: 1.h),
                      CustomText("Time zone",
                          fontWeight: FontWeight.bold, fontSize: 16.sp),
                      SizedBox(height: 0.5.h),
                      CustomText("America/New_York",
                          color: AppColors.textSecondary, fontSize: 15.sp),
                    ],
                  ),
                ),
                SizedBox(height: 3.h),

                // ✅ Certify Button
                SizedBox(
                  width: double.infinity,
                  height: 6.5.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: CustomText("Certify and Submit",
                        color: Colors.white,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionCard(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(title, fontSize: 17.sp, fontWeight: FontWeight.bold),
          SizedBox(height: 1.h),
          ...children,
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(title, fontSize: 16.sp, fontWeight: FontWeight.w600),
            Icon(Icons.chevron_right, size: 21.sp),
          ],
        ),
      ),
    );
  }
}
