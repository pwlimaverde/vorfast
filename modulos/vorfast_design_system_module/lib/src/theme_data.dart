import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color.fromARGB(255, 200, 100, 100),
    secondary: const Color.fromARGB(255, 20, 20, 20),
  ),
  fontFamily: 'Georgia',
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 72.0,
      fontWeight: FontWeight.bold,
    ),
  ),
);
