import 'package:shared_preferences/shared_preferences.dart';

class SettingPreferences {
  late SharedPreferences prefs;

  static final SettingPreferences _instance = SettingPreferences._internal();

  factory SettingPreferences() => _instance;

  SettingPreferences._internal();

  init() async {
    prefs = await SharedPreferences.getInstance();
  }

  bool get darkMode => prefs.getBool('darkMode') ?? false;

  set darkMode(bool isDark) {
    prefs.setBool('darkMode', isDark);
  }

  bool sourceIsActive(String id) => prefs.getBool(id) ?? false;

  setSourceFeed(String id, [bool active = true]) {
    prefs.setBool(id, active);
  }

  Future<bool> restore() async {
    return prefs.clear();
  }
}
