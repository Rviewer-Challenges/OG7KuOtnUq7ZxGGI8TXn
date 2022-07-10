import 'package:flutter/material.dart';

class BrandThemeData {
  static final ThemeData _light = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Colors.deepOrange,
        onPrimary: Colors.white,
        secondary: Colors.grey,
        onSecondary: Colors.black,
        error: Colors.redAccent,
        onError: Colors.red,
        background: Colors.grey.shade200,
        onBackground: Colors.blueGrey,
        surface: Colors.lightBlue,
        onSurface: Colors.black26),
  );
  static final ThemeData _dark = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.grey.shade100,
      onPrimary: Colors.lime,
      secondary: Colors.lightBlue,
      onSecondary: Colors.deepPurple,
      error: Colors.redAccent.shade700,
      onError: Colors.red.shade800,
      background: Colors.grey.shade800,
      onBackground: Colors.lime,
      surface: Colors.black45,
      onSurface: Colors.lime,
      onSecondaryContainer: Colors.lime,
    ),
  );

  static ThemeData light() => _light;
  static ThemeData dark() => _dark;
}
