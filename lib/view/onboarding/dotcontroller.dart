import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halago/core/constant/color.dart';
import 'package:halago/data/static/static.dart';

import '../../controllers/onboardingcontroller.dart';

class DotControllerOnboardeing extends StatelessWidget {
  const DotControllerOnboardeing({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(builder: (controller) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
            onBoardingList.length,
            (index) => AnimatedContainer(
              
                  margin: const EdgeInsets.only(right: 5),
                  duration: const Duration(microseconds: 900),
                  height: 6.5,
                  width: controller.currentPage == index ? 20: 5,
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                ))
      ],
    ));
  }
}
