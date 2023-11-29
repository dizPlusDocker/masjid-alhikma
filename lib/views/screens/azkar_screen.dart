import 'package:com_alhikma_moschee/views/widgets/build_azkar_section_item.dart';
import 'package:com_alhikma_moschee/views/widgets/build_default_divider.dart';
import 'package:com_alhikma_moschee/views/widgets/build_header_text.dart';
import 'package:com_alhikma_moschee/controllers/azkar_controller.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AzkarController azkarController = Get.put(AzkarController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 2.h,
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
                  title: AppConstants.azkarText,
                ),
                Center(
                  child: Obx(
                    () => ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => buildAzkarSectionItem(
                        onClick: () {
                          azkarController.navigateToZkrScreen(
                              azkarController.azkarSections[index]);
                        },
                        model: azkarController.azkarSections[index],
                      ),
                      itemCount: azkarController.azkarSections.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return buildDefaultDivider();
                      },
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
