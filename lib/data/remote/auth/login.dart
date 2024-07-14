import 'package:halago/apilinks.dart';
import 'package:halago/core/class/crud.dart';

class LoginData {
  Crud crud ; 

  LoginData(this.crud) ;

  postData( String phone ,String password) async {
    var response = await crud.postData(AppLink.login , {
      "phone" : phone , 
      "password" : password , 
    }); 
   return response.fold((l) => l, (r) => r) ;
  }
}