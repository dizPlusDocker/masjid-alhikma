import 'package:com_alhikma_moschee/models/services/location_service.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:get/get.dart';

class SalawatController extends GetxController {
  final RxDouble lat = 30.033333.obs;
  final RxDouble lon = 31.233334.obs;

  @override
  void onInit() async {
    final location = await LocationService().getLocationCoordinates();
    lat.value = location[AppConstants.latText];
    lon.value = location[AppConstants.lonText];
    super.onInit();
  }
}
