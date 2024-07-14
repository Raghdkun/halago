import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:halago/controllers/auth/firebaseauth.dart';
import 'package:halago/controllers/auth/signupcontroller.dart';
import 'package:halago/core/constant/color.dart';
import 'package:halago/core/functions/validinput.dart';
import 'package:halago/widgets/customphoneauthsignup.dart';
import 'package:halago/widgets/generalbutton.dart';
import 'package:halago/widgets/textform.dart';

class SignUp extends GetView<SignUpController> {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FirebaseAuthController()) ; 
    Get.put(SignUpController());
    return Form(
      key: controller.formstate,
      child: Container(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ListView(
            children: [
              SizedBox(
                height: 15,
              ),
              GetBuilder<SignUpController>(
                builder: (controller) {
                  return CustomPhoneAuthSignUp(controller.phone);
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormWidget(
                textInputAction: TextInputAction.next,
                obscurePass: false,
                valid: (val) {
                  return validInput(val!, 5, 254, "email");
                },
                controller: controller.email,
                keyboardType: TextInputType.emailAddress,
                name: "Enter Your Email",
              ),
              SizedBox(
                height: 15,
              ),
              GetBuilder<SignUpController>(
                builder: (controller) => TextFormWidget(
                  textInputAction: TextInputAction.done,
                  iconData: !controller.isShowPassword
                      ? FontAwesomeIcons.lockOpen
                      : FontAwesomeIcons.lock,
                  iconColor: AppColor.primaryColor,
                  obscurePass: controller.isShowPassword ? true : false,
                  onpassword: () {
                    controller.visablePass();
                  },
                  controller: controller.password,
                  valid: (val) {
                    return validatePassword(val!);
                  },
                  keyboardType: TextInputType.visiblePassword,
                  name: "Enter Your Password",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: Get.height / 35,
              ),
              GeneralButton(
                width1: 50,
                height1: Get.height / 18,
                onPressed: () {
                  // print("${controller.countrycode.text}${controller.phone.text}"); 
                  // controller.phoneAuth("+${controller.countrycode.text.trim()}${controller.phone.text.trim()}"); 
                  controller.signUp(); 

                },
                title: "Sign Up",
              ),
              SizedBox(
                height: Get.height / 23,
              ),
              InkWell(
                  onTap: () {},
                  child: Text(
                    "By Signing up you're agree to the term of services",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
