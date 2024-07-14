import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:halago/controllers/auth/signupcontroller.dart';
import 'package:halago/core/functions/validinput.dart';
import 'package:halago/widgets/textform.dart';

class CustomPhoneAuthSignUp extends GetView<SignUpController> {
  final TextEditingController phone ; 
  const CustomPhoneAuthSignUp(this.phone, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
        builder: (controller) => Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 47,
                    child: CoolDropdown<String>(
                      controller: controller.listDropdownController,
                      dropdownList: controller.countrydropdown,
                      isMarquee: true,
                      // defaultItem: controller.countrydropdown[0],
                      onChange: (newVal) async {
                        controller.selectval(newVal);

                        if (controller.listDropdownController.isError) {
                          await controller.listDropdownController.resetError();
                        }
                        controller.selectval(newVal);

                        controller.listDropdownController.close();
                      },

                      onOpen: (value) {},
                      resultOptions: ResultOptions(
                        textStyle: TextStyle(
                            color: Get.isDarkMode
                                ? Colors.white
                                : Color(0xFF17191B),
                            fontWeight: FontWeight.bold),
                        boxDecoration: BoxDecoration(
                            border: Border.fromBorderSide(BorderSide(
                              width: 0.8,
                              color: Get.isDarkMode
                                  ? Color(0xffcac4cf)
                                  : Color(0xFF17191B),
                            )),
                            borderRadius: BorderRadius.circular(10)),
                        // padding: EdgeInsets.symmetric(horizontal: 10),
                        width: 200,
                        // height: 50,
                        icon: const SizedBox(
                          width: 10,
                          height: 10,
                          child: CustomPaint(
                            painter: DropdownArrowPainter(),
                          ),
                        ),
                        render: ResultRender.label,
                        placeholder: "PN",
                        openBoxDecoration: BoxDecoration(
                            color: Get.isDarkMode
                                ? Color(0xFF17191B)
                                : Colors.white,
                            border: Border.fromBorderSide(BorderSide(
                              width: 0.8,
                              color: Get.isDarkMode
                                  ? Color(0xffcac4cf)
                                  : Color(0xFF17191B),
                            )),
                            borderRadius: BorderRadius.circular(10)),

                        isMarquee: true,
                      ),
                      dropdownOptions: DropdownOptions(
                          color: Get.isDarkMode
                              ? Color(0xFF17191B)
                              : Color(0xffcac4cf),
                          top: 20,
                          height: 200,
                          width: 140,
                          gap: DropdownGap.all(5),
                          borderSide: BorderSide(
                              width: 1,
                              color: Get.isDarkMode
                                  ? Color(0xFF17191B)
                                  : Color(0xffcac4cf)),
                          // padding: EdgeInsets.symmetric(horizontal: 10),
                          align: DropdownAlign.left,
                          animationType: DropdownAnimationType.scale),
                      dropdownTriangleOptions: DropdownTriangleOptions(
                        width: 20,
                        height: 30,
                        align: DropdownTriangleAlign.left,
                        borderRadius: 3,
                        left: 20,
                      ),
                      dropdownItemOptions: DropdownItemOptions(
                        selectedBoxDecoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? Color(0xFF17191B)
                              : Color(0xffcac4cf),
                        ),
                        selectedTextStyle: TextStyle(
                            color: Get.isDarkMode
                                ? Color(0xffcac4cf)
                                : Color(0xFF17191B),
                            fontWeight: FontWeight.bold),
                        textStyle: TextStyle(
                            color: Get.isDarkMode
                                ? Color(0xffcac4cf)
                                : Color(0xFF17191B)),
                        isMarquee: true,
                        boxDecoration: BoxDecoration(
                            color: Get.isDarkMode
                                ? Color(0xFF17191B)
                                : Color(0xffcac4cf)),
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        render: DropdownItemRender.all,
                        height: 50,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Expanded(
                  flex: 3,
                  child: TextFormWidget(
                    textInputAction: TextInputAction.done,
                    obscurePass: false,
                    controller: phone,
                    valid: (val) {
                      return validInput(val!, 9, 10, "phone");
                    },
                    keyboardType: TextInputType.number,
                    name: "Phone Number",
                  ),
                )
              ],
            ));
  }
}
