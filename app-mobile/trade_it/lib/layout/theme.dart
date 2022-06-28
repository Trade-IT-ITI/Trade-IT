import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor : Colors.white,
  colorScheme:_colorScheme,
  textTheme:const TextTheme(
    displayLarge: TextStyle(
      color: Colors.white,
      fontSize: 25,
    ),
    displayMedium: TextStyle(
      color: Colors.white,
      fontSize: 21,
    ),
    displaySmall: TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
  ),
);

const ColorScheme _colorScheme = ColorScheme(
  primary: Colors.blueAccent,
  secondary: Colors.blueGrey,
  surface: Colors.white,
  background: Colors.white,
  error: Colors.red,
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.red,
  brightness: Brightness.light,
);