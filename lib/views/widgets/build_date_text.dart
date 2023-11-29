import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

Widget buildDateText({
  Alignment? alignment,
  String? text,
}) {
  return Padding(
    padding: EdgeInsets.only(
      top: 25.sp,
      right: 17.5.sp,
      left: 17.5.sp,
    ),
    child: Container(
      alignment: alignment,
      child: Text(
        text!,
        maxLines: 1,
        style: TextStyle(
          color: AppColors.dark,
          fontSize: 25.sp,
          fontFamily: AppConstants.numberFont,
        ),
      ),
    ),
  );
}
