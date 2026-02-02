import 'package:fleetcare_eld/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../global_widgets/custom_button.dart';
import '../global_widgets/custom_text.dart';

class CustomDialogBox extends StatelessWidget {
  final String title, descriptions, positiveString, negativeString;
  final Widget img;
  final Function() positiveClick;
  final Function() negativeClick;
  final Color? negativeButtonColor;
  final Color? positiveButtonColor;
  final Color? negativeButtonTextColor;
  final Color? positiveButtonTextColor;
  final Color? negativeButtonBorderColor;
  final Color? positiveButtonBorderColor;
  final bool? isNegativeButtonShow;

  const CustomDialogBox({
    Key? key,
    required this.title,
    required this.descriptions,
    required this.img,
    required this.positiveClick,
    required this.negativeClick,
    required this.positiveString,
    required this.negativeString,
    this.negativeButtonColor,
    this.positiveButtonColor,
    this.negativeButtonTextColor,
    this.positiveButtonTextColor,
    this.negativeButtonBorderColor,
    this.positiveButtonBorderColor,
    this.isNegativeButtonShow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 4.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: contentBox(context),
    );
  }

  Widget contentBox(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          img,
          SizedBox(height: 3.h),
          if (title.isNotEmpty)
            CustomText(
              title,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
          SizedBox(height: 1.h),
          if (descriptions.isNotEmpty)
            CustomText(
              descriptions,
              fontSize: 15.sp,
              color: Colors.grey,
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
          SizedBox(height: 3.h),
          Row(
            children: [
              if (isNegativeButtonShow == true) ...[
                Expanded(
                  child: CustomButton(
                    label: negativeString,
                    onPressed: negativeClick,
                    backgroundColor: negativeButtonColor ?? Colors.white,
                    textColor: negativeButtonTextColor ?? AppColors.primary,
                    isOutlined: true,
                    // borderColor: negativeButtonBorderColor, // Add functionality to CustomButton if needed or assume outlined uses primary/grey
                  ),
                ),
                SizedBox(width: 3.w),
              ],
              Expanded(
                child: CustomButton(
                  label: positiveString,
                  onPressed: positiveClick,
                  backgroundColor: positiveButtonColor ?? AppColors.primary,
                  textColor: positiveButtonTextColor ?? Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
