import 'package:cached_network_image/cached_network_image.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halago/apilinks.dart';
import 'package:halago/controllers/auth/firebaseauth.dart';
import 'package:halago/core/class/statusrequest.dart';
import 'package:halago/core/constant/routes.dart';
import 'package:halago/core/functions/handlingdatacontroller.dart';
import 'package:halago/data/models/countrymodel.dart';
import 'package:halago/data/remote/auth/signupdata.dart';
import 'package:halago/data/remote/countrydata.dart';

import '../../core/constant/color.dart';

class SignUpController extends GetxController {
  bool isShowPassword = true;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;
  CountryData countryData = CountryData(Get.find());

  SignUpData signUpData = SignUpData(Get.find()) ; 

  late TextEditingController phone;


  List<CountryModel> data = [];
  String? selectedCountry;
  final listDropdownController = DropdownController();
  late TextEditingController email;
  
  late TextEditingController password;

  TextEditingController? smsCode;
  late TextEditingController countrycode;
  final List<CoolDropdownItem<String>> dropdownItemList = [];
  final List<CoolDropdownItem<String>> countrydropdown = [];
  FirebaseAuth auth = FirebaseAuth.instance;

  visablePass() {
    print("worked");
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  List<CoolDropdownItem> dropdownlist = [];
  selectval(String newVal) {
    countrycode.text = newVal;
    update();
  }

  goToVerfiyCodePage() {
    if (formstate.currentState!.validate() && countrycode.text != "") {
      Get.toNamed(AppRoute.verfiycodepage,
          arguments: {phone.text: "phone", countrycode.text: "country"});
    } else {
      print("field");
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
              isSelected: true,
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
phoneAuth(number){
  FirebaseAuthController.incstance.getPhoneAuth(number) ; 
}


signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(
           password.text, email.text,countrycode.text + phone.text);
      print("-------------- controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response?['status'] == "success") {
          // data.addAll(response?['data']);
          // auth.createUserWithEmailAndPassword(email: email.text.trim(), password: password.text.trim());  
          Get.offNamed(AppRoute.verfiycodepage,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "Email Or Phone Number Is Already Exists",
            buttonColor: AppColor.primaryColor ,
            onConfirm: () {
              Get.back();
            },
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      // print("Not Valid");
    }
  }

  @override
  void dispose() {
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    getCountry();
    countrycode = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }
}
