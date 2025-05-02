import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medb/service/prefs_service.dart';

class SettingsController extends GetxController {
  late RxInt themeMode;
  final prefsService = Get.find<PrefsService>();

  @override
  void onInit() {
    super.onInit();
    themeMode = prefsService.themeMode.obs;
  }

  void changeThemeMode(int value) {
    if (value == themeMode.value) return;
    themeMode.value = value;
    prefsService.themeMode = value;
    Get.changeThemeMode(
      [ThemeMode.light, ThemeMode.dark, ThemeMode.system][value],
    );
  }
}
