import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halago/core/constant/color.dart';


Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "alert!",
      middleText: "Do You Want To Exit From The App?",
      radius: 10,
      buttonColor: AppColor.primaryColor,
      actions: [
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.black)),
          onPressed: () {
            exit(0);
          },
          child: const Text("Yes"),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.black)),
          onPressed: () {
            Get.back();
          },
          child: const Text("No"),
        )
      ]);
  return Future.value(true);
}
