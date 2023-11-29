import 'package:com_alhikma_moschee/views/constants/app_language_translator.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/controllers/home_controller.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

Widget buildDayOfTheWeekText() {
  final HomeController controller = Get.put(HomeController());
  return Padding(
    padding: EdgeInsets.only(
      top: 70.sp,
    ),
    child: Text(
      DateFormat(AppConstants.dayFormat)
          .format(controller.currentTime.value)
          .languageTranslator,
      maxLines: 1,
      style: TextStyle(
        color: AppColors.dark,
        fontSize: 75.sp,
        fontFamily: AppConstants.arabicFont,
      ),
    ),
  );
}
