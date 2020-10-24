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
}

class Dimensions {
  static const double gutterSmall = 8.0;
  static const double gutterMedium = 16.0;
  static const double gutterHuge = 24.0;
}

// material themes
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Palette.blue,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Palette.blue,
);

//cupertino themes
CupertinoThemeData cupertinoTheme =
    CupertinoThemeData(primaryColor: Palette.blue);
