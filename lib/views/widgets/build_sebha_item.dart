import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

Widget buildSebhaItem({
  VoidCallback? onClick,
  Function(DragEndDetails)? onHorizontalDragEnd,
  int? count,
  String? title,
}) {
  return Center(
    child: GestureDetector(
      onTap: onClick,
      onHorizontalDragEnd: onHorizontalDragEnd,
      child: Container(
        height: 75.sp,
        width: 332.5.w,
        alignment: Alignment.center,
        child: ListTile(
          leading: Text(
            "$count",
            maxLines: 1,
            style: TextStyle(
              color: AppColors.dark,
              fontSize: 40.sp,
              fontFamily: AppConstants.arabicFont,
            ),
          ),
          title: Text(
            "$title",
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: AppColors.dark,
              fontSize: 40.sp,
              fontFamily: AppConstants.arabicFont,
            ),
          ),
        ),
      ),
    ),
  );
}
