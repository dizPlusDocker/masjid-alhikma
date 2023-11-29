import 'package:com_alhikma_moschee/views/constants/app_constant.dart';

class ZkrModel {
  int? id;
  int? count;
  String? content;

  ZkrModel(
    this.id,
    this.count,
    this.content,
  );

  ZkrModel.fromJson(Map<String, dynamic> json) {
    id = json[AppConstants.idText];
    count = json[AppConstants.countText];
    content = json[AppConstants.contentText];
  }
}
