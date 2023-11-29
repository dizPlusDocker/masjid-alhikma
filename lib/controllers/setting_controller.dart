import 'package:com_alhikma_moschee/views/widgets/build_default_dialog.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/models/database/sql_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:restart_app/restart_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool isDarkTheme = false;

class SettingsController extends GetxController {
  final SQLDB sqlDb = SQLDB();
  final RxBool isDark = false.obs;

  @override
  void onInit() {
    isDark.value = isDarkTheme;
    super.onInit();
  }

  void toggleDarkMode(bool value) {
    isDark.value = value;
    isDarkTheme = value;
    saveTheme(value);
    update();
  }

  void saveTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(AppConstants.themeText, isDark);
    Restart.restartApp();
    update();
  }

  Future<bool> getDefaultTheme() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(AppConstants.themeText, false);
    return prefs.getBool(AppConstants.themeText) ?? false;
  }

  Future<void> showDeleteDialog() async {
    await Get.dialog(
      buildDefaultDialog(
        icon: Icons.delete_outlined,
        title: AppConstants.areYouSureAboutDeletingDataText,
        noAction: () {
          Get.back();
        },
        yesAction: () async {
          Get.back();
          await sqlDb.myDeleteDataBase();
          final bool isDark = await getDefaultTheme();
          isDarkTheme = isDark;
          saveTheme(isDark);
        },
      ),
    );
  }
}
