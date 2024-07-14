import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:halago/core/constant/color.dart';
import 'package:halago/core/constant/imageasset.dart';
import 'package:halago/widgets/generalbutton.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.normal),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              height: Get.height / 2.5,
              width: Get.width / 1,
              child: SvgPicture.asset(
                AppImageAsset.city,
                width: Get.width / 1,
              ),
              color: AppColor.primaryColor,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(height: Get.height / 3.8),
                  Container(
                    alignment: Alignment.center,
                    height: Get.height / 1.9,
                    width: Get.width / 1.1,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                            "Enter your phone number to get a verfication code",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center),
                        SizedBox(
                          height: 15,
                        ),
                        // Container(
                        //   padding: EdgeInsets.all(10),
                        //   child: PhoneFormField(
                        //     controller: null, // controller & initialValue value
                        //     shouldFormat: true, // default
                        //     defaultCountry: IsoCode.JO, // default
                        //     textInputAction: TextInputAction.done,
                        //     decoration: InputDecoration(
                        //         hintText: "Enter Your Number",
                        //         border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(10),
                        //         ),
                        //         contentPadding: EdgeInsets.all(10)),
                        //     validator: PhoneValidator.validMobile(
                        //         allowEmpty:
                        //             true), // default PhoneValidator.valid()
                        //     isCountryChipPersistent: false, // default
                        //     isCountrySelectionEnabled: true, // default
                        //     countrySelectorNavigator:
                        //         CountrySelectorNavigator.draggableBottomSheet(
                        //       countries: [IsoCode.JO, IsoCode.SA, IsoCode.SY],
                        //     ),
                        //     showFlagInInput: true, // default
                        //     flagSize: 16, // default
                        //     // autofillHints: [
                        //     //   AutofillHints.telephoneNumber
                        //     // ], // default to null
                        //     enabled: true, // default
                        //     autofocus: false, // default
                        //     // default null
                        //     // ... + other textfield params
                        //   ),
                        // ),
                        SizedBox(
                          height: Get.height / 17,
                        ),
                        GeneralButton(
                          width1: Get.width / 1.5,
                          height1: Get.height / 18,
                          onPressed: () {},
                          title: "Next",
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
    );
  }
}
