import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/quran.dart' as quran;
import 'package:flutter/material.dart';

Widget buildCompassQuranVerse() {
  return SizedBox(
    width: 315.w,
    child: Directionality(
      textDirection: TextDirection.rtl,
      child: Text(
        quran.getVerse(2, 144),
        textAlign: TextAlign.justify,
        style: TextStyle(
          color: AppColors.dark,
          fontSize: 25.sp,
          fontFamily: AppConstants.moushafFont,
        ),
      ),
    ),
  );
}
