import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

Widget buildDefaultDivider() {
  return Divider(
    color: AppColors.dark,
    height: 25.sp,
    indent: 10.w,
    endIndent: 10.w,
  );
}
