import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:halago/controllers/auth/login_controller.dart';
import 'package:halago/controllers/auth/signin_controller.dart';
import 'package:halago/controllers/auth/signupcontroller.dart';
import 'package:halago/core/constant/color.dart';
import 'package:halago/core/constant/imageasset.dart';
import 'package:halago/view/auth/signin.dart';
import 'package:halago/view/auth/signup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    Get.put(SignUpController());
    Get.put(SignInController());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GetBuilder<LoginController>(
        builder: (controller) => SingleChildScrollView(
          physics: BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: Get.height / 1.9,
                width: Get.width / 1,
                child: SvgPicture.asset(
                  AppImageAsset.city,
                  width: Get.width / 1,
                ),
                color:
                    Get.isDarkMode ? Color(0xFF17191B) : AppColor.primaryColor,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(height: Get.height / 2.9),
                    Container(
                      alignment: Alignment.center,
                      height: Get.height / 1.9,
                      width: Get.width / 1.1,
                      decoration: BoxDecoration(
                        color:
                            Get.isDarkMode ? Color(0xFF17191B) : AppColor.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          TabBar(
                            dividerColor: Colors.transparent,
                            labelStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            // indicatorColor: AppColor.primaryColor,
                            indicatorSize: TabBarIndicatorSize.label,
                            // labelColor: AppColor.primaryColor,
                            controller: controller.tabController,
                            indicatorWeight: 3.5,
                            tabs: [
                              Tab(
                                text: "Sign In",
                              ),
                              Tab(
                                text: "Sign Up",
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              physics: NeverScrollableScrollPhysics(),
                              controller: controller.tabController,
                              children: [
                                SignIn(),
                                SignUp(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
