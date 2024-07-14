import 'package:halago/apilinks.dart';
import 'package:halago/core/class/crud.dart';

class VerfiyCodeSignUpData {
  Crud crud;

  VerfiyCodeSignUpData(this.crud);

  postData(String phone, String verifycode) async {
    var response = await crud.postData(AppLink.verfiyCodeSignUp, {
      "phone": phone,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
  resendData(String email, ) async {
    var response = await crud.postData(AppLink.resend, {
      "email": email,
      
    }
    );
    return response.fold((l) => l, (r) => r);
  }
}