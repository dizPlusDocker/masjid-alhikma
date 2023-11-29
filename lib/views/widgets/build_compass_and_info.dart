import 'package:com_alhikma_moschee/views/widgets/build_compass_info_text.dart';
import 'package:com_alhikma_moschee/views/widgets/build_animated_compass.dart';
import 'package:com_alhikma_moschee/controllers/compass_controller.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildCompassAndInfo() {
  return GetBuilder<CompassController>(
    init: CompassController(),
    builder: (compassController) {
      return Container(
        alignment: Alignment.center,
        child: StreamBuilder(
          stream: FlutterQiblah.qiblahStream,
          builder: (context, AsyncSnapshot<QiblahDirection> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.dark,
                ),
              );
            }
            final qiblahDirection = snapshot.data!;
            compassController.qiblahDirection.value = qiblahDirection;

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildAnimatedCompass(),
                  SizedBox(
                    height: 20.sp,
                  ),
                  buildCompassInfoText(
                    label: AppConstants.compassDirText,
                    value: qiblahDirection.qiblah,
                  ),
                  buildCompassInfoText(
                    label: AppConstants.compassStartText,
                    value: compassController.begin.value,
                  ),
                  buildCompassInfoText(
                    label: AppConstants.compassEndText,
                    value: compassController.begin.value,
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
