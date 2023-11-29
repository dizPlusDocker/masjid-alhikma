import 'package:com_alhikma_moschee/views/widgets/build_day_of_the_week_text.dart';
import 'package:com_alhikma_moschee/views/widgets/build_date_text.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/controllers/home_controller.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

Widget buildDateInfo() {
  final HomeController controller = Get.put(HomeController());
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      buildDateText(
        alignment: Alignment.topLeft,
        text: DateFormat(AppConstants.mDateFormat)
            .format(controller.currentTime.value),
      ),
      buildDateText(
        alignment: Alignment.topRight,
        text: HijriCalendar.now().toFormat(AppConstants.hDateFormat),
      ),
      buildDayOfTheWeekText(),
    ],
  );
}
