import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> saveLoginKey(String loginKey) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('loginKey', loginKey);
  }

  static Future<String?> getLoginKey() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('loginKey');
  }

  static Future<void> removeLoginKey() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('loginKey');
  }
}
