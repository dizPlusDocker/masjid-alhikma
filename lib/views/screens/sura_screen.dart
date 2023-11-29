import 'package:com_alhikma_moschee/views/constants/app_language_translator.dart';
import 'package:com_alhikma_moschee/views/widgets/build_header_text.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/quran.dart' as quran;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuraScreen extends StatelessWidget {
  const SuraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int suraNumber = Get.arguments;
    int count = quran.getVerseCount(suraNumber);

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
                buildHeaderText(
                  title: quran.getSurahNameArabic(suraNumber),
                ),
                if (suraNumber != 1 && suraNumber != 9)
                  Text(
                    quran.basmala,
                    style: TextStyle(
                      color: AppColors.dark,
                      fontSize: 24.sp,
                      fontFamily: AppConstants.suraFont,
                    ),
                  ),
                SizedBox(
                  height: 10.sp,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                    ),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: [
                          for (var ayaNumber = 1;
                              ayaNumber <= count;
                              ayaNumber++) ...{
                            TextSpan(
                              text: quran.getVerse(suraNumber, ayaNumber),
                              style: TextStyle(
                                color: AppColors.dark,
                                fontSize: 24.sp,
                                fontFamily: AppConstants.moushafFont,
                              ),
                            ),
                            TextSpan(
                              text:
                                  " \uFD3F$ayaNumber\uFD3E ".languageTranslator,
                              style: TextStyle(
                                color: AppColors.dark,
                                fontSize: 18.sp,
                                fontFamily: AppConstants.suraFont,
                              ),
                            ),
                          },
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
