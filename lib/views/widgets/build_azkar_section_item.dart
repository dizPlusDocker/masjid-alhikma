import 'package:com_alhikma_moschee/views/constants/app_language_translator.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:com_alhikma_moschee/models/azkar_model.dart';
import 'package:flutter/material.dart';

Widget buildAzkarSectionItem({
  VoidCallback? onClick,
  AzkarModel? model,
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
                    "${model!.name}",
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
                    radius: 14.sp,
                    child: Text(
                      "${model.id}".languageTranslator,
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
            ],
          ),
        ],
      ),
    ),
  );
}
