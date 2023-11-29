import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

Widget buildCompassInfoText({
  String? label,
  double? value,
}) {
  return SizedBox(
    width: 315.w,
    child: RichText(
      textAlign: TextAlign.right,
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: TextStyle(
              color: AppColors.dark,
              fontSize: 24.sp,
              fontFamily: AppConstants.arabicFont,
            ),
          ),
          TextSpan(
            text: value!.toStringAsFixed(4),
            style: TextStyle(
              color: AppColors.dark,
              fontSize: 16.sp,
              fontFamily: AppConstants.numberFont,
            ),
          ),
        ],
      ),
    ),
  );
}
