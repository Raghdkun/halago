import 'package:halago/apilinks.dart';
import 'package:halago/core/class/crud.dart';

class CountryData {
  Crud crud ; 

  CountryData(this.crud) ;

  getData() async {
    var response = await crud.postData(AppLink.countrycode , {}); 
   return response.fold((l) => l, (r) => r) ;
  }
}