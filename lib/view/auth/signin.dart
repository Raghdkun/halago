import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:halago/controllers/auth/signin_controller.dart';
import 'package:halago/core/constant/color.dart';
import 'package:halago/core/constant/routes.dart';
import 'package:halago/core/functions/validinput.dart';
import 'package:halago/widgets/cutomphoneauthsignin.dart';
import 'package:halago/widgets/generalbutton.dart';
import 'package:halago/widgets/textform.dart';

class SignIn extends GetView<SignInController> {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formstate,
      child: Container(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ListView(
            children: [
              GetBuilder<SignInController>(
                builder: (controller) {
                  return CustomPhoneAuthSignIn();
                },
              ),
              SizedBox(
                height: 15,
              ),
              GetBuilder<SignInController>(
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
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoute.forgetpassword);
                },
                child: Text("Forget Password?"),
              ),
              SizedBox(
                height: Get.height / 10,
              ),
              GeneralButton(
                width1: 50,
                height1: Get.height / 18,
                onPressed: () {
                  controller.login(); 
                },
                title: "Sign In",
              )
            ],
          ),
        ),
      ),
    );
  }
}
