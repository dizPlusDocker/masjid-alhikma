import 'package:com_alhikma_moschee/views/constants/app_language_translator.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

Widget buildQuranKareemItem({
  VoidCallback? onClick,
  String? suraName,
  String? suraNumber,
  String? suraType,
  String? suraAyat,
}) {
  return InkWell(
    onTap: onClick,
    child: SizedBox(
      height: 75.sp,
      width: 332.5.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    suraName!,
                    maxLines: 1,
                    style: TextStyle(
                      color: AppColors.dark,
                      fontSize: 40.sp,
                      fontFamily: AppConstants.arabicFont,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.dark,
                    radius: 15.sp,
                    child: Text(
                      suraNumber!.languageTranslator,
                      maxLines: 1,
                      style: TextStyle(
                        color: AppColors.light,
                        fontSize: 15.sp,
                        fontFamily: AppConstants.numberFont,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Column(
                    children: [
                      Text(
                        suraType!.languageTranslator,
                        maxLines: 1,
                        style: TextStyle(
                          color: AppColors.dark,
                          fontSize: 35.sp,
                          fontFamily: AppConstants.arabicFont,
                        ),
                      ),
                      Text(
                        suraAyat!.languageTranslator,
                        maxLines: 1,
                        style: TextStyle(
                          color: AppColors.dark,
                          fontSize: 20.sp,
                          fontFamily: AppConstants.suraFont,
                          shadows: [
                            Shadow(
                              blurRadius: 1.sp,
                              color: AppColors.light,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
