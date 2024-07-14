import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

imageUploadFromCamera() async {
  final XFile? file = await ImagePicker().pickImage(
    source: ImageSource.camera,
  );
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

pickMultipleFilesFromGallery({bool isSvg = false}) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: isSvg
        ? ["svg", "SVG"]
        : ["png", "PNG", "jpg", "jpeg", "gif", "JPEG", "JPG"],
    allowMultiple: true,
  );
  if (result!.files.length >= 3) {
    if (result.files.isNotEmpty) {
      return result.files.map((file) => File(file.path!)).toList();
    } else {
      return null;
    }
  }
}

fileUploadFromGallery([isSvg = false, ismulti = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: isSvg
          ? ["svg", "SVG"]
          : ["png", "PNG", "jpg" "jpeg", "gif", "JPEG", "JPG"],
      allowMultiple: ismulti);
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

showButtonMenu(Function() chooseCamera, Function() chooseGallory) {
  Get.bottomSheet(
    Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        height: 170,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Choose An Image"),
            ListTile(
              title: const Text("Take Image From Camera"),
              onTap: () {
                chooseCamera();
              },
              leading: const Icon(
                Icons.camera_alt,
                size: 40,
              ),
            ),
            ListTile(
              title: const Text("Take Image From Gallery"),
              onTap: () {
                chooseGallory();
              },
              leading: const Icon(
                Icons.image,
                size: 40,
              ),
            )
          ],
        ),
      ),
    ),
    backgroundColor: Colors.white,
  );
}
