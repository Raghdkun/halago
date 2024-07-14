import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with GetSingleTickerProviderStateMixin  {
  bool isKeyboardOpen = false;
  bool isSignUp = false;
  bool isActive = true;
  double keyboardHeight = MediaQuery.of(Get.context!).viewInsets.bottom;
  late TabController tabController;

  keyboard() {
    final double keyboardHeight = MediaQuery.of(Get.context!).viewInsets.bottom;
    if (keyboardHeight > 0) {
      isKeyboardOpen = true;
      update();
    } else {
      isKeyboardOpen = false;
      update();
    }
    update();
  }
  

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void dispose() {
    tabController.dispose(); 
    super.dispose();
  }

  @override
  void onReady() {
    // pageController = PageController(initialPage: currentPageIndex);
    super.onReady();
  }
}
