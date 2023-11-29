import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/models/azkar_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:convert';

class AzkarController extends GetxController {
  var azkarSections = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadAzkarSections();
  }

  void loadAzkarSections() async {
    try {
      final data = await DefaultAssetBundle.of(Get.context!)
          .loadString(AppConstants.azkarSectionJson);
      final response = json.decode(data);
      azkarSections.assignAll(
        response.map(
          (sectionAzkar) {
            return AzkarModel.fromJson(sectionAzkar);
          },
        ),
      );
    } catch (error) {
      debugPrint("${AppConstants.printAzkarError}$error");
    }
  }

  void navigateToZkrScreen(AzkarModel model) {
    if (model.id == 5) {
      Get.toNamed(AppConstants.sebhaRout);
    } else {
      Get.toNamed(
        AppConstants.zkrRout,
        arguments: {
          AppConstants.idText: model.id!,
          AppConstants.titleText: model.name!,
        },
      );
    }
  }
}
