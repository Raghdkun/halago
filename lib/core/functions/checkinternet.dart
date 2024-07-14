// import 'dart:io';

// checkInternet() async {

//   try{
//     var result = await InternetAddress.lookup("google.com") ;
//     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty){
//       return true ; 
//     }

//   }on SocketException catch(_){
//     return false ;
//   }
// }
import 'package:connectivity/connectivity.dart';

Future<bool> checkInternet() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    return false;
  } else {
    return true;
  }
}