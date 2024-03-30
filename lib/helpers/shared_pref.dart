import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  // Start class
  static late SharedPreferences _preferences;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  //! All SharedPref keys
  static const String _prefTokens = "@tokens";
  static const String _isAuth = "@isAuth";
  static const String _isWalkthroughEnable = "@isWalkthroughEnable";

  //! Methods for getting and setting data

  // for bearer token
  static Future setBearerToken(String token) async {
    await _preferences.setString(_prefTokens, token);
  }

  static String get bearerToken => _preferences.getString(_prefTokens) ?? '';

  // for isAuth
  static Future setIsAuth(bool val) async {
    await _preferences.setBool(_isAuth, val);
  }

  static bool get isAuth => _preferences.getBool(_isAuth) ?? false;

  // for isWalkthroughEnable
  static Future setIsWalkthroughEnable(bool val) async {
    await _preferences.setBool(_isWalkthroughEnable, val);
  }

  static bool get isWalkthroughEnable =>
      _preferences.getBool(_isWalkthroughEnable) ?? true;

  // End Class
}
