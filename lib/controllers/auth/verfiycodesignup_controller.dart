import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halago/core/constant/routes.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/remote/auth/verfiysignupdata.dart';

abstract class VerfiyPasswordSignUpController extends GetxController {
  checkcode();
  goToSuccessSignUp(String verfiyCodeSignUp);
}



class VerfiyPasswordSignUpControllerImp extends VerfiyPasswordSignUpController {
  VerfiyCodeSignUpData verfiyCodeSignUpData = VerfiyCodeSignUpData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  String? email;

  @override
  checkcode() {}

  @override
  goToSuccessSignUp(verfiyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();

    var response =
        await verfiyCodeSignUpData.postData(email!, verfiyCodeSignUp);
    // print("-------------- controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response?['status'] == "success") {
        // data.addAll(response?['data']);
        Get.toNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Verfiy Code Is Not Correct!",
          buttonColor: AppColor.primaryColor,
          textConfirm: "Ok",
          onConfirm: () {
            Get.back();
          },
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments["email"];

    //   super.onInit();
    // }
  }

  reSend() {
    verfiyCodeSignUpData.resendData(
      email!,
    );

    Get.rawSnackbar(
        title: "Verfiy Code Sended",
        messageText: const Text("Please Check Your Email Again"));
  }
  
}