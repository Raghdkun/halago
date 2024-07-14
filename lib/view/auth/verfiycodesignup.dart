import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:halago/core/constant/color.dart';

import '../../controllers/auth/verfiycodesignup_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../widgets/auth/bodytextwidget.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerfiyPasswordSignUpControllerImp());
    return Scaffold(
        // backgroundColor: Colors.white70,
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "24",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        body: GetBuilder<VerfiyPasswordSignUpControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: ListView(
                      children: [
                        BodyTextField(
                          bodytext: "26".tr,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BodyTextField(
                          bodytext: "25".tr,
                        ),
                         BodyTextField(
                          bodytext: "${controller.email}",
                        ),
                        const SizedBox(
                          height: 25,
                        ),

                        // const Text(
                        //   "Forget Password?",
                        //   textAlign: TextAlign.right,
                        // ),
                        OtpTextField(
                          borderWidth: 4,
                          borderRadius: BorderRadius.circular(20),
                          fieldWidth: 50,
                          numberOfFields: 5,
                          borderColor: Colors.white70,
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            // controller.goToSuccessSignUp(verificationCode);
                          }, // end onSubmit
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                         InkWell(onTap: (){
                    // controller.reSend() ; 
                  },child: Center(child: Text("Resend verfiy code" , style: TextStyle(color: AppColor.primaryColor , fontSize: 20 ),)),)
                      ],
                    ),
                  ),
                )));
  }
}