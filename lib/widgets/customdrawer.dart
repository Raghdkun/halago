import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:halago/core/constant/color.dart';
import 'package:halago/widgets/drawerpages.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
          child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              child: Container(
            width: Get.width,
            height: Get.height / 3,
            color: Color(0xff6c2cf0).withOpacity(0.3),
          )),
          Positioned(
            top: Get.height / 18,
            left: Get.width / 9,
            child: Container(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  maxRadius: 65,
                  backgroundColor: Colors.white,
                )),
          ),
          Positioned(
              top: Get.height / 4.3,
              left: Get.width / 10,
              child: Container(
                child: Text(
                  "Abu Abdallah",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )),
          Positioned(
              top: Get.height / 3.5,
              left: Get.width / 10,
              child: Container(
                alignment: Alignment.center,
                width: Get.width / 3.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: Text(
                  "Cash : 10 ",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              )),
          DrawerPage(
            icon1: FontAwesomeIcons.house,
            icon2: FontAwesomeIcons.wallet,
            icon3: FontAwesomeIcons.clockRotateLeft,
            icon4: FontAwesomeIcons.bell,
            icon5: FontAwesomeIcons.gift,
            icon6: FontAwesomeIcons.arrowUpRightDots,
            icon7: FontAwesomeIcons.arrowRightFromBracket,
            name1: "Home",
            name2: "My Wallet",
            name3: "History",
            name4: "Notifications",
            name5: "Invite Friends",
            name6: "Settings",
            name7: "Logout",
            onTap1: () {},
            onTap2: () {},
            onTap3: () {},
            onTap4: () {},
            onTap5: () {},
            onTap6: () {},
            onTap7: () {},
          )
        ],
      )),
    );
  }
}
