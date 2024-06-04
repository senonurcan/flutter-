import 'package:flutter/material.dart';

final class ProductTheme {
  ProductTheme._();

  static ProductTheme get instance => ProductTheme._();

  // Light Theme
  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF03A9F4), 
    secondaryHeaderColor: const Color(0xFF8BC34A), 
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF03A9F4),
      foregroundColor: Colors.white,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF03A9F4),
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodySmall: TextStyle(color: Colors.black87),
    ),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF03A9F4),
      secondary: Color(0xFF8BC34A),
      background: Color(0xFFF5F5F5),
      surface: Colors.white,
      error: Color(0xFFF44336),
    ),
  );

  // Dark Theme
  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF0288D1), 
    secondaryHeaderColor: const Color(0xFF689F38),
    scaffoldBackgroundColor: const Color(0xFF303030),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0288D1),
      foregroundColor: Colors.white,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF0288D1),
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white70),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF0288D1),
      secondary: Color(0xFF689F38),
      background: Color(0xFF303030),
      surface: Color(0xFF424242),
      error: Color(0xFFEF5350),
    ),
  );
}
