import 'package:flutter/material.dart';
import 'package:halago/core/constant/color.dart';

class GeneralButton extends StatelessWidget {
  final String title;
  final double width1;
  final double height1;
  final void Function() onPressed;
  GeneralButton(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.width1,
      required this.height1});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width1,
      height: height1,
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: MaterialButton(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        onPressed: onPressed,
        color: AppColor.primaryColor,
        child: Text(
          title,
          style: TextStyle(color: AppColor.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
