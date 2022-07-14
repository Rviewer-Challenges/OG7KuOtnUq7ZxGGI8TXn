import 'package:flutter/material.dart';

class BrandThemeData {
  static final ThemeData _light = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x4FFAB6)),
  );
  static final ThemeData _dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0x1A1C26), brightness: Brightness.dark),
  );

  static ThemeData light() => _light;
  static ThemeData dark() => _dark;
}
