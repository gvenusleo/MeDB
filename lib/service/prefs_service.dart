import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsService extends GetxService {
  static late final SharedPreferences _prefs;

  Future<PrefsService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  String get themeFont => _prefs.getString('themeFont') ?? '';
  set themeFont(String value) => _prefs.setString('themeFont', value);
}
