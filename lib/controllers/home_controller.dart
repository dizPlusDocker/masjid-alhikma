import 'package:get/get.dart';

class HomeController extends GetxController {
  final Rx<DateTime> currentTime = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    updateCurrentTime();
    ever(
      currentTime,
      (_) {
        updateCurrentTime();
      },
    );
  }

  void updateCurrentTime() {
    final now = DateTime.now();
    if (now.minute != currentTime.value.minute) {
      currentTime.value = now;
    }
  }
}
