import 'package:com_alhikma_moschee/views/widgets/build_default_dialog.dart';
import 'package:com_alhikma_moschee/controllers/sebha_controller.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/models/database/sql_database.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TasbehaController extends GetxController {
  SebhaController sebhaController = Get.put(SebhaController());
  late int count;
  late String id;
  final SQLDB sqlDb = SQLDB();

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    id = args[AppConstants.idText];
    count = args[AppConstants.countText];
  }

  Future<bool> onWillPop() async {
    return await Get.dialog(
      buildDefaultDialog(
        icon: Icons.save_outlined,
        title: AppConstants.doYouWantToSaveTheNewDataText,
        noAction: () {
          Get.back();
          Get.back();
        },
        yesAction: () {
          Get.back();
          saveAndNavigateToSebha()
              .then((value) => sebhaController.refreshData());
        },
      ),
    );
  }

  saveButton() {
    return Container(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () {
          saveAndNavigateToSebha()
              .then((value) => sebhaController.refreshData());
        },
        child: SizedBox(
          height: 40.sp,
          width: 40.sp,
          child: Icon(
            Icons.save_outlined,
            color: AppColors.dark,
            size: 25.sp,
          ),
        ),
      ),
    );
  }

  void incrementCount() {
    count++;
    update();
  }

  void decrementCount() {
    if (count > 0) {
      count--;
      update();
    }
  }

  void resetCount() {
    count = 0;
    update();
  }

  Future<void> saveAndNavigateToSebha() async {
    Get.back();
    Get.back();
    Get.toNamed(AppConstants.sebhaRout);
    await sqlDb.updateData(
      '''
        UPDATE sebha SET
        count = $count
        WHERE id = $id
      ''',
    );
    update();
  }
}
