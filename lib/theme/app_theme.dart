import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromARGB(255, 204, 0, 0);
  static const Color secondary = Color.fromARGB(255, 59, 76, 202);
  static const Color tertiar = Color.fromARGB(255, 255, 221, 0);

  static ThemeData themeLight() {
    return ThemeData.light().copyWith(
        primaryColor: primary,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          color: Colors.blueGrey,
          elevation: 0
        ),
        scaffoldBackgroundColor: Colors.white
      );
  }

  static ThemeData themeDark() {
    return ThemeData.dark().copyWith(
        primaryColor: primary,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 0, 58, 87),
          elevation: 0
        ),
        scaffoldBackgroundColor: Colors.grey
      );
  }
}
