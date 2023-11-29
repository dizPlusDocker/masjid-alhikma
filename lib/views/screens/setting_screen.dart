import 'package:com_alhikma_moschee/views/widgets/build_default_divider.dart';
import 'package:com_alhikma_moschee/views/widgets/build_setting_item.dart';
import 'package:com_alhikma_moschee/controllers/setting_controller.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 2.sp,
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
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 40.sp,
                  ),
                  child: Text(
                    AppConstants.settingText,
                    maxLines: 1,
                    style: TextStyle(
                      color: AppColors.dark,
                      fontSize: 75.sp,
                      fontFamily: AppConstants.arabicFont,
                    ),
                  ),
                ),
                buildSettingItem(
                  leading: GetBuilder<SettingsController>(
                    init: SettingsController(),
                    builder: (controller) {
                      return Switch(
                        value: isDarkTheme,
                        onChanged: (toggle) {
                          isDarkTheme = toggle;
                          controller.saveTheme(toggle);
                        },
                      );
                    },
                  ),
                  name: AppConstants.darkModeText,
                ),
                buildDefaultDivider(),
                buildSettingItem(
                  leading: GetBuilder<SettingsController>(
                    init: SettingsController(),
                    builder: (controller) {
                      return GestureDetector(
                        onTap: () {
                          controller.showDeleteDialog();
                        },
                        child: Icon(
                          Icons.delete_outline,
                          color: AppColors.dark,
                          size: 24.sp,
                        ),
                      );
                    },
                  ),
                  name: AppConstants.deleteDataText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
