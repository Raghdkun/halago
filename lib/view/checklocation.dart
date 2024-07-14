import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:halago/controllers/currentlocation_controller.dart';

import 'package:halago/core/constant/color.dart';
import 'package:halago/core/constant/imageasset.dart';

class CheckLocation extends StatelessWidget {
  const CheckLocation({super.key});

  @override
  Widget build(BuildContext context) {
    CurrentLocationController controller = Get.put(CurrentLocationController());
    return Scaffold(
      body: SafeArea(
          child: Container(
        alignment: Alignment.center,
        child: ListView(
          children: [
            SizedBox(
              height: Get.height / 5.5,
            ),
            Container(
              width: Get.width / 1,
              child: SvgPicture.asset(
                AppImageAsset.checklocation,
                width: Get.width / 1,
              ),
            ),
            SizedBox(
              height: Get.height / 10,
            ),
            Text(
              "Hi , Nice To Meet You",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            SizedBox(
              height: Get.height / 16,
            ),
            Text(
              "Choose Your location to get started!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColor.black,
                  // fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            SizedBox(
              height: Get.height / 16,
            ),
            InkWell(
              onTap: () {
               
                controller.getCurrentLocation(); 
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  width: double.infinity,
                  height: Get.height / 14,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.primaryColor),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.locationArrow,
                        color: AppColor.primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Use Current Location",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColor.primaryColor,
                            // fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: Get.height / 16,
            ),
            // InkWell(
            //   onTap: () {},
            //   child: Text(
            //     "Seleted manually",
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //         color: Colors.red,
            //         // fontWeight: FontWeight.bold,
            //         fontSize: 14),
            //   ),
            // ),
          ],
        ),
      )),
    );
  }
}
