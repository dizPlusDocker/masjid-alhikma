import 'package:com_alhikma_moschee/controllers/setting_controller.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';

class DarkMode {
  static String convert(Object value) {
    if (value is int) {
      return onDark(value.toString());
    } else {
      return onDark(value as String);
    }
  }

  static String onDark(String value) {
    return value
        .replaceAll(
          AppConstants.lightSplashJson,
          AppConstants.darkSplashJson,
        )
        .replaceAll(
          AppConstants.quranLightIconImage,
          AppConstants.quranDarkIconImage,
        )
        .replaceAll(
          AppConstants.salawatLightIconImage,
          AppConstants.salawatDarkIconImage,
        )
        .replaceAll(
          AppConstants.azkarLightIconImage,
          AppConstants.azkarDarkIconImage,
        )
        .replaceAll(
          AppConstants.compassLightIconImage,
          AppConstants.compassDarkIconImage,
        )
        .replaceAll(
          AppConstants.settingLightIconImage,
          AppConstants.settingDarkIconImage,
        )
        .replaceAll(
          AppConstants.quranBlueIconImage,
          AppConstants.quranGreyIconImage,
        )
        .replaceAll(
          AppConstants.salawatBlueIconImage,
          AppConstants.salawatGreyIconImage,
        )
        .replaceAll(
          AppConstants.azkarBlueIconImage,
          AppConstants.azkarGreyIconImage,
        )
        .replaceAll(
          AppConstants.compassBlueIconImage,
          AppConstants.compassGreyIconImage,
        )
        .replaceAll(
          AppConstants.settingBlueIconImage,
          AppConstants.settingGreyIconImage,
        );
  }
}

class LightMode {
  static String convert(Object value) {
    if (value is int) {
      return onLight(value.toString());
    } else {
      return onLight(value as String);
    }
  }

  static String onLight(String value) {
    return value
        .replaceAll(
          AppConstants.darkSplashJson,
          AppConstants.lightSplashJson,
        )
        .replaceAll(
          AppConstants.quranDarkIconImage,
          AppConstants.quranLightIconImage,
        )
        .replaceAll(
          AppConstants.salawatDarkIconImage,
          AppConstants.salawatLightIconImage,
        )
        .replaceAll(
          AppConstants.azkarDarkIconImage,
          AppConstants.azkarLightIconImage,
        )
        .replaceAll(
          AppConstants.compassDarkIconImage,
          AppConstants.compassLightIconImage,
        )
        .replaceAll(
          AppConstants.settingDarkIconImage,
          AppConstants.settingLightIconImage,
        )
        .replaceAll(
          AppConstants.quranGreyIconImage,
          AppConstants.quranBlueIconImage,
        )
        .replaceAll(
          AppConstants.salawatGreyIconImage,
          AppConstants.salawatBlueIconImage,
        )
        .replaceAll(
          AppConstants.azkarGreyIconImage,
          AppConstants.azkarBlueIconImage,
        )
        .replaceAll(
          AppConstants.compassGreyIconImage,
          AppConstants.compassBlueIconImage,
        )
        .replaceAll(
          AppConstants.settingGreyIconImage,
          AppConstants.settingBlueIconImage,
        );
  }
}

extension ModeExtensions on String {
  String get modeTranslator {
    dynamic mode;
    if (isDarkTheme == true) {
      mode = DarkMode.convert(this);
    } else {
      mode = LightMode.convert(this);
    }
    return mode;
  }
}
