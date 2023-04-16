import 'package:flutter/material.dart';

// Light theme data
ThemeData lightThemeData() {
  return ThemeData.light().copyWith(
    primaryColor: Colors.teal[800],
  );
}

// Dark theme data
ThemeData darkThemeData() {
  return ThemeData.dark();
}
