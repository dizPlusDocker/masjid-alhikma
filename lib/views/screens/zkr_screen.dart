import 'package:com_alhikma_moschee/views/widgets/build_default_border_radius.dart';
import 'package:com_alhikma_moschee/views/constants/app_language_translator.dart';
import 'package:com_alhikma_moschee/views/widgets/build_header_text.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:com_alhikma_moschee/controllers/zkr_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ZkrScreen extends StatelessWidget {
  const ZkrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ZkrController zkrController = Get.put(ZkrController());
    final arguments = Get.arguments;
    final int id = arguments[AppConstants.idText];
    final String title = arguments[AppConstants.titleText];

    zkrController.id.value = id;
    zkrController.title.value = title;

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
                  title: zkrController.title.value,
                ),
                Center(
                  child: Obx(
                    () {
                      final azkarSectionDetails =
                          zkrController.azkarSectionDetails;
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: azkarSectionDetails.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final azkarSection = azkarSectionDetails[index];
                          String content = azkarSection.content;

                          final counter = RxInt(azkarSection.count);
                          final count = RxInt(azkarSection.count);

                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (counter.value > 0) {
                                    counter.value--;
                                  }
                                },
                                onLongPress: () {
                                  if (counter.value >= 0 &&
                                      counter.value < count.value) {
                                    counter.value++;
                                  }
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: buildDefaultBorderRadius(),
                                      border: Border.all(
                                        color: AppColors.dark,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10.sp,
                                        ),
                                        Text(
                                          content,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                            color: AppColors.dark,
                                            fontSize: 20.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.sp,
                                        ),
                                        Obx(
                                          () => CircularPercentIndicator(
                                            radius: 30.sp,
                                            lineWidth: 5.sp,
                                            animation: true,
                                            animationDuration: 500,
                                            percent:
                                                (counter.value / count.value)
                                                    .toDouble(),
                                            progressColor: AppColors.dark,
                                            backgroundColor: AppColors.light,
                                            circularStrokeCap:
                                                CircularStrokeCap.round,
                                            center: Text(
                                              "${counter.value}"
                                                  .languageTranslator,
                                              style: TextStyle(
                                                color: AppColors.dark,
                                                fontSize: 24.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                            ],
                          );
                        },
                      );
                    },
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
