import 'package:get/get.dart';
import 'package:halago/core/constant/routes.dart';
import 'package:halago/core/services/services.dart';

class SplashScreenController extends GetxController {
  MyServices myServices = Get.find() ;

  navigator()async {
    myServices.sharedPreferences.setString("splash", "1"); 
   await Future.delayed(const Duration(seconds: 6)); 
    Get.toNamed(AppRoute.language); 
   

  }
@override
  void onInit() {
    navigator(); 
    super.onInit();
  }
}