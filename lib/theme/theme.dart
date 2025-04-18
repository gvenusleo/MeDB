import 'package:flutter/material.dart';
import 'package:medb/data/prefs/prefs.dart';

class AppTheme {
  static final Color _colorSeed = Color(0xff40a02b);

  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: Prefs.themeFont,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _colorSeed,
        brightness: Brightness.light,
      ),
    );
  }

  static ThemeData get darkTheme => ThemeData(
    fontFamily: Prefs.themeFont,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _colorSeed,
      brightness: Brightness.dark,
    ),
  );
}
