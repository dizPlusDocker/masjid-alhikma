import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

Widget buildSettingItem({
  Widget? leading,
  String? name,
  IconData? icon,
}) {
  return SizedBox(
    height: 75.sp,
    width: 332.5.w,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "$name",
                  maxLines: 1,
                  style: TextStyle(
                    color: AppColors.dark,
                    fontSize: 40.sp,
                    fontFamily: AppConstants.arabicFont,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Container(
                  height: 20.h,
                  width: 25.w,
                  alignment: Alignment.center,
                  child: leading!,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
