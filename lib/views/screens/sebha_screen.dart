import 'package:com_alhikma_moschee/views/widgets/build_default_border_radius.dart';
import 'package:com_alhikma_moschee/views/widgets/build_default_divider.dart';
import 'package:com_alhikma_moschee/views/widgets/build_header_text.dart';
import 'package:com_alhikma_moschee/views/widgets/build_sebha_item.dart';
import 'package:com_alhikma_moschee/controllers/sebha_controller.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SebhaController controller = Get.put(SebhaController());
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
                  title: AppConstants.sebhaText,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 17.5.w,
                    bottom: 20.sp,
                    left: 17.5.w,
                  ),
                  child: TextFormField(
                    maxLines: 1,
                    cursorColor: AppColors.dark,
                    autocorrect: true,
                    controller: controller.tasbihaName,
                    keyboardType: TextInputType.text,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(color: AppColors.dark),
                    decoration: InputDecoration(
                      prefixIcon: InkWell(
                        onTap: () async {
                          if (controller.tasbihaName.text.isNotEmpty) {
                            await controller.insertData();
                          }
                        },
                        child: Icon(
                          Icons.save_outlined,
                          color: AppColors.dark,
                        ),
                      ),
                      hintTextDirection: TextDirection.rtl,
                      hintText: AppConstants.addTasbihaText,
                      hintStyle: TextStyle(
                        color: AppColors.dark,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: buildDefaultBorderRadius(),
                        borderSide: BorderSide(
                          color: AppColors.dark,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: buildDefaultBorderRadius(),
                        borderSide: BorderSide(
                          color: AppColors.dark,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: buildDefaultBorderRadius(),
                        borderSide: BorderSide(
                          color: AppColors.dark,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: buildDefaultBorderRadius(),
                        borderSide: BorderSide(
                          color: AppColors.dark,
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.sebhaList.length,
                    itemBuilder: (context, int i) {
                      return Slidable(
                        key: Key(
                            "${controller.sebhaList[i][AppConstants.idText]}"),
                        endActionPane: ActionPane(
                          extentRatio: 0.15.sp,
                          motion: const StretchMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                controller.showDeleteDialog(i - 1);
                              },
                              backgroundColor: AppColors.transparent,
                              foregroundColor: AppColors.red,
                              icon: Icons.delete_outline,
                            ),
                          ],
                        ),
                        child: buildSebhaItem(
                          onClick: () {
                            Get.toNamed(
                              AppConstants.tasbihaRout,
                              arguments: {
                                AppConstants.idText: controller.sebhaList[i]
                                        [AppConstants.idText]
                                    .toString(),
                                AppConstants.countText: controller.sebhaList[i]
                                    [AppConstants.countText],
                                AppConstants.countCheckerText: controller
                                    .sebhaList[i][AppConstants.countText],
                                AppConstants.tasbihaNameText: controller
                                    .sebhaList[i][AppConstants.titleText],
                              },
                            );
                          },
                          count: controller.sebhaList[i]
                              [AppConstants.countText],
                          title:
                              "${controller.sebhaList[i][AppConstants.titleText]}",
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return buildDefaultDivider();
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
