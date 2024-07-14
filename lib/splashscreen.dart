import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halago/controllers/splashscreen_controller.dart';
import 'package:halago/core/constant/color.dart';
import 'package:halago/core/constant/imageasset.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      bottomSheet: BottomAppBar(
        height: Get.height / 3,
        color: AppColor.primaryColor,
        child: SvgPicture.asset(
          fit: BoxFit.fill,
          AppImageAsset.city,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
      backgroundColor: AppColor.primaryColor,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(bottom: 140),
        child: Image.asset(AppImageAsset.logo, height: 220),
      ),
    );
  }
}
