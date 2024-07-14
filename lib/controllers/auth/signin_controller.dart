import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halago/apilinks.dart';
import 'package:halago/core/class/statusrequest.dart';
import 'package:halago/core/constant/routes.dart';
import 'package:halago/core/functions/handlingdatacontroller.dart';
import 'package:halago/core/services/services.dart';
import 'package:halago/data/models/countrymodel.dart';
import 'package:halago/data/remote/auth/login.dart';

import 'package:halago/data/remote/countrydata.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';

class SignInController extends GetxController {
  bool isShowPassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
MyServices myServices = Get.find() ; 

  List<CountryModel> data = [];
  String selectedCountry = "";

  late TextEditingController phone;
 
 late TextEditingController countrycode;
  
  final listDropdownController = DropdownController();
  late TextEditingController password;

  List<CoolDropdownItem<String>> dropdownItemList = [];
  List<CoolDropdownItem<String>> countrydropdown = [];

  CountryData countryData = CountryData(Get.find());
  LoginData loginData =  LoginData(Get.find()); 

    FirebaseAuth auth = FirebaseAuth.instance;

    List<CoolDropdownItem> dropdownlist = [];
  selectval(String newVal) {
    countrycode.text = newVal;
    update();
  }
login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      
      update();
      var response = await loginData.postData(countrycode.text + phone.text, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          if (response['data']['users_approve'] == "1") {
            myServices.sharedPreferences
                .setString("id", response['data']['users_id'].toString());
           
            myServices.sharedPreferences
                .setString("email", response['data']['users_email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['users_phone']);
            myServices.sharedPreferences.setString("step", "2");
            Get.offNamed(AppRoute.home);
          } else {
            Get.toNamed(AppRoute.verfiycodepage,
                arguments: {"phone": phone.text , "countrycode" : countrycode.text});
          }
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("object");
    }
  }

     
  
  

  getCountry() async {
    statusRequest = StatusRequest.loading;
    var response = await countryData.getData();

    statusRequest = handlingData(response);
    print("======== $response");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        List listdata = response['data'];
        // List data = [];
        data.addAll(listdata.map((e) => CountryModel.fromJson(e)));
        for (var i = 0; i < data.length; i++) {
          countrydropdown.add(
            CoolDropdownItem<String>(
              label: '+${data[i].countrycodesCode}',
              icon: Container(
                height: 25,
                width: 25,
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppLink.server}/upload/countries/${data[i].countrycodesFlag}",
                ),
              ),
              value: '${data[i].countrycodesCode}',
            ),
          );
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  String? phoneId;
  visablePass() {
    print("worked");
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  void dispose() {
    phone.dispose();
    password.dispose();
    countrycode.dispose(); 
    super.dispose();
  }

  @override
  void onInit() {
    getCountry();

    phone = TextEditingController();

    countrycode = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
}
