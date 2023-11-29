import 'package:com_alhikma_moschee/views/widgets/build_compass_location_error.dart';
import 'package:com_alhikma_moschee/views/widgets/build_compass_quranic_verse.dart';
import 'package:com_alhikma_moschee/views/widgets/build_compass_and_info.dart';
import 'package:com_alhikma_moschee/views/widgets/build_header_text.dart';
import 'package:com_alhikma_moschee/controllers/compass_controller.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompassScreen extends StatelessWidget {
  const CompassScreen({super.key});

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
                buildHeaderText(
                  title: AppConstants.qiblahText,
                ),
                buildCompassQuranVerse(),
                SizedBox(
                  height: 25.sp,
                ),
                GetBuilder<CompassController>(
                  init: CompassController(),
                  builder: (controller) {
                    return FutureBuilder<bool>(
                      future: controller.checkLocationServicesAndPermission(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColors.dark,
                            ),
                          );
                        } else if (snapshot.hasError ||
                            snapshot.data == false) {
                          return buildCompassLocationError();
                        } else if (snapshot.data == true) {
                          return buildCompassAndInfo();
                        } else {
                          return Container();
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
