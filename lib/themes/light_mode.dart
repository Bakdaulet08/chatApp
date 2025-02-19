import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade300, // Устанавливаем фон для Scaffold
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade300,
    secondary: Colors.grey.shade200,
    tertiary: Colors.grey.shade500,
    inversePrimary: Colors.grey.shade700,
  ),
);
