import 'package:com_alhikma_moschee/views/widgets/build_default_border_radius.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:com_alhikma_moschee/views/widgets/build_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildGridItem({
  String? imageAsset,
  String? label,
  String? routeName,
  dynamic arguments,
}) {
  return InkWell(
    onTap: () {
      Get.toNamed(routeName!, arguments: arguments);
    },
    child: Container(
      height: 200.sp,
      width: 156.25.sp,
      decoration: BoxDecoration(
        color: AppColors.dark,
        borderRadius: buildDefaultBorderRadius(),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildImage(
            imageAsset: imageAsset,
          ),
          SizedBox(
            height: 25.sp,
          ),
          Text(
            label!,
            maxLines: 1,
            style: TextStyle(
              color: AppColors.light,
              fontSize: 40.sp,
              fontFamily: AppConstants.arabicFont,
            ),
          ),
        ],
      ),
    ),
  );
}
