import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    primary: Colors.grey.shade600,
    secondary: Color(0xFF1C1C1C),
    inversePrimary: Colors.grey.shade300,
  ),
);
