import 'package:get/get.dart';

import '../services/services.dart';

TranslateDiraction(D1 , D2){
    MyServices myServices = Get.find() ;

  if (myServices.sharedPreferences.getString("locale") == "ar"){
    return D1 ; 
    
  }else {
    return D2 ; 
  }
}