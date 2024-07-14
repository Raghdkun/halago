import 'package:shared_preferences/shared_preferences.dart';

class PrefServices {
  Future createString(String key, String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

  Future readString(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var cache = pref.getString(key) ?? "";
    return cache;
  }
}
