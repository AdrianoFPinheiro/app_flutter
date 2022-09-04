
import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  primarySwatch: Colors.cyan,
  primaryColor: Colors.cyan,
  buttonColor: Colors.cyan,
  brightness: Brightness.light,
  accentColor: Colors.cyan,
  appBarTheme: const AppBarTheme(
    color: Colors.black,
  ),
);

final ThemeData appThemeDataDark = ThemeData(
  primaryColor: Colors.cyan,
  buttonColor: Colors.black,
  brightness: Brightness.dark,
  accentColor: Colors.cyan,
  appBarTheme: const AppBarTheme(
    color: Colors.black,
  ),
);