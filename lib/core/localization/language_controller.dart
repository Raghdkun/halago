import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halago/core/services/prefservices.dart';

class LanguageController extends GetxController {
  // MyServices myServices = Get.find() ;
  final PrefServices myServices = PrefServices();

  var savedlanguage = "en";

  List<String> lang = [
    "ar",
    "en"
  ] ; 

  saveLocal() {
    myServices.createString("locale", savedlanguage);
  }

  Future<void> setLocal() async {
    myServices.readString("locale").then((value) {
      if (value != '' && value != null) {
        Get.updateLocale(Locale(value.toString().toLowerCase()));
        savedlanguage = value.toString();
        update(); 
      }
    });
  }
  @override
  void onInit() {
    setLocal() ; 
    super.onInit();
  }
}
