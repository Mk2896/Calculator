import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.lightGreen,
    ),
    primaryColor: Colors.greenAccent,
    primaryColorDark: Colors.green,
    primaryColorLight: Colors.lightGreen,
    secondaryHeaderColor: Colors.black,
    textTheme: const TextTheme(
        titleSmall: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.grey)),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white12,
      unselectedItemColor: Colors.blueGrey,
      selectedItemColor: Colors.teal,
    ),
    primaryColor: Colors.lightGreen,
    primaryColorDark: Colors.green,
    primaryColorLight: Colors.teal,
    secondaryHeaderColor: Colors.white,
    textTheme: const TextTheme(
        titleSmall: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.grey)),
  );
}
