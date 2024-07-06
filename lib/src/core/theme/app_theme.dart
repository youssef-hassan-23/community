library theme;

import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getDarkTheme(BuildContext context) =>
      ThemeData.dark().copyWith(

        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(color: Colors.black),
      );
  static ThemeData getLightTheme(BuildContext context) =>
      ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(color: Colors.white),
      );
}
