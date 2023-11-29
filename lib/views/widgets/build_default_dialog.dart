import 'package:com_alhikma_moschee/views/widgets/build_default_border_radius.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

Directionality buildDefaultDialog({
  required IconData icon,
  required String title,
  required VoidCallback noAction,
  required VoidCallback yesAction,
}) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: AlertDialog(
      backgroundColor: AppColors.light,
      shape: RoundedRectangleBorder(
        borderRadius: buildDefaultBorderRadius(),
      ),
      icon: Icon(
        icon,
        color: AppColors.dark,
        size: 24.sp,
      ),
      content: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.dark,
          fontSize: 24.sp,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: noAction,
          child: Container(
            height: 50.sp,
            width: 50.sp,
            color: AppColors.transparent,
            child: Center(
              child: Text(
                AppConstants.noText,
                style: TextStyle(
                  color: AppColors.dark,
                  fontSize: 20.sp,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: yesAction,
          child: Container(
            height: 50.sp,
            width: 50.sp,
            color: AppColors.transparent,
            child: Center(
              child: Text(
                AppConstants.yesText,
                style: TextStyle(
                  color: AppColors.dark,
                  fontSize: 20.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
