import 'package:halago/apilinks.dart';
import 'package:halago/core/class/crud.dart';

class SignUpData {
  Crud crud ; 

  SignUpData(this.crud) ;

  postData( String password ,String email ,String phone) async {
    var response = await crud.postData(AppLink.signup , {
      
      "password" : password , 
      "email" : email , 
      "phone" : phone , 


    }); 
   return response.fold((l) => l, (r) => r) ;
  }
}