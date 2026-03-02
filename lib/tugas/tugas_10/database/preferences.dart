import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  //initiator
  static final PreferenceHandler _instance = PreferenceHandler._internal();
  late SharedPreferences _preferences;
  factory PreferenceHandler() => _instance;
  PreferenceHandler._internal();
  //create
  static const String _isLogin = 'isLogin';
  Future<void> storingIsLogin(bool isLogin) async {
    await _preferences.setBool(_isLogin, isLogin);
  }

  //get
  Future<void> getIslogin() async {
    _preferences.getBool(_isLogin);
  }

  //delete
  // Future<void> deleteIsLogin() async {
  //   _preferences.
  // }
}
