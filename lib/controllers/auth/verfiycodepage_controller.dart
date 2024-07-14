import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halago/controllers/auth/firebaseauth.dart';
import 'package:halago/core/class/statusrequest.dart';
import 'package:halago/core/constant/color.dart';
import 'package:halago/core/constant/routes.dart';
import 'package:halago/core/functions/handlingdatacontroller.dart';
import 'package:halago/data/remote/auth/verfiysignupdata.dart';

class VerfiyCodePageController extends GetxController {
  static VerfiyCodePageController get instance => Get.find();
  VerfiyCodeSignUpData verfiyCodeSignUpData = VerfiyCodeSignUpData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  String? phone;
  String? countrycode ; 

  
  checkcode() {}

 
  goToSuccessSignUp(verfiyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();

    var response =
        await verfiyCodeSignUpData.postData(countrycode! + phone!, verfiyCodeSignUp);
    print("-------------- controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
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
    phone = Get.arguments["phone"];
    countrycode = Get.arguments["countrycode"];
    print(countrycode) ; 
    print(phone) ; 



    //   super.onInit();
    // }
  }

  reSend() {
    verfiyCodeSignUpData.resendData(
      phone!,
    );

    Get.rawSnackbar(
        title: "Verfiy Code Sended",
        messageText: const Text("Please Check Your Email Again"));
  }
}
