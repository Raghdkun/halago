import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halago/controllers/onboardingcontroller.dart';
import 'package:halago/core/constant/color.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 2,
      height: Get.height / 18,
      margin: const EdgeInsets.only(bottom: 25),
      child: MaterialButton(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        onPressed: () {
          controller.next();
        },
        color: AppColor.primaryColor,
        child: Text(
          "Get Started!",
          style: TextStyle(color: AppColor.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
