import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: 'Nunito',
  scaffoldBackgroundColor: Colors.white,
  primaryColor: const Color(0xFF6A4DFF), // Vibrant purple used for buttons
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF6A4DFF),
    primary: const Color(0xFF6A4DFF),
    onPrimary: Colors.white,
    secondary: const Color(0xFFF5F5F5),
    onSecondary: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black87,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    foregroundColor: Colors.black,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFFF0F0F5), // light gray background for input
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide.none,
    ),
    hintStyle: TextStyle(
      color: Colors.grey.shade500,
      fontSize: 16,
    ),
    prefixIconColor: Colors.grey.shade500,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF6A4DFF),
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      minimumSize: const Size.fromHeight(50),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: const Color(0xFF6A4DFF),
    unselectedItemColor: Colors.grey.shade500,
    selectedLabelStyle: const TextStyle(fontSize: 12),
    unselectedLabelStyle: const TextStyle(fontSize: 12),
    showUnselectedLabels: true,
  ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 2,
    margin: const EdgeInsets.all(8),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
);
