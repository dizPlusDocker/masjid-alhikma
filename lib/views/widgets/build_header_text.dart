import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

Widget buildHeaderText({
  String? title,
}) {
  return Padding(
    padding: EdgeInsets.only(
      top: 40.sp,
    ),
    child: Text(
      "$title",
      maxLines: 1,
      style: TextStyle(
        color: AppColors.dark,
        fontSize: 75.sp,
        fontFamily: AppConstants.arabicFont,
      ),
    ),
  );
}
