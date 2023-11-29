import 'package:com_alhikma_moschee/views/widgets/build_quran_kareem_item.dart';
import 'package:com_alhikma_moschee/views/widgets/build_default_divider.dart';
import 'package:com_alhikma_moschee/views/widgets/build_header_text.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/quran.dart' as quran;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuranKareemScreen extends StatelessWidget {
  const QuranKareemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: AppColors.dark,
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
                    title: AppConstants.quranKareemText,
                  ),
                  SizedBox(
                    height: 25.sp,
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 114,
                    itemBuilder: (context, index) {
                      return buildQuranKareemItem(
                        onClick: () {
                          Get.toNamed(
                            AppConstants.suraRout,
                            arguments: index + 1,
                          );
                        },
                        suraName: quran.getSurahNameArabic(index + 1),
                        suraNumber: "${index + 1}",
                        suraType: quran.getPlaceOfRevelation(index + 1),
                        suraAyat:
                            "\uFD3E${quran.getVerseCount(index + 1)}\uFD3F",
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return buildDefaultDivider();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
