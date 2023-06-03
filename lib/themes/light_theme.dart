import 'package:flutter/material.dart';

final lightTheme = ThemeData.light().copyWith(
  textTheme: const TextTheme(
    labelSmall: TextStyle(
      color: Colors.grey,
      fontSize: 12,
      letterSpacing: 0.3,
    ),
    headlineSmall: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      color: Colors.grey,
      fontSize: 12,
    ),
    labelMedium: TextStyle(
      color: Colors.blueGrey,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: Colors.blue,
    unselectedLabelColor: Colors.grey,
  ),
);
