import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class LocationService {
  Future<void> checkLocationService() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      StreamController<LocationStatus>.broadcast().sink.add(s);
    } else {
      StreamController<LocationStatus>.broadcast().sink.add(locationStatus);
    }
  }

  getLocationCoordinates() async {
    var position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    var lat = position.latitude;
    var lon = position.longitude;
    return {AppConstants.latText: lat, AppConstants.lonText: lon};
  }
}
