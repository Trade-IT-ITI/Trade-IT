import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: Colors.white,
  colorScheme: _colorScheme,
  //textTheme:
);

const ColorScheme _colorScheme = ColorScheme(
  primary: Colors.blueAccent,
  secondary: Colors.blueGrey,
  surface: Color.fromARGB(255, 189, 187, 187),
  background: Colors.white,
  error: Colors.red,
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.red,
  brightness: Brightness.light,
);
