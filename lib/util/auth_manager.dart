import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/dr.dart';

class AuthManager {
  static final SharedPreferences _sharedPreferences = locator.get();

  static final ValueNotifier<String?> authChangeNotifire = ValueNotifier(null);
  static void saveToken(String token) async {
    // Logic to save the token securely
    _sharedPreferences.setString('access_token', token);
    authChangeNotifire.value = token;
  }

  static String? readAuth() {
    // Logic to retrieve the token securely
    return _sharedPreferences.getString('access_token') ?? '';
  }

  static void lougout() async {
    // Logic to delete the token securely
    await _sharedPreferences.clear();
    authChangeNotifire.value = null;
  }

  static bool isLogin() {
    String? token = readAuth();
    if (token == null || token.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
