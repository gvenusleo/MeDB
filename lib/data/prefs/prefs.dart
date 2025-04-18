import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static final Prefs _instance = Prefs._internal();
  factory Prefs() {
    return _instance;
  }
  Prefs._internal();

  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get themeFont => _prefs.getString('themeFont') ?? 'Sarasa';
  static set themeFont(String value) => _prefs.setString('themeFont', value);
}
