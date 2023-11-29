import 'package:com_alhikma_moschee/views/constants/app_mode_translator.dart';
import 'package:com_alhikma_moschee/views/widgets/build_date_info.dart';
import 'package:com_alhikma_moschee/views/widgets/build_grid_item.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 2.h,
          ),
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
                Obx(
                  () {
                    return buildDateInfo();
                  },
                ),
                SizedBox(
                  height: 15.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: buildGridItem(
                        imageAsset:
                            AppConstants.salawatLightIconImage.modeTranslator,
                        label: AppConstants.salawatTimeText,
                        routeName: AppConstants.animatedSalawatRout,
                      ),
                    ),
                    buildGridItem(
                      imageAsset:
                          AppConstants.quranLightIconImage.modeTranslator,
                      label: AppConstants.quranKareemText,
                      routeName: AppConstants.animatedQuranKareemRout,
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildGridItem(
                      imageAsset:
                          AppConstants.compassLightIconImage.modeTranslator,
                      label: AppConstants.qiblahText,
                      routeName: AppConstants.animatedCompassRout,
                    ),
                    buildGridItem(
                      imageAsset:
                          AppConstants.azkarLightIconImage.modeTranslator,
                      label: AppConstants.azkarText,
                      routeName: AppConstants.animatedAzkarRout,
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildGridItem(
                      imageAsset:
                          AppConstants.settingLightIconImage.modeTranslator,
                      label: AppConstants.settingText,
                      routeName: AppConstants.animatedSettingRout,
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
