import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

Widget buildCompassLocationError() {
  return Center(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Icon(
            Icons.location_off_outlined,
            color: AppColors.dark,
            size: 150.sp,
          ),
          Text(
            AppConstants.checkLocationServicesText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.dark,
              fontSize: 40.sp,
              fontFamily: AppConstants.arabicFont,
            ),
          ),
        ],
      ),
    ),
  );
}
