import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

MaterialAppData getMaterialAppData(_, __) => MaterialAppData(
      theme: lightTheme,
      darkTheme: darkTheme,
    );

CupertinoAppData getCupertinoAppData(context, __) => CupertinoAppData(
      theme: cupertinoTheme,
    );

// properties
class Palette {
  static Color blue = Colors.blue;
  static Color white = Colors.white;
  static Color black = Colors.black;
}

class Dimensions {
  static const double gutterVerySmall = 4.0;
  static const double gutterSmall = 8.0;
  static const double gutterMedium = 16.0;
  static const double gutterLarge = 24.0;
  static const double gutterHuge = 32.0;
  static const double gutterVeryHuge = 40.0;

  static const double screenPadding = 16.0;
  static const double refreshDisplacement = 80.0;
}

// material themes
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Palette.blue,
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Palette.white,
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
    ),
    headline2: TextStyle(fontSize: 16),
    headline3: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    bodyText1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    ),
    bodyText2: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    ),
    button: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    subtitle2: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Palette.blue,
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Palette.white,
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
    ),
    headline2: TextStyle(fontSize: 16),
    headline3: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    bodyText1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    ),
    bodyText2: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    ),
    button: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    subtitle2: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
    ),
  ),
);

//cupertino themes
CupertinoThemeData cupertinoTheme = CupertinoThemeData(
    primaryColor: Palette.blue, textTheme: CupertinoTextThemeData());
