import 'package:com_alhikma_moschee/views/widgets/build_salawat_time_list_item.dart';
import 'package:com_alhikma_moschee/views/widgets/build_default_border_radius.dart';
import 'package:com_alhikma_moschee/views/widgets/build_header_text.dart';
import 'package:com_alhikma_moschee/controllers/salawat_controller.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class SalawatScreen extends StatelessWidget {
  const SalawatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SalawatController controller = Get.put(SalawatController());
    final coordinates = Coordinates(controller.lat.value, controller.lon.value);
    final country = CalculationMethod.egyptian.getParameters();
    final salawatTime = PrayerTimes.today(coordinates, country);
    final normalFormat = DateFormat.jm();

    var salatTimes = {
      AppConstants.salatElFajrText: salawatTime.fajr,
      AppConstants.salatElSunriseText: salawatTime.sunrise,
      AppConstants.salatElDhuhrText: salawatTime.dhuhr,
      AppConstants.salatElAsrText: salawatTime.asr,
      AppConstants.salatElMaghribText: salawatTime.maghrib,
      AppConstants.salatElIshaText: salawatTime.isha,
    };

    var now = DateTime.now();
    DateTime? nextPrayerTime;
    String? nextPrayerName;

    for (var prayerName in salatTimes.keys) {
      var prayerTime = salatTimes[prayerName];
      if (prayerTime != null && prayerTime.isAfter(now)) {
        nextPrayerTime = prayerTime;
        nextPrayerName = prayerName;
        break;
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.light,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(15.sp),
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildHeaderText(
                  title: AppConstants.salawatTimeText,
                ),
                SizedBox(
                  height: 25.sp,
                ),
                if (nextPrayerTime != null && nextPrayerName != null)
                  Container(
                    height: 150.sp,
                    width: 332.5.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.dark,
                      borderRadius: buildDefaultBorderRadius(),
                    ),
                    child: Center(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Text(
                              "${AppConstants.salahText} $nextPrayerName",
                              style: TextStyle(
                                color: AppColors.light,
                                fontSize: 50.sp,
                                fontFamily: AppConstants.arabicFont,
                              ),
                            ),
                            SizedBox(
                              height: 10.sp,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  normalFormat
                                      .format(nextPrayerTime)
                                      .replaceAll(RegExp(r"[APM]"),
                                          AppConstants.emptyText),
                                  style: TextStyle(
                                    color: AppColors.light,
                                    fontSize: 28.sp,
                                    fontFamily: AppConstants.numberFont,
                                  ),
                                ),
                                Text(
                                  normalFormat
                                          .format(nextPrayerTime)
                                          .contains(AppConstants.amLargeFormat)
                                      ? AppConstants.amSmallFormat
                                      : AppConstants.pmSmallFormat,
                                  style: TextStyle(
                                    color: AppColors.light,
                                    fontSize: 18.sp,
                                    fontFamily: AppConstants.englishFont,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (nextPrayerTime == null && nextPrayerName == null)
                  Container(
                    height: 150.sp,
                    width: 332.5.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.dark,
                      borderRadius: buildDefaultBorderRadius(),
                    ),
                    child: Text(
                      AppConstants.salawatEndsForTodayText,
                      style: TextStyle(
                        color: AppColors.light,
                        fontSize: 50.sp,
                        fontFamily: AppConstants.arabicFont,
                      ),
                    ),
                  ),
                SizedBox(
                  height: 10.sp,
                ),
                for (var prayerName in salatTimes.keys)
                  buildSalawatTimeListItem(
                    prayerName: prayerName,
                    prayerTime: salatTimes[prayerName]!,
                    normalFormat: normalFormat,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
