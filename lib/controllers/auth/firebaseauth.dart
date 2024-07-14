import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseAuthController extends GetxController {
  static FirebaseAuthController get incstance => Get.find() ; 
  var verificationId = "".obs;
  FirebaseAuth auth = FirebaseAuth.instance;

  getPhoneAuth(String phoneNumber) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  Future<bool> verfiyOtp(String Otp) async {
    var credential = await auth.signInWithCredential(
        PhoneAuthProvider.credential(
            smsCode: Otp, verificationId: verificationId.value));
    return credential.user != null ? true : false;
  }
}
