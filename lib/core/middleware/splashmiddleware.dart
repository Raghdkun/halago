// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:halago/core/constant/routes.dart';
// import 'package:halago/core/services/services.dart';

// class SplashMiddleWare extends GetMiddleware {
//   @override
//   int? get priority => 1;

//   MyServices myServices = Get.find();

//   @override
//    RouteSettings? redirect(String? route) {
//      if (myServices.sharedPreferences.getString("splash") == "1") {
//       return const RouteSettings(name: AppRoute.home);
//     }
    
//     return null;
//   }
// }