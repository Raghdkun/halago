import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halago/core/constant/color.dart';
import 'package:halago/core/constant/routes.dart';
import 'package:halago/core/localization/language_controller.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LanguageController());
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "LangChoose".tr,
                  style: TextStyle(color: AppColor.primaryColor, fontSize: 30),
                ),
              ),
              Flexible(
                flex: 5,
                child: SingleChildScrollView(
                  child: Container(
                    alignment: Alignment.center,
                    height: Get.height / 2,
                    width: Get.height / 2.5,
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Align(
                        alignment: Alignment.center,
                        child: GetBuilder<LanguageController>(
                          builder: (controller) => ListView(children: [
                            RadioListTile(
                              tileColor: AppColor.white,
                              title: Text(
                                "Arabic".tr,
                                style: TextStyle(
                                    color: AppColor.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              value: "ar",
                              selectedTileColor: Colors.white,
                              groupValue: controller.savedlanguage,
                              onChanged: (value) {
                                controller.savedlanguage = value!;
                                Get.updateLocale(Locale(value));
                                controller.saveLocal();
                              },
                              activeColor: AppColor.white,
                            ),
                            RadioListTile(
                              tileColor: AppColor.white,
                              title: Text(
                                "English".tr,
                                style: TextStyle(
                                    color: AppColor.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              value: "en",
                              selectedTileColor: Colors.white,
                              selected: false,
                              groupValue: controller.savedlanguage,
                              onChanged: (value) {
                                controller.savedlanguage = value!;
                                Get.updateLocale(Locale(value));
                                controller.saveLocal();
                              },
                              activeColor: AppColor.white,
                            ),
                          ]),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Flexible(
                child: Container(
                  width: 200,
                  height: 40,
                  child: MaterialButton(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                    onPressed: () {
                      Get.toNamed(AppRoute.onboarding); 
                    },
                    color: AppColor.primaryColor,
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          color: AppColor.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
