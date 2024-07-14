import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final String? name;
  final bool? obscurePass;
  final Color? iconColor;
  final IconData? iconData;
  final void Function()? onpassword;
  final String? Function(String?)? valid;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction ;

  TextFormWidget({
    super.key,
    this.name,
    this.valid,
    this.controller,
    this.keyboardType,
    required this.obscurePass,
    this.iconColor,
    this.iconData,
    this.onpassword, required this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid,
      // autovalidateMode: AutovalidateMode.always,
      controller: controller,
      textInputAction:textInputAction,
      obscureText: obscurePass == null || obscurePass == false ? false : true,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: onpassword,
              icon: Icon(
                iconData,
                color: iconColor,
              )),
          hintText: name,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.all(10)),
    );
  }
}
