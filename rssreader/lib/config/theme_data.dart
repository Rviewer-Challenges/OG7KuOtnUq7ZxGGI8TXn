import 'package:flutter/material.dart';

class BrandThemeData {
  static final ThemeData _light = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
  );
  static final ThemeData _dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.orange, brightness: Brightness.dark),
  );

  static ThemeData light() => _light;
  static ThemeData dark() => _dark;
}
