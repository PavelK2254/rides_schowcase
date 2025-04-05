import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  fontFamily: 'Nunito',
  scaffoldBackgroundColor: const Color(0xFF121212),
  primaryColor: const Color(0xFF6A4DFF),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF6A4DFF),
    brightness: Brightness.dark,
    primary: const Color(0xFF6A4DFF),
    onPrimary: Colors.white,
    secondary: const Color(0xFF1E1E1E),
    onSecondary: Colors.white70,
    surface: const Color(0xFF1C1C1C),
    onSurface: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF121212),
    elevation: 0,
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF1E1E1E),
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
    backgroundColor: const Color(0xFF1C1C1C),
    selectedItemColor: const Color(0xFF6A4DFF),
    unselectedItemColor: Colors.grey.shade500,
    selectedLabelStyle: const TextStyle(fontSize: 12),
    unselectedLabelStyle: const TextStyle(fontSize: 12),
    showUnselectedLabels: true,
  ),
  cardTheme: CardTheme(
    color: const Color(0xFF1E1E1E),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 2,
    margin: const EdgeInsets.all(8),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.white70),
    labelLarge: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
  ),
);
