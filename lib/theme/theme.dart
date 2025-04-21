import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medb/service/prefs_service.dart';

class AppTheme {
  static final Color _colorSeed = Color(0xff40a02b);
  static final prefsService = Get.find<PrefsService>();

  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: prefsService.themeFont,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _colorSeed,
        brightness: Brightness.light,
      ),
    );
  }

  static ThemeData get darkTheme => ThemeData(
    fontFamily: prefsService.themeFont,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _colorSeed,
      brightness: Brightness.dark,
    ),
  );
}
