import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Palette {
  static Color blue = Colors.blue;
}

class Dimensions {
  static const double gutterSmall = 8.0;
  static const double gutterMedium = 16.0;
  static const double gutterHuge = 24.0;
}

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Palette.blue,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Palette.blue,
);

CupertinoThemeData cupertinoTheme =
    CupertinoThemeData(primaryColor: Palette.blue);
