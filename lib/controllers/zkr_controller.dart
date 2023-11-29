import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:com_alhikma_moschee/models/zkr_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

class ZkrController extends GetxController {
  final id = 0.obs;
  final title = "".obs;
  final azkarSectionDetails = <dynamic>[].obs;
  @override
  void onInit() {
    super.onInit();
    loadSectionDetail();
  }

  Future<void> loadSectionDetail() async {
    try {
      final data = await DefaultAssetBundle.of(Get.context!)
          .loadString(AppConstants.azkarSectionDetailsJson);
      final response = json.decode(data);
      final List<dynamic> details = response
          .map(
            (section) => ZkrModel.fromJson(section),
          )
          .where(
            (sectionDetail) => sectionDetail.id == id.value,
          )
          .toList();
      azkarSectionDetails.value = details;
    } catch (error) {
      debugPrint("${AppConstants.printZkrError}$error");
    }
  }
}
