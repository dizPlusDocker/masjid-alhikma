import 'package:com_alhikma_moschee/models/services/location_service.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:location/location.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:math';

class CompassController extends GetxController {
  final RxDouble begin = 0.0.obs;
  final Rx<QiblahDirection> qiblahDirection =
      const QiblahDirection(0.0, 0.0, 0.0).obs;
  final _locationStreamController =
      StreamController<LocationStatus>.broadcast();
  Stream<LocationStatus> get locationStream => _locationStreamController.stream;

  @override
  void onInit() {
    super.onInit();
    LocationService().checkLocationService();
    ever(
      qiblahDirection,
      (_) {
        updateBegin();
      },
    );
  }

  Future<bool> checkLocationServicesAndPermission() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return false;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }

    return true;
  }

  void updateBegin() {
    begin.value = qiblahDirection.value.qiblah * (pi / 180) * -1;
  }
}
