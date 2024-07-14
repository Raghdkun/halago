import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:halago/controllers/auth/verfiycodepage_controller.dart';
import 'package:halago/core/constant/color.dart';

class VerfiyCodePage extends GetView<VerfiyCodePageController> {
  const VerfiyCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    VerfiyCodePageController controller = Get.put(VerfiyCodePageController());
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          
          SizedBox(height: Get.height / 4.9),
          Text("Enter Your Verfiy Code", textAlign: TextAlign.center,),
          Center(
            child: Container(
              height: Get.height / 8,
              width: Get.width / 1.1,
              decoration: BoxDecoration(
                color: Get.isDarkMode
                              ? Color(0xFF17191B)
                              : Color(0xffcac4cf),
                borderRadius: BorderRadius.circular(10),
              ),
              child: OtpTextField(
                numberOfFields: 6,
                borderColor: Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  controller.goToSuccessSignUp(verificationCode); 
                  // Get.offAllNamed(AppRoute.login);
                }, // end onSubmit
              ),
            ),
          )
        ],
      )),
    );
  }
}
