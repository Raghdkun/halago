import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halago/view/onboarding/dotcontroller.dart';
import 'package:halago/view/onboarding/onboardingbutton.dart';
import 'package:halago/view/onboarding/slider.dart';

import '../../controllers/onboardingcontroller.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(flex: 4, child: SliderOnBoarding()),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: DotControllerOnboardeing(),
                  ),
                  Spacer(flex: 1),
                  GetBuilder<OnBoardingControllerImp>(
                    builder: (controller) => controller.currentPage == 2 ? Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomButtonOnBoarding(),
                    ) : Container(),
                  )
                ],
              ))
        ],
      ),
    ));
  }
}
