import 'package:com_alhikma_moschee/views/widgets/build_default_divider.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget buildSalawatTimeListItem({
  String? prayerName,
  DateTime? prayerTime,
  DateFormat? normalFormat,
}) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          FlutterAlarmClock.createAlarm(
            title: "${AppConstants.salahText} $prayerName",
            hour: prayerTime.hour,
            minutes: prayerTime.minute,
          );
          FlutterAlarmClock.showAlarms();
        },
        child: Container(
          height: 75.sp,
          width: 332.5.w,
          alignment: Alignment.center,
          child: ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  normalFormat!
                      .format(prayerTime!)
                      .replaceAll(RegExp(r'[APM]'), ''),
                  maxLines: 1,
                  style: TextStyle(
                    color: AppColors.dark,
                    fontSize: 25.sp,
                    fontFamily: AppConstants.numberFont,
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: normalFormat
                          .format(prayerTime)
                          .contains(AppConstants.amLargeFormat)
                      ? Text(
                          AppConstants.amSmallFormat,
                          maxLines: 1,
                          style: TextStyle(
                            color: AppColors.dark,
                            fontSize: 15.sp,
                            fontFamily: AppConstants.englishFont,
                          ),
                        )
                      : Text(
                          AppConstants.pmSmallFormat,
                          maxLines: 1,
                          style: TextStyle(
                            color: AppColors.dark,
                            fontSize: 15.sp,
                            fontFamily: AppConstants.englishFont,
                          ),
                        ),
                ),
              ],
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  prayerName!,
                  style: TextStyle(
                    color: AppColors.dark,
                    fontSize: 50.sp,
                    fontFamily: AppConstants.arabicFont,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      buildDefaultDivider(),
    ],
  );
}
