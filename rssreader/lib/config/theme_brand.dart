import 'package:flutter/material.dart';

class BrandThemeData {
  static final ThemeData _light = ThemeData(
    primaryColor: Colors.green.shade900,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade900),
  );
  static final ThemeData _dark = ThemeData.dark().copyWith(
    primaryColor: const Color(0xFF3D4158),
    canvasColor: const Color(0xFF3D4158),
    cardColor: const Color(0xFF3D4158),
    dividerColor: const Color(0xFF3D4158),
    splashColor: const Color(0xFF3D4158),
    secondaryHeaderColor: const Color(0xFF3D4158),
    toggleableActiveColor: const Color(0xFF4FFAB6),
    hintColor: const Color(0xFF4FFAB6),
    indicatorColor: const Color(0xFF4FFAB6),
    applyElevationOverlayColor: true,
    bottomAppBarColor: const Color(0xFF3D4158),
    scaffoldBackgroundColor: const Color(0xFF1A1C26),
    appBarTheme: const AppBarTheme(
      color: Color(0xFF3D4158),
    ),
  );

  static ThemeData light() => _light;
  static ThemeData dark() => _dark;
}
