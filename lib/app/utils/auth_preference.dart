import 'package:shared_preferences/shared_preferences.dart';

class AuthPreference {
  factory AuthPreference() => _instance;
  AuthPreference._internal();
  static final AuthPreference _instance = AuthPreference._internal();

  static SharedPreferences? preferences;
  static const _keyToken = 'keyAuth';
  static String get keyToken => _keyToken;

  static Future init() async => await SharedPreferences.getInstance();

  static Future setToken(String token) async =>
      await preferences?.setString(_keyToken, token);

  static String? getToken() => preferences?.getString(_keyToken);

  static Future removeToken() async => await preferences?.remove(_keyToken);
}
