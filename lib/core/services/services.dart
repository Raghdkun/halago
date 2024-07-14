
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:halago/firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform) ;
      await FirebaseAppCheck.instance.activate(
    webRecaptchaSiteKey: 'recaptcha-v3-site-key',
    // Default provider for Android is the Play Integrity provider. You can use the "AndroidProvider" enum to choose
    // your preferred provider. Choose from:
    // 1. debug provider
    // 2. safety net provider
    // 3. play integrity provider
    androidProvider: AndroidProvider.debug,
  );
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  await pusher.init(
  apiKey: "60b7b5392dcefe8812e1",
  onError: (message, code, error) {
    print(message); 
  },
  
  cluster: "eu"
);
await pusher.connect();

         
    sharedPreferences = await SharedPreferences.getInstance();
    
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
