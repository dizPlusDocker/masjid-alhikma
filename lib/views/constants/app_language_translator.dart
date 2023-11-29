import 'package:com_alhikma_moschee/views/constants/app_constant.dart';

class ArabicTranslator {
  static String convert(Object value) {
    if (value is int) {
      return toArabic(value.toString());
    } else {
      return toArabic(value as String);
    }
  }

  static String toArabic(String value) {
    return value
        .replaceAll(
          AppConstants.zeroEnglish,
          AppConstants.zeroArabic,
        )
        .replaceAll(
          AppConstants.oneEnglish,
          AppConstants.oneArabic,
        )
        .replaceAll(
          AppConstants.twoEnglish,
          AppConstants.twoArabic,
        )
        .replaceAll(
          AppConstants.threeEnglish,
          AppConstants.threeArabic,
        )
        .replaceAll(
          AppConstants.fourEnglish,
          AppConstants.fourArabic,
        )
        .replaceAll(
          AppConstants.fiveEnglish,
          AppConstants.fiveArabic,
        )
        .replaceAll(
          AppConstants.sixEnglish,
          AppConstants.sixArabic,
        )
        .replaceAll(
          AppConstants.sevenEnglish,
          AppConstants.sevenArabic,
        )
        .replaceAll(
          AppConstants.eightEnglish,
          AppConstants.eightArabic,
        )
        .replaceAll(
          AppConstants.nineEnglish,
          AppConstants.nineArabic,
        )
        .replaceAll(
          AppConstants.saturdayEnglish,
          AppConstants.saturdayArabic,
        )
        .replaceAll(
          AppConstants.sundayEnglish,
          AppConstants.sundayArabic,
        )
        .replaceAll(
          AppConstants.mondayEnglish,
          AppConstants.mondayArabic,
        )
        .replaceAll(
          AppConstants.tuesdayEnglish,
          AppConstants.tuesdayArabic,
        )
        .replaceAll(
          AppConstants.wednesdayEnglish,
          AppConstants.wednesdayArabic,
        )
        .replaceAll(
          AppConstants.thursdayEnglish,
          AppConstants.thursdayArabic,
        )
        .replaceAll(
          AppConstants.fridayEnglish,
          AppConstants.fridayArabic,
        )
        .replaceAll(
          AppConstants.makkah1English,
          AppConstants.makkahArabic,
        )
        .replaceAll(
          AppConstants.makkah2English,
          AppConstants.makkahArabic,
        )
        .replaceAll(
          AppConstants.madinah1English,
          AppConstants.madinahArabic,
        )
        .replaceAll(
          AppConstants.madinah2English,
          AppConstants.madinahArabic,
        );
  }
}

extension ArabicExtensions on String {
  String get languageTranslator {
    return ArabicTranslator.convert(this);
  }
}
