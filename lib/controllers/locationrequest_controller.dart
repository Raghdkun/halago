import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class LocationRequestController extends GetxController{

  check() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("Alert", "Please give the app a location permission");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("Alert", "Please give the app a location permission");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar("Alert", "You can't use this app if you did not give the location permission");
    }
  }
  @override
  void onInit() {
    check() ; 
    super.onInit();
  }
}