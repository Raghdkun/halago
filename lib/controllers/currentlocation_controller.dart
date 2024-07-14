import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:halago/core/constant/routes.dart';

class CurrentLocationController extends GetxController {

  
  getCurrentLocation() async {
    // bool services;
    LocationPermission? permission;
    // services = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      
    } else {
      return Get.toNamed(AppRoute.login);
    }
  }
}
