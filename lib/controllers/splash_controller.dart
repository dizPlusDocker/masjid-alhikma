import 'package:com_alhikma_moschee/models/services/location_service.dart';
import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final LocationService locationService = Get.put(LocationService());
  RxBool animate = true.obs;

  @override
  void onInit() {
    super.onInit();
    locationService.checkLocationService();
    locationService.getLocationCoordinates();
    Future.delayed(
      const Duration(seconds: 4),
      () async {
        Get.offNamed(AppConstants.homeRout);
      },
    );
  }
}
