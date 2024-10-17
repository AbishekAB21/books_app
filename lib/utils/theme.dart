import 'package:flutter/material.dart';

// light mode
ThemeData lightMode = ThemeData(
  brightness: Brightness.light, 
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade400,
    inversePrimary: Colors.grey.shade900,
    error: Colors.red,
    tertiary: Colors.green,
    brightness: Brightness.light,
  ),
);

// dark mode
ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: const Color.fromARGB(255, 26, 26, 26),
    primary: Color.fromARGB(255, 42, 42, 42),
    secondary: Color.fromARGB(255, 50, 50, 50),
    inversePrimary: Colors.grey.shade300,
    error: Colors.red,
    tertiary: Colors.green,
    brightness: Brightness.dark, 
  ),
);
