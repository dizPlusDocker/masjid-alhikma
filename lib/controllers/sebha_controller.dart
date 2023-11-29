import 'package:com_alhikma_moschee/views/widgets/build_default_border_radius.dart';
import 'package:com_alhikma_moschee/views/widgets/build_default_dialog.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/models/database/sql_database.dart';
import 'package:com_alhikma_moschee/views/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SebhaController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TextEditingController tasbihaName = TextEditingController();
  RxList<Map> sebhaList = <Map>[].obs;
  int count = 0;
  SQLDB sqlDb = SQLDB();

  @override
  void onInit() {
    super.onInit();
    readData();
  }

  Future<void> readData() async {
    List<Map> res = await sqlDb.readData("SELECT * FROM sebha");
    sebhaList.addAll(res);
  }

  Future<void> refreshData() async {
    FocusScope.of(Get.context!).unfocus();
    tasbihaName.clear();
    sebhaList.clear();
    readData();
  }

  Future<void> insertData() async {
    await sqlDb.insertData(
      "INSERT INTO 'sebha' ('title','count') VALUES ('${tasbihaName.text}', 0)",
    );
    FocusScope.of(Get.context!).unfocus();
    tasbihaName.clear();
    sebhaList.clear();
    readData();
  }

  Future<void> deleteData(int i) async {
    int res = await sqlDb.deleteData(
        "DELETE FROM 'sebha' WHERE id = ${sebhaList[i][AppConstants.idText]}");
    if (res > 0) {
      sebhaList.removeWhere(
        (element) =>
            element[AppConstants.idText] == sebhaList[i][AppConstants.idText],
      );
    }
  }

  Future<void> showDeleteDialog(int i) async {
    i == -1
        ? await Get.dialog(
            Directionality(
              textDirection: TextDirection.rtl,
              child: AlertDialog(
                backgroundColor: AppColors.light,
                shape: RoundedRectangleBorder(
                  borderRadius: buildDefaultBorderRadius(),
                ),
                icon: Icon(
                  Icons.delete_outlined,
                  color: AppColors.dark,
                  size: 24.sp,
                ),
                content: Text(
                  AppConstants.youCantDeleteThisTasbihaText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.dark,
                    fontSize: 24.sp,
                  ),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 50.sp,
                      width: 50.sp,
                      color: AppColors.transparent,
                      child: Center(
                        child: Text(
                          AppConstants.okayText,
                          style: TextStyle(
                            color: AppColors.dark,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : await Get.dialog(
            buildDefaultDialog(
              icon: Icons.delete_outlined,
              title: AppConstants.areYouSureAboutDeletingThisTasbihaText,
              noAction: () {
                Get.back();
              },
              yesAction: () {
                sebhaList.removeAt(i);
                deleteData(i);
                refreshData();
                Get.back();
                Get.back();
                Get.toNamed(AppConstants.sebhaRout);
              },
            ),
          );
  }
}
