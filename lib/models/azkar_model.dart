import 'package:com_alhikma_moschee/views/constants/app_constant.dart';

class AzkarModel {
  int? id;
  String? num;
  String? name;

  AzkarModel(
    this.id,
    this.num,
    this.name,
  );

  AzkarModel.fromJson(Map<String, dynamic> json) {
    id = json[AppConstants.idText];
    num = json[AppConstants.numText];
    name = json[AppConstants.nameText];
  }
}
