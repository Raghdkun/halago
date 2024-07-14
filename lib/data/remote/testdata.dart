import 'package:halago/apilinks.dart';
import 'package:halago/core/class/crud.dart';

class TestData {
  Crud crud ; 

  TestData(this.crud) ;

  getData() async {
    var response = await crud.postData(AppLink.server , {}); 
   return response.fold((l) => l, (r) => r) ;
  }
}