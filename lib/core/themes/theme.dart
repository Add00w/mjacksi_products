import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData lightTheme() {
  final baseLightTheme = ThemeData.light();
  return baseLightTheme.copyWith(
    scaffoldBackgroundColor: MjacksiColors.lightBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: MjacksiColors.lightBackground,
      elevation: 0.0,
    ),
    textTheme: baseLightTheme.textTheme.apply(fontFamily: 'Cairo'),
    cardTheme: CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: MjacksiColors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          minimumSize: const Size.fromHeight(64)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.grey.shade400,
          width: 0.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.grey.shade400,
          width: 0.5,
        ),
      ),
      isDense: true,
      filled: true,
      fillColor: Colors.white,
      hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 0.5,
          ),
        ),
        hintStyle: const TextStyle(
          color: Color.fromRGBO(112, 134, 220, 1),
          fontSize: 14,
        ),
      ),
    ),
  );
}
