import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halago/apptheme.dart';
import 'package:halago/binding/initial_binding.dart';
import 'package:halago/controllers/locationrequest_controller.dart';
import 'package:halago/core/constant/color.dart';
import 'package:halago/core/functions/translatesdiraction.dart';

import 'package:halago/core/localization/translation.dart';
import 'package:halago/core/services/services.dart';
import 'package:halago/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(LocationRequestController());
    return GetMaterialApp(
      title: 'Hala Go',
      getPages: routes,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      color: AppColor.primaryColor,
      initialBinding: IntialBindings(),
      textDirection: TranslateDiraction(TextDirection.rtl, TextDirection.ltr),
      translations: MyTranslation(),
      locale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      debugShowCheckedModeBanner: false,
      // theme: controller.appTheme,
    );
  }
}
