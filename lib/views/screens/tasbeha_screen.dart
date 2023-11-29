// ignore_for_file: deprecated_member_use

import 'package:com_alhikma_moschee/views/constants/app_language_translator.dart';
import 'package:com_alhikma_moschee/controllers/tasbeha_controller.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TasbehaScreen extends StatelessWidget {
  const TasbehaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final tasbihaName = args[AppConstants.tasbihaNameText];
    return GetBuilder<TasbehaController>(
        init: TasbehaController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: controller.onWillPop,
            child: Scaffold(
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
                  child: Center(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Text(
                            "${controller.count}".languageTranslator,
                            style: TextStyle(
                              color: AppColors.dark,
                              fontSize: 50.sp,
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Text(
                            tasbihaName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.dark,
                              fontSize: 75.sp,
                              fontFamily: AppConstants.arabicFont,
                            ),
                          ),
                          SizedBox(
                            height: 25.sp,
                          ),
                          InkWell(
                            onTap: controller.incrementCount,
                            onLongPress: controller.decrementCount,
                            child: Container(
                              height: 200.sp,
                              width: 200.sp,
                              decoration: BoxDecoration(
                                color: AppColors.dark,
                                borderRadius: BorderRadius.circular(250.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 25.w,
                                ),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: InkWell(
                                    onTap: controller.resetCount,
                                    child: SizedBox(
                                      height: 40.sp,
                                      width: 40.sp,
                                      child: Icon(
                                        Icons.restart_alt_outlined,
                                        color: AppColors.dark,
                                        size: 25.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 25.w,
                                ),
                                child: controller.saveButton(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
